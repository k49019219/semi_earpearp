package order.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import member.model.MemberVO;
import myshop.model.ProductVO;

public interface InterOrderDAO {

	// 주문 ~ 주문 테이블 관련 ----------------------------------------------------------------------------
	
	// 새 주문 insert하고 생성된 주문 번호 받아오기
	HashMap<String,String> addNewOrder(HashMap<String,String> mapOrder) throws SQLException; 
	
	// 받아온 주문번호로 주문 상품 각각 상세 주문 테이블로 insert하기
	int addDetailOrder(HashMap<String,String> mapDetailOrder) throws SQLException; 
	
	// 입력받은 배송지를 배송지 테이블에 insert하기
	int addOrderShippment(HashMap<String,String> mapOrderShippment) throws SQLException; 
	
	// 해당 userid를 가진 회원의 총 주문 수를 불러온다.
	String getNumberOfOrder(HashMap<String,String> searchTerms) throws SQLException; 

	// 해당 회원의 주문 정보 조회하기
	List<HashMap<String,String>> getOrderDetailInfo(HashMap<String,String> searchTerms, String currentShowPageNo, String sizePerPage) throws SQLException; 
	
	// 해당 조건의 주문 정보 개수 구하기
	int totalPage(HashMap<String,String> searchTerms, String sizePerPage) throws SQLException; 
	
	// 추가적으로 필요한 주문 정보(주문한 제품의 카테고리번호, 해당 주문번호를 fk로 가지는 상세주문번호의 수)
	HashMap<String,String> getExtraOrderInfo(String prodcode, String ordernum) throws SQLException;
	
	// 모든 과정이 끝나고, 해당 cartno를 삭제한다.
	void deleteCart(String cartno, String userid) throws SQLException; 
	
	// 해당 userid를 가진 회원의 주문 상태 별 주문 개수를 모두 불러온다.		
	HashMap<String,String> getNumByOrderStatus(String userid) throws SQLException; 
	
	// 주문 상세페이지에서 주문에 대한 정보
	HashMap<String,String> getDetailPageOrderInfo(String ordernum) throws SQLException; 
	
	// 주문 상세페이지에서 주문 상세 정보
	List<HashMap<String,String>> getDetailPageOrderDetailInfo(String ordernum, String prodcode) throws SQLException; 		
	
	// 주문 ~ 회원 정보 관련 ----------------------------------------------------------------------------------
	
	// 현재 로그인한 회원의 사용가능한 적립금을 받아온다.
	String getUserMileage(String userid) throws SQLException;
		
	// 현재 로그인한 회원이 등록한 주소록을 모두 가져온다.
	List<HashMap<String,String>> getAddressList(String userid) throws SQLException;
	
	// 현재 로그인한 회원이 주문에 사용한 적립금을 업데이트 한다.
	String updateUsedMileage(String usedMileage, String userid, String ordernum) throws SQLException;
	
	// 상품 구매로 적립된 금액만큼 회원 정보에 업데이트하기
	void updateSavedMileage(String mileageToSave, String userid, String ordernum) throws SQLException;				
	
	// 현재 로그인한 회원의 주소록에서 삭제하려는 주소번호를 가진 행을 삭제한다.
	int deleteAddress(String addressNo, String userid) throws SQLException;
	
	// 현재 로그인한 회원의 주소록에 새롭게 입력한 주소를 추가한다.
	void addNewAddress(HashMap<String,String> newAddress) throws SQLException;
	
	// 현재 로그인한 회원의 주소록에서 특정 주소를 수정한다.
	void updateAddress(HashMap<String,String> updateAddress) throws SQLException;
	
	// 현재까지의 주소지 개수를 받아와서 10개라면 더이상 입력하지 못하게 한다.
	int countNumberOfAddress(String userid) throws SQLException;
	
	// 주문 ~ 상품 테이블 관련 -----------------------------------------------------------------------------
	// 1. 카트 번호로 카트 테이블에서 제품 관련 정보를 얻어오는 메소드
	HashMap<String, String> getCartList(String cartNo, String userid) throws SQLException;

	// 2. 상품 코드로 상품 정보 받아오기
	ProductVO getProductInfo(String prodcode) throws SQLException;

	// admin 관련 ----------------------------------------------------------------------------------
	// 모든 멤버의 주문상태 조회
	List<HashMap<String, String>> AllMemberOrderList(String size, String current) throws SQLException;
	
	// jsp_order_detail 테이블의 deliverstatus(배송상태) 컬럼의 값을 2(배송시작)로 변경하기
	int updateDeliverStart(String odrcodePnum, String str) throws SQLException;

	// 영수증전표(odrcode)소유주에 대한 사용자 정보를 조회해오는 것.
	MemberVO odrcodeOwnerMemberInfo(String key) throws SQLException;
	
	// order status 갯수 구하기
	String getStatusCnt(String str) throws SQLException;
}
