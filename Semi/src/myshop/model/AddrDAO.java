package myshop.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class AddrDAO implements InterAddrDAO {

	private DataSource ds;  // javax.sql 으로 import 하기!!
    // DataSource ds 는 아파치-톰캣이 제공하는 DBCP(DB Connection Pool) 이다.

	// 싱글톤 패턴 기법
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// == 기본 생성자 == // 
	public AddrDAO() {
		
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
	
	
	// == 기본 배송지 지정 시(addrBase=1) 다른 배송지는 addrBase 0 처리 == //
	@Override
	public int updateBase(AddrVO advo) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update san_address set addrBase=0"
					+ "    where fk_userid = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, advo.getFk_userid());
		
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return  result;
	}
	
	// == 배송지 등록  개수 == //
	@Override
	public int addrCount(String fk_userid) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*)\r\n" + 
						"		 from san_address\r\n" + 
						"		 where fk_userid=?";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fk_userid);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt(1);
			
		} finally {
			close();
		}	
		return result;	

	}
		
	// == 배송지 등록 (insert) == //
	@Override
	public int registerAddr(AddrVO advo) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into san_address(addrNo, fk_userid, post, addr1, addr2, addrBase, "
					+ "destination, receiver, addrRegisterday)"
				   +"		 values(seq_san_address.nextval, ?, ?,?,?,?,?,?,sysdate)";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, advo.getFk_userid());
			pstmt.setString(2, advo.getPost());
			pstmt.setString(3, advo.getAddr1());
			pstmt.setString(4, advo.getAddr2());
			
			if ( advo.getAddrBase() != null  ) {
				pstmt.setInt(5, 1);
			}
			else {
				pstmt.setInt(5, 0);
			}
			
			pstmt.setString(6, advo.getDestination());
			pstmt.setString(7, advo.getReceiver());
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}	
		return result;	
	}

	
	// == 배송지 조회 (select) == //
	@Override
	public List<AddrVO> addrList(String fk_userid) throws SQLException {
		
		List<AddrVO> addrList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select destination,receiver,post,addr1,addr2,addrBase,addrNo " + 
						 " from san_address \r\n" + 
						 " where fk_userid = ?"
						 + " order by addrNo desc ";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, fk_userid);
	        rs = pstmt.executeQuery();
	        
	        int cnt=0;
	        while(rs.next()) {
	        	cnt++;
	        	if (cnt==1) {
	        		addrList = new ArrayList<AddrVO>();
	        	}
	        	
	        	AddrVO adr = new AddrVO();
	        	adr.setDestination(rs.getString(1));
	        	adr.setReceiver(rs.getString(2));
	        	adr.setPost(rs.getString("post"));
	        	adr.setAddr1(rs.getString("addr1"));
	        	adr.setAddr2(rs.getString("addr2"));
	        	
	        	if ( rs.getInt("addrBase") == 1  ) {
	        		adr.setAddrBase("1");
				}
				else {
					adr.setAddrBase("0");
				}
	        	
	        	adr.setAddrNO(rs.getInt("addrNo"));
	        	
	        	addrList.add(adr);
	        }
	         
		} finally {
			close();
		}
		return addrList;
	}

	
	// == 선택 배송지 삭제 == //
	@Override
	public int deleteAddr(int addrNo) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			           
			String sql = "delete from san_address "
					  + " where addrNo = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, addrNo);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return n;
	}

	
	// == 배송지 수정 시 데이터 불러오기 //
	@Override
	public HashMap<String, String> selectAdr(int addrNo) throws SQLException {
		
		HashMap<String, String> addr = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select destination,receiver,post,addr1,addr2,addrBase,addrNo " + 
						 " from san_address \r\n" + 
						 " where addrNo = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, addrNo);
	        rs = pstmt.executeQuery();
	      
	       if(rs.next()) {
	        	
	        	addr = new HashMap<String, String>();
	        	addr.put("destination",rs.getString("destination"));
	        	addr.put("receiver",rs.getString("receiver"));
	        	addr.put("post",rs.getString("post"));
	        	addr.put("addr1",rs.getString("addr1"));
	        	addr.put("addr2",rs.getString("addr2"));
	        	addr.put("addrBase",String.valueOf(rs.getInt("addrBase")));
	        	addr.put("addrNo", rs.getString("addrNo"));
	        }
	         
		} finally {
			close();
		}
		return addr;
	}

	// == 배송지 업데이트 == // 
	@Override
	public int addrUpdate(AddrVO advo) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update san_address "
					     +  " set destination = ?, receiver = ?, post= ?, addr1= ?, addr2= ?, addrBase= ? "
					     + " where addrNo = ? " ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, advo.getDestination());
			pstmt.setString(2, advo.getReceiver());
			pstmt.setString(3, advo.getPost());
			pstmt.setString(4, advo.getAddr1());
			
			if ( advo.getAddr2() != null  ) {
				pstmt.setString(5, advo.getAddr2());
			}
			else {
				pstmt.setString(5, "");
			}
			
			if ( advo.getAddrBase() != null  ) {
				pstmt.setInt(6, 1);
			}
			else {
				pstmt.setInt(6, 0);
			}

			pstmt.setInt(7, advo.getAddrNO());
			
			n = pstmt.executeUpdate();
		
		} finally {
			close();
		}
		
		return n;
	}

	

	
}
