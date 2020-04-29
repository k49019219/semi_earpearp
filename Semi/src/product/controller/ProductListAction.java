package product.controller;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class ProductListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// DB 에 들어가서 회원목록을 조회(select) 하기 위해서는 dao 객체를 호출해온다
		InterProductDAO pdao = new ProductDAO();
				
		String cateno = request.getParameter("cateno");
		
	//	System.out.println(cateno);
		
		// 페이징 처리를 완료한 전체 회원목록 보여주기
		HashMap<String, String> paramap = new HashMap<String, String>();
		
		String sizePerPage = "12";
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(currentShowPageNo == null) {
			
			currentShowPageNo = "1";
			
		}
		
		paramap.put("currentShowPageNo", currentShowPageNo);
		paramap.put("sizePerPage", sizePerPage);
		paramap.put("cateno", cateno);
		
		List<ProductVO> productList = pdao.productList(paramap);
	
		HashMap<String,String> category = pdao.category(cateno); 
	
		String productListHtml = "";
		
		if(productList != null) {
			for(ProductVO pvo : productList) {
				
				productListHtml += "<div class='col-sm-4'>";
				
				productListHtml += "<a href='/Semi/product/detail.sa?cateno="+pvo.getFk_cateno()+"&prodcode="+pvo.getProdcode()+"'>";
				productListHtml += "<img src='/Semi/imgProd/"+  pvo.getProdimg() +"' class='prodImg' style='width:100%'/>";
				productListHtml += "</a>";
				
				productListHtml += "<div class='price'>";
				
				productListHtml += "<ul>";
				                                                                                                                                                
				productListHtml += "<li><a href = '/Semi/product/detail.sa?cateno="+pvo.getFk_cateno()+"&prodcode="+pvo.getProdcode()+"' class='listTitle'>"+pvo.getProdname()+"</a></li>\n" + 
						"      		<li><span>기간한정세일 11.15-12.31</span></li>\n" + 
						"      		<li><span class='currentPrice'><del>"+NumberFormat.getInstance().format(Integer.parseInt(category.get("price")))+"WON</del></span></li>\n" + 
						"      		<li><span class='discPrice'>"+NumberFormat.getInstance().format(Integer.parseInt(category.get("saleprice")))+"WON</span></li>";
				
				productListHtml += "</ul>";
				
				productListHtml += "</div>";
				
				productListHtml += "</div>";
				
				
			}
			
			
			int totalPage = pdao.totalPage(sizePerPage, cateno);
			
			////  !!! 공식  !!!  ////
			int pageNo = 1;
			// pageNo 가 페이지바에서 보여지는 첫번째 페이지 번호이다.
			
			int blockSize = 3;
			// blockSize 는 블럭(토막) 당 보여지는 페이지 번호의 갯수이다.
			
			int loop = 1;
			// loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지믄 증가하는 용도이다.
			
			pageNo = ( ( Integer.parseInt(currentShowPageNo) - 1 )/ blockSize ) * blockSize + 1; 
	
	
			String pageBar = "";
		//	/Semi/product/list.sa
			pageBar += "<a href = 'list.sa?cateno="+cateno+"&currentShowPageNo=1'><i class='fa fa-angle-double-left' style='font-size:32px'></i></a>";
			if(pageNo != 1)
				pageBar += "&nbsp;<a href = 'list.sa?cateno="+cateno+"&currentShowPageNo="+ (pageNo-1) +"'><i class='fa fa-angle-left page1' style='font-size:32px'></i></a>&nbsp;";
			else
				pageBar += "<a href = 'list.sa?cateno="+cateno+"&currentShowPageNo=1'><i class='fa fa-angle-left' style='font-size:32px'></i></a>";
			
			while(!( loop > blockSize || pageNo > totalPage )) {	// 반복 횟수 ; 10번 반복
				
				if(pageNo == Integer.parseInt(currentShowPageNo)) {	// 보고자 하는 페이지 == 현재 페이지
					pageBar += "&nbsp;<span class = 'active'>"+pageNo+"</span>&nbsp;";
						//	= "&nbsp;<span style = 'border : solid 2px gray; padding : 2px;>'"+pageNo+"</span>&nbsp;";
				}
				else {
					pageBar += "&nbsp;<a class = 'pageNumber' href = 'list.sa?cateno="+cateno+"&currentShowPageNo="+ pageNo +"'>"+pageNo+"</a>&nbsp;";
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
			pageBar += "&nbsp;<a href = 'list.sa?cateno="+cateno+"&currentShowPageNo="+ pageNo +"'><i class='fa fa-angle-right' style='font-size:32px'></i></a>&nbsp;";
			pageBar += "&nbsp;<a href = 'list.sa?cateno="+cateno+"&currentShowPageNo="+totalPage+"'><i class='fa fa-angle-double-right' style='font-size:32px'></i></a>&nbsp;";
			
		
			
		request.setAttribute("productList", productList);
		request.setAttribute("category", category);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("productListHtml", productListHtml);

		}
		else {
			
			System.out.println("productList 실패");
			
		}
		
		super.setViewPage("/WEB-INF/product/productList.jsp");
	}

}
