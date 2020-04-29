package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class BasketDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser");
		
		String userid = loginuser.getUserid();
					
		String cartno = request.getParameter("cartno");
		
		// System.out.println(cartno);
		
		String[] cartnoArr = cartno.split(",");
		
		InterProductDAO pdao = new ProductDAO();
		
		int n = 0;
		
		for(int i=0; i<cartnoArr.length; i++) {
			
			 n = pdao.deleteCartOne(cartnoArr[i], userid);
			
		}
		
		
	//	System.out.println(cartno);
		
		
		if(n==1) {
			
			System.out.println("성공");
			
		}
		else {
			
			System.out.println("실패");
			
		}
			
		
		
		super.setRedirect(true);
		super.setViewPage("/Semi/order/basket.sa");
		
		
		
		
	}

}
