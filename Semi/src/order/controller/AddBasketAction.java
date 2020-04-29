package order.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class AddBasketAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String wishnoArr = request.getParameter("wishnoArr"); 
		
		System.out.println(wishnoArr);
		
		String length = request.getParameter("length");
		
		String mode = request.getParameter("mode");
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginUser");
		
		
		
		if(loginuser != null) {
		
			InterProductDAO pdao = new ProductDAO();
			String userid = loginuser.getUserid();
			
			if(wishnoArr != null && length == null) {
				
				String[] wishno = wishnoArr.split(",");
				
				for(int i=0; i<wishno.length; i++) {
					
					HashMap<String, String> wishMap = pdao.selectWish(userid, wishno[i]);
					
					int n = pdao.insertCart(userid, wishMap);
					
					if(n == 1) {
						
						System.out.println("위시 장바구니 성공");
					}
					
					int m = pdao.deleteWishOne(wishno[i], userid);
					
					if(m == 1) {
						System.out.println("위시 삭제 성공");
					}
				}
				
			}
			else if(wishnoArr == null & length != null) {
				
				 
					HashMap<String, String> map = new HashMap<String, String>();
					
					for(int i=0; i< Integer.parseInt(length); i++) {
						
						 String prodcode = request.getParameter("prodcode"+i);
						 String model = request.getParameter("model"+i);
						 String qty = request.getParameter("oqty"+i);
						 
						 map.put("prodcode", prodcode);
						 map.put("model", model);
						 map.put("quantity", qty);
						 
						int n = pdao.insertCart(userid, map);
						
						if(n == 1) {
							
							request.setAttribute("mode",mode);
							System.out.println("디테일 장바구니 성공");
						}
						
					}// end of for
				 
			}// else if
		
			super.setRedirect(true);
			super.setViewPage("basket.sa");
			
		}
		else {
			// 로그인 안 했을때
			
			super.setRedirect(true);
			super.setViewPage("/Semi/member/login.sa");
			
		}
		
		
	}

}
