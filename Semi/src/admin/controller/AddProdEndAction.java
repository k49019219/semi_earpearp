package admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.*;

public class AddProdEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 관리자(admin)로 로그인했을때만 조회가 가능하도록 한다.
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginuser == null) {
			
			String message = "먼저 관리자로 로그인 하세요.";
			String loc = "javascript:history.back();";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;	// break;
		}
		else {
			
			String userid = loginuser.getUserid();
			
			if( !("earp".equals(userid)) ) {
				
				String message = "관리자만 접근이 가능합니다.";
				String loc = "javascript:history.back();";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return; // break;
				
			}
			
			
		}// 관리자 로그인
		
		String method = request.getMethod();
		
		if(!"POST".equalsIgnoreCase(method)) {
			// method 방식이 GET 이라면
			
			super.setViewPage("/WEB-INF/admin/addProd.jsp");
			
		}
		else {
			// POST 라면
			
	/*		
			 파일을 첨부해서 보내는 form 태그가
			 enctype="multipart/form-data" 으로 되어있다면
			 HttpServletRequest 을 사용해서는 데이터값을 받아올 수 없다.
			 이때는 cos.jar 라이브러리를 다운받아 사용하도록 한 후 (첨부) 
			 아래의 객체를 사용해서 데이터 값 및 첨부되어진 파일까지 받아올 수 있다. 
	*/
			
			MultipartRequest mtrequest = null;
	//		MultipartRequest mtrequest 은 HttpServletRequest 가 하던 일을 그대로 승계받아서 일처리를 해주고
	//		동시에 파일을 받아서 업로드, 다운로드 까지 해주는 기능이 있다.		
			
			
			// 1. 첨부되어진 파일을 디스크의 어느경로에 업로드 할 것인지 그 경로를 설정해야 한다.
	//		HttpSession session = request.getSession();
			
			ServletContext svlCtx = session.getServletContext();
			String imagesDir = svlCtx.getRealPath("/imgProd");	
										    // location xx Path oo
			
			System.out.println("=== 첨부되어지는 잉미지 파일이 올라가는 하드디스크 절대경로 -> "+ imagesDir +" === ");
	//	=== 첨부되어지는 잉미지 파일이 올라가는 하드디스크 절대경로 -> C:\myjsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MyMVC\images === 	
	//  C:\myjsp\MyMVC\WebContent\images << 이미지파일이 올라가지 x / 개발용으로 사용하고 실제로는 상하 경로로 쓰임
	//  C:\myjsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MyMVC\images << 운영할때 쓰임		
		
		
/*
  	--		mtrequest = new MultipartRequest(request, imagesDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
	--	 	MultipartRequest(HttpServletRequest, 파일이 올라갈 절대경로, ↑ 10 MB// 첨부파일의 최대 크기(단위:바이트), 언어형식, 덮어쓰기 하지않고 파일 이름을 계속 새로 만들어서 복사본을 만듬);
  
  
  
		    MultipartRequest의 객체가 생성됨과 동시에 파일 업로드가 이루어 진다.
					 
		    MultipartRequest(HttpServletRequest request,
			       	         String saveDirectory, -- 파일이 저장될 경로
				             int maxPostSize,      -- 업로드할 파일 1개의 최대 크기(byte)
				             String encoding,
				             FileRenamePolicy policy) -- 중복된 파일명이 올라갈 경우 파일명다음에 자동으로 숫자가 붙어서 올라간다. 
				   
		    파일을 저장할 디렉토리를 지정할 수 있으며, 업로드제한 용량을 설정할 수 있다.(바이트단위). 
		    이때 업로드 제한 용량을 넘어서 업로드를 시도하면 IOException 발생된다. 
		    또한 국제화 지원을 위한 인코딩 방식을 지정할 수 있으며, 중복 파일 처리 인터페이스를사용할 수 있다.
				   		
		    이때 업로드 파일 크기의 최대크기를 초과하는 경우이라면 
		    IOException 이 발생된다.
		    그러므로 Exception 처리를 해주어야 한다.                
 */
		  try {	
			  //  === 파일을 업로드 해준다.  ===
			  mtrequest = new MultipartRequest(request, imagesDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
			
	      } catch(IOException e) {
	    	  request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
	    	  request.setAttribute("loc", request.getContextPath()+"/admin/addProd.sa"); 
	    	  
	    	  super.setViewPage("/WEB-INF/msg.jsp");
	    	  return;
		  }
		
		  
		  // === 첨부 이미지 파일을 올렸으니 그 다음으로 제품정보를 (제품명, 정가, 제품수량,...) DB의 jsp_product 테이블에 insert 를 해주어야 한다.  === 
		  InterProductDAO pdao = new ProductDAO();
		  
		  // 새로운 제품 등록시 form 태그 에서 입력한 값들을 얻어오기
		  String cateno = mtrequest.getParameter("cateno");
		  String prodname = mtrequest.getParameter("prodname");

		  // 업로드되어진 시스템의 첨부파일 이름을 얻어 올때는 
		  // cos.jar 라이브러리에서 제공하는 MultipartRequest 객체의 getFilesystemName("form에서의 첨부파일 name명") 메소드를 사용 한다. 
		  // 이때 업로드 된 파일이 없는 경우에는 null을 반환한다.		  
		  String prodimg = mtrequest.getFilesystemName("prodimg");
		  String imgdetail = mtrequest.getFilesystemName("imgfilename");
		  // getParameter 아님xxxx
		  
		  
		/*
		   <<참고>> 
		   ※ MultipartRequest 메소드

	        --------------------------------------------------
			  반환타입                         설명
			--------------------------------------------------
			 Enumeration       getFileNames()
			
					                     업로드 된 파일들에 대한 이름을 Enumeration객체에 String형태로 담아 반환한다. 
					                     이때의 파일 이름이란 클라이언트 사용자에 의해서 선택된 파일의 이름이 아니라, 
					                     개발자가 form의 file타임에 name속성으로 설정한 이름을 말한다. 
					                     만약 업로드 된 파일이 없는 경우엔 비어있는 Enumeration객체를 반환한다.
			
			
			 File              getFile(String name)
			
					                     업로드 된 파일의 File객체를 얻는다. 
					                     우리는 이 객체로부터 파일사이즈 등의 정보를 얻어낼 수 있다. 
					                     이때 업로드 된 파일이 없는 경우에는 null을 반환한다.

			
			 String[]          getparameterValues(String name)
			
					                     동일한 파라미터 이름으로 전송된 값들을 String배열로 반환한다. 
					                     이때 전송된파라미터가 없을 경우엔 null을 반환하게 된다. 
					                     동일한 파라미터가 단 하나만 존재하는 경우에는 하나의 요소를 지닌 배열을 반환하게 된다.    
		*/
		  
	//	  String price = mtrequest.getParameter("price");
	//	  String saleprice = mtrequest.getParameter("saleprice");
		  
		  
		  ProductVO pvo = new ProductVO();
		  String prodcode = pdao.getProdcode();  // 제품번호 채번 해오기 
		  
		  pvo.setProdcode(prodcode);
		  pvo.setFk_cateno(Integer.parseInt(cateno));
		  pvo.setProdcode(prodcode);
		  pvo.setProdname(prodname);
		  pvo.setProdimg(prodimg);
		  
		  // 제품 등록
		  int n = pdao.addProd(pvo);   
		  
		  int m = pdao.addProdDetailImg(prodcode, imgdetail);
		
		  String message = "";
		  String loc = "";
		  
		  if(n*m==1) {	// 둘 다 insert 가 성공했을때 commit
			  message = "제품등록 성공!!";
			  loc = request.getContextPath()+"/product/list.sa?cateno="+cateno;
		  }
		  
		  else {
		  	  message = "제품등록 실패!!";
		  	  loc = request.getContextPath()+"/admin/addProd.sa";
		  }
		  
		  request.setAttribute("message", message);
		  request.setAttribute("loc", loc);
		  
		  super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		
		
	}// end of execute()------------------------------

}


