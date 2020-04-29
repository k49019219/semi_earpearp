package myshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import myshop.model.*;


public class RegisterEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
		String fk_userid = loginuser.getUserid();
		
		InterAddrDAO dao = new AddrDAO();
		
		 
		String post = request.getParameter("post");
	    String addr1 = request.getParameter("addr1");     
	    String addr2  = request.getParameter("addr2") ;  
	    String addrBase  = request.getParameter("addrBase") ;   
	    String destination = request.getParameter("destination") ;   
	    String receiver = request.getParameter("receiver") ;  
		
	    AddrVO advo = new AddrVO();
	    advo.setFk_userid(fk_userid);
	    advo.setPost(post);
	    advo.setAddr1(addr1);
	    advo.setAddr2(addr2);
	    advo.setDestination(destination);
	    advo.setReceiver(receiver);
	    advo.setAddrBase(addrBase);
	    
	   
	    int m = 0;
	    if( addrBase != null) {
		     m = dao.updateBase(advo);  
	    }
	    
	    int n = dao.registerAddr(advo);
	    
	    if (n==1&& (m==0||m>0)) {
	    
	    	 super.setRedirect(true);
	    	 super.setViewPage("/Semi/myshop/addr/list.sa");
	    }
		
	}

}
