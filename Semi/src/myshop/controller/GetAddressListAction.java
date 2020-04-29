package myshop.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import common.controller.AbstractController;
import order.model.InterOrderDAO;
import order.model.OrderDAO;

public class GetAddressListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = request.getParameter("userid");
		// userid를 받아와서 해당 회원이 주소록에 저장한 모든 주소들을 받아온다.
		InterOrderDAO dao = new OrderDAO();
		List<HashMap<String, String>> addressList = dao.getAddressList(userid);
		
		String result = addressList.toString();
		
		request.setAttribute("result", result);
		
		// super.setRedirect(false);
		super.setViewPage("WEB-INF/jsonResult.jsp");
	
	} // end of execute---------------------------------------------

}
