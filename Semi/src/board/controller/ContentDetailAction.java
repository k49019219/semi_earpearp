package board.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.*;
import common.controller.AbstractController;

public class ContentDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String boardNo = request.getParameter("boardNo");
		String idx = request.getParameter("idx");
		String check = request.getParameter("check");
		String prodcode = request.getParameter("prodcode");

		InterBoardDAO bdao = new BoardDAO();

		HashMap<String, String> DetailContentMap = null;
		HashMap<String, String> PreNextRev = null;
		List<HashMap<String, String>> relationList = null;
		
		if("2".equals(boardNo) && !"Adm".equals(check)) {
			DetailContentMap = bdao.getQNADetailContent(idx);
		}
		else if("2".equals(boardNo) && "Adm".equals(check)) {
			DetailContentMap = bdao.getAdminDetailContent(idx);
		}
		else if("3".equals(boardNo)) {
			DetailContentMap = bdao.getReviewDetail(idx);
			PreNextRev = bdao.getPreNextRev(idx);
			relationList = bdao.getRelationList(prodcode);
		}
		else if(!("1".equals(boardNo) || "2".equals(boardNo) || "3".equals(boardNo))){
			
			request.setAttribute("message", "잘못된 경로입니다 :/");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
		request.setAttribute("DetailContentMap", DetailContentMap);
		request.setAttribute("boardNo", boardNo);
		request.setAttribute("PreNextRev", PreNextRev);
		request.setAttribute("relationList", relationList);
		super.setViewPage("/WEB-INF/board/product/contentDetail.jsp");
	}

}
