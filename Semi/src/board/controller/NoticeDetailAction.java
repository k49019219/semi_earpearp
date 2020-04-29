package board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.InterBoardDAO;
import common.controller.AbstractController;

public class NoticeDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String boardNo = request.getParameter("boardNo");
		String idx = request.getParameter("idx");

		InterBoardDAO bdao = new BoardDAO();

		HashMap<String, String> DetailContentMap = bdao.getNoticeDetailContent(idx);
		HashMap<String, String> PreNextPostMap = bdao.getPreNextPost(idx);
		
		if(!("1".equals(boardNo) || "2".equals(boardNo) || "3".equals(boardNo))){
			
			request.setAttribute("message", "잘못된 경로입니다 :/");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
		//request.getRemoteAddr();
		
		request.setAttribute("DetailContentMap", DetailContentMap);
		request.setAttribute("PreNextPostMap", PreNextPostMap);
		request.setAttribute("boardNo", boardNo);
		super.setViewPage("/WEB-INF/board/free/noticeDetail.jsp");
	}

}
