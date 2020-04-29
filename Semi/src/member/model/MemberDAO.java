package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.Sha256;


public class MemberDAO implements InterMemberDAO {
	
	private DataSource ds;  // javax.sql 으로 import 하기!!
    // DataSource ds 는 아파치-톰캣이 제공하는 DBCP(DB Connection Pool) 이다.

	// 싱글톤 패턴 기법
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private AES256 aes = null;
	
	// == 기본 생성자 == // 
	public MemberDAO() {
		
		// == 암호화/복호화 키 (양방향암호화) ==> 이메일,휴대폰의 암호화/복호화 == //
		String key = EncryptMyKey.KEY;     // "abcd0070#eclass$";
		
		////////////////////////////////////////
		
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/sajo");
			
			aes = new AES256(key);
			
		} catch (NamingException e) {
			
			e.printStackTrace();
			
		} catch (UnsupportedEncodingException e) {
			
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

	// ==================== 관리자 ====================
	// 회원 목록 조회
	@Override
	public List<MemberVO> selectAllMember(String getsizePerPage,String getcurrentShowPageNo) throws SQLException {

		List<MemberVO> mbrList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select RNO, idx, userid, name, email, gender, registerday \r\n" + 
						 "from(\r\n" + 
						 "select row_number() over(order by idx) as RNO, idx, userid, name, email, gender, to_char(registerday, 'yyyy-mm-dd') as registerday\r\n" + 
						 "from san_member\r\n" + 
						 ")\r\n" + 
						 "where RNO between ? and ?";
			
			pstmt = conn.prepareStatement(sql);
			
			int currentShowPageNo = Integer.parseInt(getcurrentShowPageNo);
			int sizePerPage = Integer.parseInt(getsizePerPage);
			
			pstmt.setInt(1, ( currentShowPageNo * sizePerPage ) - ( sizePerPage - 1 ));
			pstmt.setInt(2, ( currentShowPageNo * sizePerPage ));
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt == 1) {
					
					mbrList = new ArrayList<MemberVO>();
					
				}
				
				MemberVO member = new MemberVO();
				
				member.setIdx( rs.getInt("idx") );
				member.setUserid( rs.getString("userid") );
				member.setName( rs.getString("name") );
				member.setEmail( aes.decrypt(rs.getString("email")) );
				member.setRegisterday(rs.getString("registerday"));
				
				mbrList.add(member);
				
				
			}
			
			
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return mbrList;
	}

	// 유저 아이디 받은 회원 정보 조회
	@Override
	public MemberVO selectOneMember(String userid) throws SQLException {

		MemberVO user = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select idx, userid, name, email, hp1, hp2, hp3, post, addr1, addr2 \n" + 
						 "	, gender, substr(birthday,1,4) AS birthdayyy, substr(birthday,5,2) AS birthdaymm, substr(birthday, 7) AS birthdaydd " + 
						 "  , to_char(registerday, 'yyyy / mm / dd') as registerday " + 
						 "from san_member \n" + 
						 "where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				user = new MemberVO();
				
				user.setIdx( rs.getInt("idx") );
				user.setUserid( rs.getString("userid") );
				user.setName( rs.getString("name") );
				user.setEmail( aes.decrypt(rs.getString("email")) );
				
				user.setHp1(rs.getString("hp1"));
				user.setHp2(aes.decrypt(rs.getString("hp2")) );     // 복호화  
				user.setHp3(aes.decrypt(rs.getString("hp3")) );     // 복호화 

				user.setPost(rs.getString("post"));
				user.setAddr1(rs.getString("addr1"));
				user.setAddr2(rs.getString("addr2"));
				user.setGender(rs.getInt("gender"));
				user.setBirthdayyy(rs.getString("birthdayyy"));
				user.setBirthdaymm(rs.getString("birthdaymm"));
				user.setBirthdaydd(rs.getString("birthdaydd"));
			    
				user.setRegisterday(rs.getString("registerday"));
				
			}
			
			
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return user;
	}
	
	
	// ==================== 개인회원 ====================
	// == 회원가입 (insert) == //
	@Override
	public int registerMember(MemberVO membervo) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			

			String sql = " insert into san_member(IDX, USERID, NAME, PWD, EMAIL,TP1,TP2,TP3, HP1, HP2, HP3, "
					   + " POST, ADDR1, ADDR2, GENDER, BIRTHDAY, REGISTERDAY, STATUS,emailCheck, CLIENTIP)     \n"
					   +"		 values(seq_san_member.nextval, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?, default, default ,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, membervo.getUserid());
			pstmt.setString(2, membervo.getName());
			
			pstmt.setString(3, Sha256.encrypt(membervo.getPwd() ));    // 암호를 SHA256 알고리즘으로 단방향암호화 시킨다. 
			// static 이므로 class명.메소드명 
			
			pstmt.setString(4, aes.encrypt(membervo.getEmail()) );
			pstmt.setString(5, membervo.getTp1());    
			
			pstmt.setString(6, aes.encrypt(membervo.getTp2()));   
			pstmt.setString(7, aes.encrypt(membervo.getTp3())); 
			
			pstmt.setString(8, membervo.getHp1());    
			pstmt.setString(9, aes.encrypt(membervo.getHp2()));    // 휴대폰번호를 AES256 알고리즘으로 양방향암호화 시킨다.
			pstmt.setString(10, aes.encrypt(membervo.getHp3()));    // 휴대폰번호를 AES256 알고리즘으로 양방향암호화 시킨다.

			pstmt.setString(11, membervo.getPost());
			pstmt.setString(12, membervo.getAddr1());
			pstmt.setString(13, membervo.getAddr2());
			pstmt.setInt(14, membervo.getGender());
			
			pstmt.setString(15, membervo.getBirthdayyy()+membervo.getBirthdaymm()+membervo.getBirthdaydd() );
			pstmt.setString(16, membervo.getEmailCheck());
			pstmt.setString(17, membervo.getClientip());
			
			result = pstmt.executeUpdate();
			
		} catch( UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}	
		return result;	
	}

	// == ID 중복 검사 == // 
	@Override
	public boolean idDuplicateCheck(String userid) throws SQLException {
			
		boolean result = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select * "
					   + " from san_member "
					   + " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid );
			
			rs = pstmt.executeQuery();
			
			result = rs.next();
						 
		} finally {
			close();
		}
		
		return result;
		
  	 } // end of idDuplicateCheck(String userid)=========================
	
	
	// == 로그인 (select) == // (아이디와 암호를 입력받아서 그 회원의 정보를 리턴)
	@Override
	public MemberVO getOneMember(HashMap<String, String> paraMap) throws SQLException {
		
		MemberVO loginuser = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select idx, userid, name, email, tp1, tp2, tp3, hp1, hp2, hp3, post, addr1, addr2, gender "  
					    + "      , substr(birthday,1,4) AS birthdayyy, substr(birthday,5,2) AS birthdaymm, substr(birthday, 7) AS birthdaydd "  
					    + "      ,to_char(registerday,'yyyy-mm-dd') AS registerday " 
					    + "      , trunc( months_between(sysdate, lastPwdChangeDate) ) AS pwdchangegap "  
					    + "      , trunc( months_between(sysdate, lastLoginDate) ) AS lastlogindategap , status"
					    + " from san_member "
					    + " where (status = 1 or status=4) and userid = ? and pwd = ? ";  // 탈퇴한 회원 제외
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid") );
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")) ); // 사용자가 입력한 비밀번호는 암호화 X <-> DB 에는 암호화 되어 있음 
			                                                         // 그러므로 똑같이 암호화
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				
				loginuser = new MemberVO();
				loginuser.setIdx(rs.getInt("idx"));
				loginuser.setUserid(rs.getString("userid"));
			    loginuser.setName(rs.getString("name"));
			    loginuser.setEmail(aes.decrypt(rs.getString("email")) ); // 복호화 
			    loginuser.setTp1(rs.getString("tp1"));
			    loginuser.setTp2(aes.decrypt(rs.getString("tp2")));
			    loginuser.setTp3(aes.decrypt(rs.getString("tp3")));
			    loginuser.setHp1(rs.getString("hp1"));
			    loginuser.setHp2(aes.decrypt(rs.getString("hp2")) );     // 복호화  
			    loginuser.setHp3(aes.decrypt(rs.getString("hp3")) );     // 복호화 

			    loginuser.setPost(rs.getString("post"));
			    loginuser.setAddr1(rs.getString("addr1"));
			    loginuser.setAddr2(rs.getString("addr2"));
			    loginuser.setGender(rs.getInt("gender"));
			    loginuser.setBirthdayyy(rs.getString("birthdayyy"));
			    loginuser.setBirthdaymm(rs.getString("birthdaymm"));
			    loginuser.setBirthdaydd(rs.getString("birthdaydd"));
			    
			    loginuser.setRegisterday(rs.getString("registerday"));
			    loginuser.setStatus(rs.getInt("status"));
			    
			    // 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 6개월이 지났으면 true,
			    // 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 6개월이 지나지 않았으면 false 로 표식한다.
                if( rs.getInt("pwdchangegap") >= 6 )
                	loginuser.setRequirePwdChange(true);

			    // 마지막으로 로그인 한 날짜가 현재일로부터 1년이 지났으면
                if( rs.getInt("lastlogindategap") >= 12 ) {
                	loginuser.setIdleStatus(true);
                }
                else {
                	// 마지막으로 로그인 한 날짜시간 갱신하기
                	sql = " update san_member set lastLoginDate = sysdate "
                		+ " where userid = ? ";
                	pstmt = conn.prepareStatement(sql);
                	pstmt.setString(1, paraMap.get("userid"));
                	pstmt.executeUpdate();
                }
			}
		
		} catch( UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		return loginuser;
	}

	// == 휴먼 상태인 사용자 계정을 휴먼이 아닌 것으로 바꾸기 == // 
	@Override
	public void expireIdle(int Idx) throws SQLException {
		// 즉, lastlogindate 컬럼의 값을 sysdate 로 update 해준다.
		
		try {
			conn = ds.getConnection();
			
			String sql = " update san_member set lastLoginDate = sysdate " + 
						 " where idx =?" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Idx);
			
			pstmt.executeUpdate();
			
		} finally {
			close();
		}	
	
	}
	
	
	// == 아이디 찾기 == // 
	@Override
	public HashMap<String, String>  findUseridMobile(HashMap<String, String> paraMap) throws SQLException {
		
		HashMap<String, String> findMap = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid, name, email, hp1, hp2, hp3, registerday " 
			             + " from san_member "
						 + " where status =1 and name = ? "
						 + "       and hp1 = ? and hp2 = ? and hp3 = ?" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("name"));
			pstmt.setString(2, paraMap.get("mobile1"));
			pstmt.setString(3, aes.encrypt(paraMap.get("mobile2")));
			pstmt.setString(4, aes.encrypt(paraMap.get("mobile3")));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				findMap = new HashMap<String,String>();
				findMap.put("userid",rs.getString("userid"));
				findMap.put("registerday",rs.getString("registerday"));
				
			}
			
		} catch( UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}	
		
		return findMap;
	}
	
	@Override
	public HashMap<String, String>  findUseridEmail(HashMap<String, String> paraMap) throws SQLException {
		
		HashMap<String, String> findMap = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid, name, email, hp1||hp2||hp3 as mobile, registerday " 
			             + " from san_member "
						 + " where status =1 and name = ? "
						 + "       and email = ?" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("name"));
			
			String email = paraMap.get("email");
			
			email = aes.encrypt(email);
			
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				findMap = new HashMap<String,String>();
				findMap.put("userid",rs.getString("userid"));
				findMap.put("registerday",rs.getString("registerday"));
				findMap.put("name",rs.getString("name"));
				
			}
			
		} catch( UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}	
		
		return findMap;
	}

	@Override
	public HashMap<String, String> findPwdEmail(HashMap<String, String> paraMap) throws SQLException {
		
		HashMap<String, String> findMap = null;
		
		findMap = new HashMap<String,String>();
		findMap.put("isExist","false");
		
		try {
			conn = ds.getConnection();
			
			String sql = "  select email, hp1, hp2, hp3 " + 
						" from san_member\r\n" + 
						" where status=1 and  userid=? and email=?" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, aes.encrypt(paraMap.get("email")));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				findMap.put("isExist","true");
				findMap.put("mobile1", rs.getString("hp1"));
				findMap.put("mobile2", aes.decrypt(rs.getString("hp2")));
				findMap.put("mobile3", aes.decrypt(rs.getString("hp3")));
			}
			
		} catch( UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}	
			
		return findMap ;
		
	}

	@Override
	public HashMap<String, String> findPwdMobile(HashMap<String, String> paraMap) throws SQLException {
		HashMap<String, String> findMap = null;
		
		findMap = new HashMap<String,String>();
		findMap.put("isExist","false");
		
		try {
			conn = ds.getConnection();
			
			String sql = " select email " 
			             + " from san_member "
						 + " where status =1 and userid = ? "
						 + "       and hp1 = ? and hp2 = ? and hp3 = ?" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("mobile1"));
			pstmt.setString(3, aes.encrypt(paraMap.get("mobile2")));
			pstmt.setString(4, aes.encrypt(paraMap.get("mobile3")));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				findMap.put("isExist","true");
				findMap.put("email",aes.decrypt(rs.getString("email")));
			}
			
		} catch( UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}	
			
		return findMap;
	}

	@Override
	public int pwdUpdate(String pwd, String userid) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update san_member set pwd = ? " + 
						 " where userid = ?" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Sha256.encrypt(pwd));
			pstmt.setString(2, userid);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}	
		
		return n;
	}
	
	// == 내정보 변경 == //
	@Override
	public int updateMember(MemberVO membervo) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update san_member "
					     +  " set name = ?, pwd = ?, EMAIL = ? , tp1 = ?, tp2 = ?, tp3 = ?, HP1 = ?, HP2 = ?, HP3 = ?, "
					     + " POST = ?, ADDR1 = ?, ADDR2 = ?, "
					     +       " emailCheck = ? , gender = ? , lastPwdChangeDate = sysdate "
					     + " where idx = ? " ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membervo.getName());
			pstmt.setString(2, Sha256.encrypt(membervo.getPwd()));
			pstmt.setString(3, aes.encrypt(membervo.getEmail()));
			
			pstmt.setString(4, membervo.getTp1());
			pstmt.setString(5, aes.encrypt(membervo.getTp2()));
			pstmt.setString(6, aes.encrypt(membervo.getTp3()));
			
			pstmt.setString(7, membervo.getHp1());
			pstmt.setString(8, aes.encrypt(membervo.getHp2()));
			pstmt.setString(9, aes.encrypt(membervo.getHp3()));
			
			pstmt.setString(10, membervo.getPost());
			pstmt.setString(11, membervo.getAddr1());
			pstmt.setString(12, membervo.getAddr2());
		    pstmt.setString(13, membervo.getEmailCheck());
		    pstmt.setInt(14, membervo.getGender());
		    pstmt.setInt(15, membervo.getIdx());
		    
			n = pstmt.executeUpdate();
		
		} catch(UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		
		return n;
	}

	// == 회원 탈퇴 == //
	@Override
	public int deleteMember(HashMap<String,String> paraMap) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update san_member "
					     +  " set status = 0 "
					     + " where idx = ? " ;
			
		    pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setString(1, paraMap.get("idx"));
		    
			pstmt.executeUpdate();
			
			sql = " delete from san_mileageList "
				     + " where  fk_userid = ? " ;
		
		    pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setString(1, paraMap.get("userid"));
		    
		    pstmt.executeUpdate();
		    
		    sql = " delete from san_mileage "
				     + " where  fk_userid = ? " ;
		
		    pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setString(1, paraMap.get("userid"));
		    
		    
			pstmt.executeUpdate();
			
			 
		    sql = "  delete san_address\r\n" + 
		    		"	 where fk_userid=? " ;
		
		    pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setString(1, paraMap.get("userid"));
		    
			n = pstmt.executeUpdate();
			
		
		} finally {
			close();
		}
		
		return n;
	}

   @Override
   public List<MemberVO> selectAllMember() throws SQLException {

      List<MemberVO> mbrList = null;
      
      try {
         conn = ds.getConnection();
         
         String sql = "select idx, userid, name, email, gender, to_char(registerday, 'yyyy-mm-dd') as registerday\n" + 
                   "from san_member\n" + 
                   "order by idx";
         
         pstmt = conn.prepareStatement(sql);
         
         rs = pstmt.executeQuery();
         
         int cnt = 0;
         while(rs.next()) {
            cnt++;
            
            if(cnt == 1) {
               
               mbrList = new ArrayList<MemberVO>();
               
            }
            
            MemberVO member = new MemberVO();
            
            member.setIdx( rs.getInt("idx") );
            member.setUserid( rs.getString("userid") );
            member.setName( rs.getString("name") );
            member.setEmail( aes.decrypt(rs.getString("email")) );
            member.setRegisterday(rs.getString("registerday"));
            
            mbrList.add(member);
            
            
         }
         
         
      } catch (GeneralSecurityException | UnsupportedEncodingException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      
      return mbrList;
   }

}



