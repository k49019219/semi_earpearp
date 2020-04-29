package board.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import board.model.*;

public class CommentListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String revidx = request.getParameter("revidx");
		
		InterBoardDAO pdao = new BoardDAO();
		
		JSONArray jsArr = new JSONArray(); 
		
		try { 
			List<CommentVO> commentList = pdao.commentList(revidx);
			
			if(commentList != null) {
				for(CommentVO cmtvo : commentList) {
					JSONObject jsobj = new JSONObject(); 
					
					jsobj.put("no", cmtvo.getNo());
					jsobj.put("fk_userid", cmtvo.getFk_userid());
					jsobj.put("commentcontents", cmtvo.getCommentContents());
					jsobj.put("writeDay", cmtvo.getWriteDay());
					
					jsArr.put(jsobj);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String result = jsArr.toString();
		request.setAttribute("result", result);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
	}

}
