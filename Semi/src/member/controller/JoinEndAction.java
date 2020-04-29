package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class JoinEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();   // 무조건 대문자로 출력 
		
		/*
		if( ! "POST".equalsIgnoreCase(method)) {
		
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);  // 디폴트값
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;  // 여기서 멈추어라 => 하단 소스가 적용되지 않음(출력 안됨)
		}
		*/
		super.setViewPage("/WEB-INF/member/joinEnd.jsp");
		
	}

}
