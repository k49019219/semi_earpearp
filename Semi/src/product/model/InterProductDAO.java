package product.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterProductDAO {
	
	// 카테고리 보여주기
	List<HashMap<String, String>> getCategoryList() throws SQLException;
	
	// totalpage
	int totalPage(String sizePerPage, String cateno) throws SQLException;
		
	// 상품목록 불러오기
	List<ProductVO> productList(HashMap<String, String> paramap) throws SQLException;
	
	// 카테고리 데이터 조회
	HashMap<String,String> category(String cateno) throws SQLException;

	
	
	
	// 제품코드를 가지고 해당 제품의 정보를 조회해오기
	ProductVO getProductOneByCode(String prodcode) throws SQLException;

	// 제품코드를 가지고 해당 제품의 추가된 이미지 정보를 조회해오기
	String getImagesByCode(String prodcode) throws SQLException;

	
	
	
	// 위시리스트에 상품 추가하기
	int addWish(HashMap<String, String> map) throws SQLException;

	// 위시리스트 상품 보여주기
	List<HashMap<String, String>> getWishList(String userid, int currentShowPageNo, int sizePerPage) throws SQLException;
	
	// 위시리스트 선택 삭제
	int deleteOneWish(String wishno) throws SQLException;

	// 위시리스트 모두 삭제
	int deleteAllWish() throws SQLException;

	// 위시리스트에 들어있는 제품의 총개수 구하기
	int getTotalCountWish(String userid) throws SQLException;
	
	// 위시리스트에 있는 전체 wishno 가져오기
	List<String> getWishNo(String userid) throws SQLException;
	
	
	
	
	// 위시리스트가 장바구니에 담기면 위시리스트 삭제
	int deleteWishOne(String wishno,String userid) throws SQLException;
	
	// 장바구니 갯수
	int cartCount(String userid) throws SQLException;
	
	// 장바구니 데이터 조회
	List<HashMap<String, String>> showCart(String userid) throws SQLException;
	
	// cartno 에 해당하는 상품 장바구니에서 지우기
	int deleteCartOne(String cartno, String userid) throws SQLException;
	
	// 장바구니에서 선택한 상품의 수량 변경
	int updateCartQty(String userid, String cartno, String updateQty) throws SQLException;
	
	// 위시리스트 한 행 가져오기
	HashMap<String, String> selectWish(String userid, String wishno) throws SQLException;
	
	// 장바구니에 추가하기 
	int insertCart(String userid, HashMap<String, String> wishMap) throws SQLException;

	// 다음 제품번호 불러오기
	String getProdcode() throws SQLException;
	
	
	
	
	// 제품 등록
	int addProd(ProductVO pvo) throws SQLException;
	
	// 상세 이미지 등록
	int addProdDetailImg(String prodcode, String imgdetail) throws SQLException;

	
	
	
	// 검색 페이지 상품별로 조회해오기
	List<HashMap<String, String>> getSearchList(HashMap<String, String> paramap) throws SQLException;

	// 검색 페이지 조회할 총 개수 구하기
	int getTotalCountSearch(HashMap<String, String> totalmap) throws SQLException;

	

}
