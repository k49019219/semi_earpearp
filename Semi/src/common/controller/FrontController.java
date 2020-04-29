package common.controller;


import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		description = "사용자가 웹에서 *.sa을 했을 경우 이 서블릿이 먼저 응답을 해 주도록 한다.", 
		urlPatterns = { "*.sa" }, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "/Volumes/Samsung_T3/PROGRAMMING/세미프로젝트/Semi/EarpEarp/WEB-INF/Command.properties", description = "*.sa에 대한 클래스 매핑 파일")
		}) 
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HashMap<String, Object> cmdMap = new HashMap<String, Object>();

	/*
	 	웹브라우저 주소창에서 *.up을 하면 FrontController 서블릿이 응대를 해 오는데 맨 처음에 자동적으로 실행되어지는 메소드가 
	 	init(ServletConfig config)이다. 여기서 중요한 것은 init(ServletConfig config) 메소드는 WAS(톰캣)가 구동
	 	되어진 후 딱 1 번만 init(ServletConfig config) 메소드가 실행되어지고, 그 이후에는 실행이 되지 않는다.
	*/
	public void init(ServletConfig config) throws ServletException {
		
		// *** 확인용 *** //
		// System.out.println("~~~ 확인용 => 서블릿 FrontController의 init(ServletConfig config)가 실행됨. ~~~");
		
		Properties pr = new Properties();
		// Properties 는 Collection 중 HashMap 계열중의  하나로써
		// "key","value"으로 이루어져 있는것이다.
		// 그런데 중요한 것은 Properties 는 key도 String 타입이고, value도 String 타입만 가능하다는 것이다.
		// key는 중복을 허락하지 않는다. value 값을 얻어오기 위해서는 key값만 알면 된다.
		
		FileInputStream fis = null;
		// 특정 파일에 내용을 읽어오기 위한 용도로 쓰이는 객체 
		
		try {
			String props = config.getInitParameter("propertyConfig");
			// System.out.println("~~~ 확인용 props => " + props);
			
			fis = new FileInputStream(props);
			// fis는 C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties 파일의 내용을 읽어오기 위한 용도로 쓰이는 객체 생성함
			
			pr.load(fis);
			/*
			 	fis 객체를 사용하여 C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties 파일의 내용을 읽어다가
			 	Properties 클래스의 객체인 pr에 로드시킨다.
			 	그러면 pr은 읽어온 파일(Command.properties)의 내용에서 = 을 기준으로 왼쪽은 key로 보고, 오른쪽은 value로
			 	인식한다.
			*/
			
			// === 확인용 시작 === //
			/*
			String str_ClassName = pr.getProperty("/index.up");
			System.out.println("~~~ 확인용 key가 /index.up인 value => " + str_ClassName);
			
			str_ClassName = pr.getProperty("/member/memberRegister.up");
			System.out.println("~~~ 확인용 key가 /member/memberRegister.up인 value => " + str_ClassName);
			*/
			// === 확인용 끝 === //
			
			Enumeration<Object> en = pr.keys();
			/*
			 	pr.keys(); 은 C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties 파일의 내용물에서
			 	= 을 기준으로 왼쪽에 있는 모든 key들만 가져오는 것이다.
			*/
			
			while(en.hasMoreElements()) {
				String key_url = (String) en.nextElement();
				// System.out.println("~~~ 확인용 key => " + key_url);
				// System.out.println("~~~ 확인용 ClassName => " + pr.getProperty(key_url));
				
				String className = pr.getProperty(key_url);
				
				if(className != null) {
					className = className.trim();
					
				Class<?> cls = Class.forName(className);
				// String 타입으로 되어진 className을 클래스화 시켜주는 것
				// 주의할 점은 실제로 String 으로 되어져 있는 문자열이 클래스로 존재해야만 한다는 것이다.
				
				Object obj = cls.newInstance();
				// 클래스로부터 실제 객체(인스턴스)를 생성해 주는 것이다.
				
				cmdMap.put(key_url, obj);
				// cmdMap 에서 키값으로 Command.properties 파일에 저장되어진 url을 주면 
				// cmdMap 에서 해당 클레스에 대한 객체(인스턴스)를 얻어오도록 만든 것이다.
				
				}
				
			} // end of while ------
			
		} catch (ClassNotFoundException e) {
			System.out.println(">>> 문자열로 명명되어진 클래스가 존재하지 않습니다.");
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			System.out.println(">>> C:/myjsp/Semi/EarpEarp/WEB-INF/Command.properties 파일이 없습니다. <<<");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		requestProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		requestProcess(request, response);
	}


	private void requestProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		// 웹브라우저상의 주소 입력창에서
		// http://localhost:9090/MyMVC/member/member/idDuplicateCheck.up?userid=leess
		// 와 같이 입력되었더라면
		// String url = request.getRequestURL().toString();
		// System.out.println("~~~ 확인용 url => "+ url);
		// ~~~ 확인용 url => http://localhost:9090/MyMVC/member/member/idDuplicateCheck.up
		
		String uri = request.getRequestURI();
		// System.out.println("~~~ 확인용 uri => "+ uri);
		// ~~~ 확인용 uri => /MyMVC/member/member/idDuplicateCheck.up
		
		String ctxPath = request.getContextPath();
		// System.out.println("ctxPath => " + ctxPath);
		// ctxPath => /MyMVC
		
		String mapKey = uri.substring(ctxPath.length());
		// System.out.println("mapKey => " + mapKey);
		
		AbstractController action = (AbstractController) cmdMap.get(mapKey);
		
		if(action == null) {
			System.out.println(">>> " + mapKey + " URL 패턴에 매핑된 클래스는 없습니다.");
		}
		else {
			try {
				action.execute(request, response);
				
				boolean bool = action.isRedirect();
				String viewPage = action.getViewPage();
				
				if(!bool) {
					// viewPage에 명기된 view단 페이지로 forward(dispatcher)를 하겠다는 말이다.
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}
				
				else {
					// viewPage 에 명기된 주소로 sendRedirect 를 하겠다는 말이다.
					response.sendRedirect(viewPage);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		// action.test();
		
	}

	
}
