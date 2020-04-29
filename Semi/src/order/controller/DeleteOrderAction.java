package order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.*;
import myshop.model.ProductVO;

public class DeleteOrderAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 삭제를 선택한 경우 삭제된 제품을 제외하고 같은 방식으로 전송한다.
		String[] prodArr = request.getParameterValues("prodArr");
		String[] qtyArr = request.getParameterValues("qtyArr");
		String[] modelArr = request.getParameterValues("modelArr");

		JSONArray jsArr = new JSONArray();
		ArrayList<HashMap<String,String>> productList = new ArrayList<HashMap<String,String>>();
		InterOrderDAO pdao = new OrderDAO();
		
		if(prodArr!=null && qtyArr!=null && modelArr!=null) {
			for(int i=0; i<prodArr.length; i++) {
				
				HashMap<String,String> product = new HashMap<String,String>();
				product.put("prodcode", prodArr[i]);
				product.put("qty", qtyArr[i]);
				product.put("model",modelArr[i]);
				
				ProductVO vo = pdao.getProductInfo(prodArr[i]);
			
				product.put("cateno", String.valueOf(vo.getCateno()));
				product.put("prodname", vo.getProdname());
				product.put("prodimg", vo.getProdimg());
				product.put("price", String.valueOf(vo.getPrice()));
				product.put("saleprice",String.valueOf(vo.getSaleprice()));
				
				productList.add(product);
			} // end of for--------------------------------------------------------------------
			JSONObject jsobj1 = new JSONObject();
			jsobj1.put("productList", productList);
			jsArr.put(jsobj1);
		}
		
		// 총 원래 가격, 총 할인가격, 최종 주문금액을 미리 계산해서 view단으로 보낸다.---------------------------------------
		int totalSalePrice = 0;
		int totalOriginalPrice = 0;
		for(HashMap<String,String> product : productList) {
			int price = Integer.parseInt(product.get("price"));
			int qty = Integer.parseInt(product.get("qty"));
			int saleprice = Integer.parseInt(product.get("saleprice"));
			
			totalOriginalPrice += price*qty;
			totalSalePrice += (price-saleprice)*qty;
		}
		
		int totalPrice = totalOriginalPrice-totalSalePrice;
		
		HashMap<String,Integer> price = new HashMap<String,Integer>();
		price.put("totalSalePrice",totalSalePrice);
		price.put("totalOriginalPrice",totalOriginalPrice);
		price.put("totalPrice",totalPrice);
		
		JSONObject jsobj2 = new JSONObject();
		jsobj2.put("price", price);
		
		/*
		 * else { String message = "잘못된 접근입니다! 로그인하세요!"; String loc =
		 * "javascript:history.back()";
		 * 
		 * request.setAttribute("message", message); request.setAttribute("loc", loc);
		 * 
		 * // super.setRedirect(false); super.setViewPage("/WEB-INF/msg.jsp"); return;
		 * // 이 이상 동작을 수행하지 않고 종료한다.
		 * 
		 * }
		 */
		
		// 주문서 작성 페이지----------------------------------------------------------------------------- 
		
		jsArr.put(jsobj2);
		
		String result = jsArr.toString();

		request.setAttribute("result", result);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
		
		}
		
	}

