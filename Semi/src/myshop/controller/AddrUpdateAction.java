package myshop.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.InterOrderDAO;
import order.model.OrderDAO;


public class AddrUpdateAction extends AbstractController {

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
		
		// 주문 페이지의 주소록 팝업창에서 주소 수정하는 controller
		String addrno = request.getParameter("addrno");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addrbase = request.getParameter("addrbase");
		String destination = request.getParameter("destination");
		String receiver = request.getParameter("receiver");

		HashMap<String,String> updateAddress = new HashMap<String,String>();
		updateAddress.put("post", post);
		updateAddress.put("addr1", addr1);
		updateAddress.put("addr2", addr2);
		updateAddress.put("addrbase", addrbase);
		updateAddress.put("destination", destination);
		updateAddress.put("receiver", receiver);
		updateAddress.put("userid", userid);
		updateAddress.put("addrno", addrno);
		
		InterOrderDAO mdao = new OrderDAO();
		
		mdao.updateAddress(updateAddress);
	
		
		// 다른 controller로 이동
		super.setRedirect(true);
		super.setViewPage("/Semi/addrPopup/list.sa");

	} // end of execute -------------------------------------------------------------------------------------------------

}
