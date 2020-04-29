package board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.MemberVO;
import my.util.MyUtil;
import board.model.*;


public class CommentDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String no = request.getParameter("no");
		
		InterBoardDAO pdao = new BoardDAO();
		
		int n = pdao.commentDelete(no);
		
		String message = "";
		String loc = "javascript:history.back()";
		
		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/msg.jsp");
		
	}

}
