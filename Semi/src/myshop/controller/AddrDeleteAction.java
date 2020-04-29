package myshop.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.*;

public class AddrDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
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
		// 주문 페이지의 주소록 팝업창에서 주소 삭제하는 controller
		String addressNoArr_str = request.getParameter("addressNoArr");

		String[] addressNoArr = null;

		if(addressNoArr_str!=null) {
			addressNoArr = addressNoArr_str.split(",");
		}
		
		InterOrderDAO mdao = new OrderDAO();
		
		for(int i=0; i<addressNoArr.length; i++) {
			int n = mdao.deleteAddress(addressNoArr[i], userid);
		}
		
		// 다른 controller로 이동
		super.setRedirect(true);
		super.setViewPage("/Semi/addrPopup/list.sa");

	} // end of execute-------------------------------------------------------------------------

}
