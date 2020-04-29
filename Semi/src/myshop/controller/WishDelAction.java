package myshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class WishDelAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String wishno = request.getParameter("wishno");
		String[] wishnoArr = wishno.split(",");
		
		
		InterProductDAO pdao = new ProductDAO();
		
		if(wishnoArr == null) {
			pdao.deleteAllWish();
		}
		
		else {
			for(int i=0; i<wishnoArr.length; i++) {
				pdao.deleteOneWish(wishnoArr[i]);
			}
		}
		
		super.setRedirect(true);
		super.setViewPage("/Semi/myshop/wishList.sa");
		
	}

}
