package myshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MileageDAO implements InterMileageDAO {

	private DataSource ds;  // javax.sql 으로 import 하기!!
    // DataSource ds 는 아파치-톰캣이 제공하는 DBCP(DB Connection Pool) 이다.

	// 싱글톤 패턴 기법
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// == 기본 생성자 == // 
	public MileageDAO() {
		
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/semi4");

			
		} catch (NamingException e) {
			
			e.printStackTrace();
			
		}	
	
	} // end of MemberDAO()=================
	
	// == 사용한 자원 반납하는 close 메소드 == //
	public void close() {
	
		try {
			if(rs != null) { rs.close(); rs = null; }
			if(pstmt != null) { pstmt.close(); pstmt = null; }
			if(conn != null) {conn.close(); conn = null; }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	} // end of close() ====================
	

	// == 회원가입 시 마일리지 자동 적립 == // 
	@Override
	public int joinMileage(String userid) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			

			String sql = " insert into san_mileageList(fk_userid, mileageNo,mileagePoint, enableUseDay,saveRegisterday, content1,content2)" + 
						" values(?,SEQ_SAN_MILEAGELIST.nextval,?,sysdate,default,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2,"+1000");
			pstmt.setString(3, "");
			pstmt.setString(4, "신규회원 적립금");
			
			pstmt.executeUpdate();
			
			
			sql = " insert into san_mileage(fk_userid,totalMileage,usedMileage)" + 
					" values(?,?,?)";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setInt(2,1000);
			pstmt.setInt(3, 0);
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}	
		return result;	
	}

	// == 페이징 처리를 위한 전체 페이지 알아오기 == //
	public int totalPage(String userid) throws SQLException {
		
		int result = 0;
		try {
			conn = ds.getConnection();
			
			String sql = "select count(*) as totalPage \n"
					   + " from san_mileageList "
					   + " where fk_userid = ? " ;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				result = Integer.parseInt(rs.getString("totalPage"));
				
			}
			
		} finally {
			
			close();
		}
		
		return result;
	}
	
	
	// == 마일리지기 적립 내역 == //
	@Override
	public List<MileageListVO> mileageList(String userid, int currentShowPageNo, int sizePerPage) throws SQLException {
		
		List<MileageListVO>  milList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select RNO, mileageno, fk_userid,mileagePoint,enableUseDay,saveRegisterday,content1,content2  \r\n" + 
						 " from \r\n" + 
						 " (\r\n" + 
						 " select rownum as RNO, mileageno, fk_userid, mileagePoint,enableUseDay,saveRegisterday,content1,content2  \r\n" + 
						 " from san_mileageList \r\n" + 
						 " where fk_userid = ? \r\n" + 
						 " )V\r\n" + 
						 " where V.RNO between ? and ?"
						 + "order by mileageno desc";
			
	        pstmt = conn.prepareStatement(sql);
	      
			pstmt.setString(1, userid);
			pstmt.setInt(2, ( currentShowPageNo * sizePerPage ) - ( sizePerPage - 1 ));
			pstmt.setInt(3, ( currentShowPageNo * sizePerPage ));
		
			rs = pstmt.executeQuery();
			
	        int cnt=0;
	        while(rs.next()) {
	        	cnt++;
	        	if (cnt==1) {
	        		milList  = new ArrayList<MileageListVO>();
	        	}
	        	
	        	MileageListVO mil = new MileageListVO();
	        	mil.setFk_userid(rs.getString("fk_userid"));
	        	mil.setMileagePoint(rs.getString("mileagePoint"));
	        	mil.setEnableUseDay(rs.getString("enableUseDay"));
	        	mil.setSaveRegisterday(rs.getString("saveRegisterday"));
	        	mil.setContent1(rs.getString("content1"));
	        	mil.setContent2(rs.getString("content2"));
	        	 	
	        	milList.add(mil);
	        }
	         
		} finally {
			close();
		}
		return milList ;
	}

	

	// == 회원별 마일리지 총합, 사용된 마일리지 == //
	@Override
	public List<MileageVO> totalMile(String fk_userid) throws SQLException {
		
		List<MileageVO> mList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select fk_userid, totalMileage,usedMileage   " + 
						 " from san_mileage \r\n" + 
						 " where fk_userid = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, fk_userid);
	        rs = pstmt.executeQuery();
	        
	        int cnt=0;
	        while(rs.next()) {
	        	cnt++;
	        	if (cnt==1) {
	        		mList  = new ArrayList<MileageVO>();
	        	} 
	        	
	        	MileageVO mil = new MileageVO();
	        	mil.setFk_userid(rs.getString("fk_userid"));
	        	mil.setTotalMileage(rs.getInt("totalMileage"));
	        	mil.setUsedMileage(rs.getInt("usedMileage"));
	        	
	        	mList.add(mil);
	        }
	         
		} finally {
			close();
		}
		
		return mList;
	}
	
}
