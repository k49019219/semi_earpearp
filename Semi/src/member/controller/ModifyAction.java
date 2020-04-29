package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class ModifyAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
				
		// == *** POST 방식으로 넘어온 것이 아니라면 *** == //
		
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
			// 회원 정보 수정 페이지
			super.setViewPage("/WEB-INF/member/modify.jsp");
		
		}
	}

}
