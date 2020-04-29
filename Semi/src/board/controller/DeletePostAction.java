package board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.*;
import common.controller.AbstractController;

public class DeletePostAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String boardNo = request.getParameter("boardNo");
		String idx = request.getParameter("idx");
		String check = request.getParameter("check");
		
		InterBoardDAO bdao = new BoardDAO();
		
		int deletePost = 0;
		if("1".equals(boardNo)) {
			deletePost = bdao.deleteNoticePost(idx);
		}
		else if("2".equals(boardNo) && !"Adm".equals(check)) {
			deletePost = bdao.deleteQNAPost(idx);
		}
		else if("2".equals(boardNo) && "Adm".equals(check)) {
			deletePost = bdao.deleteAdminComment(idx);
		}
		else if("3".equals(boardNo)) {
			deletePost = bdao.deleteRevPost(idx);
		}
		else if(!("1".equals(boardNo) || "2".equals(boardNo) || "3".equals(boardNo))){
			
			request.setAttribute("message", "잘못된 경로입니다 :/");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
		if(deletePost == 1) {
			request.setAttribute("message", "글이 정상적으로 삭제되었습니다 :-");
			request.setAttribute("loc", "/Semi/board/product/list.sa?boardNo="+boardNo);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		else if(deletePost == 4) {
			request.setAttribute("message", "글이 정상적으로 삭제되었습니다 :-");
			request.setAttribute("loc", "/Semi/board/free/list.sa?boardNo="+boardNo);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		else {
			request.setAttribute("message", "오류가 발생하여 돌아갑니다 :(");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
	//	super.setRedirect(true);

	}
}
