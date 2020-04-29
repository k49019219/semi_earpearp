package myshop.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.*;

public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 현재 로그인한 사람의 주문 정보를 불러온다
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		String userid = "";
		if(loginUser != null) { 
			userid = loginUser.getUserid();
			
		} else {
			String message = "잘못된 접근입니다! 로그인하세요!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return; // 이 이상 동작을 수행하지 않고 종료한다	
		}
		
		// 1. 처음 로딩할때 : 아무 조건없이 모든 주문 정보를 받아온다.
		// 2. 검색할 때 : 아래의 메소드들에 조건을 붙여서 받아온다.
		HashMap<String,String> searchTerms = new HashMap<String,String>();
		// 검색 조건은 주문처리상태, 주문일자(min~max)이므로, 1.에서 필요한 변수와 함께 hashMap으로 넘긴 후
		// 해당 조건이 != null이라면 sql문을 추가한다.
		String status = request.getParameter("status");
		if(status==null || "전체 주문처리상태".equals(status) || "".equals(status)) {
			status = "";
		}
		// 주문처리 상태 : 전체, 결제완료, 배송준비중, 배송중, 배송완료
		
		String period = request.getParameter("period");
		// "오늘", "1주일", "1개월", "3개월", "6개월"
		// sql문에서 입력값에 따라 다른 조건을 적용한다.
		String startDate = "";
		String endDate = "";
		
		// 기간 버튼으로 검색한 경우
		if(period!=null) {
			// 현재 날짜를 가져온다
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			
			// 특정 형태의 날짜로 값을 뽑기
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
			endDate = df.format(cal.getTime());
					
			if("오늘".equals(period.trim())) {
				cal.add(Calendar.DATE, 0); 
				startDate = df.format(cal.getTime());
	
			} else if("1주일".equals(period.trim())) {
				cal.add(Calendar.DATE, -7); 
				startDate = df.format(cal.getTime());
			    
			} else if("1개월".equals(period.trim())) {
				cal.add(Calendar.MONTH, -1); 
				startDate = df.format(cal.getTime());
			    
			} else if("3개월".equals(period.trim())) {
				cal.add(Calendar.MONTH, -3); 
				startDate = df.format(cal.getTime());
			    
			} else if("6개월".equals(period.trim())) {
				cal.add(Calendar.MONTH, -6); 
				startDate = df.format(cal.getTime());
			}
			
		}	
		
		// 기간 버튼으로 검색하지 않았다면 달력에서 선택한 날짜를 기준으로 한다.
		else {
			startDate = request.getParameter("startDate");
			endDate = request.getParameter("endDate");
			
			if(startDate==null) startDate="";
			if(endDate==null) endDate="";
			
		}
		
		searchTerms.put("status", status);
		searchTerms.put("startDate", startDate);
		searchTerms.put("endDate", endDate);
		searchTerms.put("userid", userid);
		
		request.setAttribute("status",status);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		
		InterOrderDAO odao = new OrderDAO();
		
		// 해당 userid를 가진 회원의 총 주문 수를 모두 불러온다. (주문 목록 상단에 표시)
		
		String numofOrder = odao.getNumberOfOrder(searchTerms);
		
		request.setAttribute("numofOrder", numofOrder);
		
		// 해당 userid를 가진 회원의 주문 번호, 해당 주문번호의 주문 상세 정보를 모두 불러온다.
		// 편의상 주문 테이블의 정보도 중복해서 입력한다.
		// 조건이 걸릴경우 이 메소드에만 걸면 해당하는 주문번호만 나오므로 자동으로 아래 메소드에도 적용
		
		
		//-- 페이징 ===========================================================================
		
		String sizePerPage = "5";	// 한 페이지에 보여줄 상품(게시글 등) 갯수
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		// 띄울(보여줄) 페이지

		if(currentShowPageNo == null) {
			currentShowPageNo = "1";	
		}

		List<HashMap<String,String>> orderDetailList = odao.getOrderDetailInfo(searchTerms, currentShowPageNo, sizePerPage);
		
		if(orderDetailList!=null) {
			// 이 결과물에 각각 해당하는 카테고리 번호, 해당 주문번호가 가진 주문상세번호의 개수를 가져와서 hashMap에 함께 추가한다.
			for(HashMap<String,String> order : orderDetailList) {
				String prodcode = order.get("prodcode");
				String ordernum = order.get("ordernum");
				
				HashMap<String,String> map = odao.getExtraOrderInfo(prodcode, ordernum);
				order.put("cateno", map.get("cateno"));
				order.put("numOfDetail", map.get("numOfDetail"));
				order.put("prodimg", map.get("prodimg"));
			}	
		}
		
		// 해당하는 주문 개수/보여줄 개수 == 전체 페이지 개수
		int totalPage = odao.totalPage(searchTerms, sizePerPage);

		int pageNo = 1;
		// pageNo 가 페이지바에서 보여지는 첫번째 페이지 번호이다.
		int blockSize = 3;
		// blockSize 는 블럭(토막) 당 보여지는 페이지 번호의 갯수이다.
		int loop = 1;
		// loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지믄 증가하는 용도이다.
		pageNo = ( ( Integer.parseInt(currentShowPageNo) - 1 )/ blockSize ) * blockSize + 1; 
		String pageBar = "";
		
		pageBar += "<a href = '/Semi/myshop/order/list.sa?currentShowPageNo=1&status="+status+"&startDate="+startDate+"&endDate="+endDate+"'><i class='fa fa-angle-double-left' style='font-size:32px'></i></a>";
		
		if(pageNo!=1) {
			pageBar += "&nbsp;<a href = '/Semi/myshop/order/list.sa?currentShowPageNo="+ (pageNo-1) +"&status="+status+"&startDate="+startDate+"&endDate="+endDate+"'><i class='fa fa-angle-left' style='font-size:32px'></i></a>&nbsp;";
		} else {
			pageBar += "&nbsp;<a href = '/Semi/myshop/order/list.sa?currentShowPageNo="+ (pageNo) +"&status="+status+"&startDate="+startDate+"&endDate="+endDate+"'><i class='fa fa-angle-left' style='font-size:32px'></i></a>&nbsp;";
		}
		
		while(!( loop > blockSize || pageNo > totalPage )) {	// 반복 횟수 ; 10번 반복
			
			if(pageNo == Integer.parseInt(currentShowPageNo)) {	// 보고자 하는 페이지 == 현재 페이지
				pageBar += "&nbsp;<span class = 'active' style='display:inline-block;'>"+pageNo+"</span>&nbsp;";
					//	= "&nbsp;<span style = 'border : solid 2px gray; padding : 2px;>'"+pageNo+"</span>&nbsp;";
			}
			else {
				pageBar += "&nbsp;<a class = 'pageNumber' href = '/Semi/myshop/order/list.sa?currentShowPageNo="+ pageNo +"&status="+status+"&startDate="+startDate+"&endDate="+endDate+"'>"+pageNo+"</a>&nbsp;";
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
		if(pageNo <= totalPage) {
			pageBar += "&nbsp;<a href = '/Semi/myshop/order/list.sa?currentShowPageNo="+pageNo+"&status="+status+"&startDate="+startDate+"&endDate="+endDate+"'><i class='fa fa-angle-right' style='font-size:32px'></i></a>&nbsp;";
		} else {
			pageBar += "&nbsp;<a href = '/Semi/myshop/order/list.sa?currentShowPageNo="+totalPage+"&status="+status+"&startDate="+startDate+"&endDate="+endDate+"'><i class='fa fa-angle-right' style='font-size:32px'></i></a>&nbsp;";
			
		}
		pageBar += "&nbsp;<a href = '/Semi/myshop/order/list.sa?currentShowPageNo="+totalPage+"&status="+status+"&startDate="+startDate+"&endDate="+endDate+"'><i class='fa fa-angle-double-right' style='font-size:32px'></i></a>&nbsp;";
		
		request.setAttribute("orderDetailList", orderDetailList);
		request.setAttribute("sizePerPage", sizePerPage);
		request.setAttribute("pageBar", pageBar);
		
		// MYPAGE - ORDER
		super.setViewPage("/WEB-INF/myshop/order/list.jsp");
	}

}
