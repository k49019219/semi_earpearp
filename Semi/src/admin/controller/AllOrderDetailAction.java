package admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.*;

public class AllOrderDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		// 클릭한 상품의 주문정보를 받아 주문 상세 페이지로 보낸다.
		String ordernum = request.getParameter("ordernum");
		String prodcode = request.getParameter("prodcode");
		
		InterOrderDAO odao = new OrderDAO();
		
		// 주문자 이름 가져오기 ㅜㅜ
		MemberVO orderuser = odao.odrcodeOwnerMemberInfo(ordernum);
		
		// 주문에 대한 정보
		HashMap<String,String> orderInfo = new HashMap<String,String>();
		orderInfo = odao.getDetailPageOrderInfo(ordernum);
		orderInfo.put("ordernum", ordernum);
		
		// 주문 상세 정보, 각 주문제품의 이미지, 카테고리 받아오기
		List<HashMap<String,String>> orderDetail = new ArrayList<HashMap<String,String>>();
		orderDetail = odao.getDetailPageOrderDetailInfo(ordernum, prodcode);

		int totalOriginalPrice = 0;
		int totalSalePrice = 0;
		for(HashMap<String,String> order : orderDetail) {
			int price = Integer.parseInt(order.get("price"));
			int saleprice = Integer.parseInt(order.get("saleprice"));
			int quantity = Integer.parseInt(order.get("quantity"));
			
			totalOriginalPrice += price*quantity;
			totalSalePrice += (price-saleprice)*quantity;
		}
		
		orderInfo.put("totalOriginalPrice", String.valueOf(totalOriginalPrice));
		orderInfo.put("totalSalePrice", String.valueOf(totalSalePrice));
		
		request.setAttribute("orderInfo", orderInfo);
		request.setAttribute("orderDetail", orderDetail);
		request.setAttribute("orderuser", orderuser);
		
		super.setViewPage("/WEB-INF/admin/orderDetail.jsp");
		
	}

}
