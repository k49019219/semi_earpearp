package member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;

public class LoginEndAction extends AbstractController {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();   // 무조건 대문자로 출력 
		
		if( ! "POST".equalsIgnoreCase(method)) {
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);  // 디폴트값
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;  // 여기서 멈추어라 => 하단 소스가 적용되지 않음(출력 안됨)
		}
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		InterMemberDAO memberdao = new MemberDAO();
		HashMap<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", pwd);
		
		MemberVO loginUser = memberdao.getOneMember(paraMap);  // 로그인 하면 유저의 DB를 한 번에 가져와서, 이후에 내 정보 보기 등을 클릭할 때 활용한다.
		
		
		if(loginUser != null && loginUser.isIdleStatus() == false ) { 
			
	         // 로그인 성공하고 휴먼상태 아닐 때
	
			// 세션(session) 영역에 loginUser 를 저장시켜두면, 모든 페이지(파일) 에서 loginUser 정보를 읽을 수 있게 된다.
			HttpSession session = request.getSession(); 
			session.setAttribute("loginUser", loginUser);
			
			
			if(loginUser.isRequirePwdChange() == true) { 	// 비밀번호 바꾼지 6개월 이상될 때 
				
				String message = "비밀번호를 변경하신지 6개월이 지났습니다. 암호를 변경하세요.";
				String loc = request.getContextPath() + "/mainPage.sa";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}
			
			else {
				// goBackURL == null
				// 암호 변경을 한지는 6개월 이내이고
				// 장바구니 담기를 하지 않고 그냥 로그인을 시도하는 경우
				
				super.setRedirect(true); 
				super.setViewPage(request.getContextPath() + "/mainPage.sa");	
			}
			
		}
		
		
		else if (loginUser != null && loginUser.isIdleStatus() == true ) { // 휴먼 계정 (로그인 한 지 1년이 지남)
			String message = "로그인 하신지 1년이 지나서 휴먼상태가 되었습니다. 관리자에게 문의 바랍니다.";
			String loc = request.getContextPath() + "/mainPage.sa";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			HttpSession session = request.getSession(); 
			session.setAttribute("loginUser", loginUser);
			
			memberdao.expireIdle(loginUser.getIdx());
			// == 휴먼 상태인 사용자 계정을 휴먼이 아닌 것으로 바꾸기 ==
			// 즉, lastlogindate 컬럼의 값을 sysdate 로 update 해준다.
			
			return;
		}
		else { // 로그인 실패 시 
			String message = "아이디 또는 비밀번호가 일치하지 않습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
	}


}
