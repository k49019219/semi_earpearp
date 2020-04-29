package admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import common.controller.AbstractController;
import member.model.MemberVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import order.model.*;

public class DeliverStartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if(!"POST".equalsIgnoreCase(method)) {
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back();";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}
				
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
				// admin(관리자)으로 로그인 한 경우 
				String odrcode = request.getParameter("ordernum");
				String prodcode = request.getParameter("prodcode"); 
			    
				System.out.println(odrcode);
				System.out.println(prodcode);
				
				InterOrderDAO pdao = new OrderDAO(); 
				
				StringBuilder sb = new StringBuilder();
				// 's20191214-3/1','s20191214-4/3','s20191214-5/2'
				// 's20191214-3은 영수증번호(전표)'이고 /뒤에 붙은 1 은 제품번호이다.
				// 's20191214-4은 영수증번호(전표)'이고 /뒤에 붙은 3 은 제품번호이다.
				// 's20191214-5은 영수증번호(전표)'이고 /뒤에 붙은 2 은 제품번호이다.
				// 이것은 오라클에서 영수증번호(전표)컬럼||'/'||제품번호 로 하겠다는 말이다.
				
				
				String odrcodePnum = odrcode+"/"+prodcode;
				
			//	odrcodePnum = odrcodePnum.substring(0, odrcodePnum.length()-1);
				// 맨뒤의 콤마(,)제거하기 
				
				int n = pdao.updateDeliverStart(odrcode, "배송중");
				
				if(n==1) {
			    	// === 배송을 했다라는 확인 문자(SMS)를  주문을 한 사람(여러명)에게 보내기 시작 ===
					
					HashMap<String, String> odrcodeMap = new HashMap<String, String>(); 
					// 동일한 전표에 서로 다른 제품들을 구매한 경우 동일 전표를 가진 사람에게는 SMS(문자)를 1번만 보내야 하므로
					// 중복을 허락치 않는 HashMap 을 사용하기로 한다. 
		/*			
					for(String odrcode : odrcodeArr) {
						odrcodeMap.put(odrcode, odrcode);
						// odrcodeMap 에 전표를 넣기(HashMap 이므로 중복된 전표가 있으면 덮어씌우므로 고유한 값만 존재하게 된다).
					}
					
					Set<String> odrcodeMapKeysets = odrcodeMap.keySet();
					// 중복을 허락치 않는 키값 얻어오기
			
		*/			
		//			for(String key : odrcodeMapKeysets) {
						MemberVO membervo = pdao.odrcodeOwnerMemberInfo(odrcode);
						// 영수증전표(odrcode)소유주에 대한 사용자 정보를 조회해오는 것.
					
					   String api_key = "key";  // 발급받은 본인 API Key
						
					   String api_secret = "secret";  // 발급받은 본인 API Secret
						
						Message coolsms = new Message(api_key, api_secret);
						// net.nurigo.java_sdk.api.Message 임. 
						// 먼저 다운 받은  javaSDK-2.2.jar 를 /MyMVC/WebContent/WEB-INF/lib/ 안에 넣어서  build 시켜야 함.
								
						// == 4개 파라미터(to, from, type, text)는 필수사항이다. == 
						HashMap<String, String> paraMap = new HashMap<String, String>();
						paraMap.put("to", membervo.getHp1().trim()+membervo.getHp2().trim()+membervo.getHp3().trim()); // 수신번호
						
						
						paraMap.put("from", "01022982571"); // 발신번호
						paraMap.put("type", "SMS"); // Message type ( SMS(단문), LMS(장문), MMS, ATA )
						paraMap.put("text", "[나이거사조]몰에서 "+membervo.getName()+"님 께서 주문하신 전표["+odrcodePnum+"]를 우체국택배로 배송했습니다."); // 문자내용    
						paraMap.put("app_version", "JAVA SDK v2.2"); // application name and version
								
						//	 ==  아래의 파라미터는 필요에 따라 사용하는 선택사항이다. == 
						//	paraMap.put("mode", "test"); // 'test' 모드. 실제로 발송되지 않으며 전송내역에 60 오류코드로 뜹니다. 차감된 캐쉬는 다음날 새벽에 충전 됩니다.
						//	paraMap.put("image", "desert.jpg"); // image for MMS. type must be set as "MMS"
						//	paraMap.put("image_encoding", "binary"); // image encoding binary(default), base64 
						//	paraMap.put("delay", "10"); // 0~20사이의 값으로 전송지연 시간을 줄 수 있습니다.
						//	paraMap.put("force_sms", "true"); // 푸시 및 알림톡 이용시에도 강제로 SMS로 발송되도록 할 수 있습니다.
						//	paraMap.put("refname", ""); // Reference name
						//	paraMap.put("country", "KR"); // Korea(KR) Japan(JP) America(USA) China(CN) Default is Korea
						//	paraMap.put("sender_key", "5554025sa8e61072frrrd5d4cc2rrrr65e15bb64"); // 알림톡 사용을 위해 필요합니다. 신청방법 : http://www.coolsms.co.kr/AboutAlimTalk
						//	paraMap.put("template_code", "C004"); // 알림톡 template code 입니다. 자세한 설명은 http://www.coolsms.co.kr/AboutAlimTalk을 참조해주세요. 
						//	paraMap.put("datetime", "20140106153000"); // Format must be(YYYYMMDDHHMISS) 2014 01 06 15 30 00 (2014 Jan 06th 3pm 30 00)
						//	paraMap.put("mid", "mymsgid01"); // set message id. Server creates automatically if empty
						//	paraMap.put("gid", "mymsg_group_id01"); // set group id. Server creates automatically if empty
						//	paraMap.put("subject", "Message Title"); // set msg title for LMS and MMS
						//	paraMap.put("charset", "euckr"); // For Korean language, set euckr or utf-8
						//	paraMap.put("app_version", "Purplebook 4.1") // 어플리케이션 버전
														
						try {
							JSONObject jsobj = (JSONObject) coolsms.send(paraMap);
							// org.json.JSONObject 이 아니라
							// org.json.simple.JSONObject 이어야 한다.
							
							System.out.println("확인용 jsobj.toString() => " + jsobj.toString());
							// 확인용 jsobj.toString() => {"group_id":"GID5DF05F5949CB3","success_count":1,"error_count":0}
						} catch (CoolsmsException e) {
							e.printStackTrace();
						}
						
			//		}// end of for--------------
				 	 // === *** 배송을 했다라는 확인 문자(SMS)를  주문을 한 사람(여러명)에게 보내기 종료 *** === //
					
					String message = "선택하신 제품들은 배송중으로 변경되었습니다.";
					String loc = "/Semi/admin/admin.sa";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
				else {
					String message = "선택하신 제품들은 배송중으로 변경이 실패되었습니다. 발신번호 변경해놓음";
					String loc = "javascript:history.back();";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
			}	
			
		}
		
		
		
	}

	
 }

