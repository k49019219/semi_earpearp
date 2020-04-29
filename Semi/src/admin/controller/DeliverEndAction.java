package admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.InterOrderDAO;
import order.model.OrderDAO;

public class DeliverEndAction extends AbstractController {

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
			else {
				
				String ordernum = request.getParameter("ordernum");
				
				System.out.println("배완"+ordernum);
				
				String str = "배송완료";
				
				InterOrderDAO odao = new OrderDAO();
				
				int n = odao.updateDeliverStart(ordernum, str);
				
				if(n == 1) {
					
					System.out.println("orderUpdate 성공");
					
					String message = "선택하신 제품은 배송완료로 변경되었습니다.";
					String loc = "/Semi/admin/admin.sa";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					
				}
				else {
					System.out.println("orderUpdate 실패");
					
					String message = "선택하신 제품의 배송완료 변경을 실패했습니다.";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					
				}
				
			}
			
		
		}

	}
}
