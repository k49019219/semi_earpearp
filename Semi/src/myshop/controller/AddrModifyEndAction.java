package myshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import myshop.model.AddrDAO;
import myshop.model.AddrVO;
import myshop.model.InterAddrDAO;

public class AddrModifyEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
		String fk_userid = loginuser.getUserid();
		
		String method = request.getMethod();
		
		if( !"POST".equalsIgnoreCase(method)) {
			
			String message = "비정상적인 경로입니다.";
			String loc = "javascript:history.back()";
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		else {
			String destination = request.getParameter("destination") ;   
			String receiver = request.getParameter("receiver") ;  
			String post = request.getParameter("post");
		    String addr1 = request.getParameter("addr1");     
		    String addr2  = request.getParameter("addr2") ;  
		    String addrBase  = request.getParameter("addrBase") ;   
		    String str_addrNo = request.getParameter("addrNo");
		
		    int addrNo = Integer.parseInt(str_addrNo);
		   
		    AddrVO advo = new AddrVO();
		    advo.setFk_userid(fk_userid);
		    advo.setPost(post);
		    advo.setAddr1(addr1);
		    advo.setAddr2(addr2);
		    advo.setDestination(destination);
		    advo.setReceiver(receiver);
		    advo.setAddrBase(addrBase);
		    advo.setAddrNO(addrNo);
		    
			InterAddrDAO dao = new AddrDAO();
			// System.out.println(addrBase);
			

			int m = 0;
			if( addrBase != null ) {
			      m = dao.updateBase(advo);
		    }
			 
		    int n = dao.addrUpdate(advo);
		
		    if (n==1) {
		    	request.setAttribute("message", "배송주소록이 수정되었습니다.");
				request.setAttribute("loc", "/Semi/myshop/addr/list.sa");
				
				super.setViewPage("/WEB-INF/msg.jsp");
				
		    }
		}
		
	}

}
