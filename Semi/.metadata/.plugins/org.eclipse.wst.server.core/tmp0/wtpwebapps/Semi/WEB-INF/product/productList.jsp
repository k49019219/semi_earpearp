<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<jsp:include page = "../header.jsp" />

<style>

	header {
	
		margin-bottom: 0px;
	}

	#banner {
	
		margin-bottom: 20px;
	}
	

	#bannerh2 {
	
		font-size : 20px;
		font-weight: 900; 
		color:#00a0e2;
		
	}
	
	#bannerh2.hard::after {
	
		margin : 0 46.27%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:219px;
	    width : 120px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
	#bannerh2.tough::after {
	
		margin : 0 43.8%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:219px;
	    width : 198px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
	#bannerh2.jelly::after {
	
		margin : 0 46.23%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:219px;
	    width : 118px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
	#bannerh2::after_clearj {
	
		margin : 0 46.27%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:219px;
	    width : 120px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
	#bannerh2::after_colorj {
	
		margin : 0 46.27%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:219px;
	    width : 120px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
	#bannerh2.limited::after {
	
		margin : 0 45.6%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:219px;
	    width : 140.6px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
	#banner2 {
	
		margin-left: 22.25%;
		margin-right: 20%;
	
		cursor : pointer;
	
	}
	
	#banner2 div {
		
		display: inline-block;
		color: black;
		font-weight: 900;
		font-size: 18px;
		margin-right: 32px;
		margin-bottom: 50px;
	
	}
	#banner2 div:hover {
		color: #00a0e2;
	}
	
	
	h2 {
	
		margin-bottom: 70px;
	
	}
	
	.col-sm-4 {
		border-top-width: 6px;
		margin-bottom: 40px;

	}
	
	.pageNumber {
		
		font-size:16px; 
		font-weight:bold;
	}
	
	.pagination {
	  display: block;
	}
	
	.pagination a {
	  color: black;
	  padding: 3px 10px;
	  text-decoration: none;
	  cursor : pointer;
	  margin : 0 10px;
	}
 	
	.pagination span.active {
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

<script type="text/javascript" >

 $(function() {
	 
	 var catename = $("#bannerh2").text();
	 
	 if( "HARD CASE" == catename){
		 
		 $("#bannerh2").toggleClass('hard');
		 
	 }
	 else if("TOUGH/SLIDE CASE" == catename){
		 
		 $("#bannerh2").toggleClass('tough');
		 
	 }
	 else if("LIMITED CASE" == catename){
		 
		 $("#bannerh2").toggleClass('limited');
		 
	 }
	else {
		 
		 $("#bannerh2").toggleClass('jelly');
		 
	 }
	 
	 
 });

</script>

<div id="contents"> 
<div class="container text-center"> 

	<c:choose>
		<c:when test="${ category.cateno eq 3 }">
			<div id = "banner">
	  		<h2 style = "margin-bottom : 32px;">
	  			<span id = "bannerh2">JELLY CASE</span>
	  		</h2>
			</div>
			<div id = "banner2">
			  	<div onclick="location.href='/Semi/product/list.sa?cateno=3'" style = "color: #00a0e2;">CLEAR JELLY CASE</div>
			  	<div onclick="location.href='/Semi/product/list.sa?cateno=4'">COLOR JELLY CASE</div>
			</div>
		</c:when>
		
		<c:when test="${ category.cateno eq 4 }">
			<div id = "banner">
	  		<h2 style = "margin-bottom : 32px;">
	  			<span id = "bannerh2">JELLY CASE</span>
	  		</h2>
			</div>
			<div id = "banner2">
			  	<div onclick="location.href='/Semi/product/list.sa?cateno=3'" >CLEAR JELLY CASE</div>
			  	<div onclick="location.href='/Semi/product/list.sa?cateno=4'" style = "color: #00a0e2;">COLOR JELLY CASE</div>
			</div>
		</c:when>
	
		<c:otherwise>
			<div id = "banner">
		  		<h2>
		  			<span id = "bannerh2">${ category.catename } CASE</span>
		  		</h2>
	  		</div>
		</c:otherwise>
	</c:choose>
  
  <div class="row">
  
  
  <c:if test="${ not empty productList }">
		${ productListHtml }
  </c:if>
  
  <c:if test="${ empty productList }">
  	<div class="col-sm-4">
  	  <span> 등록된 상품이 없습니다. </span>
    </div>
  </c:if>


  
 
  
</div>
   <div class="pagination">
	
		${pageBar}
	
  </div>
 
</div>
</div>

<jsp:include page = "../footer.jsp" />
