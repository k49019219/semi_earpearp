package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.*;


public class IdDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		response.setContentType("text/html;charset=UTF-8"); 
		
		request.setCharacterEncoding("UTF-8");  
		
		String userid = request.getParameter("userid");
			
		InterMemberDAO memberdao = new MemberDAO();
		
		boolean isExistUserid;
		
		JSONObject jsObj = new JSONObject();
		
		try {
			
			isExistUserid = memberdao.idDuplicateCheck(userid);
			
			if ( isExistUserid ) {
				jsObj.put("msg", "이미 사용중인 아이디 입니다.");
				jsObj.put("bool", "false");
			}
			else if ( ! isExistUserid)  {
				jsObj.put("msg", "사용 가능한 아이디 입니다.");
				jsObj.put("bool", "true");
			}
			

		} catch (Exception e) {
			
			jsObj.put("msg", "조회하는 도중 오류가 발생했습니다.");
			e.printStackTrace();
			
		} 
		
		String result = jsObj.toString(); 
		
		request.setAttribute("result", result);
		
		super.setViewPage("/WEB-INF/jsonResult.jsp");
		
	}
	
	
}
