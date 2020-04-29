<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="member.model.*"  %>
<%@page import="myshop.model.*"  %>
<%

	MemberVO loginuser = (MemberVO)session.getAttribute("loginUser"); // casting 
	String fk_userid = loginuser.getUserid();
	
	InterAddrDAO dao = new AddrDAO();
	int count = dao.addrCount(fk_userid);

%>
<jsp:include page="../../header.jsp" />     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>addrList</title>

<style>

	header {
	
		margin-bottom: 0px;
	}
	/* 
	#banner {
	
		margin-bottom: 20px;
	}
	 */

	#bannerh2 {
	
		font-size : 20px;
		font-weight: 900; 
		color:#00a0e2;
		text-decoration: underline;
		text-underline-position: under;
	}
	/* 
	#bannerh2::after {
	
		margin : 0 47%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:218px;
	    width : 95px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	 */
	h2 {
	
		margin-bottom: 50px;
	
	}
	
	#addrTbl {
	
		width : 96%;
		margin : 0 auto;
	}
 	
 	#addrTbl .message {
	 	
	 	border: 1px solid #d7d5d5;
	    padding: 50px 0;
	    text-align: center;
	    color: #757575;
	    font-weight: bold;
 		padding : 50px 0;
		font-size: 12px;
		
 	}
 	
	#addrTbl tr {
	
		border : solid 1px #dfdfdf;
		border-collapse: collapse;
	}
 	
	#addrTbl th {
	
		text-align: center;
		padding: 11px 0 10px;
	    border-left: 1px solid #dfdfdf;
	    border-bottom: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    font-weight: normal;
	    background: #fbfafa;
	    font-size: 12px;
	}
	    
	#addrTbl .addr td{
		 
		padding : 8px 0 7px 0;
		font-size: 12px;
		 
	}
	
	#addrCor {
	
		width : 96%;
		margin : 0 auto;
		padding-top: 10px;
		
	}
	
	#addrCor div {
		
		display: inline-block;
		width : 49.7%;
		
	}
	
	#addrCor a {
		
		
		background-color : #4a5164;
		text-decoration: none;
		color : white;
		font-family: "굴림",Gulim;
    	font-size: 12px;
    	text-align: center;
    	padding: 9px 15px;
    	border-radius: 2px;
    	margin-right : 0px;
   	    line-height: 18px;
  
    	
	}
	
	#addrCor button {
		margin-left : 0px;
	}
	

	#addrWarring {
		
		text-align: left;
		border: solid 1px #dfdfdf;
		width : 96%;
		margin : 0 auto;
	}
	
	#addrWarring h3 {
		
		
	    padding: 9px 0 6px 10px;
	    border-bottom: 1px solid #e8e7e7;
	    color: #101010;
	    font-size: 12px;
	    background: #fbfbfb;
	    margin-top: 0;
	    font-weight: bold;
	
	}
	
	#addrWarring li {
	
		list-style-type:none; 
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
    	font-size: 11.8px;
    	/* line-height : 18px; */
    	padding-left: 22px;
   	    color: #757575;
   	   	
	}
	
	#addrWarring li span {
		vertical-align: text-bottom;
	}
	
	.ico_number {
	
		margin-right: 7px;
		margin-bottom : 3px;
	
	}
	
	.whiteBtn {
	
	    display: inline-block;
	    padding: 2px 8px;
	    border: 1px solid #d1d1d1;
	    border-radius: 2px;
	    font-family: "굴림",Gulim;
	    font-size: 12px;
	    line-height: 18px;
	    color: #222;
	    background-color : white; 
	    
	}
	
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		// == 체크박스 전체선택 / 전체해제 == // 
		 $("input:checkbox[id=allCheck]").click(function(){
	 
				var bool = $(this).prop("checked"); 
				
				$("input:checkbox[name=adrCheck]").prop("checked", bool);
		  });
	  
		 $("input:checkbox[name=adrCheck]").click(function(){
			 
			 var flag = false;
			 
			 $("input:checkbox[name=adrCheck]").each(function() {
				 var bool = $(this).prop("checked");
				 if(!bool) {
					 $("input:checkbox[id=allCheck]").prop("checked", false);
					 flag = true;
					 return false;
				 }
			 });
			 
			 if(!flag)
				 $("input:checkbox[id=allCheck]").prop("checked", true); 
			 
		 });
		 
		/// == 선택 주소록 삭제 == ///  
		$(".deleteBtn").click(function(){
			var flag = false;
			
			$("input:checkbox[name=adrCheck]").each(function() {
				 var bool = $(this).prop("checked");
				 if( bool ) {
					 flag = true;
					 return;
				}
			 });
			 
			 if( !flag) { 
				 alert("삭제할 항목을 선택해주세요.")
			 }
			 else {
				 var checkArray = new Array();
				 $("input:checkbox[name=adrCheck]").each(function() {
					
					 var bool = $(this).prop("checked");
					
					 if (bool){
						 var checkBtn = $(this);
						 var tr = checkBtn.parent().parent();
						 var td = tr.children();
						 var addrNo = td.eq(7).text().trim();
						 checkArray.push(addrNo);
					 }
				 })	 
				console.log(checkArray); 
				/* window.location.href="/Semi/myshop/addr/deleteAddr.sa?checkArray="+checkArray;
				 */
				
				 $.ajax({
					type:'POST',
					url:'<%= request.getContextPath()%>/myshop/addr/deleteAddr.sa',
					traditional : true,
					data: {"checkArray" : checkArray},
					dataType:"json", 
					success: function(json) {  
						location.href="/Semi/myshop/addr/list.sa";
					
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				 });
				
			 }
		
		})
	
	})
	
	function registerAddr(){
		var count = <%=count %>;
		console.log(count);
		if ( count==10 ){
			alert("배송 주소록은 최대 10개까지 등록할 수 있습니다.");
		}else{
		    location.href = "/Semi/myshop/addr/register.sa";
		}
	}
	
