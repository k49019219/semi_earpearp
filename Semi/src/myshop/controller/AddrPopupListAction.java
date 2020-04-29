package myshop.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.*;

public class AddrPopupListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 팝업창에서 현재 로그인한 회원이 주소록에 저장한 모든 주소를 받아온다.
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
		
		InterOrderDAO dao = new OrderDAO();
		List<HashMap<String,String>> addressList = dao.getAddressList(userid);
		
		request.setAttribute("addressList", addressList);
		super.setViewPage("/addrPopup/list.jsp");
		
	}

}
