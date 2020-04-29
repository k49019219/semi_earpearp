package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;
import myshop.model.*;


public class JoinInsertAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String tp1 = request.getParameter("Gephone_1");
		String tp2 = request.getParameter("Gephone_2");
		String tp3 = request.getParameter("Gephone_3");
		String hp1 = request.getParameter("phone_1");
		String hp2 = request.getParameter("phone_2");
		String hp3 = request.getParameter("phone_3");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String birthdayyy = request.getParameter("birthdayyy");
		String birthdaymm = request.getParameter("birthdaymm");
		String birthdaydd = request.getParameter("birthdaydd");
		
		// *** 클라이언트의 IP 주소 알아오기 *** //
		String clientip = request.getRemoteAddr();
		
        String emailCheck = request.getParameter("emailCheck");
        
		MemberVO membervo = new MemberVO();
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
		membervo.setBirthdayyy(birthdayyy);
		membervo.setBirthdaymm(birthdaymm);
		membervo.setBirthdaydd(birthdaydd);
		membervo.setClientip(clientip);
		
		membervo.setEmailCheck(emailCheck);
		
		InterMemberDAO memberdao = new MemberDAO();
		int n = memberdao.registerMember(membervo);
	
		String message = "";
		String loc = "";
		
		if(n==1) {
			
			 request.setAttribute("userid", userid );
			 request.setAttribute("name", name);
			 request.setAttribute("email", email);
			
			 InterMileageDAO mdao = new MileageDAO();
			 mdao.joinMileage(userid);
		     
		 if ( ! "".equals(post.trim()) || ! "".equals(addr1.trim()) || ! "".equals(addr2.trim()) ) {
				 
				 InterAddrDAO adao = new AddrDAO();
				 AddrVO advo = new AddrVO();
				 advo.setFk_userid(userid);
				 advo.setPost(post);
				 advo.setAddr1(addr1);
				 advo.setAddr2(addr2);
				 advo.setDestination("집");
				 advo.setReceiver(name);
				 advo.setAddrBase("1");
				 
				 adao.registerAddr(advo);
			 }
			
			 super.setViewPage("/WEB-INF/member/joinEnd.jsp");
		
		}
		else {
			 message = "회원가입 실패";
			 loc = "javascript:history.back()";  // 뒤로 가기 
			 request.setAttribute("message", message);
			 request.setAttribute("loc", loc);
				
			 super.setViewPage("/WEB-INF/msg.jsp");
		}
		

	}

}
