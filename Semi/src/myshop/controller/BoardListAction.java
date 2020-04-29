package myshop.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.*;
import common.controller.AbstractController;
import member.model.MemberVO;
import my.util.MyUtil;

public class BoardListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		session.removeAttribute("goBackURL2");

		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String loginuserID = loginUser.getUserid();
		
		String page = request.getParameter("page");
		String size = request.getParameter("size");
		
		if(page == null) {
			page = "1";
		}
		if(size == null || !"15".equals(size)) {
			size="15";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", page);
		map.put("size", size);
		map.put("loginuserID", loginuserID);


		InterBoardDAO bdao = new BoardDAO();
		List<HashMap<String,String>> MyBoardList = bdao.getMyBoardList(loginuserID);
		List<HashMap<String,String>> TitlecomList = bdao.getTitlecomList();
		List<HashMap<String,String>> CountList = bdao.getCountList(map);
		List<HashMap<String,String>> AdmComList = bdao.getAdminCommentsList();

		int cnt = 0;
		for( HashMap<String, String> count : CountList ) {
			cnt += Integer.parseInt(count.get("count"));
		}
		
		int totalPage = (int)Math.ceil((double)cnt/Integer.parseInt(size));  // 10/5  12/5  12.0/5   12.0/5.0

		// !!!!! 공식 !!!!!
		int pageNo = 1;
		// pageNo가 페이지바에서 보여지는 첫번째 페이지 번호이다.
		
		int blockSize = 5;
		// blockSize는 블럭(토막)당 보여지는 페이지 번호의 갯수이다.
		
		int loop = 1;
		// loop는 1부터 증가하여 1개 블럭을 이루는 페이지 번호의 갯수(지금은 10개)까지만 증가하는 용도이다.
		
		pageNo = ( (Integer.parseInt(page) - 1)/blockSize)*blockSize + 1; // !!!!! 공식 !!!!!
		
		String pageBar = "";
		
		// ***** [이전] 만들기 ***** // search_date="+search_date+"&search_key="+search_key+"&search="+search+"&
		if( pageNo != 1 ) {
			pageBar += "<a href='/Semi/myshop/boardList.sa?page="+(pageNo-1)+"&size="+size+"'><img src='/Semi/images/btn_page_prev.png' alt='이전페이지'></a>";
		// loop가 10일때 while문을 빠져나와 해당 [다음]을 만든다. 여기서의 memberList.up은 해당 memberListAction.java를 읽어오고
		// 맨 위 getParameter값에 1이 아닌 10이 들어오게 되면서 loop는 11부터 새로이 시작하며 반복한다.
		}

		pageBar += "<ul>";
		// !( 1 > 10 || 2 > 2)
		//while(!(10 > 10)) => 10 > 10 참일때 빠져나간다 '!' 
		// pageNo > totalPage => pageNO는 totalPage까지만 찍는다.
		while(!(loop > blockSize || pageNo > totalPage)) {

			if(pageNo == (Integer.parseInt(page)) ) {
				pageBar +="<li><span class='this'>"+pageNo+"</span></li>";
			} 
			else {	
				pageBar +="<li><a style='display: inline-block;' class='other' href='/Semi/myshop/boardList.sa?page="+pageNo+"&size="+size+"'>"+pageNo+"</a></li>";
			}
			
				pageNo++; // 1 2 3 4 5 6 7 8 9 10
				loop++;	  // 1 2 3 4 5 6 7 8 9 10
				
		}// end of while --------------------
		
		pageBar += "</ul>";
		
		// ***** [다음] 만들기 ***** //
		if( !(pageNo > totalPage) ) {
		pageBar +="<a style='display: inline-block;' href='/Semi/myshop/boardList.sa?page="+pageNo+"&size="+size+"'><img src='/Semi/images/btn_page_next.png' alt='다음페이지'></a>";
		// loop가 10일때 while문을 빠져나와 해당 [다음]을 만든다. 여기서의 memberList.up은 해당 memberListAction.java를 읽어오고
		// 맨 위 getParameter값에 1이 아닌 10이 들어오게 되면서 loop는 11부터 새로이 시작하며 반복한다.
		}

		int startIdx = cnt-Integer.parseInt(size)*(Integer.parseInt(page)-1);
		
		Calendar currentDate = Calendar.getInstance();
		int month = currentDate.get(Calendar.MONTH)+1;
		String today = (currentDate.get(Calendar.YEAR)+"-"+month+"-"+currentDate.get(Calendar.DATE));
		
		String goBackURL2 = MyUtil.getCurrentURL2(request);
		session.setAttribute("goBackURL2", goBackURL2);
		
		request.setAttribute("today", today);
		request.setAttribute("startIdx", startIdx);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("goBackURL2", goBackURL2);
		
		request.setAttribute("TitlecomList", TitlecomList);
		request.setAttribute("MyBoardList", MyBoardList);
		request.setAttribute("AdmComList", AdmComList);
		super.setViewPage("/WEB-INF/myshop/boardList.jsp");
		
	}

}
