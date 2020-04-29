package myshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AddrPopupRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//addrno는 일반 등록일때 null, 수정일때 null이 아니므로 이를 이용한다.
		String addrno = request.getParameter("addrno");
		request.setAttribute("addrno", addrno);
		
		super.setViewPage("/addrPopup/register.jsp");
		
	}

}
