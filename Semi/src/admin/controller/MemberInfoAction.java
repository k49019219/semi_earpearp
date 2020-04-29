package admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;

public class MemberInfoAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginuser == null) {
			
			String message = "먼저 관리자로 로그인 하세요.";
			String loc = "javascript:history.back();";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;	// break;
		}
		else {
			
			String userid = loginuser.getUserid();
			
			if( !("earp".equals(userid)) ) {
				
				String message = "관리자만 접근이 가능합니다.";
				String loc = "javascript:history.back();";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return; // break;
				
			}
			
		}// 관리자 로그인
		
		String userid = request.getParameter("userid");
		
		InterMemberDAO mdao = new MemberDAO();
		
		MemberVO user = mdao.selectOneMember(userid);
		
		request.setAttribute("user", user);
		
		super.setViewPage("/WEB-INF/admin/memberInfo.jsp");
		
	}

}
