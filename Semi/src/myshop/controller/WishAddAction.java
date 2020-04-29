package myshop.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class WishAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		int length = Integer.parseInt(request.getParameter("length"));
			
		int n = 0;
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser");
		
		
		if(!"POST".equalsIgnoreCase(method)) {
			// GET 방식이라면
			
			String message = "비정상적인 경로로 들어왔습니다";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}

		
		else {
			
			if(loginuser != null) {
				for(int i=0; i<length; i++) {
					// 제품코드(prodcode), 옵션(model), 수량(oqty), spinnerLength(length)
					String prodcode = request.getParameter("prodcode"+i); // 제품번호
					String model = request.getParameter("model"+i); // 주문량
					
					
					HashMap<String, String> map = new HashMap<String, String>();
					
					map.put("prodcode", prodcode);
					map.put("model", model);
					map.put("userid", loginuser.getUserid());
					
					InterProductDAO pdao = new ProductDAO();
					n = pdao.addWish(map);
				}
				
				if(n==1) {
					request.setAttribute("message", "관심상품으로 등록되었습니다.");
					request.setAttribute("loc", "javascript:history.back()");
				}
				else {
					request.setAttribute("message", "위시리스트 담기 실패!!");
					request.setAttribute("loc", "javascript:history.back()");
				}
				
				super.setViewPage("/WEB-INF/msg.jsp");
				
				} 
			
			else {
				super.setRedirect(true);
				super.setViewPage("/Semi/member/login.sa");
			}
		
		}
	}
}
	

