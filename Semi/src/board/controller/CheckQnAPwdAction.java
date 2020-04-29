package board.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.*;
import common.controller.AbstractController;
import member.model.MemberVO;

public class CheckQnAPwdAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String boardNo = request.getParameter("boardNo");
		String idx = request.getParameter("idx");
		String contentEditPwd = request.getParameter("contentEditPwd");
		String method = request.getMethod(); // get or post
		
		HashMap<String, String> pwdmap = new HashMap<String, String>();
		pwdmap.put("idx", idx);
		pwdmap.put("contentEditPwd", contentEditPwd);
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if("POST".equalsIgnoreCase(method)) {
			
			InterBoardDAO bdao = new BoardDAO();
			
			boolean bool = bdao.QNACheckPwd(pwdmap);
			
			if(!bool) {
				request.setAttribute("message", "비밀번호가 같지 않습니다. :(");
				request.setAttribute("loc", "javascript:history.back()");
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				return;
			}
			else {
				super.setRedirect(true);
				super.setViewPage("/Semi/board/product/content.sa?boardNo="+boardNo+"&idx="+idx);
				return;
			}
		}
		else if("GET".equalsIgnoreCase(method) && loginUser.getStatus() == 4){
			request.setAttribute("boardNo", boardNo);
			request.setAttribute("idx", idx);

			super.setRedirect(true);
			super.setViewPage("/Semi/board/product/content.sa?boardNo="+boardNo+"&idx="+idx);
		}
		else if("GET".equalsIgnoreCase(method)) {
			request.setAttribute("boardNo", boardNo);
			request.setAttribute("idx", idx);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/board/product/checkQnAPwd.jsp");
		}
		
	}

}
