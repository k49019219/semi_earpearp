package board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.model.BoardDAO;
import board.model.InterBoardDAO;
import common.controller.AbstractController;
import member.model.MemberVO;
import my.util.MyUtil;

public class WriteAdminAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//  공지 게시판 글쓰기 페이지
		String boardNo = request.getParameter("boardNo");
		String idx = request.getParameter("idx");
		String method = request.getMethod();
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		InterBoardDAO bdao = new BoardDAO();
		
		if(!"POST".equalsIgnoreCase(method)) {
			
			HashMap<String, String> contentForEditMap = bdao.getNoticeDetailContent(idx);

			if(!("1".equals(boardNo) || "2".equals(boardNo) || "3".equals(boardNo))){
				
				request.setAttribute("message", "잘못된 경로입니다 :/");
				request.setAttribute("loc", "javascript:history.back()");
				
				super.setViewPage("/WEB-INF/msg.jsp");
				return;
			}

			String content = "";
			if(contentForEditMap != null) {
				content = contentForEditMap.get("content");
				content = content.replaceAll("<br/>", "\r\n");
				contentForEditMap.put("content", content);
			}
			
			request.setAttribute("boardNo", boardNo);
			request.setAttribute("contentForEditMap", contentForEditMap);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/board/free/writeAdmin.jsp");
			
		} // end of ! post -----------
		else {
			
			MultipartRequest mtrequest = null;
			ServletContext svlCtx = session.getServletContext();
			String writerIp = request.getRemoteAddr();
			
			String imagesDir = svlCtx.getRealPath("/images");
			// imagesDir = C:\myjsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MyMVC\images
			
			try {
				
				mtrequest = new MultipartRequest(request, imagesDir, 100*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
				
			} catch (IOException e) {
				 request.setAttribute("message", "파일 업로드에 실패하였습니다 :<");
		    	 request.setAttribute("loc", "javascript:history.back()"); 
		    	  
		    	 super.setViewPage("/WEB-INF/msg.jsp");
		    	 return;
			}
			
			boardNo = mtrequest.getParameter("boardNo");
			idx = mtrequest.getParameter("idx");
			String subject = mtrequest.getParameter("select");
			String title = mtrequest.getParameter("subject");

			String content = mtrequest.getParameter("content");
			content = MyUtil.replaceParameter(content);
			content = content.replaceAll("\r\n", "<br/>");
			
			String bImage1 = mtrequest.getFilesystemName("bImage1");
			String bImage2 = mtrequest.getFilesystemName("bImage2");
			String bImage3 = mtrequest.getFilesystemName("bImage3");
			String bImage4 = mtrequest.getFilesystemName("bImage4");
			String bImage5 = mtrequest.getFilesystemName("bImage5");
			String conPwd = mtrequest.getParameter("conPwd");
			
			if(bImage1 == null) { bImage1 = "none"; }
			if(bImage2 == null) { bImage2 = "none"; }
			if(bImage3 == null) { bImage3 = "none"; }
			if(bImage4 == null) { bImage4 = "none"; }
			if(bImage5 == null) { bImage5 = "none"; }
			
			HashMap<String, String> conMap = new HashMap<String, String>();
			conMap.put("title", title);
			conMap.put("subject", subject);
			conMap.put("content", content);
			conMap.put("bImage1", bImage1);
			conMap.put("bImage2", bImage2);
			conMap.put("bImage3", bImage3);
			conMap.put("bImage4", bImage4);
			conMap.put("bImage5", bImage5);
			conMap.put("conPwd", conPwd);
			conMap.put("idx", idx);
			conMap.put("boardNo", boardNo);
			conMap.put("writerIp", writerIp);
			conMap.put("fk_userid", loginUser.getUserid());
			conMap.put("status", Integer.toString(loginUser.getStatus()));
			
			int result = bdao.NoticeContentChange(conMap);

			if(result != 1) {
				request.setAttribute("message", "오류가 발생하여 돌아갑니다 :(");
		    	request.setAttribute("loc", "javascript:history.back()"); 
		    	  
		    	super.setViewPage("/WEB-INF/msg.jsp");
		    	return;
			}
			else if(result == 1){
				request.setAttribute("message", "글이 정상적으로 등록되었습니다 :>");
				request.setAttribute("loc", "/Semi/board/free/list.sa?boardNo="+boardNo);
				
				super.setViewPage("/WEB-INF/msg.jsp");
				return;
			}
			
		}// end of post -----------
	
	}

}
