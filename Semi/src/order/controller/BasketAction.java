package order.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.*;
public class BasketAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	/*	
		상품 디테일 -->  회원아이디, 제품번호, 수량, 옵션 (맵)
		위시		 --> 회원아이디, 제품번호, 수량(default), 옵션	(맵)
	*/
		
		
	/*	
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = loginuser.getUserid();
	*/	
		InterProductDAO pdao = new ProductDAO();
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser");
	
		if(loginuser != null) {
			
			String userid = loginuser.getUserid();
			
		//	List<HashMap<String, String>> cartList = pdao.showCart(로그인유저아이디);
			List<HashMap<String, String>> cartList = pdao.showCart(userid);
			
		//	System.out.println(cartList.size());
			
			int totalPrice = 0;
			int subTotal = 0;
			int discountPrice = 0;
			if(cartList != null) {
				for(HashMap<String, String> map : cartList) {
					
					totalPrice += Integer.parseInt(map.get("prodOneTotal"));
					subTotal += Integer.parseInt(map.get("orgOneTotal"));
					discountPrice += Integer.parseInt(map.get("discountPrice"));
				}
			}
			
			request.setAttribute("cartList", cartList);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("subTotal", subTotal);
			request.setAttribute("discountPrice", discountPrice);
			
			String cartCount = String.valueOf(pdao.cartCount(userid));
			session.setAttribute("cartCount", cartCount);
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/order/basket.jsp");
			
		}
		else{
			// 로그인 안 하고 장바구니 담을 때
			
			super.setRedirect(true);
			super.setViewPage("/Semi/member/login.sa");
			
		}
		
		
		
	}

}
