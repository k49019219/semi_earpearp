package order.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
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

import member.model.*;
import myshop.model.*;
import util.security.AES256;

public class OrderDAO implements InterOrderDAO {

	private DataSource ds;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private AES256 aes = null;
	
	// == 기본 생성자 == // 
	public OrderDAO() {
		
		String key = EncryptMyKey.KEY;
		
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
	
	} // end of OrderDAO()=================
	
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

	//----------------------------------------------------------------------------------
	
	// 새 주문 insert하고 생성된 주문 번호 받아오기
	public HashMap<String,String> addNewOrder(HashMap<String,String> mapOrder) throws SQLException {
		HashMap<String,String> orderInfo = null;
		
		try {
			conn = ds.getConnection();

			String sql = " insert into san_order(ordernum, userid_fk, totalprice, orderdate, paymentoption)\n"+
						 " values (to_char(sysdate,'yyyymmdd') ||'-'|| SEQ_SAN_ORDERNUM.nextval, ?, ?, default, ?) ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mapOrder.get("userid"));
			pstmt.setString(2, mapOrder.get("totalPrice"));
			pstmt.setString(3, mapOrder.get("howtopay"));
			
			int n = pstmt.executeUpdate();
			
			// 주문 테이블에 insert한 후 주문 번호, 주문일자 받아오기
			if(n==1) {
				sql = " select ordernum, orderdate "+
						" from san_order "+
						" order by ordernum desc ";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) { // desc로 정렬한 가장 최근에 입력된 ordernum
					orderInfo = new HashMap<String,String>();
					orderInfo.put("ordernum", rs.getString("ordernum")); 
					orderInfo.put("orderdate", rs.getString("orderdate"));
				}
			}
			
		} finally {
			close();
		}	
		return orderInfo;
	} // end of int addNewOrder(HashMap<String,String> mapOrder)------------------------------
	
	// 받아온 주문번호로 주문 상품 각각 상세 주문 테이블로 insert하기
	public int addDetailOrder(HashMap<String,String> mapDetailOrder) throws SQLException {
		int n = 0;
		try {
			conn = ds.getConnection();
			
			String sql = " insert into san_orderDetail(orderdetailnum, ordernum_fk, prodcode, quantity, prodname, price, model, saleprice) "+
						 " values(seq_san_orderdetailnum.nextval, ?, ?, ?, ?, ?, ?, ?) ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mapDetailOrder.get("ordernum"));
			pstmt.setString(2, mapDetailOrder.get("prodcode"));
			pstmt.setString(3, mapDetailOrder.get("qty"));
			pstmt.setString(4, mapDetailOrder.get("prodname"));
			pstmt.setString(5, mapDetailOrder.get("price"));
			pstmt.setString(6, mapDetailOrder.get("model"));
			pstmt.setString(7, mapDetailOrder.get("saleprice"));

			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}	
		return n;
	} // end of void addDetailOrder()---------------------------------------------------------

	// 입력받은 배송지를 배송지 테이블에 insert하기
	public int addOrderShippment(HashMap<String,String> mapOrderShippment) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " insert into san_shipment(ordernum_fk, address, orderstatus, shippingstatus, shippingprice, receiver, post, shippingmsg, hp, email) "+
						 " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mapOrderShippment.get("ordernum"));
			pstmt.setString(2, mapOrderShippment.get("address"));
			pstmt.setString(3, mapOrderShippment.get("orderstatus"));
			pstmt.setString(4, mapOrderShippment.get("shippingstatus"));
			pstmt.setString(5, mapOrderShippment.get("shippingprice"));
			pstmt.setString(6, mapOrderShippment.get("receiver"));
			pstmt.setString(7, mapOrderShippment.get("post"));
			pstmt.setString(8, mapOrderShippment.get("shippingmsg"));
			pstmt.setString(9, mapOrderShippment.get("hp"));
			pstmt.setString(10, mapOrderShippment.get("email"));
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}	
		return n;	
	} // end of addOrderShippment--------------------------------------------------------------

	// 해당 userid를 가진 회원의 총 주문 수를 불러온다.
	public	String getNumberOfOrder(HashMap<String,String> searchTerms) throws SQLException {
		
		String numofOrder = "";
		
		try {
			conn = ds.getConnection();

			String sql = " select count(*) as numoforder "+
						 " from "+
						 " (select * from san_order "+
						 " where userid_fk = ? ";
			if(!"".equals(searchTerms.get("startDate").trim())) {
				
				sql += " and (to_char(orderdate,'yyyy-mm-dd') between '"+
					   searchTerms.get("startDate")+"' and '"+searchTerms.get("endDate")+"' ) ";
			}
			
			sql += ") A ";
			
			sql += " join (select * from san_shipment ";
			
			if(!"".equals(searchTerms.get("status").trim()) || "전체 주문처리상태".equals(searchTerms.get("status").trim())) {
				
			sql += "where orderstatus = '"+searchTerms.get("status")+"' ";
			
			}
			
			sql += ") B "+
				   " on A.ordernum = B.ordernum_fk ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTerms.get("userid"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				numofOrder = String.valueOf(rs.getInt("numoforder"));
			}
			
		} finally {
			close();
		}	
		return numofOrder;
		
	} // end of getNumberOfOrder---------------------------------------------------------------------
	
	// 해당 회원의 모든 주문 정보 조회하기
	public List<HashMap<String,String>> getOrderDetailInfo(HashMap<String,String> searchTerms, String currentShowPageNo, String sizePerPage) throws SQLException {
		
		List<HashMap<String,String>> orderDetailList = null;
		
		//	start =>  ( currentShowPageNo * sizePerPage ) - ( sizePerPage - 1 )  // 공식
		//  end   =>  ( currentShowPageNo * sizePerPage )   // 공식
			
		int intCurrentShowPageNo = Integer.parseInt(currentShowPageNo);
		int intSizePerPage = Integer.parseInt(sizePerPage);
			
		//	int currentShowPageNo = 1;
		//	int sizePerPage = 10;
		try {
			conn = ds.getConnection();

			String sql = " select RNO, ordernum, orderstatus, orderdate, userid_fk, totalprice, paymentoption, orderdetailnum, prodcode, quantity, prodname, price, model, saleprice " + 
						 " from\r\n" + 
						 " ("+ 
						 " select row_number() over(order by C.ordernum desc) as RNO, ordernum, orderstatus, to_char(orderdate,'yyyy-mm-dd') as orderdate,\n"+
						 " userid_fk, totalprice, paymentoption, orderdetailnum, prodcode, quantity, prodname, price, model, saleprice\n"+
						 " from\n"+
						 " (    select A.*, B.orderstatus\n"+
						 "    from\n"+
						 "    (select * from san_order where userid_fk= ? ";
			if(!"".equals(searchTerms.get("startDate").trim())) {
				sql+= " and (to_char(orderdate,'yyyy-mm-dd') between '"+searchTerms.get("startDate")+"' and '"+searchTerms.get("endDate")+"') ";
			}
			
			sql += " order by orderdate desc ) A \n"+
				   "    join (select * from san_shipment ";
			
			if(!"".equals(searchTerms.get("status").trim()) || "전체 주문처리상태".equals(searchTerms.get("status").trim()) ) {
				sql += "where orderstatus = '"+searchTerms.get("status")+"' ";
			}
			
			sql += " ) B\n"+
				   "    on A.ordernum = B.ordernum_fk\n"+
				   " ) C join san_orderdetail D\n"+
				   " on C.ordernum = D.ordernum_fk order by C.ordernum desc ) E "+
				   " where E.RNO between ? and ? ";	
			
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, searchTerms.get("userid"));
			pstmt.setInt(2, ( intCurrentShowPageNo * intSizePerPage ) - ( intSizePerPage - 1 ));
			pstmt.setInt(3, ( intCurrentShowPageNo * intSizePerPage ));
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) { 
					orderDetailList = new ArrayList<HashMap<String,String>>(); 
				}
				
				HashMap<String,String> order = new HashMap<String,String>();
		
				order.put("ordernum", rs.getString("ordernum"));
				
				order.put("orderstatus", rs.getString("orderstatus"));
				order.put("orderdate", rs.getString("orderdate"));
				order.put("totalprice", rs.getString("totalprice"));
				order.put("paymentoption", rs.getString("paymentoption"));
				order.put("orderdetailnum", rs.getString("orderdetailnum"));
				
				order.put("prodcode", rs.getString("prodcode"));
				
				order.put("quantity", rs.getString("quantity"));
				order.put("prodname", rs.getString("prodname"));
				order.put("price", rs.getString("price"));
				order.put("model", rs.getString("model"));
				order.put("saleprice", rs.getString("saleprice"));
				
				orderDetailList.add(order);
			}	
		} finally {
			close();
		}	
		
		return orderDetailList;
	} // end of List<HashMap<String,String>> getAllOrderInfo(String userid)-----------------
	
	public int totalPage(HashMap<String,String> searchTerms, String sizePerPage) throws SQLException {
		
		int result = 0;
		try {
			
			conn = ds.getConnection();

			String sql = 
						 " select ceil(count(*)/ ? ) as totalPage "+
						 " from\n"+
						 " (    select A.*, B.orderstatus\n"+
						 "    from\n"+
						 "    (select * from san_order where userid_fk= ? ";
			if(!"".equals(searchTerms.get("startDate").trim())) {
				sql+= " and (to_char(orderdate,'yyyy-mm-dd') between '"+searchTerms.get("startDate")+"' and '"+searchTerms.get("endDate")+"') ";
			}
			
			sql += " order by orderdate asc) A \n"+
				   "    join (select * from san_shipment ";
			
			if(!"".equals(searchTerms.get("status").trim()) || "전체 주문처리상태".equals(searchTerms.get("status").trim()) ) {
				sql += "where orderstatus = '"+searchTerms.get("status")+"' ";
			}
			
			sql += " ) B\n"+
				   "    on A.ordernum = B.ordernum_fk\n"+
				   " ) C join san_orderdetail D\n"+
				   " on C.ordernum = D.ordernum_fk ";	
			
			pstmt = conn.prepareStatement(sql);	
			
			pstmt.setString(1, sizePerPage);
			pstmt.setString(2, searchTerms.get("userid"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("totalPage");
			}
		} finally {	
			close();
		}
		return result;	
		
	} // end of totalPage -------------------------------------------------------------------------

	// getOrderDetailInfo의 결과물에 추가적으로 필요한 주문 정보(주문한 제품의 카테고리번호, 해당 주문번호를 fk로 가지는 상세주문번호의 수)
	public HashMap<String,String> getExtraOrderInfo(String prodcode, String ordernum) throws SQLException {

		HashMap<String,String> map = new HashMap<String,String>();
		try {
			conn = ds.getConnection();
			
			// 해당 상품의 카테고리번호를 조회한다---------------------------------------------------------
			// 사진 누르면 카테고리번호, 상품번호를 키로 해서 상세페이지로 이동
			String sql = "select fk_cateno, prodimg from san_product where prodcode = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodcode);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				map.put("cateno", rs.getString("fk_cateno") );
				map.put("prodimg", rs.getString("prodimg") );
			}

			// 해당 주문번호에 몇개의 상세주문번호 행이 있는지 함께 조회한다.-------------------------------------------
			// view단에서 테이블 rowspan할때 필요함
			sql = "select count(*) as numOfDetail from san_orderdetail where ordernum_fk = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				map.put("numOfDetail", rs.getString("numOfDetail") );
			}

		} finally {
			close();
		}	
		return map;
	} // end of getExtraOrderInfo ---------------------------------------------------------------------
	
	// 모든 과정이 끝나고, 해당 cartno를 삭제한다.
	public void deleteCart(String cartno, String userid) throws SQLException {
		
		try {
			conn = ds.getConnection();

			String sql = "delete from san_cart where fk_userid= ? and cartno = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, cartno);
			
			pstmt.executeUpdate();
			
		} finally {
			close();
		}	
	} // end of deleteCart(String cartno, String userid)-------------------------------------
	
	// 현재 로그인한 회원의 사용가능한 적립금을 받아온다.
		@Override
		public String getUserMileage(String userid) throws SQLException {
			
			String ablemileage = "";
			
			try {
				conn = ds.getConnection();

				String sql = "select totalmileage from san_mileage where fk_userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					ablemileage = rs.getString("totalmileage");
				}
				
			} finally {
				close();
			}	
			
			return ablemileage;
			
		} // end of getUserMileage(String userid)---------------------------------------------------------
			
		// 현재 로그인한 회원이 등록한 주소록을 모두 가져온다.
				public List<HashMap<String,String>> getAddressList(String userid) throws SQLException {
					
					List<HashMap<String,String>> addressList = null;

					try {
						conn = ds.getConnection();

						String sql = " select addrno, post, addr1, addr2, receiver, destination, addrbase " +
								     		" from san_address " +
								     		" where fk_userid = ? "
								     		+ "order by addrNo desc ";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userid);
						
						rs = pstmt.executeQuery();
						
						int cnt = 0;
						while(rs.next()) {
							cnt++;
							if(cnt==1) {
								addressList = new ArrayList<HashMap<String,String>>();
							}
							
							HashMap<String,String> address = new HashMap<String,String>();
							address.put("addrno",rs.getString("addrno"));
							address.put("post",rs.getString("post"));
							address.put("addr1",rs.getString("addr1"));
							address.put("addr2",rs.getString("addr2"));
							address.put("receiver",rs.getString("receiver"));
							address.put("destination",rs.getString("destination"));
							address.put("addrBase", rs.getString("addrbase"));
							
							addressList.add(address);
						}
					} finally {
						close();
					}	
					return addressList;
				} // end of getAddressList-------------------------------------------------------------

		// 현재 로그인한 회원이 주문에 사용한 적립금을 업데이트 한다.
		public String updateUsedMileage(String usedMileage, String userid, String ordernum) 
			throws SQLException {
			
			int ablemileage = 0;
			try {
				conn = ds.getConnection();
				String sql = "";
				
				
				if(!"".equals(usedMileage)) {
					sql = " update san_mileage "+
						  " set totalmileage = totalmileage-? "+
						  "  , usedmileage = usedmileage+? "+
						  " where fk_userid = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, usedMileage);
					pstmt.setString(2, usedMileage);
					pstmt.setString(3, userid);
					
					int n = pstmt.executeUpdate();
				}
					// 새로 바뀐 사용가능 적립금 받아오기
					sql = " select totalmileage from san_mileage where fk_userid = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					
					rs = pstmt.executeQuery();
					if(rs.next()) {
						ablemileage =  rs.getInt("totalmileage");
					}
					
				// 적립금 사용 내역 입력하기
				if(!"".equals(usedMileage)) {
					sql = " insert into san_mileageList(fk_userid, MILEAGENO, MILEAGEPOINT, CONTENT1, CONTENT2) "+
						  " values(?, SEQ_SAN_MILEAGELIST.nextval, ?, ?, '상품 구매로 인한 사용') ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					pstmt.setString(2, "-"+usedMileage);
					pstmt.setString(3, ordernum);
					
					int n = pstmt.executeUpdate();
				}		
					
			} finally {
				close();
			}	
			return String.valueOf(ablemileage);
			
		} // end of updateUsedMileage---------------------------------------------------------------
		
		// 상품 구매로 적립된 금액만큼 회원 정보에 업데이트하기
		public void updateSavedMileage(String mileageToSave, String userid, String ordernum)
			throws SQLException {
			
			mileageToSave = String.valueOf(Math.round(Double.parseDouble(mileageToSave)));
			
			try {
				conn = ds.getConnection();
				
				// 적립된 만큼 totalmileage를 올린다.
				String sql = " update san_mileage "+
							 " set totalmileage = totalmileage+? "+
							 " where fk_userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mileageToSave);
				pstmt.setString(2, userid);
				
				int n = pstmt.executeUpdate();

					// 적립금 사용 내역 입력하기
					sql = " insert into san_mileagelist(fk_userid, mileageno, mileagepoint, enableuseday, saveregisterday, content1, content2) "+
						  " values(?, seq_san_mileagelist.nextval, ? , sysdate+20 , default, ? , '상품 구매로 인한 적립') ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					pstmt.setString(2, "+"+mileageToSave);
					pstmt.setString(3, ordernum);
		
					n = pstmt.executeUpdate();
					
			} finally {
				close();
			}	
				
		} // end of updateSavedMileage---------------------------------------------------------------
			
		// 현재 로그인한 회원의 주소록에서 삭제하려는 주소번호를 가진 행을 삭제한다.
				public int deleteAddress(String addressNo, String userid) throws SQLException {
					
					int n = 0;
					try {
						conn = ds.getConnection();
					
						String sql = " delete from SAN_ADDRESS " +
									 " where fk_userid = ? and addrno = ? ";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userid);
						pstmt.setString(2, addressNo);
						
						n = pstmt.executeUpdate();
						
					} finally {
						close();
					}	
					return n;
					
				} // end of deleteAddress---------------------------------------------------------------------
				
				// 현재 로그인한 회원의 주소록에 새롭게 입력한 주소를 추가한다.
				public void addNewAddress(HashMap<String,String> newAddress) throws SQLException {
					
					try {
						conn = ds.getConnection();
						
						String sql = "";
						
						if("1".equals(newAddress.get("addrbase"))) {
							sql = " update san_address set addrbase = 0";
						}
						
						sql = " insert into SAN_ADDRESS (addrno, fk_userid, post, addr1, addr2, addrbase, destination, receiver, addrregisterday) "+
							  " values(seq_san_address.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate) ";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, newAddress.get("userid"));
						pstmt.setString(2, newAddress.get("post"));
						pstmt.setString(3, newAddress.get("addr1"));
						pstmt.setString(4, newAddress.get("addr2"));
						pstmt.setString(5, newAddress.get("addrbase"));
						pstmt.setString(6, newAddress.get("destination"));
						pstmt.setString(7, newAddress.get("receiver"));
						
						int n = pstmt.executeUpdate();

						
					} finally {
						close();
					}	
				} // end of addNewAddress-------------------------------------------------------------------------
				
				// 현재 로그인한 회원의 주소록에서 특정 주소를 수정한다.
				public void updateAddress(HashMap<String,String> updateAddress) throws SQLException {
					
					try {
						conn = ds.getConnection();
						
						String sql = " update san_address "+
										   " set post = ?, addr1 = ?, addr2 = ?, addrbase = ?, destination  = ?, "+
										   " receiver = ? "+
										   " where fk_userid = ? and addrno = ? ";
					
						pstmt = conn.prepareStatement(sql);
						
						pstmt.setString(1, updateAddress.get("post"));
						pstmt.setString(2, updateAddress.get("addr1"));
						pstmt.setString(3, updateAddress.get("addr2"));
						pstmt.setString(4, updateAddress.get("addrbase"));
						pstmt.setString(5, updateAddress.get("destination"));
						pstmt.setString(6, updateAddress.get("receiver"));
						pstmt.setString(7, updateAddress.get("userid"));
						pstmt.setString(8, updateAddress.get("addrno"));
						
						pstmt.executeUpdate();
						
					} finally {
						close();
					}	

				} // end of updateAddress---------------------------------------------------------------------------

				// 현재까지의 주소지 개수를 받아와서 10개라면 더이상 입력하지 못하게 한다.
				public int countNumberOfAddress(String userid) throws SQLException {
					
					int numOfAddress = 0;
					
					try {
						conn = ds.getConnection();
						
						String sql = " select count(*) as numOfAddress " +
									 " from san_address "+
									 " where fk_userid = ? ";
					
						pstmt = conn.prepareStatement(sql);
						
						pstmt.setString(1, userid);

						rs = pstmt.executeQuery();
						if(rs.next()) {
							numOfAddress =rs.getInt("numOfAddress");
						}
						
					} finally {
						close();
					}	
					return numOfAddress;
				} // end of countNumberOfAddress-----------------------------------------------------------
			
	
		//------------------------------------------------------------------------------------------------
		// 1. 카트 번호로 카트 테이블에서 제품 관련 정보를 얻어오는 메소드
		public HashMap<String, String> getCartList(String cartNo, String userid) throws SQLException {
			
			HashMap<String, String> cartInfo = null;
			
			try {
				conn = ds.getConnection();

				String sql = " select fk_prodcode, quantity, model "+
							 " from san_cart "+
							 " where cartno = ? and fk_userid= ? ";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cartNo);
				pstmt.setString(2, userid);

				rs = pstmt.executeQuery();
				
				if(rs.next()) {

					cartInfo = new HashMap<String, String>();
					
					cartInfo.put("prodcode", rs.getString("fk_prodcode"));
					cartInfo.put("quantity", rs.getString("quantity"));
					cartInfo.put("model", rs.getString("model"));
					
				}
			} finally {
				close();
			}	
			
			return cartInfo;
		}

		// 2. 상품 코드로 상품 정보 받아오기
		public ProductVO getProductInfo(String prodcode) throws SQLException {
			
			ProductVO member = null;
			
			try {
				conn = ds.getConnection();

				String sql = " select fk_cateno, prodname, prodimg from san_product where prodcode = ? ";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, prodcode);
		
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					member = new ProductVO();
					
					member.setCateno(rs.getInt("fk_cateno"));
					member.setProdname(rs.getString("prodname"));
					member.setProdimg(rs.getString("prodimg"));

					// san_category에서 다른 정보를 받아온다.
					sql = " select price, saleprice from san_category where cateno = ? ";  
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, rs.getInt("fk_cateno"));
					rs = pstmt.executeQuery();
					if(rs.next()) {
						member.setPrice(rs.getInt("price"));
						member.setSaleprice(rs.getInt("saleprice"));
					}
				}
			} finally {
				close();
			}	
			return member;
		} // end of getProductInfo()-------------------------------------------------------
		
		// 해당 userid를 가진 회원의 주문 상태 별 주문 개수를 모두 불러온다.		
		public HashMap<String,String> getNumByOrderStatus(String userid) throws SQLException {
			
			HashMap<String,String> NumByOrderStatus = new HashMap<String,String>();
			
			try {
				conn = ds.getConnection();
				
				String[] orderStatus = new String[] {"결제완료", "배송준비중", "배송중", "배송완료"};
				String[] orderStatus_key = new String[] {"finishOrder", "preparingShipping", "OnShipping", "done"};
				
				for(int i=0; i<orderStatus.length; i++) {
					
					String sql = " select count(orderstatus) as cnt \n"+
						   		 " from \n"+
								 " ( select ordernum from san_order where userid_fk = ? ) A "+
								 " join\n"+
								 " (select * from san_shipment where orderstatus = '"+orderStatus[i]+"') B "+
								 " on A.ordernum = B.ordernum_fk";
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					rs = pstmt.executeQuery();
					
					// 한글로 key값 주기가 찜찜해서 임의로 영어 key를 만듬
					if(rs.next()) {
						NumByOrderStatus.put(orderStatus_key[i], rs.getString("cnt"));
					}
				}

			} finally {
				close();
			}	
			return NumByOrderStatus;
		} // end of getNumByOrderStatus-------------------------------------------------
		
	// 주문 상세페이지에서 주문에 대한 정보
	public HashMap<String,String> getDetailPageOrderInfo(String ordernum) throws SQLException {
		
		HashMap<String,String> orderInfo = new HashMap<String,String>();
		
		try {
			conn = ds.getConnection();
			
			// 주문 관련 정보
			String sql = "select to_char(orderdate,'yyyy-mm-dd') as orderdate, totalprice, paymentoption from san_order where ordernum = ? ";
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				orderInfo.put("orderdate", rs.getString("orderdate"));
				orderInfo.put("totalprice", rs.getString("totalprice"));
				if("payCard".equals(rs.getString("paymentoption"))) {
					orderInfo.put("paymentoption", "신용카드 결제");
				} else {
					orderInfo.put("paymentoption", "카카오페이 결제");
				}
				
			}
			
			// 배송 관련 정보
			sql = "select orderstatus, shippingprice, shippingstatus, receiver, post, address, hp, shippingmsg "+
				  " from san_shipment where ordernum_fk = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				orderInfo.put("orderstatus", rs.getString("orderstatus"));
				orderInfo.put("shippingprice", rs.getString("shippingprice"));
				orderInfo.put("shippingstatus", rs.getString("shippingstatus"));
				orderInfo.put("receiver", rs.getString("receiver"));
				orderInfo.put("post", rs.getString("post"));
				orderInfo.put("address", rs.getString("address"));
				orderInfo.put("hp", rs.getString("hp"));
				orderInfo.put("shippingmsg", rs.getString("shippingmsg"));
			}
			
		} finally {
			close();
		}	
		return orderInfo;
	} // end of getDetailPageOrderInfo--------------------------------------------------------
		
	// 주문 상세페이지에서 주문 상세 정보
	public List<HashMap<String,String>> getDetailPageOrderDetailInfo(String ordernum, String prodcode) 
		throws SQLException {
		
		List<HashMap<String,String>> orderDetailInfo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select A.prodcode, A.orderdetailnum, A.price, A.saleprice, A.quantity, A.model, A.prodname, B.prodimg, B.fk_cateno " + 
						 " from ( " + 
						 " (select prodcode, orderdetailnum, price, saleprice, quantity, model, prodname from san_orderdetail where ordernum_fk= ? ) A " + 
						 " join " + 
						 " (select * from san_product) B " + 
						 " on A.prodcode = B.prodcode) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			rs = pstmt.executeQuery();

			int cnt = 0;
			while(rs.next()) { 
				cnt++;
				if(cnt==1) {
					orderDetailInfo = new ArrayList<HashMap<String,String>>();
				}
				HashMap<String,String> orderDetail = new HashMap<String,String>();
				
				orderDetail.put("prodimg", rs.getString("prodimg"));
				orderDetail.put("fk_cateno", rs.getString("fk_cateno"));
				orderDetail.put("orderdetailnum", rs.getString("orderdetailnum"));
				orderDetail.put("prodcode", rs.getString("prodcode"));
				orderDetail.put("price", rs.getString("price"));
				orderDetail.put("saleprice", rs.getString("saleprice"));
				orderDetail.put("quantity", rs.getString("quantity"));
				orderDetail.put("model", rs.getString("model"));
				orderDetail.put("prodname", rs.getString("prodname"));
				
				orderDetailInfo.add(orderDetail);
			}
		
		} finally {
			close();
		}	
		return orderDetailInfo;
	} // end of getDetailPageOrderDetailInfo-----------------------------------------------------
		
	// admin -----------------------------------------------------------------------
	
	// 모든 멤버의 주문상태 조회
			@Override
			public List<HashMap<String, String>> AllMemberOrderList(String getcurrentShowPage, String getsizePerPage) throws SQLException {

				List<HashMap<String, String>> orderList = null;
				
				try {
					
					conn = ds.getConnection();

					String sql = "select RNO, T.ordernum, T.userid_fk,name, T.orderdate, T.prodcode, prodname, prodimg, T.quantity, T.totalprice, S.orderstatus \n" + 
							"from ( \n" + 
							"        select RNO, ordernum, totalprice, userid_fk, M.name, prodcode, prodname, prodimg, quantity, orderdate \n" + 
							"        from \n" + 
							"        (select RNO, E.ordernum, totalprice, userid_fk, P.prodcode, prodname, prodimg, quantity, orderdate \n" + 
							"         from(select row_number() over(order by O.ordernum desc) as RNO \n" + 
							"                   ,O.ordernum, substr(listagg(D.prodcode, ',') within group (order by O.ordernum),1, 7) as prodcode \n" + 
							"                   , totalprice, userid_fk, sum(quantity) as quantity, to_char(orderdate, 'yyyy-mm-dd') as orderdate \n" + 
							"             from san_order O JOIN san_orderdetail D \n" + 
							"             on O.ordernum = D.ordernum_fk \n" + 
							"             group by ordernum, totalprice, userid_fk, orderdate \n" + 
							"             order by 1 \n" + 
							"             ) E JOIN san_product P \n" + 
							"        ON P.prodcode = E.prodcode \n" + 
							"        order by 1)Q JOIN san_member M \n" + 
							"        ON Q.userid_fk = M.userid \n" + 
							"     )T JOIN san_shipment S \n" + 
							"on T.ordernum = S.ordernum_fk \n" + 
							"where RNO between ? and ?";

					pstmt = conn.prepareStatement(sql);
					
					int currentShowPageNo = Integer.parseInt(getcurrentShowPage);
					int sizePerPage = Integer.parseInt(getsizePerPage);
					
				
					pstmt.setInt(1, ( currentShowPageNo * sizePerPage ) - ( sizePerPage - 1 ));
					pstmt.setInt(2, ( currentShowPageNo * sizePerPage ));
			
					rs = pstmt.executeQuery();
					
					int cnt = 0;
					while(rs.next()) {
						cnt++;
						
						if(cnt == 1) {
							
							orderList = new ArrayList<HashMap<String, String>>();
							
						}
						
						HashMap<String, String> order = new HashMap<String, String>();
				//	T.ordernum, T.userid_fk, T.orderdate, T.prodcode
				//		, prodname, prodimg, T.quantity, T.totalprice, S.orderstatus	
						
						order.put("ordernum", rs.getString("ordernum"));
						order.put("userid", rs.getString("userid_fk"));
						order.put("name", rs.getString("name"));
						order.put("orderdate", rs.getString("orderdate"));
						order.put("prodcode", rs.getString("prodcode"));
						order.put("prodname", rs.getString("prodname"));
						order.put("prodimg", rs.getString("prodimg"));
						order.put("quantity", rs.getString("quantity"));
						order.put("totalprice", rs.getString("totalprice"));
						order.put("orderstatus", rs.getString("orderstatus"));
					
						orderList.add(order);
					}
					
				} finally {
					close();
				}	
				
				return orderList;
			}

			
			// jsp_order_detail 테이블의 deliverstatus(배송상태) 컬럼의 값을 2(배송시작)로 변경하기 
			@Override
			public int updateDeliverStart(String odrcodePnum, String str) throws SQLException {
				
				int result = 0;
				
				try {
					 conn = ds.getConnection();
					 
					 conn.setAutoCommit(false); // 수동커밋으로 전환
					 
					 String sql = " update san_shipment set orderstatus = ?\n" + 
					 			  "where ordernum_fk = ?";
					 
					 pstmt = conn.prepareStatement(sql);
					 
					 pstmt.setString(1, str);
					 pstmt.setString(2, odrcodePnum);
					 
					 int n = pstmt.executeUpdate();
					 
					 if(n == 1) {
						 conn.commit();
						 
						 conn.setAutoCommit(true); // 자동커밋으로 전환
						 result = 1; 
					 }
					 else {
						 conn.rollback();
						 
						 conn.setAutoCommit(true); // 자동커밋으로 전환
						 result = 0; 
					 }
					 
				} finally {
					close();
				}
				
				return result;
			}
			
			
			// 영수증전표(odrcode)소유주에 대한 사용자 정보를 조회해오는 것.
			@Override
			public MemberVO odrcodeOwnerMemberInfo(String odrcode) throws SQLException {
				
				MemberVO membervo = null;
				
				try {
					conn = ds.getConnection();
								
					String sql = "select idx, userid, name, email, hp1, hp2, hp3, post, addr1, addr2 "
				              +	"      , gender, birthday "
				              +	"      , to_char(registerday, 'yyyy-mm-dd') as registerday "
							  +	"      , status "
				              +	" from san_member "
							  + " where userid = (select userid_fk "  
							  + "                 from san_order "  
							  + "                 where ordernum = ? ) ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, odrcode);
					
					rs = pstmt.executeQuery();
					
					boolean isExists = rs.next();
					
					if(isExists) {
						int v_idx = rs.getInt("idx");
						String userid = rs.getString("userid");
						String name = rs.getString("name");
						String email = aes.decrypt(rs.getString("email"));  // 이메일을 AES256 알고리즘으로 복호화 시키기
						String hp1 = rs.getString("hp1");
						String hp2 = aes.decrypt(rs.getString("hp2"));      // 휴대폰을 AES256 알고리즘으로 복호화 시키기
						String hp3 = aes.decrypt(rs.getString("hp3"));      // 휴대폰을 AES256 알고리즘으로 복호화 시키기
						String post = rs.getString("post");
						String addr1 = rs.getString("addr1");
						String addr2 = rs.getString("addr2");
						
						String gender = rs.getString("gender");
						String birthday = rs.getString("birthday");
						
						String registerday = rs.getString("registerday");
						int status = rs.getInt("status");
						
						membervo = new MemberVO();
						
						membervo.setIdx(v_idx);
						membervo.setUserid(userid);
						membervo.setName(name);
						membervo.setEmail(email);
						membervo.setHp1(hp1);
						membervo.setHp2(hp2);
						membervo.setHp3(hp3);
						membervo.setPost(post);
						membervo.setAddr1(addr1);
						membervo.setAddr2(addr2);
						membervo.setGender(Integer.parseInt(gender));
						membervo.setBirthdayyy(birthday.substring(0, 4));
						membervo.setBirthdaymm(birthday.substring(4, 6));
						membervo.setBirthdaydd(birthday.substring(6));
						membervo.setRegisterday(registerday);
						membervo.setStatus(status);
					}
					
				} catch (UnsupportedEncodingException | GeneralSecurityException e) {
					e.printStackTrace();
				} finally {
					close();
				}
				
				return membervo;	
			}

			
			// order status 갯수 구하기
			@Override
			public String getStatusCnt(String str) throws SQLException {

				String result = "";
				
				try {
					 conn = ds.getConnection();
					 
					 String sql = " select count(*) as count \n" + 
					 			  "from san_shipment \n" + 
					 			  "where orderstatus like '%'||?||'%'";
					 
					 pstmt = conn.prepareStatement(sql);
					 
					 pstmt.setString(1, str);
					 
					 rs = pstmt.executeQuery();
					 
					 rs.next();
					 
					 result = rs.getString("count");
					 
				} finally {
					close();
				}
				
				return result;
				
			}
	
} // end of class------------------------------------------------------------------------------
