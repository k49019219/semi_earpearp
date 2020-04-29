package product.model;

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
import javax.websocket.Session;

import member.model.MemberVO;



public class ProductDAO implements InterProductDAO {

private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	public ProductDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/sajo");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			
			if(rs != null) {
				rs.close();
				rs = null;
			}
			
			if(pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			
			if(conn != null) {
				conn.close();
				conn = null;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 카테고리 보여주기
	@Override
	public List<HashMap<String, String>> getCategoryList() throws SQLException {
		List<HashMap<String, String>> categoryList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select cateno, catename, price, saleprice "  
		 		    + " from san_category "
		 		    + " order by cateno asc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				
				cnt++;
				if(cnt==1) {
					categoryList = new ArrayList<HashMap<String, String>>();
				}
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("cateno", rs.getString("cateno"));
				map.put("catename", rs.getString("catename"));
				map.put("price", rs.getString("price"));
				map.put("saleprice", rs.getString("saleprice"));
				
				categoryList.add(map);
			}
						
		} finally {
			close();
		}
		
		return categoryList;
	}
	
	// 카테고리 별 상품목록
	@Override
	public List<ProductVO> productList(HashMap<String, String> paramap) throws SQLException {

		List<ProductVO> productList = null;

		try {
			conn = ds.getConnection();

			String sql = "select RNO, prodcode, fk_cateno, prodname, prodimg \n" + 
	                  "from(\n" + 
	                  "    select rownum as RNO, prodcode, fk_cateno, prodname, prodimg \n" + 
	                  "    from(\n" + 
	                  "        select prodcode, fk_cateno, prodname, prodimg \n" + 
	                  "        from san_product\n" + 
	                  "       where fk_cateno = ? \n" + 
	                  "        order by prodcode desc \n" + 
	                  "    )V\n" + 
	                  ")F\n" + 
	                  "where F.RNO between ? and ?";

			pstmt = conn.prepareStatement(sql);

			// start => ( currentShowPageNo * sizePerPage ) - ( sizePerPage - 1 ) // 공식
			// end => ( currentShowPageNo * sizePerPage ) // 공식

			int currentShowPageNo = Integer.parseInt(paramap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paramap.get("sizePerPage"));

			// int currentShowPageNo = 1;
			// int sizePerPage = 18;

			pstmt.setString(1, paramap.get("cateno"));
			pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(3, (currentShowPageNo * sizePerPage));

			rs = pstmt.executeQuery();

			int cnt = 0;
			while (rs.next()) {
				cnt++;

				if (cnt == 1) {

					productList = new ArrayList<ProductVO>();

				}

				ProductVO pvo = new ProductVO();

				pvo.setProdcode(rs.getString("prodcode"));
				pvo.setFk_cateno(Integer.parseInt(rs.getString("fk_cateno")));
				pvo.setProdname(rs.getString("prodname"));
				pvo.setProdimg(rs.getString("prodimg"));

				productList.add(pvo);

			}
		} finally {
			close();
		}
		return productList;
	}

	// totalpage
    @Override
    public int totalPage(String sizePerPage, String cateno) throws SQLException {
       int result = 0;
       try {
          conn = ds.getConnection();
          
          if(cateno != "" && !(cateno.equals("멤버리스트"))) {
             
             String sql = "select ceil(count(*)/?) as totalPage \n"
                      + "from san_product \n"
                      + "where fk_cateno = ?";
             
             pstmt = conn.prepareStatement(sql);
             
             pstmt.setString(1, sizePerPage);
             pstmt.setString(2, cateno);
             
          }
          else if(cateno.equals("멤버리스트")){
             
             String sql = "select ceil(count(*)/?) as totalPage \n"
                      + "from san_member \n";
             
             pstmt = conn.prepareStatement(sql);
             
             pstmt.setString(1, sizePerPage);
             
          }
          else {
             
             String sql = "select ceil(count(*)/?) as totalPage \n"
                      + "from san_order";
             
             pstmt = conn.prepareStatement(sql);
             
             pstmt.setString(1, sizePerPage);
             
          }
          
          
          
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
             
             result = Integer.parseInt(rs.getString("totalPage"));
             
          }
          
       } finally {
          
          close();
       }
       
