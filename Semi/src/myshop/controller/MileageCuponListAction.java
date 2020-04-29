package myshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MileageCuponListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// MYPAGE - MILEAGE - 미가용쿠폰/회원등급적립내역
		super.setViewPage("/WEB-INF/myshop/mileage/cuponList.jsp");
	}

}
