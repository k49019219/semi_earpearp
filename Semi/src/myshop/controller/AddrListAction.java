package myshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;
import myshop.model.*;

public class AddrListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
		
		if (loginuser==null) {
			
				String message = "먼저 로그인하세요.";
				String loc = "/Semi/member/login.sa";
				request.setAttribute("message", message);  
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
		}	
		else {
			// MYPAGE - ORDER
			 
			 InterAddrDAO adrdao = new AddrDAO();
			 List<AddrVO> adrList = adrdao.addrList(loginuser.getUserid());
			 request.setAttribute("adrList",adrList );
			 
			 super.setRedirect(false);
			 super.setViewPage("/WEB-INF/myshop/addr/addrList.jsp");
			
		}
		
	}

}
