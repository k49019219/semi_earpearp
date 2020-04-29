<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page = "../header.jsp" />

<style>

	select {
		font-size: 14px;
		padding-left: 5px;
	}

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
	
	#bannerh2::after {
	
		margin : 0 45.75%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:218px;
	    width : 130px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
	h2 {
	
		margin-bottom: 70px;
	
	}

	.col-sm-4 {
		border-top-width: 6px;
		margin-bottom: 40px;

	}

	/*검색 상자 부분*/
	.searchBox {
		font-size: 11px;
		margin: 0 42px;
		padding : 35px 0 10px 0;
		border: 2px solid #000;
		background: #fff;
	}
	
	.searchBox input, .searchBox select {
		border : 1px solid #d9d9d9;
	}
	
	#category_no, #orderby {
		width : 54%;
	}
	
	.searchBox select {
		height : 35px;
	}
	
	.searchBox input {
   		line-height: 29px;
   		padding-left : 10px;
	}
	
	.searchBox .searchselect {
		width : 316px;
	}
	
	.searchBox label {
		display : inline-block;
		width : 100px;
	}
	
	.searchBox .item {
		padding-left : 30%;
		font-size : 12pt;
		margin : 7px auto;
	}
	
	.searchBox #search_condition {
		width : 18%;
	}
	
	.searchBox #searchBtn {
		padding-left : 46%;
		margin : 30px 0;
	}
	
	/*검색 상자 아래의 정렬 기준 bar*/
	.searchResult {
		margin : 0 42px;
		padding : 40px 0;
	}
	
	.searchResult p {
		display:inline-block;
		float:left;
		padding-left:10px;
	}
	
	ul.alignby {
		float : right;
		display:inline-block; 
		text-align:right;
	}

	ul.alignby li {
		list-style-type: none;
		display : inline-block;
		font-size: 15px;
		padding : 0 10px;
		color: #2e2e2e;
		cursor: pointer;
		border-right : solid 1px #e6e6e6;
	}
	
	ul.alignby > li:nth-child(3) {
		border : none;
	}
	
	ul.alignby li a {
		text-decoration: none;
		color : #2e2e2e;
	}

	ul.alignby li a:hover { 
		cursor: pointer;
	}
	
	/*검색 결과가 없을 때*/
	.noData {
		text-align: center;
		font-size: 12px;
		margin-top: 80px;
		margin-bottom: 80px;
	}
	
	.noData .warning {
		font-weight:bold;
		color:#008bcc;
	}
	
	.waringBold {
		font-weight:bold;
		margin-bottom:20px;
	}
	
	.noData > ul > li {
		list-style-type: none;
		margin-top : 10px;
	}
	
	/* ====== page Bar ====== */
	
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
<script>
$(document).ready(function(){
	
	var search = "${search}";
	$("#keyword").val(search);
	
	var category_no = "${category_no}";
	$("#category_no").val(category_no);
	
	var search_condition = "${search_condition}";
	$("#search_condition").val(search_condition);
	
	var orderby = "${orderby}";
	$("#orderby").val(orderby);
	
});

