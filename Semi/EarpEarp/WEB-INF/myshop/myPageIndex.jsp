<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>
<!DOCTYPE html>

<style type="text/css">

	body {
      font-family: 'Open Sans', NanumGothic,'Malgun Gothic', Dotum,sans-serif;
      }
      
    ul {
    	list-style-type: none;
    	padding: 0px;
    	display: inline-block;
		width: 100%;
    }

	a{
		cursor: pointer;
	}
	
	div.container {
		display: inline-block;
		width: 100%;
		height: 100%;
		text-align: center;
	}
	
	div.contents {
		margin: 0 auto;
		width: 86.7%;
	}
	
	h2#myPage {
		display: inline-block;
	    letter-spacing: .3px;
	    color: #00a0e2;
	    font-weight: 900;
	    font-size: 20px;
	    margin-top: 15px;
	}
	
	h2#myPage:after {
		content: "";
        display: block;
        width: 94px;
        border-bottom: solid 3px #00a0e2;
	}
	
	div.mymenuDiv {
		margin-top: 42px;
	}
	
	ul.mymenuList {
		width: 100%;
		font-size: 22px;
    	font-weight: bold;
	}
	
	ul.mymenuList:after {
		content: "";
        display: block;
        width: 100%;
        border-bottom: solid 2px black;
        margin: 0 auto;
        position: relative;
        top: 7px;
	}
	
	ul.mymenuList li {
    	padding-left: 0px;
    	margin: 0 30px 0 30px;
    	display: inline-block;
	}
	
	ul.mymenuList > li > a {
		color: black;
	}
	
	ul.mymenuList > li > a.myLink:hover {
		color: red;
	}
	
	div.description {
		margin-top: 30px;
		font-size: 17px;
		text-align: left;
	}
	
	div.status {
		border: solid 2px black;
		border-top: solid 6px black;
		display: inline-block;
		width: 100%;
		margin-top: 20px;
	}

	div.sttTitle {
		padding-top: 10px;
	}
	
	div.sttTitle h3{
		display: inline-block;
		font-size: 18px;
		font-weight: bold;
	}
	
	div.sttTitle span{
		font-size: 18px;
	}
	
	div.sttContents {
		display: inline-block;
		width: 100%;
		padding: 40px 0px 20px 0px;
	}
	
	li.orderList {
		display: inline-block;
		font-size: 17px;
		font-weight: bold;
		width: 20%;
		margin: 0px 25px 0px 25px;
	}
	
	a.orderLink{
		display: block;
		margin-top: 22px;
		font-weight: bold;
    	font-size: 21px;
    	color: #00a0e2;
	}
	
	ul.CS {
		display: inline-block;
		font-size: 16px;
	}
	
	div.orderDiv {
		display: inline-block;
		width: 80%;
	}
	
	div.csDiv {
		display: inline-block;
		width: 19%;
		position: relative;
		top: 5px; 
		font-weight: bold;
	}
	
	span.icoDot {
    display: inline-block;
    width: 2px;
    height: 2px;
    margin: 8px 6px 0 0;
    background: #4d4d4d;
    vertical-align: top;
	}
	
	li.orderCS {
		margin: 5px;
	}
	
	div.myOrder {
		border: solid 1px green;
	}
	
	h3.myOrderTitle {
		font-size: 25px;
		font-weight: bold;
		display: block;
		text-align: left;
		margin-top: 50px;
	}
	
	table.myOrderTbl {
		width: 100%;
		margin-top: 30px;
	}
	
	table.myOrderTbl th {
		text-align: center;
		font-size: 19px;
		border-bottom: solid 1px black;
		padding-bottom: 8px;
	}
	
	table.myOrderTbl td {
		height: 185px;
	}
	
	table.myOrderTbl td.fontTbl {
		font-size: 18px;
		font-weight: bold;
		color: black;
	}
	
	td.number {
		font-size: 12px;
		font-weight: bold;
	}
	
	div.itemImg {
		display: inline-block;
		float: left;
	}
	
	div.itemDesc {
		text-align: left;
		margin-top: 5.6%;
		margin-left: 28%;
	}
	
	div.itemDesc a, span {
		display: block;
		color: black;
	}
	
	div.itemDesc span {
		font-size: 12px;
	}
	
	a.line {
		display: inline-block;
		width: 90%;
		border-top: solid 2px black;
		padding: 0 5px 0 5px;
		color: black;
	}
	
	
	/* ==== Paging bar css ==== */
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
	
	.writeBtn {
	cursor : pointer;
	}
</style>

