package my.util;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {
	
	// ******** 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드)를 작성해주는 메소드 ***********
	public static String replaceParameter(String param) {
		String result = param;
		
		if(param != null) {
			result.replaceAll("<", "&lt;");
			result.replaceAll(">", "&gt;");
			result.replaceAll("&", "&amp;");
			result.replaceAll("/", "&quot;");
		}
		
		return result;
	}
	
	
	// ****** ? 다음의 데이터까지 포함한 URL주소를 알아오는 메소드 생성
	public static String getCurrentURL(HttpServletRequest request) {
		String currentURL = request.getRequestURL().toString(); 
		
		String queryString = request.getQueryString();
		
		currentURL += "?"+queryString;
		
		String ctxPath = request.getContextPath();

		int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();

		currentURL = currentURL.substring(beginIndex+1);
		
		return currentURL;
		
	}
	
	
	public static String getCurrentURL2(HttpServletRequest request) {
		String currentURL = request.getRequestURL().toString(); 
		
		String queryString = request.getQueryString();

		currentURL += "?"+queryString;
		
		String ctxPath = request.getContextPath();

		int one = currentURL.indexOf(ctxPath) + ctxPath.length();

		int two = currentURL.lastIndexOf("/");
		
		String target = currentURL.substring(one, two);
		
		int end = currentURL.indexOf(target) + target.length();
		
		currentURL.substring(end);

		return currentURL;
		
	}
	
	

}