function goSearch(){
	
	console.log($("#keyword").val());
	
	// 검색 버튼을 누르면 div.searchBox에서 사용자가 입력한 검색어들을 전송, DB에서 해당하는 상품 리스트를 받아온다.
	if($("#keyword").val() == "" && $("#minprice").val() == "" && $("#maxprice").val() == ""
			&& $("#category_no").val() == null && $("#orderby").val() == null){
		alert("검색어를 입력하세요!");	
	}
	else {
		var frm = document.searchForm;
		
		frm.method = "GET";
		frm.action = "/Semi/product/search.sa"; 
		frm.submit();
	}
	
}
</script>
<div id="contents"> 
<div class="container text-center">    
  <div id = "banner">
  		<h2>
  			<span id = "bannerh2">SEARCH LIST</span>
  		</h2>
  </div>
          
  <div class="row">
	  <div class="searchBox" align="left">
	  <form id = "searchForm" name="searchForm">
	  	<fieldset>
			<div class="item">
				<label>상품분류</label> 
				<select id="category_no" name="category_no">
					<option value="" selected="selected">상품분류 선택</option>
					<option value="1">상품대분류 &gt; CASE &gt; HARDCASE</option>
					<option value="2">상품대분류 &gt; CASE &gt; TOUGH/SLIDE</option>
					<option value="3">상품대분류 &gt; CASE &gt; JELLY CASE &gt; CLEAR JELLY CASE</option>
					<option value="4">상품대분류 &gt; CASE &gt; JELLY CASE &gt; COLOR JELLY CASE</option>
					<option value="5">상품대분류 &gt; CASE &gt; LEMITED CASE</option>
		 		</select>
	 		</div>
	 		
	 		<div class="item">
	 			<div>
	                <label>검색조건</label>
	                <select id="search_condition" name="search_condition">
						<option value="product_name">상품명</option>
						<option value="product_code">상품코드</option>
					</select> 
					<input id="keyword" name="search" size="36" type="text" style="font-size: 14px;" />
				</div>				
			</div>
			
			<div class="item">
				<label>판매가격대</label> 
				<input id="minprice" name="minprice" size="25" type="text" style="font-size: 14px;"/> 
				~ 
				<input id="maxprice" name="maxprice" size="25" type="text" style="font-size: 14px;"/>
			</div>
 
			 <div class="item">
				<label>검색정렬기준</label> 
				<select id="orderby" name="orderby" class="searchselect">
					<option value="" selected="selected">::: 기준선택 :::</option>
					<option value="name">상품명순</option>
					<option value="lowprice">낮은가격 순</option>
					<option value="highprice">높은가격 순</option>
				</select>
			</div>
			
			<div id="searchBtn">
		   		<a style="cursor:pointer"><img src="/Semi/images/searchpage_btn.jpg" onclick="goSearch();"></a>
		    </div>
		   
	  	</fieldset>
	  </form>
	  </div> 
  
	  <div class="searchResult">
        <p align="left">총 <strong>${totalCountSearch}</strong> 개 의 상품이 검색되었습니다.</p>
        <ul class="alignby">
			<li><a href="search.sa?category_no=${category_no}&search_condition=${search_condition}&search=${search}&minprice=${minprice}&maxprice=${maxprice}&orderby=name">상품명</a></li>
			<li><a href="search.sa?category_no=${category_no}&search_condition=${search_condition}&search=${search}&minprice=${minprice}&maxprice=${maxprice}&orderby=lowprice">낮은가격</a></li>
			<li><a href="search.sa?category_no=${category_no}&search_condition=${search_condition}&search=${search}&minprice=${minprice}&maxprice=${maxprice}&orderby=highprice">높은가격</a></li>
			<%-- <li><a href="#">사용후기</a></li> --%>
		</ul>
	</div>
	
	
	<c:if test="${empty searchList}"> 
		<div class="noData">
		   <ul>
		   	<li class="warning">검색결과가 없습니다.</li>
		   	<li class="waringBold">정확한 검색어 인지 확인하시고 다시 검색해 주세요.</li>
			<li>검색어/제외검색어의 입력이 정확한지 확인해 보세요.</li>
		    <li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</li>
		    <li>검색 옵션을 다시 확인해 보세요.</li>
		   </ul>
		</div>
	</c:if> 
  	
  	<c:if test="${not empty searchList}">
	  	<c:forEach var="searchList" items="${ searchList }">
  
  	<div class="col-sm-4">
  	  <a href="/Semi/product/detail.sa?prodcode=${ searchList.prodcode }&cateno=${ searchList.cateno }">
  	  <img src="/Semi/imgProd/${ searchList.prodimg }" class="prodImg" style="width:100%"/>
      </a>
      <div class="price">
      	<ul>
      		<li><a href = "/Semi/product/detail.sa?prodcode=${ searchList.prodcode }" class="listTitle">${ searchList.prodname }</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>${ searchList.price }WON</del></span></li>
      		<li><span class="discPrice">${ searchList.saleprice }WON</span></li>
      	</ul>
      </div>
    </div>
    
    </c:forEach>
      <div class="pagination">
		
		 ${requestScope.pageBar}
		
	  </div>
    </c:if>
    </div>
	 
    
	


</div>

<jsp:include page = "../footer.jsp" />