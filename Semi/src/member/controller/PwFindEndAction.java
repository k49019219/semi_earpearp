package member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class PwFindEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); 

		if ("POST".equalsIgnoreCase(method)){
			// 아이디 찾기 버튼에서 아이디를 입력하고 찾기 버튼을 클릭했을 때
			String type = request.getParameter("Findradio");
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String email = request.getParameter("email");
			String mobile1 = request.getParameter("mobile1");
			String mobile2 = request.getParameter("mobile2");
			String mobile3 = request.getParameter("mobile3");
			
			InterMemberDAO memberdao = new MemberDAO();
			HashMap<String,String> paraMap = new HashMap<String,String>();
			paraMap.put("name",name);
			paraMap.put("userid",userid);
			paraMap.put("email", email);
			paraMap.put("mobile1", mobile1);
			paraMap.put("mobile2", mobile2);
			paraMap.put("mobile3", mobile3);
		
			HashMap<String,String> findMap = new HashMap<String,String>();
			
			if ( "email".equalsIgnoreCase(type)) {
				findMap = memberdao.findPwdEmail(paraMap);
				
				mobile1 = findMap.get("mobile1");
				mobile2 = findMap.get("mobile2");
				mobile3 = findMap.get("mobile3");
			}
			else {
				findMap = memberdao.findPwdMobile(paraMap);
				email = findMap.get("email");
			}
			
			
			if ( findMap.get("isExist").equals("false")) {   // 이름과 전화번호가 모두 일치하지 않을 때.
				
				String message = "입력하신 정보로 가입된 회원은 존재하지 않습니다";
				String loc = "javascript:history.back()";
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			else {
				
				request.setAttribute("userid", userid );
			
				request.setAttribute("mobile1", mobile1);
				request.setAttribute("mobile2", mobile2);
				request.setAttribute("mobile3", mobile3);
			
				request.setAttribute("email", email);
				
				super.setViewPage("/WEB-INF/member/pwFindEnd.jsp");
			}
		}
		else {
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);  // 디폴트값
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;  // 여기서 멈추어라 => 하단 소스가 적용되지 않음(출력 안됨)
			
		}
		
	}

}
