package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class BasketUpdateAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser");
		
		String userid = loginuser.getUserid();
		
		if(userid == null) {
			
			userid = "tj2571";
			
		}
		String cartno = request.getParameter("cartno");
		String updateQty = request.getParameter("updateQty");
		
	//	System.out.println("crtno -> " + cartno);
	//	System.out.println("updateQty -> "+ qty);
		
		InterProductDAO pdao = new ProductDAO();
		
		int n = pdao.updateCartQty(userid, cartno, updateQty);
		
		if(n == 1) {
			
			System.out.println("장바구니 업데이트 성공");
			
		}
		else {
			System.out.println("장바구니 업데이트 실패");
			
		}
		
		
		super.setRedirect(true);
		super.setViewPage("/Semi/order/basket.sa");
		
	}

}
