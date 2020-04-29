package myshop.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import myshop.model.*;

public class DeleteAddrAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String[] addrNoList = request.getParameterValues("checkArray");		
		
		/* System.out.println(addrNoList); */
		
		InterAddrDAO dao = new AddrDAO();
		
		int n = 0;
		
		for (int i = 0; i < addrNoList.length; i++) {
			
			String addrNo = addrNoList[i];
			 n = dao.deleteAddr(Integer.parseInt(addrNoList[i])); 
		}
		
		JSONObject jsobj = new JSONObject();
		jsobj.put("n", n);
		String result = jsobj.toString();
		request.setAttribute("result", result);
		super.setRedirect(false); super.setViewPage("/WEB-INF/jsonResult.jsp");
	
	}

}
