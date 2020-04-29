package member.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class PwEmailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		String method = request.getMethod(); 

		if ("POST".equalsIgnoreCase(method)){
			
		
			GoogleMail mail = new GoogleMail();
			
			// == 인증코드를 랜덤하게 생성 == // 
			Random rnd = new Random();
			
			String certificationCode = "";  // "swfet0933651" 형태
			
			char randchar = ' '; // char 디폴트는 공백! ' ' (홑따옴표)
			for (int i = 0; i < 5; i++) {
			/* 범위 지정
			 	min 부터 max 사이 값으로 랜덤한 정수를 얻으려면
			 	int rndum = rnd.nextInt(max-min+1) + min 
			 	
			 	==> 영문 소문자 'a'부터 'z' 까지 랜덤하게 1개를 만들 수 있다.
			*/
				randchar = (char)(rnd.nextInt('z'-'a'+1)+'a');  // char 타입이 사칙연산 만나면 자동으로 숫자로 변환
				certificationCode += randchar;
			}
			int randnum = 0;
			for (int i = 0; i < 7; i++) {
				randnum = rnd.nextInt(9-0+1)+0;
				certificationCode += randnum;
			}
			
			// System.out.println("~~~~~~ 확인용 certificationCode =>" + certificationCode);
			
			// 랜덤하게 생성한 인증코드를 비밀번호를 찾고자 하는 사용자의 email 로 전송시킨다.
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			String userid = request.getParameter("userid");
		
			int n = 1;
			
			try {
				// 인증코드를 사용자가 입력한 email 주소로 전송
				mail.sendmail(email, certificationCode,userid);
				
				// 자바에서 발급한 인증코드를 세션에 저장
				session.setAttribute("certificationCode", certificationCode);
				
				request.setAttribute("email", email);
				
				InterMemberDAO dao = new MemberDAO();
		    	n = dao.pwdUpdate(certificationCode, userid);
		    
			} catch (Exception e) {
				e.printStackTrace();
				n = -1; // 메일 발송이 실패했을 때 : n이 1에서 -로 바뀐다.
			}
			
			request.setAttribute("n", n);
			request.setAttribute("userid", userid);
			
			super.setViewPage("/WEB-INF/member/pwEmailEnd.jsp");
			
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
