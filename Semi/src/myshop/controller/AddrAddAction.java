package myshop.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.InterOrderDAO;
import order.model.OrderDAO;

public class AddrAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addrbase = request.getParameter("addrbase"); // 기본 배송지 여부
		String destination = request.getParameter("destination");
		String receiver = request.getParameter("receiver");
		
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
		HashMap<String,String> newAddress = new HashMap<String,String>();
		newAddress.put("post", post);
		newAddress.put("addr1", addr1);
		newAddress.put("addr2", addr2);
		newAddress.put("addrbase", addrbase);
		newAddress.put("destination", destination);
		newAddress.put("receiver", receiver);
		newAddress.put("userid", userid);
		
		InterOrderDAO mdao = new OrderDAO();
		// 현재까지의 주소지 개수를 받아와서 10개라면 더이상 입력하지 못하게 한다.
		int n = mdao.countNumberOfAddress(userid);
		
		if(n<10) {
			// 10개 이하라면 정상적으로 입력
			mdao.addNewAddress(newAddress);
		} else {
			String message = "주소지는 10개만 입력 가능합니다!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return; // 이 이상 동작을 수행하지 않고 종료한다. 
		}
		
		// 다른 controller로 이동
		super.setRedirect(true);
		super.setViewPage("/Semi/addrPopup/list.sa");
		
	} // execute -----------------------------------------------------------------------------------

}
