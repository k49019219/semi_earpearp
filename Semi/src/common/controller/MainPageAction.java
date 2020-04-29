package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class MainPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();
		
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser");
		
		String cartCount = "";
		if(loginuser != null) {
			
			String userid = loginuser.getUserid();
			
			cartCount = String.valueOf(pdao.cartCount(userid));
			
			if("0".equals(cartCount)) {
				
				cartCount = "";
				
			}
			
			
		}
		
		
		session.setAttribute("cartCount", cartCount);
		
		
		// 메인페이지로 이동
		super.setViewPage("/WEB-INF/mainPage.jsp");
		
	}
}
