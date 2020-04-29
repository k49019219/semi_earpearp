package board.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.*;
import common.controller.AbstractController;
import my.util.MyUtil;

public class BoardProductListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// COMMUNITY - Q&A / REVIEW
		HttpSession session = request.getSession();
		session.removeAttribute("goBackURL2");
		
		String boardNo = request.getParameter("boardNo");
		String page = request.getParameter("page");
		String size = request.getParameter("size");
		String search_date = request.getParameter("search_date");
		String search_key = request.getParameter("search_key");
		String search = request.getParameter("search");
		
		InterBoardDAO bdao = new BoardDAO();

		if(page == null) {
			page = "1";
		}
		if(size == null || !"15".equals(size)) {
			size="15";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", page);
		map.put("size", size);

		if(search_date != null) {
			map.put("search_date", search_date);
			map.put("search_key", search_key);
			map.put("search", search);
		}
		else {
			search_date = "";
			search_key = "";
			search= "";
		}
		
		List<HashMap<String, String>> boardList = null;
		List<HashMap<String, String>> AdminList = null;
		List<HashMap<String, String>> NoticeList = null;
		HashMap<String, String> pageCountMap = null;
		List<HashMap<String, String>> TitlecomList = null;
		int totalPage = 0;
		int count = 0;
		
		if("2".equals(boardNo)) { // 질문답변게시판

			pageCountMap = bdao.getQNAPageCountMap(map);
			count = Integer.parseInt(pageCountMap.get("count"));
			
			try { totalPage = Integer.parseInt(pageCountMap.get("totalPage"));
			} catch (NumberFormatException e) { totalPage = (int) Math.ceil((double)count/15); }
			
			boardList = bdao.getQNAList(map);
			AdminList = bdao.getAdminCommentsList();
			NoticeList = bdao.getNoticeListForQNA();
		}
		else if("3".equals(boardNo)) { // 리뷰게시판
			pageCountMap = bdao.getReviewTotalPage(map);
			count = Integer.parseInt(pageCountMap.get("count"));

			try {
				totalPage = Integer.parseInt(pageCountMap.get("totalPage"));
			} catch (NumberFormatException e) { totalPage = (int) Math.ceil((double)count/15); }

			boardList = bdao.getReviewList(map);
			TitlecomList = bdao.getTitlecomList();
		}
		else if(!("1".equals(boardNo) || "2".equals(boardNo) || "3".equals(boardNo))){
			
			request.setAttribute("message", "잘못된 경로입니다 :/");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
		// 페이징바
		int pageNo = 1;
		
		int blockSize = 10;
		
		int loop = 1;
		
		pageNo = ( (Integer.parseInt(page) - 1)/blockSize)*blockSize + 1;
		
		String pageBar = "";
		
		// 이전
		if( pageNo != 1 ) {
			pageBar += "<a href='/Semi/board/product/list.sa?boardNo="+boardNo+"&search_date="+search_date+"&search_key="+search_key+"&search="+search+"&page="+(pageNo-1)+"&size="+size+"'><img src='/Semi/images/btn_page_prev.png' alt='이전페이지'></a>";
		}

		pageBar += "<ul>";

		while(!(loop > blockSize || pageNo > totalPage)) {

			if(pageNo == (Integer.parseInt(page)) ) {
				pageBar +="<li><span class='this'>"+pageNo+"</span></li>";
			} 
			else {	
				pageBar +="<li><a style='display: inline-block;' class='other' href='/Semi/board/product/list.sa?boardNo="+boardNo+"&search_date="+search_date+"&search_key="+search_key+"&search="+search+"&page="+pageNo+"&size="+size+"'>"+pageNo+"</a></li>";
			}
			
				pageNo++;
				loop++;
				
		}// end of while --------------------
		
		pageBar += "</ul>";
		
		// 다음
		if( !(pageNo > totalPage) ) {
		pageBar +="<a style='display: inline-block;' href='/Semi/board/product/list.sa?boardNo="+boardNo+"&search_date="+search_date+"&search_key="+search_key+"&search="+search+"&page="+pageNo+"&size="+size+"'><img src='/Semi/images/btn_page_next.png' alt='다음페이지'></a>";
		}

		int startIdx = count-Integer.parseInt(size)*(Integer.parseInt(page)-1);
		
		Calendar currentDate = Calendar.getInstance();
		int month = currentDate.get(Calendar.MONTH)+1;
		String today = (currentDate.get(Calendar.YEAR)+"-"+month+"-"+currentDate.get(Calendar.DATE));

		String goBackURL2 = MyUtil.getCurrentURL2(request);
		session.setAttribute("goBackURL2", goBackURL2);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("boardNo", boardNo);
		request.setAttribute("today", today);
		
		request.setAttribute("AdminList", AdminList);
		request.setAttribute("NoticeList", NoticeList);
		request.setAttribute("TitlecomList", TitlecomList);
		
		request.setAttribute("size", size);
		request.setAttribute("page", page);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("startIdx", startIdx);
		
		request.setAttribute("search_date", search_date);
		request.setAttribute("search_key", search_key);
		request.setAttribute("search", search);
		
		super.setViewPage("/WEB-INF/board/product/boardProductList.jsp");
	}

}
