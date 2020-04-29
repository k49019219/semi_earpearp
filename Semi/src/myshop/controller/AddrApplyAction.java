package myshop.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AddrApplyAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 선택한 주소지를 주문 페이지에 입력한다.
		String receiver = request.getParameter("receiver");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");
		
		request.setAttribute("receiver", receiver);
		request.setAttribute("post", post);
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2);
		request.setAttribute("hp2", hp2);
		request.setAttribute("hp3", hp3);

		super.setViewPage("/order/orderForm.sa");

	}

}
