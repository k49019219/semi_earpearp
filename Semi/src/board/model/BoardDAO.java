package board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.util.MyUtil;


public class BoardDAO implements InterBoardDAO {

	////////////DataSource ds는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다. import - javax.sql
	private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	/////// 생성자  import - javax.naming
	public BoardDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/sajo");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	// 톰캣이 구동되어지는 순간 web.xml을 참조하고 적어둔 resource-ref를 통해 context.xml 에서 넣어주었던 resource를 여기서 불러다 씁니다.
	
	/////// 사용한 자원을 반납하는 close() 메소드 생성하기
	public void close() {
		try {
			if( rs != null ) rs.close(); rs = null;
			if( pstmt != null ) pstmt.close(); pstmt = null;
			if( conn != null ) conn.close(); conn = null;
		} catch (SQLException e) {
			e.printStackTrace(); // 뭔가 잘못되어지면 console에 찍어라.
		}
	}
	
	////////////////// 질문답변게시판 글 목록 불러오기 ////////////////////
	@Override
	public List<HashMap<String, String>> getQNAList(HashMap<String, String> map) throws SQLException {
		
		List<HashMap<String, String>> QNAList = null;
		
		try {

			conn = ds.getConnection();
			
			String sql = " select *\n"+
								" from\n"+
								" (\n"+
								"    select RNO, qnaidx, fk_userid, C.name, fk_boardno, fk_prodcode, prodname, prodimg, fk_cateno, qnatitle, qnacontent, qnawriteday\n"+
								"    from \n"+
								"    (\n"+
								"    select row_number() over (order by qnaidx desc) AS RNO, qnaidx, fk_userid, fk_boardno, fk_prodcode, qnacontent\n"+
								"         , case when length(B.prodname) > 20 then substr(B.prodname, 1, 18)||'..' else B.prodname end AS prodname\n"+
								"         , B.prodimg, B.fk_cateno, qnatitle\n"+
								"         , to_char(qnawriteday, 'yyyy-mm-dd') AS qnawriteday \n"+
								"     from san_qna A left join san_product B\n"+
								"     on A.fk_prodcode = B.prodcode\n";
			
					String search_date = map.get("search_date");
					String search_key = map.get("search_key");
					String search = map.get("search");
			
					if(search_date != null) {
						
						sql += "    ) V\n"+
							   " 	left join san_member C\n" + 
							   " 	on V.fk_userid = C.userid " +
							   " 	where "+search_key+" like '%'|| ? ||'%'\n";
						
						switch (search_date) {
						case "week":
							sql += " and qnawriteday >= to_char(sysdate-7, 'yyyy-mm-dd') ";
							break;
						case "month":
							sql += " and qnawriteday >= to_char(add_months(sysdate, -1), 'yyyy-mm-dd') ";						
							break;
						case "month3":
							sql += " and qnawriteday >= to_char(add_months(sysdate, -3), 'yyyy-mm-dd') ";
							break;
						case "all":
							sql+= " ";
							break;

						default:
							break;
						} // end of switch --------
						
					}
					else {
						sql += " ) V\n"+
							   " left join san_member C\n" + 
							   " on V.fk_userid = C.userid ";
					}
					
					sql += " ) T\n"+
						   " where RNO between ? and ? "+
						   " order by qnaidx desc";
			
			pstmt = conn.prepareStatement(sql);
			
			int page = Integer.parseInt(map.get("page"));
			int size = Integer.parseInt(map.get("size"));
			
			if(search_date != null && (search != null && search != "")) { // 검색 O
				pstmt.setString(1, search);
				pstmt.setInt(2, (page*size) - (size-1)); 
				pstmt.setInt(3, (page*size)); 
			}
			else { // 검색 X
				pstmt.setInt(1, (page*size) - (size-1)); 
				pstmt.setInt(2, (page*size)); 
			}
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { QNAList = new ArrayList<HashMap<String,String>>(); }
				
				HashMap<String, String> dbmap = new HashMap<String, String>();
				
				dbmap.put("idx", rs.getString("qnaidx"));
				dbmap.put("fk_userid", rs.getString("fk_userid"));
				dbmap.put("name", rs.getString("name"));
				dbmap.put("fk_boardno", rs.getString("fk_boardno"));
				dbmap.put("fk_prodcode", rs.getString("fk_prodcode"));
				dbmap.put("prodname", rs.getString("prodname"));
				dbmap.put("prodimg", rs.getString("prodimg"));
				dbmap.put("title", rs.getString("qnatitle"));
				dbmap.put("writeday", rs.getString("qnawriteday"));
				dbmap.put("fk_cateno", Integer.toString(rs.getInt("fk_cateno")));

				QNAList.add(dbmap);

			}
			
		} finally {
			close();
		}

