package order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import myshop.model.ProductVO;
import order.model.InterOrderDAO;
import order.model.OrderDAO;

public class OrderResultAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		if("POST".equals(method)) {
			InterOrderDAO odao = new OrderDAO();
			// 주문 페이지에서 작성한 배송, 주문 상품 관련 정보를 불러온다.
			String howtopay = request.getParameter("howtopay");
			
			String receiver = request.getParameter("name");
			String post = request.getParameter("postnum");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			
			String hp1 = request.getParameter("hp1");
			String hp2 = request.getParameter("hp2");
			String hp3 = request.getParameter("hp3");
			
			String email = request.getParameter("emailId")+"@"+request.getParameter("emailSite");
			
			String shippingMsg = request.getParameter("shippingMsg");
			String shippingfee = request.getParameter("shippingfee");
			
			// 사용한 마일리지를 회원 정보에서 차감한다.
			String usedMileage = request.getParameter("usedMileage");
			
			// 해당 금액만큼 회원 정보에 적립한다.
			String mileageToSave = request.getParameter("mileageToSave");
			
			String cartnoArr_str = request.getParameter("cartnoArr");
			String[] CartNoArr = null;
			if(cartnoArr_str != null) {
				CartNoArr = cartnoArr_str.split(",");
			} 

			HttpSession session = request.getSession();
			Object obj = session.getAttribute("loginUser");
			MemberVO loginUser = (MemberVO)obj;
			String userid = "";
			if(loginUser!=null) {
				userid = loginUser.getUserid();
			} 
			else {
				String message = "잘못된 접근입니다! 로그인하세요!";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				// super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				return; // 이 이상 동작을 수행하지 않고 종료한다. 
			}
			
			InterOrderDAO dao = new OrderDAO();
			// 받아온 cartNoArr로 구입한 상품 정보, 개수, 옵션, 가격 등 알아오기---------------------------------
			ArrayList<HashMap<String,String>> productList = new ArrayList<HashMap<String,String>>();
			
			for(int i=0; i<CartNoArr.length; i++) {
			
				// 1. 카트 번호로 카트 테이블에서 제품 관련 정보를 얻어오는 메소드
				HashMap<String, String> cartInfo = dao.getCartList(CartNoArr[i], userid);
				// 각각 cartno에 맞는 prodcode, quantity, model를 가져온다
				
				if(cartInfo!=null) {
					
					HashMap<String,String> product = new HashMap<String,String>();
					product.put("cartno", CartNoArr[i]); // 삭제할때 사용하기 위해 cartno을 함께 가져간다
					product.put("prodcode", cartInfo.get("prodcode"));
					product.put("qty", cartInfo.get("quantity"));
					product.put("model", cartInfo.get("model"));
					
					ProductVO eachproduct = dao.getProductInfo(cartInfo.get("prodcode"));
				
					product.put("cateno", String.valueOf(eachproduct.getCateno()));
					product.put("prodname", eachproduct.getProdname());
					product.put("prodimg", eachproduct.getProdimg());
					product.put("price", String.valueOf(eachproduct.getPrice()));
					product.put("saleprice",String.valueOf(eachproduct.getSaleprice()));
					
					productList.add(product);
				}
			} // end of for--------------------------------------------------------------------
			request.setAttribute("productList", productList);
		
			// 총 원래 가격, 총 할인가격, 최종 주문금액을 계산한다.--------------------------------------
			HashMap<String,String> price = new HashMap<String,String>();
			String totalPayment = request.getParameter("totalPayment");
			String totalOriginalPrice = request.getParameter("totalOriginalPrice");
			String totalSalePrice = request.getParameter("totalSalePrice");
			
			price.put("totalPayment", totalPayment);
			price.put("totalOriginalPrice", totalOriginalPrice);
			price.put("totalSalePrice", totalSalePrice);
			request.setAttribute("price", price);
			// 필요한 정보 받아오기 --------------------------------------------------------------------------
			
			////////////////////////////////////////////////////////////////////////////////////////
			// 주문 테이블에 insert하기
			
			// 주문 테이블에 insert하고 주문 번호 받아오기
			HashMap<String,String> mapOrder = new HashMap<String,String>();
			mapOrder.put("userid", userid);
			mapOrder.put("totalPrice", totalPayment);
			mapOrder.put("howtopay", howtopay);
			
			request.setAttribute("howtopay", howtopay);
			HashMap<String,String> orderInfo = odao.addNewOrder(mapOrder); // 새 주문을 insert하고 주문번호, 주문일자를 받아온다.
			// ordernum, orderdate
			
			// 받아온 주문번호로 각각 주문상품별 주문상세 테이블에 insert하기
			for(HashMap<String,String> product : productList) {
				
				HashMap<String,String> mapDetailOrder = new HashMap<String,String>();
				
				mapDetailOrder.put("ordernum", orderInfo.get("ordernum"));
				mapDetailOrder.put("prodcode", product.get("prodcode"));
				mapDetailOrder.put("qty", product.get("qty"));
				mapDetailOrder.put("prodname", product.get("prodname"));
				mapDetailOrder.put("price", product.get("price"));
				mapDetailOrder.put("saleprice", product.get("saleprice"));
				mapDetailOrder.put("model", product.get("model"));
				
				int n = odao.addDetailOrder(mapDetailOrder);
			}
			
			// 입력받은 배송지를 배송지 테이블에 insert하기
			HashMap<String,String> mapOrderShippment = new HashMap<String,String>();
			
			mapOrderShippment.put("ordernum", orderInfo.get("ordernum"));
			mapOrderShippment.put("orderdate", orderInfo.get("orderdate"));
			mapOrderShippment.put("address", addr1+" "+addr2);
			mapOrderShippment.put("orderstatus", "결제완료");
			
			
			if("2500".equals(shippingfee.trim())) {
				mapOrderShippment.put("shippingstatus", "기본배송");
			} else {
				mapOrderShippment.put("shippingstatus", "무료배송");
			}
			
			mapOrderShippment.put("shippingprice", shippingfee);
			mapOrderShippment.put("receiver", receiver);
			mapOrderShippment.put("post", post);
			mapOrderShippment.put("shippingmsg", shippingMsg);
			mapOrderShippment.put("hp", hp1+"-"+hp2+"-"+hp3);
			mapOrderShippment.put("email", email);
			
			int n = odao.addOrderShippment(mapOrderShippment);
		
			// 사용한 마일리지를 회원 정보에서 차감하기 
			if(usedMileage==null || "".equals(usedMileage)) {
				usedMileage = "";
			}
			String ableMileage = dao.updateUsedMileage(usedMileage, userid, orderInfo.get("ordernum"));
			
			request.setAttribute("ableMileage", ableMileage);
			request.setAttribute("mapOrderShippment", mapOrderShippment);
		
			// 상품 구매로 적립된 금액만큼 회원 정보에 업데이트하기
			dao.updateSavedMileage(mileageToSave, userid, orderInfo.get("ordernum"));		
			
			// 모든 과정이 끝나고, 해당 cartno를 삭제한다.
			for(int i=0; i<CartNoArr.length; i++) {
				odao.deleteCart(CartNoArr[i], userid);
			}
			
			// 모든 과정이 끝나고, session에 저장했던 cartno를 삭제한다.
			session.removeAttribute("CartNoArr");
			
		} // end of POST----------------------------------------------------------------------
		
		
		// 주문서 작성 완료 페이지
		super.setViewPage("/WEB-INF/order/orderResult.jsp");
	}
}
