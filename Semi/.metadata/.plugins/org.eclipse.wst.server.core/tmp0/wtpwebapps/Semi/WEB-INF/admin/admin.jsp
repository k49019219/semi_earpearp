<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp"/>

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
		margin-top : 3px;
        width: 135px;
        border-bottom: solid 3px #00a0e2;
	}
	
	div.mymenuDiv {
		margin-top: 42px;
	}
	
	ul.mymenuList {
		width: 100%;
		font-size: 20px;
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
		/* text-align: left;
		margin-top: 5.6%;
		margin-left: 28%; */
		text-align: center;
		margin: 13% 0;
		vertical-align: middle;
	}
	
	div.itemDesc a, span {
		display: block;
		color: black;
	}
	
	div.itemDesc span {
		font-size: 14px;
	}
	
	a.line {
		display: inline-block;
		width: 90%;
		border-top: solid 2px black;
		padding: 0 5px 0 5px;
		color: black;
	}
	
	.submitBtn {
		 	display: block;
		    box-sizing: border-box;
		    padding: 6px 10px;
		    border: 1px solid transparent;
		    border-radius: 2px;
		    font-size: 12px;
		    line-height: 18px;
		    text-align: center;
		    color: white;
		    background-color: #4a5164;
		    
	}
	
	.cancelBtn {
		
			/* margin-top : 10px; */
		    display: block;
		    box-sizing: border-box;
		    padding: 6px 10px;
		    border: 1px solid #d1d1d1;
		    border-radius: 2px;
		    font-size: 12px;
		    line-height: 18px;
		    text-align: center;
		    color: #222;
		    background-color: white;
		     
	}
	
	.pageNumber {
		
		font-size:16px; 
		font-weight:bold;
	}
	
	.pagination {
	  display: block;
	  text-align: center;
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

		$(".btnDeliverStart").click(function(){
			// 배송하기 버튼 클릭시
			
			var ordernum = $(this).closest("tr").children("td").children(".imbread").val();
			var prodcode = $(this).closest("tr").children("td:nth-child(4)").children("div:nth-child(2)").children(".improd").val();
			
			var bool = confirm("[ "+ordernum + " ] 배송시작");
			
			console.log(prodcode);
			
			if(bool){
		
				$.ajax({
					
					url : "/Semi/admin/deliverStart.sa",
					type : "POST",
					data : {"ordernum" : ordernum,
							"prodcode" : prodcode},
					success : function() {
						
						location.href = "javascript:history.go(0)";
						
					},error : function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
					
					
				});
			}
			
			
			
		});// end of $("#btnDeliverStart").click()------------------
	
		
		
		$(".btnDeliverEnd").click(function(){
			// 배송완료 버튼 클릭시
			
			
			var ordernum = $(this).closest("tr").children("td").children(".imbread").val();
			var bool = confirm("[ "+ordernum + " ] 배송완료");
			
			if(bool){
				
			//	console.log(ordernum);
				
			//	location.href = "/Semi/admin/deliverEnd.sa?ordernum="+ordernum;
				
				$.ajax({
					
					url : "/Semi/admin/deliverEnd.sa",
					type : "POST",
					data : {"ordernum" : ordernum },
					success : function() {
						
						location.href = "javascript:history.go(0)";
						
					},error : function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
					
					
				});
				
			}
			
			
		});// end of $("#btnDeliverEnd").click()------------------
	
		$(".orderdetail").click(function() {
			
			var ordernum = $(this).closest("tr").children("td").children(".imbread").val();
			var bool = alert("[ "+ordernum + " ] 주문 상세페이지로 이동합니다.");
			
			if(bool){
				
				console.log(ordernum);
				
		//		location.href = "/Semi/admin/orderDetail.sa?ordernum="+ordernum;
		
				$.ajax({
					
					url : "/Semi/admin/orderDetail.sa",
					type : "POST",
					data : {"ordernum" : ordernum },
					success : function() {
						
						location.href = "javascript:history.go(0)";
						
					},error : function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
					
					
				});
				
			}
			
			
		});
	
		
	});

</script>