		return QNAList;
	}

	
	//////////////// 페이징처리를 위한 게시판 전체 글 갯수 알아오기 ////////////////
	@Override
	public HashMap<String, String> getQNAPageCountMap(HashMap<String, String> map) throws SQLException {
		
		HashMap<String, String> pageCount = null;
		
		try {
			
			conn = ds.getConnection();
			
			String size = map.get("size");
			String search_date = map.get("search_date");
			String search_key = map.get("search_key");
			String search = map.get("search");
			
			String sql = " select count(*) AS count, ceil(count(*)/?) AS totalpage "+
						 " from san_qna A left join san_product B "+
						 " on A.fk_prodcode = B.prodcode " +
						 " left join san_member C\n" + 
						 " on A.fk_userid = C.userid ";

			if(search_date != null && (search_key != null && search_key != "")) {
				
				switch (search_date) {
				case "week":
					sql+= " where to_char(qnawriteday, 'yyyy-mm-dd') >= to_char(sysdate-7, 'yyyy-mm-dd') and ";
					break;
				case "month":
					sql+= " where to_char(qnawriteday, 'yyyy-mm-dd') >= to_char(add_months(sysdate, -1), 'yyyy-mm-dd') and ";
					break;
				case "month3":
					sql+= " where to_char(qnawriteday, 'yyyy-mm-dd') >= to_char(add_months(sysdate, -3), 'yyyy-mm-dd') and ";
					break;
				case "all":
					sql+=" where ";
					break;

				default:
					break;
				}
				
				sql += search_key+" like '%'|| ? ||'%' ";
				
			}

			pstmt = conn.prepareStatement(sql);

			if(search_date != null && (search_key != null && search_key != "")) {
				pstmt.setString(1, size);
				pstmt.setString(2, search);

			}
			else { 
				pstmt.setString(1, size); 
			}
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				pageCount = new HashMap<String, String>();
				
				pageCount.put("count", Integer.toString(rs.getInt("count")));
				pageCount.put("totalpage", Integer.toString(rs.getInt("totalpage")));
				
			}

		} finally {
			close();
		}
		
		return pageCount;
	}

	
	
	
	//////////////// 질문답변 게시판 상세페이지 ////////////////
	@Override
	public HashMap<String, String> getQNADetailContent(String idx) throws SQLException {
		
		HashMap<String, String> DetailContentMap = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select qnaidx, fk_userid, C.name, fk_boardno, fk_prodcode, qnatitle, qnacontent\n"+
						 "      , qnaimage1, qnaimage2, qnaimage3, qnaimage4, qnaimage5 " +
						 "      , to_char(qnawriteday, 'yyyy-mm-dd') AS qnawriteday "+
						 "      , prodcode, prodname, prodimg, D.price, D.cateno\n"+
						 " from\n"+
						 " (\n"+
						 " 	select *\n"+
						 " 	from san_qna A left join san_product B\n"+
						 " 	on A.fk_prodcode = B.prodcode\n"+
						 " ) V\n"+
						 " left join san_member C\n"+
						 " on V.fk_userid = C.userid "+
						 " left join san_category D\n" + 
						 " on V.fk_cateno = D.cateno "+
						 " where qnaidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				DetailContentMap = new HashMap<String, String>();
				
				DetailContentMap.put("idx", rs.getString("qnaidx"));
				DetailContentMap.put("fk_userid", rs.getString("fk_userid"));
				DetailContentMap.put("name", rs.getString("name"));
				DetailContentMap.put("fk_boardno", rs.getString("fk_boardno"));
				DetailContentMap.put("fk_prodcode", rs.getString("fk_prodcode"));
				DetailContentMap.put("title", rs.getString("qnatitle"));
				DetailContentMap.put("content", rs.getString("qnacontent"));
				DetailContentMap.put("image1", rs.getString("qnaimage1"));
				DetailContentMap.put("image2", rs.getString("qnaimage2"));
				DetailContentMap.put("image3", rs.getString("qnaimage3"));
				DetailContentMap.put("image4", rs.getString("qnaimage4"));
				DetailContentMap.put("image5", rs.getString("qnaimage5"));
				DetailContentMap.put("writeday", rs.getString("qnawriteday"));
				DetailContentMap.put("prodcode", rs.getString("prodcode"));
				DetailContentMap.put("prodname", rs.getString("prodname"));
				DetailContentMap.put("prodimg", rs.getString("prodimg"));
				DetailContentMap.put("price", Integer.toString(rs.getInt("price")));
				DetailContentMap.put("cateno", Integer.toString(rs.getInt("cateno")));

			}

		} finally {
			close();
		}

		return DetailContentMap;
	}

	
	
	
	
	////////////////////////////// 질문답변 게시판 게시물 조회를 위한 비밀번호 체크 ////////////////
	@Override
	public boolean QNACheckPwd(HashMap<String, String> pwdmap) throws SQLException {

		boolean check = false;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select * from san_qna where qnaidx = ? and qnapwd = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pwdmap.get("idx"));
			pstmt.setString(2, pwdmap.get("contentEditPwd"));
			
			rs = pstmt.executeQuery();
			
			check = rs.next();
			
		} finally {
			close();
		}

		return check;
	}

	
	
	
	
	
	//////////////////////////////질문답변 게시판 게시물 수정 및 등록 ////////////////////////////
	@Override
	public int QNAContentChange(HashMap<String, String> conMap) throws SQLException {
		
		int result = 0;
		
		try {

			conn = ds.getConnection();

			String sql = " select * from san_qna where qnaidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, conMap.get("idx"));

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				sql = " update san_qna set qnatitle = ? \n" + 
					  "                	 , qnacontent = ? \n" + 
					  "                  , qnapwd = ? \n" + 
					  "                  , qnaimage1 = ? \n" + 
					  "                  , qnaimage2 = ? \n" + 
					  "                  , qnaimage3 = ? \n" + 
					  "                  , qnaimage4 = ? \n" + 
					  "                  , qnaimage5 = ? \n" + 
					  " where qnaidx = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, conMap.get("title"));
				pstmt.setString(2, conMap.get("content"));
				pstmt.setString(3, conMap.get("conPwd"));
				pstmt.setString(4, conMap.get("bImage1"));
				pstmt.setString(5, conMap.get("bImage2"));
				pstmt.setString(6, conMap.get("bImage3"));
				pstmt.setString(7, conMap.get("bImage4"));
				pstmt.setString(8, conMap.get("bImage5"));
				pstmt.setString(9, conMap.get("idx"));
				
				result = pstmt.executeUpdate();

			}
			else {
				
				sql = " insert into san_qna(qnaidx, fk_userid, fk_boardno, qnatitle, qnacontent, qnapwd, "
					  + " qnaimage1, qnaimage2, qnaimage3, qnaimage4, qnaimage5, writerip ";
				
				if(conMap.get("prodcode") != null) {
					sql += " , fk_prodcode) "
						+ " values(seq_san_qna.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
				}
				else {
					sql += " ) "
						+ " values(seq_san_qna.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";
				}

					
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, conMap.get("fk_userid"));
				pstmt.setString(2, conMap.get("boardNo"));
				pstmt.setString(3, conMap.get("title"));
				pstmt.setString(4, conMap.get("content"));
				pstmt.setString(5, conMap.get("conPwd"));
				pstmt.setString(6, conMap.get("bImage1"));
				pstmt.setString(7, conMap.get("bImage2"));
				pstmt.setString(8, conMap.get("bImage3"));
				pstmt.setString(9, conMap.get("bImage4"));
				pstmt.setString(10, conMap.get("bImage5"));
				pstmt.setString(11, conMap.get("writerIp"));
				
				if(conMap.get("prodcode") != null) {
					pstmt.setString(12, conMap.get("prodcode"));
				}

				result = pstmt.executeUpdate();
				
			}
			
		} finally {
			close();
		}
		
		return result;
	}

	
	
	
	//////////////////////////////질문답변 게시판 게시물 삭제 ////////////////////////////
	@Override
	public int deleteQNAPost(String idx) throws SQLException {
		
		int result = 0;
		
		try {
			
			conn = ds.getConnection();	
			
			String sql = " delete from san_qna where qnaidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			result = pstmt.executeUpdate();

		} finally {
			close();
		}
		
		return result;
	}

	
	
	
	
	
	////////////////////// 질문답변 게시판 게시물에 대한 관리자 답변 등록 및 수정 /////////////////////
	@Override
	public int AdminCommentUp(HashMap<String, String> conMap) throws SQLException {
		int result = 0;
		
		try {

			conn = ds.getConnection();

			String sql = " select * from san_admincomment where fk_qnaidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, conMap.get("fk_qnaidx"));

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				sql = " update san_admincomment set admcontent = ? \n" + 
					  "                	 		  , admpwd = ? \n" + 
					  "                  		  , admimage1 = ? \n" + 
					  "                  		  , admimage2 = ? \n" + 
					  "                  		  , admimage3 = ? \n" + 
					  "                  		  , admimage4 = ? \n" + 
					  "                  		  , admimage5 = ? \n" + 
					  " where fk_qnaidx = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, conMap.get("content"));
				pstmt.setString(2, conMap.get("conPwd"));
				pstmt.setString(3, conMap.get("bImage1"));
				pstmt.setString(4, conMap.get("bImage2"));
				pstmt.setString(5, conMap.get("bImage3"));
				pstmt.setString(6, conMap.get("bImage4"));
				pstmt.setString(7, conMap.get("bImage5"));
				pstmt.setString(8, conMap.get("fk_qnaidx"));
				
				result = pstmt.executeUpdate();

			}
			else {
				
				sql = " insert into san_admincomment(admidx, fk_userid, status, fk_qnaidx, fk_boardno, admcontent, admpwd, "
					+ " admimage1, admimage2, admimage3, admimage4, admimage5 ) "
					+ " values(seq_san_admincomment.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, conMap.get("fk_userid"));
				pstmt.setString(2, conMap.get("status"));
				pstmt.setString(3, conMap.get("idx"));
				pstmt.setString(4, conMap.get("boardNo"));
				pstmt.setString(5, conMap.get("content"));
				pstmt.setString(6, conMap.get("conPwd"));
				pstmt.setString(7, conMap.get("bImage1"));
				pstmt.setString(8, conMap.get("bImage2"));
				pstmt.setString(9, conMap.get("bImage3"));
				pstmt.setString(10, conMap.get("bImage4"));
				pstmt.setString(11, conMap.get("bImage5"));

				result = pstmt.executeUpdate();
				
			}
			
		} finally {
			close();
		}
		
		return result;
	}

	
	
	
	
	///////////////////// 질문답변 게시판 게시물에 대한 관리자 답변 불러오기 /////////////////////
	@Override
	public List<HashMap<String, String>> getAdminCommentsList() throws SQLException {
		
		List<HashMap<String, String>> AdminCommentsList = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select admidx, fk_userid, B.name, A.status, fk_qnaidx, fk_boardno, admcontent "
					   + "		, to_char(admwriteday, 'yyyy-mm-dd') AS admwriteday "
					   + " from san_admincomment A left join san_member B"
					   + " on A.fk_userid = B.userid ";
			         
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { AdminCommentsList = new ArrayList<HashMap<String, String>>(); }
				
				HashMap<String, String> map = new HashMap<String, String>();
				
				map.put("idx", rs.getString("admidx"));
				map.put("fk_userid", rs.getString("fk_userid"));
				map.put("name", rs.getString("name"));
				map.put("status", rs.getString("status"));
				map.put("fk_qnaidx", rs.getString("fk_qnaidx"));
				map.put("fk_boardno", rs.getString("fk_boardno"));
				map.put("admwriteday", rs.getString("admwriteday"));
				map.put("admcontent", rs.getString("admcontent"));
				
				AdminCommentsList.add(map);
			}
			
		} finally {
			close();
		}
		
		return AdminCommentsList;
	}

	
	
	
	/////////////////// 관리자 답변 상세페이지 불러오기 /////////////////
	@Override
	public HashMap<String, String> getAdminDetailContent(String idx) throws SQLException {
		HashMap<String, String> Content = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select admidx, fk_userid, B.name, A.status, fk_qnaidx, fk_boardno, admcontent, \n"+
								"   	       admimage1, admimage2, admimage3, admimage4, admimage5,\n"+
								"             to_char(admwriteday, 'yyyy-mm-dd') AS admwriteday \n"+
								" from san_admincomment A left join san_member B\n"+
								" on A.fk_userid = B.userid\n"+
								" where A.fk_qnaidx = ? ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				Content = new HashMap<String, String>();
				
				Content.put("idx", rs.getString("admidx"));
				Content.put("fk_userid", rs.getString("fk_userid"));
				Content.put("name", rs.getString("name"));
				Content.put("status", rs.getString("status"));
				Content.put("fk_qnaidx", rs.getString("fk_qnaidx"));
				Content.put("fk_boardno", rs.getString("fk_boardno"));
				Content.put("content", rs.getString("admcontent"));
				Content.put("image1", rs.getString("admimage1"));
				Content.put("image2", rs.getString("admimage2"));
				Content.put("image3", rs.getString("admimage3"));
				Content.put("image4", rs.getString("admimage4"));
				Content.put("image5", rs.getString("admimage5"));
				Content.put("writeday", rs.getString("admwriteday"));
				
			}
			
		} finally {
			close();
		}
		
		return Content;
	}

	
	
	
	
	//////////////////// 공지 게시판 페이징 처리를 위한 전체 게시글 갯수 알아오기 //////////////////
	@Override
	public HashMap<String, String> getNoticePageCountMap(HashMap<String, String> map) throws SQLException {
		HashMap<String, String> pageCount = null;
		
		try {
			conn = ds.getConnection();
			
			String size = map.get("size");
			String search_date = map.get("search_date");
			String search_key = map.get("search_key");
			String search = map.get("search");
			
			String sql = " select count(*) AS count, ceil(count(*)/?) AS totalpage "+
						 " from san_notice ";

			if(search_date != null && (search_key != null && search_key != "")) {
				
				switch (search_date) {
				case "week":
					sql+= " where to_char(qnawriteday, 'yyyy-mm-dd') >= to_char(sysdate-7, 'yyyy-mm-dd') and ";
					break;
				case "month":
					sql+= " where to_char(qnawriteday, 'yyyy-mm-dd') >= to_char(add_months(sysdate, -1), 'yyyy-mm-dd') and ";
					break;
				case "month3":
					sql+= " where to_char(qnawriteday, 'yyyy-mm-dd') >= to_char(add_months(sysdate, -3), 'yyyy-mm-dd') and ";
					break;
				case "all":
					sql+=" where ";
					break;

				default:
					break;
				}
				
				sql += search_key+" like '%'|| ? ||'%' ";
				
			}

			pstmt = conn.prepareStatement(sql);

			if(search_date != null && (search_key != null && search_key != "")) {
				pstmt.setString(1, size);
				pstmt.setString(2, search);

			}
			else { 
				pstmt.setString(1, size); 
			}
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				pageCount = new HashMap<String, String>();
				
				pageCount.put("count", Integer.toString(rs.getInt("count")));
				pageCount.put("totalpage", Integer.toString(rs.getInt("totalpage")));
				
			}

		} finally {
			close();
		}
		
		return pageCount;
	}

	
	
	
	
	
	////////////////////////////// 공지 게시판 글 목록 불러오기 ///////////////////////////////
	@Override
	public List<HashMap<String, String>> getNoticeList(HashMap<String, String> map) throws SQLException {
		List<HashMap<String, String>> NoticeList = null;
		
		try {

			conn = ds.getConnection();
			
			String sql = " select * \n" + 
								 " from \n" + 
								" (\n" + 
								" select row_number() over (order by notidx desc) AS RNO, notidx, fk_userid, B.name, fk_boardno\n" + 
								"          , notisubject, notititle\n" + 
								"          , to_char(notiwriteday, 'yyyy-mm-dd') AS notiwriteday\n" + 
								" from san_notice A left join san_member B\n" + 
								" on A.fk_userid = B.userid ";
			
					String search_date = map.get("search_date");
					String search_key = map.get("search_key");
					String search = map.get("search");
			
					if(search_date != null && (search_key != null && search_key != "")) {
						
						sql += " 	where "+search_key+" like '%'|| ? ||'%' ";
						
						switch (search_date) {
						case "week":
							sql += " and notiwriteday >= to_char(sysdate-7, 'yyyy-mm-dd') ";
							break;
						case "month":
							sql += " and notiwriteday >= to_char(add_months(sysdate, -1), 'yyyy-mm-dd') ";						
							break;
						case "month3":
							sql += " and notiwriteday >= to_char(add_months(sysdate, -3), 'yyyy-mm-dd') ";
							break;
						case "all":
							sql+= " ";
							break;
						}
						
						sql += " order by notisubject asc\n" + 
								" ) V\n";
						
					}
					else {
						sql += " order by notisubject asc\n" + 
								" ) V\n";
					}
					
					sql += " where RNO between ? and ? ";
								
			
			pstmt = conn.prepareStatement(sql);
			
			int page = Integer.parseInt(map.get("page"));
			int size = Integer.parseInt(map.get("size"));

			if(search_date != null && (search_key != null && search_key != "")) { // 검색이 있으면 ~  
				pstmt.setString(1, search);
				pstmt.setInt(2, (page*size) - (size-1)); // 페이징처리 공식
				pstmt.setInt(3, (page*size)); // 페이징처리 공식
			}
			else {
				pstmt.setInt(1, (page*size) - (size-1)); // 페이징처리 공식
				pstmt.setInt(2, (page*size)); // 페이징처리 공식
			}
			

			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { NoticeList = new ArrayList<HashMap<String,String>>(); }
				
				HashMap<String, String> dbmap = new HashMap<String, String>();
				
				dbmap.put("idx", rs.getString("notidx"));
				dbmap.put("fk_userid", rs.getString("fk_userid"));
				dbmap.put("name", rs.getString("name"));
				dbmap.put("fk_boardno", rs.getString("fk_boardno"));
				dbmap.put("title", rs.getString("notititle"));
				dbmap.put("subject", rs.getString("notisubject"));
				dbmap.put("writeday", rs.getString("notiwriteday"));
				dbmap.put("RNO", Integer.toString(rs.getInt("RNO")));

				NoticeList.add(dbmap);

			}
			
		} finally {
			close();
		}

		return NoticeList;
	}

	
	
	
	
	//////////////////////////// 공지 게시판 상세페이지 ///////////////////////////
	@Override
	public HashMap<String, String> getNoticeDetailContent(String idx) throws SQLException {
		HashMap<String, String> Content = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select notidx, fk_userid, B.name, A.status, fk_boardno, notititle, noticontent, \n"+
								"   	       notimage1, notimage2, notimage3, notimage4, notimage5,\n"+
								"             to_char(notiwriteday, 'yyyy-mm-dd') AS notiwriteday \n"+
								" from san_notice A left join san_member B\n"+
								" on A.fk_userid = B.userid\n"+
								" where A.notidx = ? ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				Content = new HashMap<String, String>();
				
				Content.put("idx", rs.getString("notidx"));
				Content.put("fk_userid", rs.getString("fk_userid"));
				Content.put("name", rs.getString("name"));
				Content.put("status", rs.getString("status"));
				Content.put("fk_boardno", rs.getString("fk_boardno"));
				Content.put("title", rs.getString("notititle"));
				Content.put("content", rs.getString("noticontent"));
				Content.put("image1", rs.getString("notimage1"));
				Content.put("image2", rs.getString("notimage2"));
				Content.put("image3", rs.getString("notimage3"));
				Content.put("image4", rs.getString("notimage4"));
				Content.put("image5", rs.getString("notimage5"));
				Content.put("writeday", rs.getString("notiwriteday"));
				
			}
			
		} finally {
			close();
		}
		
		return Content;
	}

	
	
	
	
	////////////////////////////공지 게시판 게시물 수정 및 등록 ///////////////////////////
	@Override
	public int NoticeContentChange(HashMap<String, String> conMap) throws SQLException {
		int result = 0;
		
		try {

			conn = ds.getConnection();

			String sql = " select * from san_notice where notidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, conMap.get("idx"));

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				sql = " update san_notice set notititle = ?\n"+
					  "                          , notisubject = ? \n" + 				
					  "                          , noticontent = ? \n" + 
					  "                  		  , notimage1 = ? \n" + 
					  "                  		  , notimage2 = ? \n" + 
					  "                  		  , notimage3 = ? \n" + 
					  "                  		  , notimage4 = ? \n" + 
					  "                  		  , notimage5 = ? \n" + 
					  " where notidx = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, conMap.get("title"));
				pstmt.setString(2, conMap.get("subject"));
				pstmt.setString(3, conMap.get("content"));
				pstmt.setString(4, conMap.get("bImage1"));
				pstmt.setString(5, conMap.get("bImage2"));
				pstmt.setString(6, conMap.get("bImage3"));
				pstmt.setString(7, conMap.get("bImage4"));
				pstmt.setString(8, conMap.get("bImage5"));
				pstmt.setString(9, conMap.get("idx"));
				
				result = pstmt.executeUpdate();

			}
			else {
				
				sql = " insert into san_notice(notidx, fk_userid, status, fk_boardno, notititle, notisubject, noticontent, "
					+ " notimage1, notimage2, notimage3, notimage4, notimage5, writerip ) "
					+ " values(seq_san_notice.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, conMap.get("fk_userid"));
				pstmt.setString(2, conMap.get("status"));
				pstmt.setString(3, conMap.get("boardNo"));
				pstmt.setString(4, conMap.get("title"));
				pstmt.setString(5, conMap.get("subject"));
				pstmt.setString(6, conMap.get("content"));
				pstmt.setString(7, conMap.get("bImage1"));
				pstmt.setString(8, conMap.get("bImage2"));
				pstmt.setString(9, conMap.get("bImage3"));
				pstmt.setString(10, conMap.get("bImage4"));
				pstmt.setString(11, conMap.get("bImage5"));
				pstmt.setString(12, conMap.get("writerIp"));

				result = pstmt.executeUpdate();
				
			}
			
		} finally {
			close();
		}
		
		return result;
	}

	
	
	
	
	////////////////// 공지 게시판 게시물 삭제 /////////////////////
	@Override
	public int deleteNoticePost(String idx) throws SQLException {
		int result = 0;
		
		try {
			
			conn = ds.getConnection();	
			
			String sql = " delete from san_notice where notidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			result = pstmt.executeUpdate();

		} finally {
			close();
		}
		
		return result+3;
	}

	
	
	
	////////////////// 질문답변 게시판 게시물에 대한 관리자 답변 삭제 /////////////////
	@Override
	public int deleteAdminComment(String idx) throws SQLException {
		int result = 0;
		
		try {
			
			conn = ds.getConnection();	
			
			String sql = " delete from san_admincomment where admidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			result = pstmt.executeUpdate();

		} finally {
			close();
		}
		
		return result;
	}

	
	
	
	
	/////////////////////// 질문답변 게시판 상단에 위치할 공지 목록 불러오기 //////////////////////
	@Override
	public List<HashMap<String, String>> getNoticeListForQNA() throws SQLException {
		List<HashMap<String, String>> NoticeList = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select notidx, fk_userid, B.name, A.status, fk_boardno, notititle, noticontent, notisubject,\n"+
					"   	       notimage1, notimage2, notimage3, notimage4, notimage5,\n"+
					"             to_char(notiwriteday, 'yyyy-mm-dd') AS notiwriteday \n"+
					" from san_notice A left join san_member B\n"+
					" on A.fk_userid = B.userid\n"+
					" where notisubject = '공지' ";

		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		int cnt=0;
		while(rs.next()) { 
			cnt++;
			if(cnt==1) { NoticeList = new ArrayList<HashMap<String, String>>(); } 
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("idx", rs.getString("notidx"));
			map.put("fk_userid", rs.getString("fk_userid"));
			map.put("name", rs.getString("name"));
			map.put("status", rs.getString("status"));
			map.put("fk_boardno", rs.getString("fk_boardno"));
			map.put("title", rs.getString("notititle"));
			map.put("subject", rs.getString("notisubject"));
			map.put("content", rs.getString("noticontent"));
			map.put("image1", rs.getString("notimage1"));
			map.put("image2", rs.getString("notimage2"));
			map.put("image3", rs.getString("notimage3"));
			map.put("image4", rs.getString("notimage4"));
			map.put("image5", rs.getString("notimage5"));
			map.put("writeday", rs.getString("notiwriteday"));
			
			NoticeList.add(map);
			
			}
			
		} finally {
			close();
		}
		
		return NoticeList;
	}

	
	
	
	
	
	/////////////////////// 공지 게시물 상세 페이지에 보여질 다음글, 이전글 불러오기 //////////////////////
	@Override
	public HashMap<String, String> getPreNextPost(String idx) throws SQLException {
		HashMap<String, String> PreNextPost = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select * \n"+
						 " from\n"+
						 " (\n"+
						 " select lag(notititle) over (order by notidx) AS pre_title\n"+
						 "      , lag(notidx) over (order by notidx) AS preidx\n"+
						 "      , notidx, notititle\n"+
						 "      , lead(notititle) over(order by notidx) AS next_title\n"+
						 "      , lead(notidx) over (order by notidx) AS nextidx\n"+
						 " from san_notice\n"+
						 " )\n"+
						 " where notidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				PreNextPost = new HashMap<String, String>();
				
				PreNextPost.put("preidx", rs.getString("preidx"));
				PreNextPost.put("pre_title", rs.getString("pre_title"));
				PreNextPost.put("nextidx", rs.getString("nextidx"));
				PreNextPost.put("next_title", rs.getString("next_title"));
				
			}
			
		} finally {
			close();
		}
		
		return PreNextPost;
	}

	
	
	
	
	
	/////////////// 상품 상세페이지에서 보여줄 특정 상품에 대한 질문답변 게시물 리스트 불러오기 ////////////// 
	@Override
	public List<HashMap<String, String>> getQnaListForProduct(HashMap<String, String> pagingMap) throws SQLException {
		List<HashMap<String, String>> QnaList = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select *\n" + 
					 	 " from\n" + 
					 	 " (\n" + 
					 	 " select row_number() over (order by qnaidx desc) AS RNO, qnaidx, fk_userid, B.name "+
					 	 "		, fk_boardno, fk_prodcode, qnatitle, qnacontent, qnapwd "+
					 	 "      , to_char(qnawriteday, 'yyyy-mm-dd') AS qnawriteday\n" + 
					 	 " from san_qna A left join san_member B\n" + 
					 	 " on A.fk_userid = B.userid\n" + 
					 	 " where fk_prodcode = ? \n" + 
					 	 " )\n" + 
					 	 " where RNO between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			int page = Integer.parseInt(pagingMap.get("page"));
			int size = Integer.parseInt(pagingMap.get("size"));
			
			pstmt.setString(1, pagingMap.get("prodcode"));  
			pstmt.setInt(2, (page*size) - (size-1)); // 페이징처리 공식
			pstmt.setInt(3, (page*size)); // 페이징처리 공식
			
			rs = pstmt.executeQuery();
			
			int cnt=0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { QnaList = new ArrayList<HashMap<String, String>>(); }
				
				HashMap<String, String> map = new HashMap<String, String>();
				
				map.put("idx", rs.getString("qnaidx"));
				map.put("fk_userid", rs.getString("fk_userid"));
				map.put("name", rs.getString("name"));
				map.put("fk_boardno", rs.getString("fk_boardno"));
				map.put("fk_prodcode", rs.getString("fk_prodcode"));
				map.put("title", rs.getString("qnatitle"));
				map.put("content", rs.getString("qnacontent"));
				map.put("pwd", rs.getString("qnapwd"));
				map.put("writeday", rs.getString("qnawriteday"));
				
				QnaList.add(map);
				
			}
			
		} finally {
			close();
		}
		
		return QnaList;
	}

	
	
	
	
	////// 상품 상세페이지에서 보여줄 특정 상품에 대한 질문답변 미니 게시판 페이징 처리 위한 게시물 갯수 알아오기 /////
	@Override
	public HashMap<String, String> getQnaPageCountForProdMap(HashMap<String, String> pagingMap) throws SQLException {
		HashMap<String, String> pageCount = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select count(*) AS count, ceil(count(*)/?) AS totalPage "+
						 " from san_qna\n" + 
						 " where fk_prodcode = ? \n";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pagingMap.get("size"));
			pstmt.setString(2, pagingMap.get("prodcode")); 

			rs = pstmt.executeQuery();

			if(rs.next()) {
				pageCount = new HashMap<String, String>();
				
				pageCount.put("count", Integer.toString(rs.getInt("count")));
				pageCount.put("totalpage", Integer.toString(rs.getInt("totalpage")));
				
			}

		} finally {
			close();
		}
		
		return pageCount;
	}
	
	
	
	
	
	
	///////////////////////// 리뷰 게시판 페이징 처리를 한  전체 목록 조회하기 ///////////////////////////
	@Override
	public List<HashMap<String, String>> getReviewList(HashMap<String, String> map) throws SQLException {
		
		List<HashMap<String, String>> reviewList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql =  " select *\n"+
					" from\n"+
					" (\n"+
					"    select RNO, revidx, fk_userid, C.name, fk_boardno, fk_prodcode, prodname, prodimg, revtitle, revcontent, revwriteday "+
					"		  , revimage1, revimage2, revimage3, revimage4, revimage5\n"+
					"    from \n"+
					"    (\n"+
					"    select row_number() over (order by revidx desc) AS RNO, revidx, fk_userid, fk_boardno, fk_prodcode, revcontent\n"+
					"         , case when length(b.prodname) > 22 then substr(B.prodname, 1, 20)||'..' else B.prodname end AS prodname\n"+
					"         , B.prodimg, revtitle, revimage1, revimage2, revimage3, revimage4, revimage5\n"+
					"         , to_char(revwriteday, 'yyyy-mm-dd') AS revwriteday \n"+
					"     from san_review A left join san_product B\n"+
					"     on A.fk_prodcode = B.prodcode\n";
	
			
			String search_key = map.get("search_key");	
			String search_date = map.get("search_date");	
			String search = map.get("search");	
			
			if(search_date != null) {	
				
				sql +=
					  " ) V\n"+
					  " left join san_member C\n"+
					  " on V.fk_userid = C.userid "+
					  " where "+search_key+" like '%'|| ? ||'%'\n";

				
				switch (search_date) {
					case "week":
						sql += " and revwriteday >= to_char(sysdate-7, 'yyyy-mm-dd') ";
					break;
					
					case "month":
						sql += " and revwriteday >= to_char(add_months(sysdate, -1), 'yyyy-mm-dd') ";
					break;
					
					case "month3":
						sql += " and revwriteday >= to_char(add_months(sysdate, -3), 'yyyy-mm-dd') ";
					break;
					
					case "all":
						sql+= " ";
					break;
	
					default:
					break;
				}

			}
			else {
				sql += " ) V\n"+
				  " left join san_member C\n" +
				  " on V.fk_userid = C.userid ";
			}

			sql += " ) T\n"+
			  " where RNO between ? and ? "+
			  " order by revidx desc\n";

			pstmt = conn.prepareStatement(sql);

			int page = Integer.parseInt(map.get("page"));
			int size = Integer.parseInt(map.get("size"));

			if(search_date != null &&  (search != null && search != "")) { // 검색이 있으면 ~
				pstmt.setString(1, search);
				pstmt.setInt(2, (page*size) - (size-1)); // 페이징처리 공식
				pstmt.setInt(3, (page*size)); // 페이징처리 공식
			
			}
			else {
				pstmt.setInt(1, (page*size) - (size-1)); // 페이징처리 공식
				pstmt.setInt(2, (page*size)); // 페이징처리 공식
			}

			rs = pstmt.executeQuery();

			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { 
					reviewList = new ArrayList<HashMap<String,String>>(); 
					
				}

				HashMap<String, String> dbmap = new HashMap<String, String>();
	
				dbmap.put("idx", rs.getString("revidx"));
				dbmap.put("fk_userid", rs.getString("fk_userid"));
				dbmap.put("fk_boardno", rs.getString("fk_boardno"));
				dbmap.put("fk_prodcode", rs.getString("fk_prodcode"));
				dbmap.put("prodname", rs.getString("prodname"));
				dbmap.put("prodimg", rs.getString("prodimg"));
				dbmap.put("title", rs.getString("revtitle"));
				dbmap.put("name", rs.getString("name"));
				dbmap.put("writeday", rs.getString("revwriteday"));
				dbmap.put("rimg1", rs.getString("revimage1"));
				dbmap.put("rimg2", rs.getString("revimage2"));
				dbmap.put("rimg3", rs.getString("revimage3"));
				dbmap.put("rimg4", rs.getString("revimage4"));				
				dbmap.put("rimg5", rs.getString("revimage5"));
	
				reviewList.add(dbmap);
			} 

		} finally {
			close();
		}

		return reviewList;
	}


	//////////////// 리뷰 게시판 페이징처리를 위한 게시판 전체 글 갯수 알아오기 ////////////////
	@Override
	public HashMap<String, String> getReviewTotalPage(HashMap<String, String> map) throws SQLException {

		HashMap<String, String> pageCount = null; 

		try {
			conn = ds.getConnection();
		
			String size = map.get("size");
			String search_date = map.get("search_date");
			String search_key = map.get("search_key");
			String search = map.get("search");

			
			String sql = " select count(*) AS count, ceil(count(*)/ ? ) AS totalpage "+
						 " from san_review A left join san_product B"+
						 " on A.fk_prodcode = B.prodcode"+
						 " left join san_member C" +
						 " on A.fk_userid = C.userid";

			if(search_date != null && (search_key != null && search_key != "")) {

				switch (search_date) {
				case "week":
					sql+= " where to_char(revwriteday, 'yyyy-mm-dd') >= to_char(sysdate-7, 'yyyy-mm-dd') and ";
				break;
				
				case "month":
					sql+= " where to_char(revwriteday, 'yyyy-mm-dd') >= to_char(add_months(sysdate, -1), 'yyyy-mm-dd') and ";
				break;
				
				case "month3":
					sql+= " where to_char(revwriteday, 'yyyy-mm-dd') >= to_char(add_months(sysdate, -3), 'yyyy-mm-dd') and ";
				break;
				
				case "all":
					sql+=" where ";
				break;
			
				default:
				break;
			}
				sql += search_key+" like '%'|| ? ||'%' ";
			}
			
			pstmt = conn.prepareStatement(sql);

			if(search_date != null &&  (search_key != null && search_key != "")) {
				pstmt.setString(1, size);
				pstmt.setString(2, search);
			}
			else {
				pstmt.setString(1, size);
			}
			
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				pageCount = new HashMap<String, String>();
				
				pageCount.put("totalpage",  Integer.toString(rs.getInt("totalpage")));
				pageCount.put("count",  Integer.toString(rs.getInt("count")));

			}
			
		} finally {
			close();
		}
		
		return pageCount;
	}

			
		
	
	///////////////////////////////// 리뷰 게시판 리뷰 글 상세보기 ///////////////////////////////////
	@Override
	public HashMap<String, String> getReviewDetail(String idx) throws SQLException {

		HashMap<String, String> DetailContentMap = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select revidx, fk_userid, C.name, fk_boardno, fk_prodcode, D.price, prodname, prodimg, revtitle, revcontent\n" + 
					"       , D.cateno, revpwd, revimage1,revimage2, revimage3, revimage4, revimage5, revwriteday\n" + 
					" from\n" + 
					"    (\n" + 
					"    select revidx, fk_userid, fk_boardno, fk_prodcode, fk_cateno\n" + 
					"         , b.prodname\n" + 
					"         , B.prodimg, revtitle,revcontent, revpwd\n" + 
					"         , revimage1, revimage2, revimage3, revimage4, revimage5\n" + 
					"         , to_char(revwriteday, 'yyyy-mm-dd') AS revwriteday\n" + 
					"     from san_review A left join san_product B\n" + 
					"     on A.fk_prodcode = B.prodcode\n" + 
					"     order by revidx desc\n" + 
					"    ) V\n" + 
					" left join san_member C\n" + 
					" on V.fk_userid = C.userid "+
					" left join san_category D " +
					" on V.fk_cateno = D.cateno " + 
					" where revidx= ? ";
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, idx);
				
				rs = pstmt.executeQuery();

				if(rs.next()) {
					
					DetailContentMap = new HashMap<String, String>();
	
					DetailContentMap.put("idx", rs.getString("revidx"));
					DetailContentMap.put("fk_userid", rs.getString("fk_userid"));
					DetailContentMap.put("fk_boardno", rs.getString("fk_boardno"));
					DetailContentMap.put("prodcode", rs.getString("fk_prodcode"));
					DetailContentMap.put("prodname", rs.getString("prodname"));
					DetailContentMap.put("prodimg", rs.getString("prodimg"));
					DetailContentMap.put("title", rs.getString("revtitle"));
					DetailContentMap.put("name", rs.getString("name"));
					DetailContentMap.put("content", rs.getString("revcontent"));
					DetailContentMap.put("revpwd", rs.getString("revpwd"));
					DetailContentMap.put("image1", rs.getString("revimage1"));
					DetailContentMap.put("image2", rs.getString("revimage2"));
					DetailContentMap.put("image3", rs.getString("revimage3"));
					DetailContentMap.put("image4", rs.getString("revimage4"));
					DetailContentMap.put("image5", rs.getString("revimage5"));
					DetailContentMap.put("writeday", rs.getString("revwriteday"));
					DetailContentMap.put("price", Integer.toString(rs.getInt("price")));
					DetailContentMap.put("cateno", Integer.toString(rs.getInt("cateno")));

				}

			} finally {
				close();
			}

		return DetailContentMap;
	}
			
	
	
	
	
	////////////////////////// 리뷰 게시판 Ajax를 이용한 특정 제품의 댓글 입력(insert) 하기 ////////////////////////////
	@Override
	public int addComment(CommentVO cmtvo) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into san_comments(no, fk_userid, rev_passwd, fk_revidx, commentContents, writeDay) "+
					     " values(seq_san_comments.nextval, ?, ?, ?, ?, sysdate) ";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cmtvo.getFk_userid());
			pstmt.setString(2, cmtvo.getRev_passwd());
			pstmt.setString(3, cmtvo.getFk_revidx());
			pstmt.setString(4, cmtvo.getCommentContents());
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
	}
	
	
	
	
	
	///////////////// 리뷰 게시판 Ajax 를 이용한 특정 제품의 댓글  ////////////////
	@Override
	public List<CommentVO> commentList(String revidx) throws SQLException {
		List<CommentVO> CommentList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select no, fk_userid, commentcontents, to_char(writeday, 'yyyy-mm-dd') AS writeDay " + 
					     " from san_comments " + 
					     " where fk_revidx = ? " + 
					     " order by no desc ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, revidx);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { CommentList = new ArrayList<CommentVO>(); }
				
				int no = rs.getInt("no");
				String fk_userid = rs.getString("fk_userid"); 
				String commentContents = rs.getString("commentContents");
				String writeDay = rs.getString("writeDay");
												
				CommentVO commentVO = new CommentVO();
				commentVO.setNo(no);
				commentVO.setFk_userid(fk_userid);
				commentVO.setCommentContents(commentContents);
				commentVO.setWriteDay(writeDay);
				
				CommentList.add(commentVO);
			}			
			
		} finally {
			close();
		}
		
		return CommentList;
	}
	
	
	
	
	
	
	/////////////////////// 리뷰 게시판 리뷰 글 작성하기 (insert) 및 수정하기 /////////////////////////
	@Override
	public int RevContentChange(HashMap<String, String> conMap) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select * from san_review where revidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, conMap.get("idx"));
			
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				
				sql = " update san_review set revtitle = ? \n" + 
					  "                	 , revcontent = ? \n" + 
					  "                  , revpwd = ? \n" + 
					  "                  , revimage1 = ? \n" + 
					  "                  , revimage2 = ? \n" + 
					  "                  , revimage3 = ? \n" + 
					  "                  , revimage4 = ? \n" + 
					  "                  , revimage5 = ? \n" + 
					  " where revidx = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, conMap.get("title"));
				pstmt.setString(2, conMap.get("content"));
				pstmt.setString(3, conMap.get("conPwd"));
				pstmt.setString(4, conMap.get("bImage1"));
				pstmt.setString(5, conMap.get("bImage2"));
				pstmt.setString(6, conMap.get("bImage3"));
				pstmt.setString(7, conMap.get("bImage4"));
				pstmt.setString(8, conMap.get("bImage5"));
				pstmt.setString(9, conMap.get("idx"));
				
				result = pstmt.executeUpdate();
			
			}
			else {
				
				sql = "insert into san_review(revidx, fk_userid, fk_boardno, revtitle, revcontent, revpwd, "
					+ " revimage1, revimage2, revimage3, revimage4, revimage5, writerip";
				
				if(conMap.get("prodcode") != null) {
					sql += " , fk_prodcode) "
						+ " values(seq_san_review.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
				}
				else {
					sql += " ) "
						+ " values(seq_san_review.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
				}

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, conMap.get("fk_userid"));
				pstmt.setString(2, conMap.get("boardNo"));
				pstmt.setString(3, conMap.get("title"));
				pstmt.setString(4, conMap.get("content"));
				pstmt.setString(5, conMap.get("conPwd"));
				pstmt.setString(6, conMap.get("bImage1"));
				pstmt.setString(7, conMap.get("bImage2"));
				pstmt.setString(8, conMap.get("bImage3"));
				pstmt.setString(9, conMap.get("bImage4"));
				pstmt.setString(10, conMap.get("bImage5"));
				pstmt.setString(11, conMap.get("writerIp"));
				
				if(conMap.get("prodcode") != null) {
					pstmt.setString(12, conMap.get("prodcode"));
				}
			
				result = pstmt.executeUpdate();
				
			}
		
		} finally {
		close();
		}
		
		return result;
	}

	
	
	
	////////////////////////////// 리뷰 게시판 게시글 삭제 //////////////////////////////
	@Override
	public int deleteRevPost(String idx) throws SQLException {
		int result = 0;
		
		try {
		
			conn = ds.getConnection();	
			
			String sql = " delete from san_review where revidx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}


	
	
	
	//////////////////////// 댓글 삭제하기 ////////////////////////////
	@Override
	public int commentDelete(String no) throws SQLException {
		
		int result = 0;
		
		try {
		
			conn = ds.getConnection();	
			
			String sql = " delete from san_comments where no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
		
		} finally {
			close();
		}
		
		return result;	
	}

	
	//////////////////////////// 리뷰 글 이전글, 다음글 불러오기 //////////////////////////// 
	@Override
	public HashMap<String, String>  getPreNextRev(String idx) throws SQLException {
		HashMap<String, String> PreNextPostRev = null;
	
		try {
		
			conn = ds.getConnection();
		
			String sql = " select *\n" + 
					" from\n" + 
					" (\n" + 
					" select lag(revtitle) over (order by revidx) AS pre_title\n" + 
					" , lag(revidx) over (order by revidx) AS preidx\n" + 
					" , revtitle, revidx\n" + 
					" , lead(revidx) over (order by revidx) AS nextidx\n" + 
					" , lead(revtitle) over(order by revidx) AS next_title\n" + 
					" from san_review\n" + 
					" )\n" + 
					" where revidx = ? ";
	
	
	
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			rs = pstmt.executeQuery();
	
			if(rs.next()) {
				
				PreNextPostRev = new HashMap<String, String>();
				
				PreNextPostRev.put("preidx", rs.getString("preidx"));
				PreNextPostRev.put("pre_title", rs.getString("pre_title"));
				PreNextPostRev.put("nextidx", rs.getString("nextidx"));
				PreNextPostRev.put("next_title", rs.getString("next_title"));
			
			}
	
		} finally {
		close();
		}
	
		return PreNextPostRev;
	}
	
	
	
	
	
	//////////////////////// 리뷰게시판 관련글 보기 ////////////////////////////////
	@Override
	public List<HashMap<String, String>> getRelationList(String prodcode) throws SQLException {
		
		List<HashMap<String, String>> relationList = null;
		
		try {
		
			conn = ds.getConnection();
			
			String sql = " select C.prodname, V.name, revtitle, revwriteday, prodcode, revidx \n" + 
					" from\n" + 
					" (\n" + 
					" select revidx, fk_prodcode, revtitle, fk_userid, B.name "+
					"	   , to_char(revwriteday, 'yyyy-mm-dd') AS revwriteday\n" + 
					" from san_review A left join san_member B\n" + 
					" on A.fk_userid = B.userid\r\n" + 
					" where rownum <= '5' and fk_prodcode= ? \n" + 
					" ) V\n" + 
					" left join san_product C\n" + 
					" on V.fk_prodcode = C.prodcode" ;
	
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prodcode);
			
			rs = pstmt.executeQuery();
		
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) {
					relationList = new ArrayList<HashMap<String, String>>();
				}
				
				HashMap<String, String> relationMap = new HashMap<String, String>();
				
				relationMap.put("revidx", rs.getString("revidx"));
				relationMap.put("prodcode", rs.getString("prodcode"));
				relationMap.put("prodname", rs.getString("prodname"));
				relationMap.put("revtitle", rs.getString("revtitle"));
				relationMap.put("revwriteday", rs.getString("revwriteday"));
				relationMap.put("name", rs.getString("name"));
				
				relationList.add(relationMap);
			
			}
		
		} finally {
			close();
		}
		
		return relationList;
	}

				
	
	
	
	
	////////////////////// 리뷰글 제목에 보이는 댓글 갯수 가져오기 //////////////////////////
	@Override
	public List<HashMap<String, String>> getTitlecomList() throws SQLException {
		
		List<HashMap<String, String>> TitlecomList = null;
		
		try {
		
			conn = ds.getConnection();
			
			String sql = " select count(commentcontents) AS CNT, fk_revidx\n" + 
					" from san_comments\n" +
					" group by fk_revidx ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) {
					TitlecomList = new ArrayList<HashMap<String, String>>();
					
				}
				
				HashMap<String, String> commentMap = new HashMap<String, String>();
				
				commentMap.put("idx", rs.getString("fk_revidx"));
				commentMap.put("cnt", rs.getString("CNT"));
				
				TitlecomList.add(commentMap);
			}
		} finally {
			close();
		}
		
		return TitlecomList;
	
	}

	
	
	
	
	
	//////////////////// 마이페이지에 내가 쓴 게시물 목록 불러오기 /////////////////////
	@Override
	public List<HashMap<String, String>> getMyBoardList(String loginuserID) throws SQLException {
		
		List<HashMap<String, String>> MyList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select V.idx, V.boardno, V.prodcode, V.title, V.writeday, B.name\n" + 
						 " from \n" + 
						 " ( "+
						 " select qnaidx AS idx, fk_boardno AS boardno, fk_prodcode AS prodcode, qnatitle AS title\n" + 
						 "    	   ,  to_char(qnawriteday, 'yyyy-mm-dd') AS writeday, fk_userid AS userid\n" + 
						 " from san_qna\n" + 
						 " where fk_userid = ? \n" + 
						 " union \n" + 
						 " select revidx, fk_boardno, fk_prodcode, revtitle\n" + 
						 "    , to_char(revwriteday, 'yyyy-mm-dd'), fk_userid\n" + 
						 " from san_review\n" + 
						 " where fk_userid = ? \n" + 
						 " ) V\n" + 
						 " left join san_member B\n" + 
						 " on V.userid = B.userid " +
						 " order by writeday desc ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, loginuserID);
			pstmt.setString(2, loginuserID);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { MyList = new ArrayList<HashMap<String,String>>(); }
				
				HashMap<String, String> map = new HashMap<String, String>();

				map.put("idx", Integer.toString(rs.getInt("idx")));
				map.put("boardno", rs.getString("boardno"));
				map.put("prodcode", rs.getString("prodcode"));
				map.put("title", rs.getString("title"));
				map.put("writeday", rs.getString("writeday"));
				map.put("name", rs.getString("name"));
				
				MyList.add(map);
			}
			
		} finally {
			close();
		}
	
		return MyList;
	}

	
	
	
	
	/////////////////// 마이 페이지 내가 쓴 글 페이징 바를 작성하기 위한 총 페이지 수 알아오기 /////////////////
	@Override
	public List<HashMap<String,String>> getCountList(HashMap<String, String> map) throws SQLException {
		List<HashMap<String,String>> pageCount = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select  count(*) AS count\n" + 
						 " from san_qna\n" + 
						 " where fk_userid = ? \n" + 
						 " union all\n" + 
						 " select count(*) \n" + 
						 " from san_review\n" + 
						 " where fk_userid = ? \n";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, map.get("loginuserID")); 
			pstmt.setString(2, map.get("loginuserID")); 

			rs = pstmt.executeQuery();

			int cnt=0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { pageCount = new ArrayList<HashMap<String, String>>(); }
				
				HashMap<String, String> Map = new HashMap<String, String>();
				
				Map.put("count", Integer.toString(rs.getInt("count")));
				
				pageCount.add(Map);
				
			}

		} finally {
			close();
		}
		
		return pageCount;
	}

}