<body>
	<div class="container">
		<div class="contents">
			<div class="titleArea">
				<h2 id="myPage">MY PAGE</h2>
			</div>
			<div class="mymenuDiv">
				<ul class="mymenuList">
					<li><a href="/Semi/myshop/myPageIndex.sa" style="color: red;">my</a></li>
					<li><a href="/Semi/myshop/order/list.sa">order</a></li>
					<li><a href="/Semi/member/modify.sa">profile</a></li>
					<li><a href="/Semi/myshop/mileage/historyList.sa">mileage</a></li>
					<li><a href="/Semi/myshop/boardList.sa">board</a></li>
					<li><a href="/Semi/myshop/wishList.sa">wishlist</a></li>
					<li><a href="/Semi/myshop/addr/list.sa">address</a></li>
				</ul>
			</div>
			<div class="status">
				<div class="sttTitle">
					<h3>${sessionScope.loginUser.name} 님의 주문처리 현황</h3>
					<span>(최근 3개월 기준)</span>
				</div>
				<div class="sttContents">
					<div class="orderDiv">
					<ul class="order">
						<li class="orderList">
							<span>결제완료</span>
							<a class="orderLink" href="/Semi/myshop/order/list.sa?startDate=&endDate=%5Bobject%20HTMLInputElement%5D&status=결제완료">${NumByOrderStatus.finishOrder}</a>
						</li>
						<li class="orderList">
							<span>배송준비중</span>
							<a class="orderLink" href="/Semi/myshop/order/list.sa?startDate=&endDate=%5Bobject%20HTMLInputElement%5D&status=배송준비중">${NumByOrderStatus.preparingShipping}</a>
						</li>
						<li class="orderList">
							<span>배송중</span>
							<a class="orderLink" href="/Semi/myshop/order/list.sa?startDate=&endDate=%5Bobject%20HTMLInputElement%5D&status=배송중">${NumByOrderStatus.OnShipping}</a>
						</li>
						<li class="orderList">
							<span>배송완료</span>
							<a class="orderLink" href="/Semi/myshop/order/list.sa?startDate=&endDate=%5Bobject%20HTMLInputElement%5D&status=배송완료">${NumByOrderStatus.done}</a>
						</li>
					</ul>
					</div>
					<div class="csDiv">
					<ul class="CS">
						<li class="orderCS"><span class="icoDot"></span>취소 : &nbsp; 0</li>
						<li class="orderCS"><span class="icoDot"></span>교환 : &nbsp; 0</li>
						<li class="orderCS"><span class="icoDot"></span>반품 : &nbsp; 0</li>
					</ul>
					</div>
				</div>
			</div>
			<div class="myOrderDiv">
				<h3 class="myOrderTitle">MY ORDER</h3>
				
				<table class="myOrderTbl">
				<colgroup >
					<col style="width: 12%;">
					<col style="width: 12%;">
					<col style="width: 30%;">
					<col style="width: 12%;">
					<col style="width: 12%;">
					<col style="width: 12%;">
					<col style="width: 12%;">
				</colgroup>
					<tr>
						<th>Order Number</th>
						<th>Order Date</th>
						<th>Item</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Order Status</th>
						<th>취소/교환/반품</th>
					</tr>
					<c:if test="${orderDetailList != null}">
						<c:forEach var="order" items="${orderDetailList}" varStatus="status">
							<tr>
								<td class="number">
									<a class="line" href="/Semi/myshop/order/detail.sa?prodcode=${order.prodcode}&ordernum=${order.ordernum}">
									[${order.ordernum}]</a>
								</td>
								<td class="fontTbl">${order.orderdate}</td>
								<td class="fontTbl">
								<div class="itemImg" >
								<a href="/Semi/product/detail.sa?prodcode=${order.prodcode}&cateno=${order.cateno}">
								<img src="/Semi/imgProd/${order.prodimg}" alt="주문한상품이미지" style="width: 100px;"/></a>
								</div>
								<div class="itemDesc fontTbl" >
								<a href="/Semi/product/detail.sa?prodcode=${order.prodcode}&cateno=${order.cateno}">
									${order.prodname}
								</a>
								<span>[옵션: ${order.model}]</span>
								</div>
								</td>
								<td class="fontTbl">${order.quantity}</td>
								<%-- 주문 상세 페이지에 들어가기 전에는 원래 가격만 보인다. --%>
								<td class="fontTbl"><span>${order.price}</span> WON</td>
								<td class="fontTbl">${order.orderstatus}
									<c:if test="${order.orderstatus == '배송완료'}">
										<br/><br/><a class="writeBtn" href="/Semi/board/product/write.sa?boardNo=3&prodcode=${order.prodcode}"><img src="/Semi/images/btn_write.gif" alt="리뷰작성하기" style="width: 100px;"/></a>
									</c:if>
								</td>
								<td class="fontTbl">-</td>
							</tr>
						</c:forEach>
					</c:if>
					
					<c:if test="${orderDetailList == null}">
						<tr>
							<td colspan="7" style="text-align:center; font-size:12pt; padding: 20px 0; font-weight:bold;">주문 내역이 없습니다</td>
						</tr>
					</c:if>
				</table>
				
				<div class="pagination">
				${pageBar}
				</div>
			
			</div>
		</div>
		

	</div>
	
</body>

<jsp:include page="../footer.jsp"/>