</script>

</head>
<body>

	<div id="contents"> 
		<div class="container text-center">    
		  <div id = "banner">
		  		<h2>
		  			<span id = "bannerh2">ADDRESS</span>
		  		</h2>
		  </div>
		  
		  <form name = "addrFrm">
		  
			  <table id = "addrTbl">
			  	<tr class = "message">
			  			<c:if test="${ adrList != null }">
			  				<th style = "width : 2%;"><input type="checkbox" id="allCheck"/></th>
			  			</c:if>
			  			<c:if test="${ adrList == null }">
			  				<th style = "width : 2%;">&nbsp;&nbsp;	</th>
			  			</c:if>
			  		<th style = "width : 8%;">배송지명</th>
			  		<th style = "width : 8%;">수령인</th>
			  		<th style = "width : 9%;">일반전화</th>  
			  		<th style = "width : 9%;">휴대전화</th>
			  		<th style = "width : 60%;">주소</th>
			  		<th style = "width : 5%; border-right: 1px solid #dfdfdf;">수정</th>
			  	</tr>
		 <c:if test="${ adrList == null }">
			 	<tr>
			  		<td colspan = "8"  class = "message"  >등록된 주소가 없습니다.</td>
			  	</tr>
		 </c:if> 	
			  	
		 <c:if test="${ adrList != null }">	
		 	
		 	<c:forEach items="${adrList}" var="adrList" varStatus="status">
			  	<tr class = "addr" >
			  		<td> <input type = "checkbox" name="adrCheck"/>
			  		</td>
			  		<td> 
			  		<c:if test="${ adrList.addrBase == 1 }">	
			  		<img src = "http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/ico_addr_default.gif" />
			  		</c:if>
			  		 ${adrList.destination}
			  		 </td>
			  		<td> ${adrList.receiver} </td>
			  		<td> ${sessionScope.loginUser.tp1} -${sessionScope.loginUser.tp2} -${sessionScope.loginUser.tp3}  </td>
			  		<td> ${sessionScope.loginUser.hp1} -${sessionScope.loginUser.hp2} -${sessionScope.loginUser.hp3} </td>
			  		<td align="left">(${adrList.post})&nbsp;${adrList.addr1}&nbsp;${adrList.addr2} </td>
			  		<td style = " border-right: 1px solid #dfdfdf;"> 
			  		<button type="button" class = "whiteBtn modifyBtn" 
			  		  onclick="location.href ='/Semi/myshop/addr/modifyAddr.sa?addrNO=${adrList.addrNO}'">수정</button> 
			  		</td>
			  		<td style="display: none;">
			  		<p class="addrNO"> ${adrList.addrNO}</p>
			  		</td>
			  	</tr>
			</c:forEach>
		</c:if>  	  	
			  </table>   
			  
		<div id = "addrCor">
		
		 <c:if test="${adrList != null }">	  
			  
			  	<div align="left">
			  		<button type = "button" class = "whiteBtn deleteBtn" style = "padding: 6px 8px; " >선택 주소록 삭제</button>
			  	</div>
			  	
		</c:if>   	
		 	
			  	<div align="right" style = "float: right;">
			  		<a style="cursor: pointer;" onclick="registerAddr();" >배송지 등록</a>
			  	</div>
			  	
			  </div>
			
		  </form>  
			<br/><br/>
		  <div id = "addrWarring">
		  	<h3>배송주소록 유의사항</h3>
		  	<div>
		  		<ul style="padding : 0;" >
		  			
		  			<li>
			  			<img src = "/Semi/images/ico_number1.png" class = "ico_number" />
			  			<span>배송 주소록은 최대 10개까지 등록할 수 있습니다.</span>
		  			</li>
		  			  
		  			<li>
		  				<img src = "/Semi/images/ico_number2.png" class = "ico_number" />
		  				<span>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</span>
		  			</li>
		  		</ul>
		  	</div>
		  
		  </div>  
			  
		</div>
	 </div>
  
</body>
</html>

<jsp:include page="../../footer.jsp" />  