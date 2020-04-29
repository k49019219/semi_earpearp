<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../header.jsp"/>

<style>

	body {
	    font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
	}

	div#container {
	
		width: 85%;
		margin : 0 auto;
		text-align: center;
	
	}
	
	h3 {
	
		text-align: center;
		font-size : 20px; 
		color : #0099e6; 
		font-weight: bold; 
		margin-bottom: 42px;
	
	}
	
	h3::after {
	    margin: 0 47.2%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top: 190px;
	    width: 88px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	}
	
	table#mbrTbl {
	
		margin-top: 12px;
	
		width: 100%;
		
	/*	color : #0099e6;	*/

	
	}
	
	table#mbrTbl th {
		text-align: center;
	    padding: 11px 0 10px;
	    border-left: 1px solid #dfdfdf;
	    border-bottom: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    font-weight: normal;
	    background: #fbfafa;
	
	}
	
	table#mbrTbl td:hover {
	
		cursor : pointer;
	}
	
	table#mbrTbl th, table#mbrTbl td{
	
		border : solid 1px black;
		border-collapse: collapse;
	
	}
	table#mbrTbl td{
	    
	    padding: 11px 10px 10px;
	    border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    word-break: break-all;
	    word-wrap: break-word;

	}
	
	div#expage{
		display: inline-block;
	    box-sizing: border-box;
	    padding: 6px 10px;
	    border: 1px solid transparent;
	    border-radius: 2px;
	    font-family: "굴림",Gulim;
	    font-size: 12px;
	    line-height: 18px;
	    text-align: center;
	    color: #fff;
	    background-color: #4a5164;
	
	}
	
	.pageNumber {
		
		font-size:16px; 
		font-weight:bold;
	}
	
	.pagination {
	  display: block;
	  text-align: center;
	  margin-top : 0px;
	  margin-bottom: 45px;
	}
	
	.pagination a {
	  color: black;
	  padding: 3px 10px;
	  text-decoration: none;
	  cursor : pointer;
	  margin : 0 10px;
	}
 	
	.pagination span.active {
		display : inline-block;
	 	border : solid 2px black;
	 	color: black;
		padding: 3px 10px;
		text-decoration: none;
		cursor : pointer;
		margin : 0 10px;
		font-size: 16px; 
		font-weight: bold; 
	}
 	
	.pagination a:hover, .pagination span:hover {
	   text-decoration: underline;
	}
</style>


<script type="text/javascript">
	
	$(function() {
		 
		$("#mbrTbl tr").click(function() {
			
			var userid = $(this).children(":nth-child(3)").text();
			
			window.open("/Semi/admin/memberInfo.sa?userid="+userid, "회원정보"
					  , "resizable = no, width=470px, height=500px, top=200px, left=200px");
			
		});
		
	});
	

</script>


<div id = "container">
	<div>
	<div style = "margin-top : 10px; margin-bottom: 42px;">
		<h3 style = "font-size : 20px; color : #0099e6; font-weight: bold; "> 회원목록 </h3>
	</div>	
		<div style = "margin-bottom: 35px;" >
			<table id = "mbrTbl">
				<thead>
					<tr>
						<th>-</th>
						<th>회원번호</th>
						<th>아이디</th>
						<th>회원명</th>
						<th>이메일</th>
						<th>가입일자</th>
					</tr>
				</thead>
				<tbody>
					<c:if test = "${ memberList != null }">
						<c:forEach var = "mbrlist" items="${ memberList }" varStatus="status" > 
							<tr>
								<td>${ status.count }</td>
								<td>${ mbrlist.idx }</td>
								<td>${ mbrlist.userid }</td>
								<td>${ mbrlist.name }</td>
								<td>${ mbrlist.email }</td>
								<td>${ mbrlist.registerday }</td>
							</tr>	
						</c:forEach>
					</c:if>
					
					<c:if test="${ memberList == null }">
					<tr>
						<td colspan = "5">
							<span>가입된 회원이 없습니다.</span>
						</td>
					</tr>
					</c:if>
					
				</tbody>
			</table>
			
		</div>
		<div class="pagination">
	
			${pageBar}
		
	 	</div>
	</div>
</div>


<jsp:include page="../footer.jsp"/>
