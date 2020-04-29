package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;


public class MemberUpdateAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
				
		// == *** POST 방식으로 넘어온 것이 아니라면 *** == //
			String method = request.getMethod();
			
			if (loginuser==null) {
			
				String message = "먼저 로그인하세요.";
				String loc = "javascript:history.back()";
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}	
			else if( !"POST".equalsIgnoreCase(method)) {
				
				String message = "비정상적인 경로입니다.";
				String loc = "javascript:history.back()";
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setViewPage("/WEB-INF/msg.jsp");
				return;
			}
			else {
				
				int idx = Integer.parseInt(request.getParameter("idx"));
				String userid = request.getParameter("userid");
				String name = request.getParameter("name");
				String pwd = request.getParameter("pwd");
				String email = request.getParameter("email");
				
				String tp1 = request.getParameter("tp1");
	
				String tp2 = request.getParameter("tp2");
				String tp3 = request.getParameter("tp3");
				
				String hp1 = request.getParameter("hp1");
				String hp2 = request.getParameter("hp2");
				String hp3 = request.getParameter("hp3");
				String post = request.getParameter("post");
				String addr1 = request.getParameter("addr1");
				String addr2 = request.getParameter("addr2");
				int gender = Integer.parseInt(request.getParameter("gender"));
				String emailCheck = request.getParameter("emailCheck");
				
				MemberVO membervo = new MemberVO();
				membervo.setIdx(idx);
				membervo.setName(name);
				membervo.setUserid(userid);
				membervo.setPwd(pwd);
				membervo.setEmail(email);
				
				membervo.setTp1(tp1);
				membervo.setTp2(tp2);
				membervo.setTp3(tp3);
				
				membervo.setHp1(hp1);
				membervo.setHp2(hp2);
				membervo.setHp3(hp3);
				membervo.setPost(post);
				membervo.setAddr1(addr1);
				membervo.setAddr2(addr2);
				membervo.setGender(gender);
			
				membervo.setEmailCheck(emailCheck);
				
				InterMemberDAO memberdao = new MemberDAO();
				int n = memberdao.updateMember(membervo);
				
				String message = "";
				String loc = "";
				
				if (n == 1) {
					// session 에 저장된 loginUser 를 변경된 사용자의 정보값으로 변경해야 한다.
					// 즉, 변경 직후 로그인된 화면에 변경된 값이 적용되어야 한다. 
					
					loginuser= (MemberVO)session.getAttribute("loginUser");
			
					loginuser.setIdx(idx);
					loginuser.setName(name);
					loginuser.setPwd(pwd);
					loginuser.setEmail(email);
					loginuser.setHp1(hp1);
					loginuser.setHp2(hp2);
					loginuser.setHp3(hp3);
					loginuser.setTp1(tp1);
					loginuser.setTp2(tp2);
					loginuser.setTp3(tp3);
					loginuser.setPost(post);
					loginuser.setAddr1(addr1);
					loginuser.setAddr2(addr2);
					loginuser.setEmailCheck(emailCheck);
					loginuser.setGender(gender);
					
					
					session.setAttribute("loginUser",loginuser);
					
					message = "회원정보 수정이 완료되었습니다.";
					
					
				}
				else {
					message = "회원정보 수정에 실패했습니다.";
				}
				
				loc = "/Semi/mainPage.sa";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				
			}
	}

}
