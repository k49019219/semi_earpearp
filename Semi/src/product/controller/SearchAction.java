package product.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class SearchAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 카테고리 받아오기
		super.getCategoryList(request);
		
		// name = "search"로 검색어 입력된다.
		
		String search = request.getParameter("search");
		String category_no = request.getParameter("category_no");
		String search_condition = request.getParameter("search_condition");
		String minprice = request.getParameter("minprice");
		String maxprice = request.getParameter("maxprice");
		String orderby = request.getParameter("orderby");
		
		if(category_no == null) {
			category_no = "";
		}
		
		if(orderby == null) {
			orderby = "";
		}
		
		if(search_condition == null) {
			search_condition = "product_name";
		}
		
		if(minprice == null) {
			minprice = "";
		}
		
		if(maxprice == null) {
			maxprice = "";
		}
		
		
		
		
		request.setAttribute("search", search);
		request.setAttribute("category_no", category_no);
		request.setAttribute("search_condition", search_condition);
		request.setAttribute("minprice", minprice);
		request.setAttribute("maxprice", maxprice);
		request.setAttribute("orderby", orderby);
		
		
		// 이부분에 DB랑 연결해서 제품명==search와 일치하는 제품 리스트만 검색 페이지에 보여줘야함!
		InterProductDAO pdao = new ProductDAO();

		
		// 페이징 처리 
		int sizePerPage = 9;	// 한 페이지에 보여줄 상품(게시글 등) 갯수
		
		// 전체 페이지 
		HashMap<String, String> totalmap = new HashMap<String, String>();	
		totalmap.put("search", search);
		totalmap.put("category_no", category_no);
		totalmap.put("search_condition", search_condition);
		totalmap.put("minprice", minprice);
		totalmap.put("maxprice", maxprice);
		totalmap.put("orderby", orderby);
		
		
		int totalCountSearch = pdao.getTotalCountSearch(totalmap);
		int totalPage = 0;
		if (totalCountSearch == 0) {
			totalPage = 1;
		}
		else {
			totalPage = (int)Math.ceil((double)totalCountSearch/sizePerPage); 
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
			
		HashMap<String, String> paramap = new HashMap<String, String>();	
		paramap.put("search", search);
		paramap.put("category_no", category_no);
		paramap.put("search_condition", search_condition);
		paramap.put("minprice", minprice);
		paramap.put("maxprice", maxprice);
		paramap.put("orderby", orderby);
		paramap.put("currentShowPageNo", String.valueOf(currentShowPageNo));
		paramap.put("sizePerPage", String.valueOf(sizePerPage));
		
		
		List<HashMap<String, String>> searchList = pdao.getSearchList(paramap);

		
		request.setAttribute("searchList", searchList);
	
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
		pageBar += "<a href = 'search.sa?currentShowPageNo=1'><i class='fa fa-angle-double-left' style='font-size:32px'></i></a>";
		pageBar += "&nbsp;<a href = 'search.sa?currentShowPageNo="+ beforePage +"&search="+search+"'><i class='fa fa-angle-left' style='font-size:32px'></i></a>&nbsp;";
		
		int loop = 1;
		// loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수까지 증가하는 용도이다.
		while( !(loop>blockSize || pageNo>totalPage)) {	
			loop++;
			if(pageNo == currentShowPageNo) {	// 보고자 하는 페이지 == 현재 페이지
				pageBar += "&nbsp;<span class = 'active'>"+pageNo+"</span>&nbsp;";
					//	= "&nbsp;<span style = 'border : solid 2px gray; padding : 2px;>'"+pageNo+"</span>&nbsp;";
			}
			else {
				pageBar += "&nbsp;<a class = 'pageNumber' href = 'search.sa?currentShowPageNo="+ pageNo +"&category_no="+category_no+"&search_condition="+search_condition+"&search="+search+
						"&minprice="+minprice+"&maxprice="+maxprice+"&orderby="+orderby+"'>"+pageNo+"</a>&nbsp;";
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
		pageBar += "&nbsp;<a href = 'search.sa?currentShowPageNo="+ nextPage +"&category_no="+category_no+"&search_condition="+search_condition+"&search="+search+
				"&minprice="+minprice+"&maxprice="+maxprice+"&orderby="+orderby+"'><i class='fa fa-angle-right' style='font-size:32px'></i></a>&nbsp;";
		pageBar += "&nbsp;<a href = 'search.sa?currentShowPageNo="+totalPage+"&category_no="+category_no+"&search_condition="+search_condition+"&search="+search+
				"&minprice="+minprice+"&maxprice="+maxprice+"&orderby="+orderby+"'><i class='fa fa-angle-double-right' style='font-size:32px'></i></a>&nbsp;";
	
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("totalCountSearch", totalCountSearch);
		
		
		// 검색 페이지
		super.setViewPage("/WEB-INF/product/search.jsp");

	}

}