<body>
	<div class="container">
		<div class="contents">
			<div class="titleArea">
				<h2 id="myPage">관리자 페이지</h2>
			</div>
			<div class="mymenuDiv">
				<ul class="mymenuList">
					<li><a href="/Semi/admin/admin.sa" style="color: red;">주문내역</a></li>
					<li><a href="/Semi/admin/memberList.sa">회원목록</a></li>
					<li><a href="/Semi/admin/addProd.sa">제품등록</a></li>
				</ul>
			</div>
			<div class="status">
				<div class="sttTitle">
					<h3>주문처리 현황</h3>
				</div>
				<div class="sttContents">
					<div class="orderDiv">
					<ul class="order">
						<li class="orderList">
							<span>결제완료</span>
							<a class="orderLink">${ strcnt1 }</a>
						</li>
						<li class="orderList">
							<span>배송준비중</span>
							<a class="orderLink">${ strcnt2 }</a>
						</li>
						<li class="orderList">
							<span>배송중</span>
							<a class="orderLink">${ strcnt3 }</a>
						</li>
						<li class="orderList">
							<span>배송완료</span>
							<a class="orderLink">${ strcnt4 }</a>
						</li>
					</ul>
					</div>
				</div>
			</div>
			
			<form name = "frmDeliver">
			
			<div class="myOrderDiv">
				<h3 class="myOrderTitle">ORDER</h3>
				<table class="myOrderTbl">
				<colgroup >
					<col style="width: 12%;">
					<col style="width: 11%;">
					<col style="width: 11%;">
					<col style="width: 25%;">
					<col style="width: 9%;">
					<col style="width: 10%;">
					<col style="width: 12%;">
					<col style="width: 12%;">
				</colgroup>
					<tr>
						<th>Order Number</th>
						<th>Order User</th>
						<th>Order Date</th>
						<th>Item</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Order Status</th>
						<th>Shipment</th>
					</tr>
					
					<c:if test="${ orderList != null }">
					<c:forEach var="order" items="${ orderList }" >
						<tr>
							<td class="number"><a class="line orderdetail " href="/Semi/admin/allOrderDetail.sa?ordernum=${ order.ordernum }&prodcode=${ order.prodcode }">[${ order.ordernum }]</a>
								<input class = "imbread" type = "hidden" name = "ordernum" value="${ order.ordernum }" />
							</td>
							<td class="fontTbl">${ order.name }
								<input type = "hidden" name = "userid" value="${ order.userid }" />
							</td>
							<td class="fontTbl">${ order.orderdate }</td>
							<td class="fontTbl" style = "padding : 10px">
							<div class="itemImg">
							<a href="/Semi/admin/allOrderDetail.sa?ordernum=${ order.ordernum }&prodcode=${ order.prodcode }"><img src="/Semi/imgProd/${ order.prodimg }" style="width: 100px;"/></a>
							</div>
							<div class="itemDesc fontTbl">
							<a style = "display : block;" href="/Semi/admin/allOrderDetail.sa?ordernum=${ order.ordernum }&prodcode=${ order.prodcode }"> ${ order.prodname } 
								<c:if test="${ order.quantity != 1 }" >
								<span style = "display : inline-block; width : 10px" > 외  </span>
								</c:if>
							</a>
								<input class = "improd" type = "hidden" name = "prodcode" value="${ order.prodcode }" />
							</div>
							</td>
							<td class="fontTbl">${ order.quantity }</td>
							<td class="fontTbl"><fmt:formatNumber pattern="###,###" value="${ order.totalprice }"  />WON</td>
							<td class="fontTbl orderstatus ">${ order.orderstatus }
								<input type = "hidden" name = "orderstatus" value="${ order.orderstatus }" />
							</td>
							
							<td class="fontTbl" align = "center" >
						  		<c:if test="${ order.orderstatus == '결제완료' }">
						  		<button class =  "btnDeliverStart submitBtn" type = "button" >배송시작</button>
						  		</c:if>
						  		<c:if test="${ order.orderstatus == '배송중' }">
						  		<button class =  "btnDeliverEnd cancelBtn" type = "button">배송완료</button>
						  		</c:if>	
							</td>
							
						</tr>
					</c:forEach>
					</c:if>
				</table>
			</div>
			
			</form>
		
		<div class="pagination">  
	
			${pageBar}
		
	 	</div>
			
		</div>
		
	</div>
</body>

<jsp:include page="../footer.jsp"/>