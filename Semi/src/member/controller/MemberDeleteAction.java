package member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;

public class MemberDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
		
		HashMap<String, String> loginMap = new HashMap<String,String>(); 
		loginMap.put("userid", loginuser.getUserid());
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		loginMap.put("idx", String.valueOf(idx));
		
		InterMemberDAO dao = new MemberDAO();
		
		// 세션을 삭제
		session.invalidate();
		
		int n = dao.deleteMember(loginMap);
		
		if (n==1) {
			
			super.setViewPage("/WEB-INF/member/delete.jsp");
		
		}
		
	}

}
