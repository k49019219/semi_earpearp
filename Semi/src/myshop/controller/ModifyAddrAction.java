package myshop.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import myshop.model.AddrDAO;
import myshop.model.InterAddrDAO;

public class ModifyAddrAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
		String straddrNO = request.getParameter("addrNO");
		
		// == *** 로그인 안되어 있다면 *** == //
		
		if (loginuser==null) {
		
			String message = "먼저 로그인하세요.";
			String loc = "javascript:history.back()";
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}	
		else {
			
			int addrNo = Integer.parseInt(straddrNO);
			
			InterAddrDAO dao = new AddrDAO();
			HashMap<String, String> addr = dao.selectAdr(addrNo);
		   
			request.setAttribute("addr", addr);
			
			super.setViewPage("/WEB-INF/myshop/addr/modifyAddr.jsp");
		}
	}

}
