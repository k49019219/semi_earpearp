package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AgreementAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 이용약관 AGREEMENT
		super.setViewPage("/WEB-INF/member/agreement.jsp");
		
	}

}