       return result;
    }
    

	// 카테고리 별 카테고리 이름, 카테고리 가격 등등 가져오기
	public HashMap<String,String> category(String cateno) throws SQLException {
		
		HashMap<String,String> category = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select cateno, catename, price, saleprice \n" + 
						 "from san_category \n" + 
						 "where cateno = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cateno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				category = new HashMap<String,String>();
				
				category.put("cateno", rs.getString("cateno"));
				category.put("catename", rs.getString("catename").toUpperCase());
				category.put("price", rs.getString("price"));
				category.put("saleprice", rs.getString("saleprice"));
				
			}
			
		} finally {
			
			close();
		}
		
		
		return category;
	}


	
	// ---------------- Product List ---------------- //
	// 제품번호를 가지고 해당 제품의 정보를 조회해오기
	@Override
	public ProductVO getProductOneByCode(String v_prodcode) throws SQLException {
		ProductVO pvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select fk_cateno, prodcode, prodname, prodimg\n "+
				 	 	 " from san_product\n "+
				 	 	 " where prodcode = ? \n ";
			// to_char를 하지않고 pnum으로만 사용하면 주소 pnum='' 안에 아무 문자열을 넣을 경우 alert이 뜨지 않고 오류가 발생한다.
			// 따라서 to_char를 사용해서 문자열도 받을 수 있게 해 주어야 한다.
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, v_prodcode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {    
				int fk_cateno = rs.getInt("fk_cateno");  
				String prodcode = rs.getString("prodcode");           
				String prodname = rs.getString("prodname");       
				String prodimg = rs.getString("prodimg");         
				
				pvo = new ProductVO(fk_cateno, prodcode, prodname, prodimg);
			}
			
		} finally {
			close();
		}
		return pvo;
	}

	// 제품번호를 가지고 해당 제품의 추가된 이미지 정보를 조회해오기
	@Override
	public String getImagesByCode(String v_prodcode) throws SQLException {
		
		String imgfilename = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select imgfilename \n "+
				 	 	 " from san_detail_img \n "+
				 	 	 " where fk_prodcode = ? \n ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, v_prodcode);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				imgfilename = rs.getString("imgfilename");
			}
			
		} finally {
			close();
		}
		return imgfilename;
	}

	
	// ---------------- Wish List ---------------- //
	// 위시리스트에 상품 추가하기
	@Override
	public int addWish(HashMap<String, String> map) throws SQLException {
		int result = 0; 
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " select wishno "
			 		    + " from san_wish "
			 		    + " where fk_userid = ? and"
			 		    + " fk_prodcode = ? and "
			 		    + " model = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, map.get("userid"));
			 pstmt.setString(2, map.get("prodcode"));
			 pstmt.setString(3, map.get("model"));
			 
			 rs = pstmt.executeQuery();
			 
			
			 if(rs.next()) { // 어떤 제품을 추가로 장바구니에 넣고자 하는 경우
			  
				 int wishno = rs.getInt("wishno");
				 
				 sql = " update san_wish set quantity = 1 " + " where wishno = ? ";
				 
				 pstmt.setInt(1, wishno);
				 
				 result = pstmt.executeUpdate(); 
			 }
			 
			 else {
				// 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우
				 
				 sql = " insert into san_wish(wishno, fk_userid, fk_prodcode, model, quantity) "
				 	 + " values(seq_san_wish.nextval, ?, ?, ?, default) ";
				 
				 pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1, map.get("userid"));
				 pstmt.setString(2, map.get("prodcode"));
				 pstmt.setString(3, map.get("model"));
				 
				 result = pstmt.executeUpdate();
			 }
			 
		} finally {
			close();
		}
		
		return result;
	}
	
	// 위시리스트 상품 보여주기
	@Override
	public List<HashMap<String, String>> getWishList(String userid, int currentShowPageNo, int sizePerPage) throws SQLException {
		List<HashMap<String, String>> wishList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select RNO, prodcode, prodname, prodimg, cateno, catename, wishno, price, saleprice, fk_userid, model \n "+
						 " from\n "+
						 " (\n "+
						 " select rownum as RNO, prodcode, prodname, prodimg, cateno, catename, wishno, price, saleprice, fk_userid, model \n "+
						 " from \n "+
						 " (\n "+
						 " select prodcode, prodname, prodimg, cateno, catename, wishno, price, saleprice, fk_userid, model \n "+
						 " from \n "+
						 " (select prodcode, prodname, prodimg, cateno, catename, price, saleprice\n "+
						 " from san_product P, san_category C\n "+
						 " where P.fk_cateno = C.cateno\n "+
						 " ) T, san_wish W\n "+
						 " where T.prodcode = W.fk_prodcode\n ";
			
			if(!"earp".equals(userid)) { 
				// 관리자가 아닌 일반사용자로 로그인 한 경우 
				sql += " and fk_userid = ? ";
			}	
				  sql += " ) R\n " +
						 " ) A\n "+
						 " where RNO between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			 if(!"earp".equals(userid)) { 
					// 관리자가 아닌 일반사용자로 로그인 한 경우 
				    pstmt.setString(1, userid);
				    pstmt.setInt(2, (currentShowPageNo*sizePerPage)-(sizePerPage-1) ); // 공식
					pstmt.setInt(3, currentShowPageNo*sizePerPage ); // 공식 
				}
			    else {
			    	// 관리자로 로그인 한 경우 
			    	pstmt.setInt(1, (currentShowPageNo*sizePerPage)-(sizePerPage-1) ); // 공식
					pstmt.setInt(2, currentShowPageNo*sizePerPage ); // 공식
			    }
			
			rs = pstmt.executeQuery();
			
				int cnt = 0;
				while(rs.next()) {
					cnt++;
					
					if(cnt==1) {
						wishList = new ArrayList<HashMap<String, String>>();
					} 
					
					HashMap<String, String> wishmap = new HashMap<String, String>();
					
					wishmap.put("prodcode", rs.getString("prodcode"));
					wishmap.put("prodname", rs.getString("prodname"));
					wishmap.put("prodimg", rs.getString("prodimg"));
					wishmap.put("price", rs.getString("price"));
					wishmap.put("saleprice", rs.getString("saleprice"));
					wishmap.put("fk_userid", rs.getString("fk_userid"));
					wishmap.put("model", rs.getString("model"));
					wishmap.put("wishno", rs.getString("wishno"));
					
					wishList.add(wishmap);
				} // end of while-----------------------------
		
		
		} finally {
			close();
		}
		return wishList;
	}
    
	

    // 위시리스트 선택 삭제
	@Override
	public int deleteOneWish(String wishno) throws SQLException {
		int result = 0;
		
		try {
	          conn = ds.getConnection();
	          
	          String sql = " delete from san_wish where wishno = ? ";
	          
	          pstmt = conn.prepareStatement(sql);
	          
	          pstmt.setString(1, wishno);
	          
	          result = pstmt.executeUpdate();
	          
	       } finally {
	          
	          close();
	       }
		
		return result;
	}

	// 위시리스트 모두 삭제
	@Override
	public int deleteAllWish() throws SQLException {
		int result = 0;
		
		try {
	          conn = ds.getConnection();
	          
	          String sql = " delete from san_wish ";
	          
	          pstmt = conn.prepareStatement(sql);
	          
	          result = pstmt.executeUpdate();
	          
	       } finally {
	          
	          close();
	       }
		
		return result;
	}

	// 위시리스트에 들어있는 제품의 총개수 구하기
	@Override
	public int getTotalCountWish(String userid) throws SQLException {
		int totalCountWish = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*) AS CNT \r\n" + 
						 "from san_wish ";
			
			if("earp".equals(userid)) { 
				pstmt = conn.prepareStatement(sql);
			}
			else {
				// 관리자가 아닌 일반사용자로 로그인 한 경우 
				sql += " where fk_userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
			}
			
			rs = pstmt.executeQuery();
			rs.next();
						
			totalCountWish = rs.getInt("CNT");
			
		} finally {
			close();
		}

		return totalCountWish;
	}
	
	@Override
	public List<String> getWishNo(String userid) throws SQLException {
		List<String> wishnoArr = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select wishno \n" + 
						 " from san_wish " +
						 " where fk_userid = ? ";
			

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt==1) {
					wishnoArr = new ArrayList<String>();
				}
					
				String wishno = rs.getString("wishno");
				
				wishnoArr.add(wishno);
			}

		} finally {
			close();
		}
		
		return wishnoArr;
	}
	

	// ---------------- Cart List ---------------- //
	// 장바구니 개수
    @Override
    public int cartCount(String userid) throws SQLException {

       int result = 0;
       
       try {
          conn = ds.getConnection();
          
          String sql = "select count(*) as cartCount \n"
                   + "from san_cart \n"
                   + "where fk_userid = ?";
          
          pstmt = conn.prepareStatement(sql);
          
          pstmt.setString(1, userid);
          
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
             
             result = rs.getInt("cartCount");
          }
          
       } finally {
          
          close();
       }
       
       return result;
       
    }

    	// 장바구니 데이터 조회
 		@Override
 		public List<HashMap<String, String>> showCart(String userid) throws SQLException {

 			List<HashMap<String, String>> cartList = null;
 			
 			try {
 				
 				conn = ds.getConnection();
 				
 				String sql = "select cartno, fk_userid, prodcode, prodname, prodimg, cateno, price, saleprice, quantity, model\n" + 
 						 	 "from(\n" + 
 					 		 "    select A.prodcode, B.cateno, A.prodname, A.prodimg, B.price, B.saleprice\n" + 
 							 "    from san_product A join san_category B\n" + 
 							 "    on A.fk_cateno = B.cateno\n" + 
 							 "    order by A.prodcode\n" + 
 							 ")V join san_cart T\n" + 
 							 "on T.fk_prodcode = V.prodcode\n" + 
 							 "where T.fk_userid = ? \n"
 							 + "order by cartno";
 				
 				pstmt = conn.prepareStatement(sql);
 				
 				pstmt.setString(1, userid);
 				
 				rs = pstmt.executeQuery();
 				
 				int cnt = 0;
 				while(rs.next()) {
 					cnt++;
 					
 					if(cnt == 1) {
 						
 						cartList = new ArrayList<HashMap<String, String>>();
 					}
 					
 					HashMap<String, String> map = new HashMap<String,String>();
 			// cartno, fk_userid, prodcode, prodname, prodimg, cateno, price, saleprice, quantity, model		
 					
 					int saleprice = rs.getInt("saleprice");
 					int quantity = rs.getInt("quantity");
 					int price = rs.getInt("price");
 					
 					int orgOneTotal = price * quantity;
 					int prodOneTotal = saleprice * quantity;
 					int discountPrice = (price - saleprice)* quantity;;
 					
 					map.put("cartno", rs.getString("cartno"));
 					map.put("fk_userid", rs.getString("fk_userid"));
 					map.put("prodcode", rs.getString("prodcode"));
 					map.put("prodname", rs.getString("prodname"));
 					map.put("prodimg", rs.getString("prodimg"));
 					map.put("cateno", rs.getString("cateno"));
 					map.put("price", rs.getString("price"));
 					map.put("saleprice", rs.getString("saleprice"));
 					map.put("quantity", rs.getString("quantity"));
 					map.put("model", rs.getString("model"));
 					map.put("orgOneTotal", String.valueOf(orgOneTotal));
 					map.put("prodOneTotal", String.valueOf(prodOneTotal));
 					map.put("discountPrice", String.valueOf(discountPrice));
 					
 					cartList.add(map);
 					
 				}
 				
 			} finally {
 				
 				close();
 			}
 			
 			
 			return cartList;
 			
 		}
 		
 	// delete 키 누른 장바구니 하나만 지우기
	@Override
	public int deleteCartOne(String cartno, String userid) throws SQLException {

		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "delete from san_cart \n"
					   + "where fk_userid = ? and cartno = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, cartno);
			
			n = pstmt.executeUpdate();
			
			
		} finally {
			
			close();
		}
		
		return n;
	}
	
	
	
	
	// 장바구니에서 선택한 상품의 수량 변경
	@Override
	public int updateCartQty(String userid, String cartno, String updateQty) throws SQLException {

		int n = 0; 

		try {
			conn = ds.getConnection();
			
			String sql = "update san_cart set quantity = ? \n"
					   + "where fk_userid = ? and cartno = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updateQty);
			pstmt.setString(2, userid);
			pstmt.setString(3, cartno);
			
			n = pstmt.executeUpdate();
			
			
		} finally {
			
			close();
		}
		
		return n;
	}

	// 위시리스트 한 행 가져오기
	@Override
	public HashMap<String, String> selectWish(String userid, String wishno) throws SQLException {
		
		HashMap<String, String> wishmap = null;
		
		try {
			
			conn = ds.getConnection();
	
			String sql = "select wishno, fk_userid, fk_prodcode, model, quantity \n" + 
						 "from san_wish \n" + 
						 "where fk_userid = ? and wishno = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, wishno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				wishmap = new HashMap<String, String>();
				
				wishmap.put("userid", rs.getString("fk_userid"));
				wishmap.put("prodcode", rs.getString("fk_prodcode"));
				wishmap.put("model", rs.getString("model"));
				wishmap.put("quantity", rs.getString("quantity"));
				
			}
			
		} finally {
			
			close();
		}
		
		return wishmap;
	}

	// 장바구니에 추가하기 
	@Override
	public int insertCart(String userid, HashMap<String, String> paramap) throws SQLException {

		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into san_cart(cartno, fk_userid, fk_prodcode, quantity, model) \n" + 
						 "values(seq_san_cart.nextval,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, paramap.get("prodcode"));
			pstmt.setString(3, paramap.get("quantity"));
			pstmt.setString(4, paramap.get("model"));
			
			n = pstmt.executeUpdate();
			
			
		} finally {
			
			close();
		}
		
		
		
		return n;
		
	}
	
	
	
	// ---------------- Admin Page ---------------- //
	// 제품등록시 다음 제품코드 불러오기
	@Override
	public String getProdcode() throws SQLException {
	// 제품번호 채번 해오기(실제 제품테이블에 있는 Pnum(seq) 가져오기)

		String prodcode = "";
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select '123-'||seq_san_product.nextval as PRODCODE \n" + 
						 "from dual";
			
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			rs.next();
			
			prodcode = rs.getString("PRODCODE");
				

		} finally {
			
			close();
		}
		
		return prodcode;

	}

	// 제품 등록
	@Override
	public int addProd(ProductVO pvo) throws SQLException {
		
		int n = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "insert into san_product \n" + 
					"values(?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pvo.getProdcode());
			pstmt.setInt(2, pvo.getFk_cateno());
			pstmt.setString(3, pvo.getProdname());
			pstmt.setString(4, pvo.getProdimg());
			
			n = pstmt.executeUpdate();
			
			
		} finally {
			
			close();
		}
		
		return n;
	}

	// 상세 이미지 등록
	@Override
	public int addProdDetailImg(String prodcode, String imgdetail) throws SQLException {
		
		int m = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "insert into san_detail_img(fk_prodcode, imgfilename) \n" + 
						 "values(?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prodcode);
			pstmt.setString(2, imgdetail);
			
			m = pstmt.executeUpdate();
			
			
		} finally {
			
			close();
		}
		
		return m;
	}

    
    
    // ---------------- Search ---------------- //
	// 검색 페이지 상품별로 조회해오기
	@Override
	public List<HashMap<String, String>> getSearchList(HashMap<String, String> paramap) throws SQLException {
		
		List<HashMap<String, String>> searchList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select RNO, prodcode, prodname, prodimg, cateno, catename, price, saleprice\n "+
					" from\n "+
					" (select rownum as RNO, prodcode, prodname, prodimg, cateno, catename, price, saleprice\n "+
					" from\n "+
					" (select prodcode, prodname, prodimg, cateno, catename, price, saleprice\n "+
					" from san_product P, san_category C\n "+
					" where P.fk_cateno = c.cateno and 1=1 ";
			
			
			// 검색어로 찾을 때
			if(!"".equalsIgnoreCase(paramap.get("search"))) {
				// 상품명으로 찾을 때
				if("product_name".equalsIgnoreCase(paramap.get("search_condition"))) {
					String search = paramap.get("search");
					sql += " and prodname like '%' || '"+search+"' || '%' \n";
					
				}
				// 상품코드로 찾을 때
				else if("product_code".equalsIgnoreCase(paramap.get("search_condition"))){
					String search = paramap.get("search");
					sql += " and prodcode like '%' || '"+search+"' || '%' \n";	
				}
			}
			
			// 카테고리로 찾을 때
			if(!"".equalsIgnoreCase(paramap.get("category_no"))) {
				String category_no = paramap.get("category_no");            
			    sql += "  and ( cateno = "+category_no+")\n";
			}
			
			// 가격대로 검색하기
			if(!"".equalsIgnoreCase(paramap.get("minprice")) || !"".equalsIgnoreCase(paramap.get("maxprice"))) {
				String minprice = paramap.get("minprice");
				String maxprice = paramap.get("maxprice");
				
				// minprice 만 있을 때
				if(!"".equalsIgnoreCase(minprice) && "".equalsIgnoreCase(maxprice)) {
					sql += " and (saleprice > "+minprice+" ) \n";
				}
				
				// maxprice 만 있을 때
				if("".equalsIgnoreCase(minprice) && !"".equalsIgnoreCase(maxprice)) {
					sql += " and (saleprice < "+maxprice+" ) \n";
				}
				
				// 둘 다 있을 때
				if(!"".equalsIgnoreCase(minprice) && !"".equalsIgnoreCase(maxprice)) {
					sql += " and (saleprice between "+minprice+" and "+maxprice+" ) \n";
				}
				
			}
			
				// 정렬 기준으로 검색할 때
				if(!"".equalsIgnoreCase(paramap.get("orderby"))) {
					String orderby = paramap.get("orderby");
					// 상품명으로 검색할 때
					if("name".equalsIgnoreCase(orderby)) {
						sql += " order by prodname ";
					}
					
					// 낮은 가격 순으로 검색할 때
					if("lowprice".equalsIgnoreCase(orderby)) {
						sql += " order by saleprice ";
					}
					
					// 높은 가격 순으로 검색할 때
					if("highprice".equalsIgnoreCase(orderby)) {
						sql += " order by saleprice desc ";
					}
				}
			
					sql += ") R\n "+
					       " ) T\n "+
					       " where RNO between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramap.get("currentShowPageNo"));
			pstmt.setString(2, paramap.get("sizePerPage"));
			
			rs = pstmt.executeQuery();
			
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt==1) {
					searchList = new ArrayList<HashMap<String, String>>();
				} 
				
				HashMap<String, String> searchmap = new HashMap<String, String>();
				
				searchmap.put("prodcode", rs.getString("prodcode"));
				searchmap.put("prodname", rs.getString("prodname"));
				searchmap.put("prodimg", rs.getString("prodimg"));
				searchmap.put("cateno", rs.getString("cateno"));
				searchmap.put("catename", rs.getString("catename"));
				searchmap.put("price", rs.getString("price"));
				searchmap.put("saleprice", rs.getString("saleprice"));
				
				
				
				searchList.add(searchmap);
				} // end of while-----------------------------
		
		} finally {
			close();
		}
		return searchList;
	}

	// 검색 페이지 조회할 총 개수 구하기
	@Override
	public int getTotalCountSearch(HashMap<String, String> totalmap) throws SQLException {
		int totalCountSearch = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " select count(*) AS CNT\n "+
						 " from san_product P, san_category C\n "+
						 " where P.fk_cateno = c.cateno and 1=1 ";
			
			// 검색어로 찾을 때
			if(!"".equalsIgnoreCase(totalmap.get("search"))) {
				// 상품명으로 찾을 때
				if("product_name".equalsIgnoreCase(totalmap.get("search_condition"))) {
					String search = totalmap.get("search");
					sql += " and prodname like '%' || '"+search+"' || '%' \n";
					
				}
				// 상품코드로 찾을 때
				else if("product_code".equalsIgnoreCase(totalmap.get("search_condition"))){
					String search = totalmap.get("search");
					sql += " and prodcode like '%' || '"+search+"' || '%' \n";	
				}
			}
			
			// 카테고리로 찾을 때
			if(!"".equalsIgnoreCase(totalmap.get("category_no"))) {
				String category_no = totalmap.get("category_no");            
			    sql += "  and ( cateno = "+category_no+")\n";
			}
			
			// 가격대로 검색하기
			if(!"".equalsIgnoreCase(totalmap.get("minprice")) || !"".equalsIgnoreCase(totalmap.get("maxprice"))) {
				String minprice = totalmap.get("minprice");
				String maxprice = totalmap.get("maxprice");
				
				// minprice 만 있을 때
				if(!"".equalsIgnoreCase(minprice) && "".equalsIgnoreCase(maxprice)) {
					sql += " and (saleprice > "+minprice+" ) \n";
				}
				
				// maxprice 만 있을 때
				if("".equalsIgnoreCase(minprice) && !"".equalsIgnoreCase(maxprice)) {
					sql += " and (saleprice < "+maxprice+" ) \n";
				}
				
				// 둘 다 있을 때
				if(!"".equalsIgnoreCase(minprice) && !"".equalsIgnoreCase(maxprice)) {
					sql += " and (saleprice between "+minprice+" and "+maxprice+" ) \n";
				}
				
			}
			
			// 정렬 기준으로 검색할 때
			if(!"".equalsIgnoreCase(totalmap.get("orderby"))) {
				String orderby = totalmap.get("orderby");
				// 상품명으로 검색할 때
				if("name".equalsIgnoreCase(orderby)) {
					sql += " order by prodname ";
				}
				
				// 낮은 가격 순으로 검색할 때
				if("lowprice".equalsIgnoreCase(orderby)) {
					sql += " order by saleprice ";
				}
				
				// 높은 가격 순으로 검색할 때
				if("highprice".equalsIgnoreCase(orderby)) {
					sql += " order by saleprice desc ";
				}
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
						
			totalCountSearch = rs.getInt("CNT");
			
		} finally {
			close();
		}

		return totalCountSearch;
	}

	
	// 위시리스트가 장바구니에 담기면 위시리스트 삭제
	@Override
	public int deleteWishOne(String wishno, String userid) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "delete from san_wish \n" + 
						 "where wishno = ? and fk_userid = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, wishno);
			pstmt.setString(2, userid);
			
			n = pstmt.executeUpdate();
			
			
		} finally {
			
			close();
		}

		return n;
	}

}
