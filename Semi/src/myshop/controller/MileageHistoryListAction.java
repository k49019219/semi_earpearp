package myshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

import myshop.model.InterMileageDAO;
import myshop.model.MileageDAO;
import myshop.model.MileageListVO;
import myshop.model.MileageVO;


public class MileageHistoryListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
		
		if (loginuser==null) {
			
				String message = "먼저 로그인하세요.";
				String loc = "/Semi/member/login.sa";
				request.setAttribute("message", message);  
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
		}	
		else {
			
			InterMileageDAO mildao = new MileageDAO();
			String userid = ((MemberVO)session.getAttribute("loginUser")).getUserid();
			
			// 페이징 처리 
			int sizePerPage = 3;	// 한 페이지에 보여줄 상품(게시글 등) 갯수
			
			// 전체 페이지 
			int totalCountCart = mildao.totalPage(userid);
			int totalPage = 0;
			if (totalCountCart == 0) {
				totalPage = 1;
			}
			else {
				totalPage = (int)Math.ceil((double)totalCountCart/sizePerPage); 
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
			
			List<MileageListVO> mileList = mildao.mileageList(userid, currentShowPageNo, sizePerPage);
		
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
			pageBar += "<a href = 'historyList.sa?currentShowPageNo=1'><i class='fa fa-angle-double-left' style='font-size:32px'></i></a>";
			pageBar += "&nbsp;<a href = 'historyList.sa?currentShowPageNo="+ beforePage +"'><i class='fa fa-angle-left' style='font-size:32px'></i></a>&nbsp;";
			
			int loop = 1;
			// loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수까지 증가하는 용도이다.
			while( !(loop>blockSize || pageNo>totalPage)) {	
				loop++;
				if(pageNo == currentShowPageNo) {	// 보고자 하는 페이지 == 현재 페이지
					pageBar += "&nbsp;<span class = 'active'>"+pageNo+"</span>&nbsp;";
						//	= "&nbsp;<span style = 'border : solid 2px gray; padding : 2px;>'"+pageNo+"</span>&nbsp;";
				}
				else {
					pageBar += "&nbsp;<a class = 'pageNumber' href = 'historyList.sa?currentShowPageNo="+ pageNo +"'>"+pageNo+"</a>&nbsp;";
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
			pageBar += "&nbsp;<a href = 'historyList.sa?currentShowPageNo="+ nextPage +"'><i class='fa fa-angle-right' style='font-size:32px'></i></a>&nbsp;";
			pageBar += "&nbsp;<a href = 'historyList.sa?currentShowPageNo="+totalPage+"'><i class='fa fa-angle-double-right' style='font-size:32px'></i></a>&nbsp;";
			
			
			// 총 적립금, 사용된 적립금 
			List<MileageVO> mileTotal = mildao.totalMile(loginuser.getUserid());
			 
			request.setAttribute("mileList", mileList);
			request.setAttribute("mileTotal", mileTotal);
			request.setAttribute("pageBar", pageBar);
			
			// MYPAGE - MILEAGE - 적립내역보기
			super.setViewPage("/WEB-INF/myshop/mileage/historyList.jsp");

		}	
	}

}
