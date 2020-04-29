package admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
 
public class AddProdAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterProductDAO pdao = new ProductDAO();
		List<HashMap<String, String>> category = pdao.getCategoryList();
		
		request.setAttribute("category", category);
		
		super.setViewPage("/WEB-INF/admin/addProd.jsp");
		
	}

}
