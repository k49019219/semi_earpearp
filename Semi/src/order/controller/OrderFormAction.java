package order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.*;
import myshop.model.ProductVO;


public class OrderFormAction extends AbstractController {
	
	// 장바구니에서 주문할 상품 목록을 받아와서 view단으로 전송하는 controller
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterOrderDAO dao = new OrderDAO();
		
		// 현재 로그인한 사람의 userid에 해당하는 사용가능한 적립금을 가져와서 view단으로 넘겨준다.-----------------------
		HttpSession session =  request.getSession();
		Object obj = session.getAttribute("loginUser");
		MemberVO loginUser = (MemberVO)obj;

		String userid = "";
		if(loginUser != null) {
			userid = loginUser.getUserid();
			
		} else {
			
			String message = "잘못된 접근입니다! 로그인하세요!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return; // 이 이상 동작을 수행하지 않고 종료한다. 		
		}

		String ableMileage = dao.getUserMileage(userid);
		request.setAttribute("ableMileage", ableMileage);

		// 장바구니에서 아래 세 배열, 상품코드, 수량, 선택모델을 받아온다!
		// 삭제를 선택한 경우 삭제된 제품을 제외하고 같은 방식으로 전송한다.
		String CartNoArr_Str = request.getParameter("cartnoArr");
		
		
		String[] CartNoArr = null;
		

		//  -------------------------------------------------------------
		if(CartNoArr_Str!=null) {
			session.setAttribute("CartNoArr", CartNoArr_Str); // 처음 로딩되었을때 session에 저장한다.
		}
		else {
			CartNoArr_Str = (String)session.getAttribute("CartNoArr");
		}
		
		// request에서도, session에서도 null이라면
		if(CartNoArr_Str == null){
			
			String message = "카트가 비어있습니다!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return; // 이 이상 동작을 수행하지 않고 종료한다.
			
		} else {
			CartNoArr = CartNoArr_Str.split(",");
		}
		
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
	
		// 총 원래 가격, 총 할인가격, 최종 주문금액을 미리 계산해서 view단으로 보낸다.---------------------------------------
		int totalSalePrice = 0;
		int totalOriginalPrice = 0;
		for(HashMap<String,String> product : productList) {
			int price = Integer.parseInt(product.get("price"));
			int qty = Integer.parseInt(product.get("qty"));
			int saleprice = Integer.parseInt(product.get("saleprice"));
			
			totalOriginalPrice += price*qty;
			totalSalePrice += (price-saleprice)*qty;
		}
		
		int totalPrice = totalOriginalPrice-totalSalePrice;
		
		int shippingfee = 0;
		if(totalPrice>=50000) {
			shippingfee = 0;
		} else {
			shippingfee = 2500;
		}
		
		HashMap<String,Integer> price = new HashMap<String,Integer>();
		
		price.put("totalSalePrice",totalSalePrice);
		price.put("totalOriginalPrice",totalOriginalPrice);
		price.put("totalPrice",totalPrice);
		price.put("shippingfee",shippingfee);

		request.setAttribute("price", price);
	
		// 만약 배송지 팝업에서 배송지를 선택했다면 아래 값을 받게 된다.
		String receiver = request.getParameter("receiver");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");
		
		HashMap<String,String> address = new HashMap<String,String>();
		address.put("receiver",receiver);
		address.put("post",post);
		address.put("addr1",addr1);
		address.put("addr2",addr2);
		address.put("hp2",hp2);
		address.put("hp3",hp3);
		
		request.setAttribute("address", address);
		
		// 주문서 작성 페이지----------------------------------------------------------------------------- 
		super.setViewPage("/WEB-INF/order/orderForm.jsp");
		
	}// end of execute-------------------------------------------------------------------------------

}
