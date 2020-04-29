package product.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.*;
import common.controller.AbstractController;
import my.util.MyUtil;
import product.model.*;

public class DetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterProductDAO pdao = new ProductDAO();

		String prodcode = request.getParameter("prodcode");
		String cateno = request.getParameter("cateno");

		// 제품번호를 가지고 해당 제품의 정보를 조회해오기
		ProductVO pvo = pdao.getProductOneByCode(prodcode);

		// 제품번호를 가지고 해당 제품의 추가된 이미지 정보를 조회해오기
		String imgfilename = pdao.getImagesByCode(prodcode);

		// 카테고리 데이터 조회
		HashMap<String, String> category = pdao.category(cateno);
		
		request.setAttribute("category", category);

		////////////////////////////Q&A 미니 게시판 ///////////////////////////

		String page = request.getParameter("page");
		String size = request.getParameter("size");

		InterBoardDAO bdao = new BoardDAO();

		if (page == null) {
			page = "1";
		}
		if (size == null || !"3".equals(size)) {
			size = "3";
		}

		HashMap<String, String> PagingMap = new HashMap<String, String>();
		PagingMap.put("size", size);
		PagingMap.put("page", page);
		PagingMap.put("prodcode", prodcode);

		// QNA 리스트 조회 및 페이징처리를 위한 count, totalPage 불러오기
		HashMap<String, String> qnaPageCountMap = bdao.getQnaPageCountForProdMap(PagingMap);
		int totalPage = 0;
		int count = Integer.parseInt(qnaPageCountMap.get("count"));
		try {
			totalPage = Integer.parseInt(qnaPageCountMap.get("totalPage"));
		} catch (NumberFormatException e) {
			totalPage = (int) Math.ceil((double) count / 15);
		}

		// 해당 상품에 대한 QNA 리스트 조회
		List<HashMap<String, String>> QnaList = bdao.getQnaListForProduct(PagingMap);

		// 해당 상품에 대한 관리자 답변 리스트 조회
		List<HashMap<String, String>> AdminList = bdao.getAdminCommentsList();

		int pageNo = 1;
		int blockSize = 5;
		int loop = 1;

		pageNo = ((Integer.parseInt(page) - 1) / blockSize) * blockSize + 1; // !!!!! 공식 !!!!!

		String pageBar = "";

		// ***** [이전] 만들기 ***** // /Semi/product/detail.sa?prodcode=123-001&cateno=1
		if (pageNo != 1) {
			pageBar += "<a href='/Semi/product/detail.sa?prodcode=" + prodcode + "&cateno=" + cateno + "&page="
					+ (pageNo - 1) + "&size=" + size + "'><img src='/Semi/images/btn_page_prev.png' alt='이전페이지'></a>";
		}

		pageBar += "<ul>";

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == (Integer.parseInt(page))) {
				pageBar += "<li><span class='this'>" + pageNo + "</span></li>";
			}

			else {
				pageBar += "<li><a style='display: inline-block;' class='other' href='/Semi/product/detail.sa?prodcode="
						+ prodcode + "&cateno=" + cateno + "&page=" + pageNo + "&size=" + size + "'>" + pageNo
						+ "</a></li>";
			}

			pageNo++; // 1 2 3 4 5 6 7 8 9 10
			loop++; // 1 2 3 4 5 6 7 8 9 10

		} // end of while --------------------

		pageBar += "</ul>";

		// ***** [다음] 만들기 ***** //
		if (!(pageNo > totalPage)) {
			pageBar += "<a style='display: inline-block;' href='/Semi/product/detail.sa?prodcode=" + prodcode
					+ "&cateno=" + cateno + "&page=" + pageNo + "&size=" + size
					+ "'><img src='/Semi/images/btn_page_next.png' alt='다음페이지'></a>";
		}

		int startIdx = count - Integer.parseInt(size) * (Integer.parseInt(page) - 1);

		if (pvo == null) {
			// GET 방식이므로 사용자가 웹브라우저 주소창에서 장난쳐서 존재하지 않는 제품 번호를 입력한 경우
			String message = "검색하신 제품은 존재하지 않습니다.";
			String loc = "javascript:history.back()";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

			super.setViewPage("/WEB-INF/msg.jsp");

			return;
		}

		else {

			// 제품이 있는 경우
			request.setAttribute("pvo", pvo);
			request.setAttribute("imgfilename", imgfilename);
			request.setAttribute("category", category);

			Calendar currentDate = Calendar.getInstance();
			int month = currentDate.get(Calendar.MONTH) + 1;
			String today = (currentDate.get(Calendar.YEAR) + "-" + month + "-" + currentDate.get(Calendar.DATE));

			HttpSession session = request.getSession();
			
			String goBackURL2 = MyUtil.getCurrentURL2(request);
			session.setAttribute("goBackURL2", goBackURL2);

			request.setAttribute("today", today);
			request.setAttribute("size", size);
			request.setAttribute("page", page);
			request.setAttribute("pageBar", pageBar);
			request.setAttribute("startIdx", startIdx);
			request.setAttribute("AdminList", AdminList);

			request.setAttribute("QnaList", QnaList);

			super.setViewPage("/WEB-INF/product/detailPage.jsp");

		}
	}

}