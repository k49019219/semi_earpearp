package myshop.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;
import product.model.*;


public class WishListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginUser");
		
		    if(loginuser == null)  {
				request.setAttribute("message", "위시리스트를 보려면 먼저 로그인부터 하세요.");
				request.setAttribute("loc", "javascript:location.href='/Semi/member/login.sa'");
				
				super.setViewPage("/WEB-INF/msg.jsp");
				return;
			}
		
			InterProductDAO pdao = new ProductDAO();

			// 페이징 처리 
			int sizePerPage = 10;	// 한 페이지에 보여줄 상품(게시글 등) 갯수
			
			// 전체 페이지 
			String userid = loginuser.getUserid();
			int totalCountWish = pdao.getTotalCountWish(userid);
			int totalPage = 0;
			if (totalCountWish == 0) {
				totalPage = 1;
			}
			else {
				totalPage = (int)Math.ceil((double)totalCountWish/sizePerPage); 
			}
			
			String str_currentShowPageNo = request.getParameter("currentShowPageNo");
			int currentShowPageNo = 0;
			try {
				
				if(str_currentShowPageNo == null) {
					currentShowPageNo = 1; // 첫 시작엔 1페이지 보여주기
				}
				else {
					currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
					
					if ( currentShowPageNo < 1 || currentShowPageNo > totalPage ) {
						currentShowPageNo = 1;
					}
				}
				
			} catch (Exception e) {
				currentShowPageNo = 1; // 문자 입력 시 그냥 1페이지 보여주기 
			}
				
			List<HashMap<String, String>> wishList = pdao.getWishList(userid, currentShowPageNo, sizePerPage);
			
			request.setAttribute("wishList", wishList);
			
			int blockSize = 3;
			// blockSize 는 블럭(토막) 당 보여지는 페이지 번호의 갯수이다.
			
			int pageNo = ( (currentShowPageNo -1)/blockSize )*blockSize + 1 ; // 페이징 공식 

			String pageBar = "";
			
			// 이전 만들기 
			int beforePage = 0;
			if ( currentShowPageNo > 1 ) {
				 beforePage = currentShowPageNo-1;
			}
			else {
				 beforePage = 1;
			}
			pageBar += "<a href = 'wishList.sa?currentShowPageNo=1'><i class='fa fa-angle-double-left' style='font-size:32px'></i></a>";
			pageBar += "&nbsp;<a href = 'wishList.sa?currentShowPageNo="+ beforePage +"'><i class='fa fa-angle-left' style='font-size:32px'></i></a>&nbsp;";
			
			int loop = 1;
			// loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수까지 증가하는 용도이다.
			while( !(loop>blockSize || pageNo>totalPage)) {	
				loop++;
				if(pageNo == currentShowPageNo) {	// 보고자 하는 페이지 == 현재 페이지
					pageBar += "&nbsp;<span class = 'active'>"+pageNo+"</span>&nbsp;";
						//	= "&nbsp;<span style = 'border : solid 2px gray; padding : 2px;>'"+pageNo+"</span>&nbsp;";
				}
				else {
					pageBar += "&nbsp;<a class = 'pageNumber' href = 'wishList.sa?currentShowPageNo="+ pageNo +"'>"+pageNo+"</a>&nbsp;";
				}
				pageNo++;
			} // end of while() -------------------
			
			
			// 다음 만들기
			int nextPage = 0;
			if ( currentShowPageNo < totalPage ) {
				nextPage = currentShowPageNo+1;
			}
			else {
				nextPage = currentShowPageNo;
			}
			pageBar += "&nbsp;<a href = 'wishList.sa?currentShowPageNo="+nextPage +"'><i class='fa fa-angle-right' style='font-size:32px'></i></a>&nbsp;";
			pageBar += "&nbsp;<a href = 'wishList.sa?currentShowPageNo="+totalPage+"'><i class='fa fa-angle-double-right' style='font-size:32px'></i></a>&nbsp;";

			
			List<String> wishnoArr = pdao.getWishNo(userid);
			
			request.setAttribute("pageBar", pageBar);
			request.setAttribute("wishnoArr", wishnoArr);
			
			super.setViewPage("/WEB-INF/myshop/wishList.jsp");
		}
	}
	

