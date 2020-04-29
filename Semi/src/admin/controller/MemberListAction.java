package admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class MemberListAction extends AbstractController { 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 관리자(admin)로 로그인했을때만 조회가 가능하도록 한다.
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginuser == null) {
			
			String message = "먼저 관리자로 로그인 하세요.";
			String loc = "javascript:history.back();";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}
		else {
			
			String userid = loginuser.getUserid();
			
			if( !("earp".equals(userid)) ) {
				
				String message = "관리자만 접근이 가능합니다.";
				String loc = "javascript:history.back();";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
				
			}
			
			
		}
		
		InterMemberDAO dao = new MemberDAO();
		
	//	List<MemberVO> memberList = dao.selectAllMember();
		
		String sizePerPage = "10";
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		String cateno = "멤버리스트";
		
		if(currentShowPageNo == null) {
			
			currentShowPageNo = "1";
			
		}
		
		
		List<MemberVO> memberList = dao.selectAllMember(sizePerPage, currentShowPageNo);
		
		InterProductDAO pdao = new ProductDAO();
			
		int totalPage = pdao.totalPage(sizePerPage, cateno);
		// admin 에서 토탈페이지 변경
		
		////  !!! 공식  !!!  ////
		int pageNo = 1;
		// pageNo 가 페이지바에서 보여지는 첫번째 페이지 번호이다.
		
		int blockSize = 3;
		// blockSize 는 블럭(토막) 당 보여지는 페이지 번호의 갯수이다.
		
		int loop = 1;
		// loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지믄 증가하는 용도이다.
		
		pageNo = ( ( Integer.parseInt(currentShowPageNo) - 1 )/ blockSize ) * blockSize + 1; 


		String pageBar = "";

		pageBar += "<a href = 'memberList.sa?currentShowPageNo=1'><i class='fa fa-angle-double-left' style='font-size:32px'></i></a>";
		if(pageNo != 1)
			pageBar += "&nbsp;<a href = 'memberList.sa?currentShowPageNo="+ (pageNo-1) +"'><i class='fa fa-angle-left page1' style='font-size:32px'></i></a>&nbsp;";
		else
			pageBar += "<a href = 'memberList.sa?currentShowPageNo=1'><i class='fa fa-angle-left' style='font-size:32px'></i></a>";
		
		while(!( loop > blockSize || pageNo > totalPage )) {	// 반복 횟수 ; 10번 반복
			
			if(pageNo == Integer.parseInt(currentShowPageNo)) {	// 보고자 하는 페이지 == 현재 페이지
				pageBar += "&nbsp;<span class = 'active'>"+pageNo+"</span>&nbsp;";
					//	= "&nbsp;<span style = 'border : solid 2px gray; padding : 2px;>'"+pageNo+"</span>&nbsp;";
			}
			else {
				pageBar += "&nbsp;<a class = 'pageNumber' href = 'memberList.sa?currentShowPageNo="+ pageNo +"'>"+pageNo+"</a>&nbsp;";
			}
			
			pageNo++;	// 1 부터 10 까지
						// 11 부터 20 까지
						// 21 부터 30 까지
						// 31 부터 40 까지
						// 41 
			
			loop++;
			// 매번 loop 가 1씩 증가
			
		} // end of while() -------------------
		
		
		// 다음 만들기
		pageBar += "&nbsp;<a href = 'memberList.sa?currentShowPageNo="+ pageNo +"'><i class='fa fa-angle-right' style='font-size:32px'></i></a>&nbsp;";
		pageBar += "&nbsp;<a href = 'memberList.sa?currentShowPageNo="+totalPage+"'><i class='fa fa-angle-double-right' style='font-size:32px'></i></a>&nbsp;";
		
			
		request.setAttribute("memberList", memberList);
		request.setAttribute("pageBar", pageBar);
		
		super.setViewPage("/WEB-INF/admin/memberList.jsp");
		
	}

}
