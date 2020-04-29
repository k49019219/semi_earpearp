package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class FinalPaymentAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*// 로그인 상태에서만 결제가 가능하도록 한다.
		boolean bool = super.checkLogin(request);
				
		if(!bool) { // 로그인 하지 않은 경우 alert 메세지를 보여주고 그 전 페이지로 돌아간다.
			String message = "먼저 로그인 하세요!";
			String loc = "javascript:history.back();";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return; // 현재 execute 메소드 진행을 종료한다.
		}
		
		else {*/
			
			HttpSession session =  request.getSession();
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); 
			
			String howtopay = request.getParameter("howtopay");
			String totalPayment = request.getParameter("totalPayment");
			
			String url="";
			if("payCard".equals(howtopay)) {
				url = "/WEB-INF/order/paymentGatewayCard.jsp";
			}
			else if("payKakao".equals(howtopay)) {
				url = "/WEB-INF/order/paymentGatewayKakao.jsp";
			}
			request.setAttribute("howtopay", howtopay);
			request.setAttribute("totalPayment", totalPayment);

			// 구매자 정보 넘기기
			if(loginuser==null) { // 임시코드
				loginuser = new MemberVO();
				loginuser.setUserid("sample");
				loginuser.setName("이순신");
				loginuser.setEmail("yes9013@naver.com");
				loginuser.setHp1("010");
				loginuser.setHp2("1234");
				loginuser.setHp3("5678");
				loginuser.setAddr1("서울시 중구");
				loginuser.setAddr2("구로동");
				loginuser.setPost("123456");
			}
			request.setAttribute("userid", loginuser.getUserid());
			request.setAttribute("name", loginuser.getName()); // 구매자 이름을 넘긴다.
			request.setAttribute("name", loginuser.getEmail());
			request.setAttribute("hp", loginuser.getHp1()+loginuser.getHp2()+loginuser.getHp3());
			request.setAttribute("address", loginuser.getAddr1()+loginuser.getAddr2());
			request.setAttribute("post", loginuser.getPost());
			
			super.setViewPage(url); 
			// (결제대행사 페이지, iport로 이동한다.)
			// : 해당 파일은 iport의 가이드라인대로 만든다! paymentGateway.jsp 파일 참고
		//}// end of else(로그인 == true)--------------
	
	} // end of execute----------------------------------------------------------------------

}
