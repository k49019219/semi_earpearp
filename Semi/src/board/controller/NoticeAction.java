package board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class NoticeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// NOTICE 게시글 양식
		super.setViewPage("/WEB-INF/board/free/noticeDetail.jsp");
	}

}
