package common.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest; 

import product.model.*;


public abstract class AbstractController implements InterCommand {
	
	/*
	 	※ forward방법(dispatcher)으로 이동
	 	
	 	super.setRedirect(false);
	 	super.setViewPage("/WEB-INF/index.jsp");
	 	
	 	※ URL 주소를 변경하여 페이지 이동
	 	
	 	super.setRedirect(true);
	 	super.setViewPage("registerMember.up");
	*/
	
	private boolean isRedirect = false;
	private String viewPage;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getViewPage() {
		return viewPage;
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	
	// 로그인 유무를 검사
	/*
	 public boolean checkLogin(HttpServletRequest request) { 
	 	HttpSession session = request.getSession(); MemberVO loginuser = (MemberVO)
	 	session.getAttribute("loginuser");
	 	if(loginuser != null) return true; else return false; 
	 }
	 */
	
	// 제품목록(Category)을 보여줄 메소드 
	public void getCategoryList(HttpServletRequest request) 
			throws SQLException {
		
		/*
		 	jsp_category 테이블에서
		 	카테고리코드(code)와 카테고리명(cname)을 가져와서
		 	request 영역에 저장시킨다.
		 */
		InterProductDAO dao = new ProductDAO();
		List<HashMap<String, String>> categoryList = dao.getCategoryList();
		
		request.setAttribute("categoryList", categoryList);
	};
}
