package board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import my.util.MyUtil;
import board.model.CommentVO;
import board.model.InterBoardDAO;
import board.model.BoardDAO;


public class CommentRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String fk_userid = request.getParameter("fk_userid");
		String fk_revidx = request.getParameter("fk_revidx");
		String rev_passwd = request.getParameter("rev_passwd");
		String commentContents = request.getParameter("commentContents");
	    commentContents = MyUtil.replaceParameter(commentContents);
		
		CommentVO cmtvo = new CommentVO(); 
		
		cmtvo.setFk_userid(fk_userid);
		cmtvo.setFk_revidx(fk_revidx);
		cmtvo.setRev_passwd(rev_passwd);
		cmtvo.setCommentContents(commentContents);
		
		cmtvo.setCommentContents(commentContents.replaceAll("\r\n", "<br/>")); // 엔터"\r\n" 가 있으면 br 로 바꿔주세요 
		
		InterBoardDAO pdao = new BoardDAO();
		
		JSONObject jsobj = new JSONObject();
		
		try {
			int n = pdao.addComment(cmtvo);
			
			if(n==1) { // 댓글쓰기가 성공이라면 
				jsobj.put("n", 1);
			}
			else { // 댓글쓰기가 실패이라면 
				jsobj.put("n", 0);
			}
		} catch (Exception e) {
			// 댓글쓰기가 실패이라면 
			jsobj.put("n", 0);

		}

		String result = jsobj.toString();
		
		request.setAttribute("result", result);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
	}

}
