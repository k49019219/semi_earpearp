<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp" />

<style>

	/* ======= cart css ======= */

	header {
	
		margin-bottom: 50px;
	
	}
	
	div#cart {
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
		width: 85%;
		margin: 0 auto;
		text-align: center;
		padding-bottom: 15px;
	}
   
	#cartText{
		color : #00a0e2;
		font-weight: 900;
		position: relative;
		font-size: 20px;
		margin-top: 30px;
	}
	
	#cartText::after {
	
		margin : 0 47.7%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top: 23px;
	    width : 60px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
	.cartTab {
		 padding-top: 15px;
		 overflow: hidden;
		 margin-top: 25px;
		 padding-left: 0px;
		 border-bottom: solid 2px black;
	}
	
	.cartTab > ul {
		padding: 0;
	}
	
	.cartTabLink {
		float: left;
		outline: none;
		cursor: pointer;
		font-size: 16px;
		padding: 17px 70px 19px;
		font-weight: bold;
		list-style: none;
		border: solid 2px black;
		border-bottom : solid 3px black;
		margin-left: 0;
	}
   
    .cartTabContents {
    	margin: 40px 0px;
    }
    
    table#cartKorTable  {
    	text-align: center;
    	font-weight: bold;
    	border: solid 2px black;
    }
    
    table#cartKorTable > tr {
    	border: solid 2px black;
    }
    
    table#cartKorTable > tbody > tr {
    	height: 200px;
    }
    
    table#cartKorTable th {
    
    	font-size: 16px;
    }
    
    
    tr.cartKorROW > td > a {
    	cursor: pointer;
    }
    
    tr.cartKorROW > td > a > img {
    	margin: 5px 0;
    }
    
    div.countChange {
 		margin-top: 10px; 
 		padding-left:25px;    
 		padding-right: 10px;
    }     
    
    a.countChangebtn {
		    display: inline-block;
		    padding: 2px 8px;
		    border: 1px solid #d1d1d1;
		    border-radius: 2px;
		    font-family: "굴림",Gulim;
		    font-size: 12px;
		    line-height: 18px;
		    font-weight: normal;
		    color: #222;
	}
	
	a.countChangebtn:hover {
		background-color: #eee;
		cursor: pointer;
	}
	
	.qtychange { 
		float: left; 
		margin: 0;  
		width: 22; 
		height: 12.99;
	}
    
    .qtychange:hover {
    	cursor: pointer;
    }
    
    .qtyinput {
    	font-family: "돋움",Dotum;
    	border: 1px solid #ccc; 
    	border-right : hidden; 
    	width: 28.98px;
    	height: 26px; 
    	font-weight: normal; 
    	font-size: 12px; 
    	text-align:center; 
    	margin-bottom: 3px;
    	border-top-left-radius: 3px;
    	border-bottom-left-radius: 3px;
    }
  
    .cartMid {
    	width: 100%;
    	/* border: 1px solid #ccc;  */
        vertical-align: bottom;
        height: 290px;
    }
    
    #cartTable {
    	float: left;
    	width: 50%;
    	max-height: 400px;
    	border: 2px solid black;
    	border-top: 6px solid black;
    	font-weight: bold; 
    }
    
    #cartTable > tr,td {
    	text-align: left;	
    }
    
    .cartTblROW{
    	height: 5px;
    }
    
    .cartTbldata{
    	border: none; 
    	font-size: 14pt;
    	padding-left: 50px;
    }
    .cartTblRowTotal{
    	border-top: 2px solid black;
    }
    
    .cartTblPrice{
    	padding: 15px;
    	text-align: right;
    	font-weight: bold;
    	padding-right: 50px;
    }
    
    .cartTbldata > table > tr > td:first-child {
		width: 60%;
    }
    
    a#detail:hover {
    	cursor: pointer;
    }
	
	.cartRight {
    	float: right;
    	width: 35%;
    	padding-top: 60px;
    	text-align:right;
    	height: 200px;
    	
    }
	
	.cartLast {
		margin-bottom: 70px;
	}

	.smallTotal {
		padding-top: 12px;
	
	}

	/* =================================================== */
	
	#layer {	
		width: 300px;
		position: absolute;
		
	}

	#layer > div.header {
		border: solid 1px #707070;
		border-bottom: none;
		background-color: #495164;
		height: 30px;
		padding: 7px 20px 8px 20px;
	}
 
	span#title {
		font-size: 10pt;
		font-weight: bold;
	}
	
	a.close {
		float: right;
	}
	
	a.close:hover {
		cursor: pointer;
	}
	
	a.close > img {
		margin-bottom: 8px;
	}
	
	#layer > div.contents {
		border: solid 1px #707070;
		min-height: 90px;
		padding: 10px 20px 10px 20px;
		background: white;
	}
 
 	ul.detail{
 		clear: both;
 		font-size: 9pt;
 		color: #707070;
 		padding-left: 10px;
 	}
 	
 	.term {
 		font-weight: normal;
 	}
 	
 	.price{
 		float: right;
 	}
 	
 	/* =================================================== */
 	#cart .prodImg{
 		width: 130px;
 		height: 130px;
 		margin-right: 15px;
 	}
	
	.prodOption{  
		padding-top: 30px;
	}  
	
	#cart ul li {
		list-style-type: none;
		
	}
	  
	.listTitle {
	
		font-size: 11pt;
	}
	
</style>

<!-- ================================================================ -->

<script>

	$( document ).ready( function() {
		
		/* 
		$(".cartTabLink").click(function(){
			$(this).css('border-bottom','none');
			$(this).siblings().css('border-bottom','');
		});
		
		document.getElementById("cartDefaultOpen").click();
		  */
		
	//	 var quantity = parseInt('${cart.quantity}');
		  
	//	  console.log(quantity);
		  
		  // 수량?
	//	 $(".qtyinput").val(quantity);
		  
		  // == 장바구니 상품 개수에 따른 숫자 변경 == // 
	//	 $(".cartCount").html( $(".cartTabContents #cartTbody tr").length );
		
		  // == 장바구니가 비어 있을 때 == // 
		 if( $("#cartKorOrder #cartTbody tr").length < 1 ) {
			 $(".cartOnly").hide();
			 $(".cartLeft").hide();
		 }
			 
		 
		///////////////////////////////////////// 테이블 ///////////////////////////////////////////////
		
		 // == 체크박스 전체선택 / 전체해제 == // 
		 $("input:checkbox[id=allCheck]").click(function(){
	 
				var bool = $(this).prop("checked"); 
				
				$("input:checkbox[name=orderCheck]").prop("checked", bool);
		  });
	  
		 $("input:checkbox[name=orderCheck]").click(function(){
			 
			 var flag = false;
			 
			 var check = $(this).closest('tr').children("td").children(".sendCartno").val();
			 
	//		 console.log(check);
			 
			 $("input:checkbox[name=orderCheck]").each(function() {
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
		 
		 /////// 수량 변경 ///////
		 $(".qtychangeUp").click(function(){
			 var idx = $(".qtychangeUp").index(this);
			 var num = $(".qtyinput:eq(" + idx + ")").val();
			 num = $(".qtyinput:eq(" + idx + ")").val( parseInt(num)+1 );	
		 });
		 
		 $(".qtychangeDown").click(function(){
			 var idx = $(".qtychangeDown").index(this);
			 var num = $(".qtyinput:eq(" + idx + ")").val();
			 if ( num > 1) {
			 	num = $(".qtyinput:eq(" + idx + ")").val( parseInt(num)-1 );	
			 }
		 });
		 
		 
		 // 수량 변경 업데이트
		 $(".countChangebtn").click(function() {
			 
			 // 변경할 카트넘버
			 var cartno = $(this).closest('tr').children("td").children(".sendCartno").val();
		//	 console.log(cartno);
			 
			 // 변경할 수량
			 var updateQty = $(this).closest("td").children(".quantity").children(".qtyinput").val();
		//	 console.log(qty);
		
			 location.href = "/Semi/order/basketUpdate.sa?cartno="+cartno+"&updateQty="+updateQty; 
			
			 
		 });
		 
		///////////////////////////////////////// 제품 삭제 ///////////////////////////////////////////////
		 /////// DELETE 버튼 /////////
		 $(".deleteOne").click(function(){
			 var bool = confirm("선택하신 상품을 삭제하시겠습니까?");
			 if( bool ) {
				 
				 var cartno = $(this).closest('tr').children("td").children(".sendCartno").val();
				 console.log(cartno);
				 //$(this).closest('tr').remove();
			
			window.location.href = "/Semi/order/basketDelete.sa?cartno="+cartno;
				 
			 }	
			 
		 });
		 
		 /////// 선택상품 삭제 //////
		 $("#deleteSelect").click(function(){
		/*	
			 var cartnoArr = new Array();
			 
			 $("input:checkbox[name=orderCheck]").each(function() {
				 var bool = $(this).prop("checked");
				 
				 
				 if( bool ) {
					 
					 var cartno = $(this).closest('tr').children("td").children(".sendCartno").val();
				
					 cartnoArr.push(cartno);
					 
				 }
				 
				 
			 })
			 
			 console.log(cartnoArr);
			 
		*/	 
			 var flag = false;
			 $("input:checkbox[name=orderCheck]").each(function() {
				 var bool = $(this).prop("checked");
				 if( bool ) {
					 flag = true;
					 return;
				}
			 });
			 
			 if(!flag) { 
				 alert("선택된 상품이 없습니다.")
			 }
			 else {
				 
				 var bool = confirm("선택하신 상품을 삭제하시겠습니까?");
				 if( bool ) {
					 var cartnoArr = new Array();
					 $("input:checkbox[name=orderCheck]").each(function() {
						 var bool = $(this).prop("checked");
						 if( bool ) {
							 
							 var cartno = $(this).closest("tr").children("td").children(".sendCartno").val();
						
							 
							 cartnoArr.push(cartno);
							 
						 }
					 });
					 console.log(cartnoArr);
					 window.location.href = "/Semi/order/basketDelete.sa?cartno="+cartnoArr;
					 
				 }
			 } 
			 
		 
		 });
		 
		 /////// 모두 삭제 //////
		 $("#deleteAll").click(function(){
			 var bool = confirm("장바구니를 비우시겠습니까?");
			 if( bool ) {
			/*	  
				 $("#cartKorOrder").remove();
				 $(".cartOnly").hide();
				 $(".cartLeft").hide();
				  var html = "<p style='font-weight: bold; font-size: 13pt;'>장바구니가 비어있습니다.</p>";
				 $("#cartKorea").html(html);
				 $(".cartCount").html( 0 );
			*/	 
			var cartnoArr = new Array();
			 $("input:checkbox[name=orderCheck]").each(function() {
			
					 var cartno = $(this).closest('tr').children("td").children(".sendCartno").val();
					 cartnoArr.push(cartno);
					 
				});
				 
			  window.location.href = "/Semi/order/basketDelete.sa?cartno="+cartnoArr;
			 }
		 });
		 
		 ///////////////////////////////////////////////////////////////////////////////////////////////
		 
		 
		 /////////////////////////////////////// 영수증  /////////////////////////////////////////////////
		 
		 
		 var totalPrice = parseInt("${ totalPrice }");
		 
	//	 console.log(totalPrice);
			
		 var html = "";
		
		 if(totalPrice > 50000){
			 
			 html = "<span>무료<span>";
			 $("#Delivery1").text("0");
			 $("#Delivery2").text("0(무료)");
			 
			 
		 }
		 else {
			 html = "<span>2,500WON</span> <br/> 조건";
			 $("#Delivery1").text("2,500");
			 $("#Delivery2").text("2,500");
			 
			 totalPrice = totalPrice + 2500;
		 }
		 
		 $(".freeDlv").html(html);
		 
		 var str_total = totalPrice.toLocaleString('en');
		 
	//	 console.log(str_total);
		 
		 $(".totalPrice1").text(str_total);
		 
		 var salePrice = parseInt("${ discountPrice }");
		 
		 $(".salePrice").text(salePrice.toLocaleString('en'));
		 
		 var subTotal = parseInt("${ subTotal }");
		 
		 $(".subTotal").text(subTotal.toLocaleString('en'))
		 
	
		 ///////////////////////////////////////// 제품 주문 ///////////////////////////////////////////////
		 
		 /////// GO ORDER 버튼 /////////
		 $(".orderOne").click(function(){
			 var cartno = $(this).closest('tr').children("td").children(".sendCartno").val();
			 console.log(cartno);
			 
			 location.href = "/Semi/order/orderForm.sa?cartnoArr="+cartno+"&mode=${mode}";
				 
		 });
		 
		 /////// 선택상품 주문 //////
		 $("#orderSelect").click(function(){
		/*	
			 var cartnoArr = new Array();
			 
			 $("input:checkbox[name=orderCheck]").each(function() {
				 var bool = $(this).prop("checked");
				 
				 
				 if( bool ) {
					 
					 var cartno = $(this).closest('tr').children("td").children(".sendCartno").val();
				
					 cartnoArr.push(cartno);
					 
				 }
				 
				 
			 })
			 
			 console.log(cartnoArr);
			 
		*/	 
			 var flag = false;
			 $("input:checkbox[name=orderCheck]").each(function() {
				 var bool = $(this).prop("checked");
				 if( bool ) {
					 flag = true;
					 return;
				}
			 });
			 
			 if(!flag) { 
				 alert("선택된 상품이 없습니다.")
			 }
			 else {
				 
				 var bool = confirm("선택하신 상품을 주문하시겠습니까?");
				 if( bool ) {
					 var cartnoArr = new Array();
					 $("input:checkbox[name=orderCheck]").each(function() {
						 var bool = $(this).prop("checked");
						 if( bool ) {
							 
							 var cartno = $(this).closest('tr').children("td").children(".sendCartno").val();
						
							 cartnoArr.push(cartno);
							 
						 }
					 });
					 
					 window.location.href = "/Semi/order/orderForm.sa?cartnoArr="+cartnoArr+"&mode=${mode}";
					 
				 }
			 } 
			 
		 
		 });
		 
		 /////// 모두 주문 //////
		 $("#orderAll").click(function(){
			 var bool = confirm("모든 상품을 주문하시겠습니까?");
			 if( bool ) {
			/*	  
				 $("#cartKorOrder").remove();
				 $(".cartOnly").hide();
				 $(".cartLeft").hide();
				  var html = "<p style='font-weight: bold; font-size: 13pt;'>장바구니가 비어있습니다.</p>";
				 $("#cartKorea").html(html);
				 $(".cartCount").html( 0 );
			*/	 
			var cartnoArr = new Array();
			 $("input:checkbox[name=orderCheck]").each(function() {
			
					 var cartno = $(this).closest('tr').children("td").children(".sendCartno").val();
					 cartnoArr.push(cartno);
					 
				});
			  window.location.href = "/Semi/order/orderForm.sa?cartnoArr="+cartnoArr+"&mode=${mode}";
			 }
		 });
		 
		 
	
	}); // end of $(function() {});
	
      
   	function openCart(event, country) {
	   	 
		var i, tabcontent, tablinks;
	   	tabcontent = document.getElementsByClassName("cartTabContents");
	   	for (i = 0; i < tabcontent.length; i++) {
	   	   tabcontent[i].style.display = "none";
	     }
	   	
	  	tablinks = document.getElementsByClassName("cartTabLink");
	  	for (i = 0; i < tablinks.length; i++) {
	 	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	   	 }
	  	 document.getElementById(country).style.display = "block";
	   	 event.currentTarget.className += " active";
   	}
   	
   	// == 내역보기 클릭 == // 
   	function ViewLayer(){
   	  document.getElementById("layer").style.display='inline';
   	}

   	// == 내역보기 닫기 버튼 == // 
   	function myClose() {
   	  document.getElementById("layer").style.display = "none";    
	}
	
</script>	

<!-- ================================================================ -->

<div>

<div id="cart">
	<h3 id="cartText">CART</h3>
	
	<div class="cartTab">
	<ul>
		<li class="cartTabLink" id="cartDefaultOpen" onclick="openCart(event, 'cartKorea');">국내배송상품 (<span class="cartCount">${ sessionScope.cartCount }</span>)</li>
		<!-- <li class="cartTabLink" onclick="openCart(event, 'cartForeign');">해외배송상품 (<span id="cartCount">0</span>)</li>	 -->	
	</ul>
	</div>
	

	<div id="cartKorea" class="cartTabContents" style="min-height: 150px;">
	
		<c:if test="${ not empty cartList }">
		<form name="cartKorOrder" id="cartKorOrder" >
			<table id="cartKorTable" style="table-layout:fixed; width: 100%;">
				<colgroup>
					<col style="width: 60px;">
					<col style="width: auto;">
					<col style="width: 160px;">
					<col style="width: 110px;">
					<col style="width: 120px;">
					<col style="width: 120px;">
					<col style="width: 120px;">
					<col style="width: 160px;">
					<col style="width: 170px;">
				</colgroup>
				<thead style="font-size: 11pt;">
				<tr class="cartKorROW" style="height: 60px; border-top: solid 6px black; border-bottom: solid 2px black;">
					<th style="text-align: center;"><input type="checkbox" id="allCheck"/></th>
					<th style="text-align: left;" scope="col">ITEM &nbsp; (<span class="cartCount">${ sessionScope.cartCount }</span>)</th>
					<th style="text-align: center;" scope="col">PRICE</th>
					<th style="text-align: center;" scope="col">QUANTITY</th>
					<th style="text-align: center;" scope="col">POINT</th>
					<th style="text-align: center;" scope="col">배송구분</th>
					<th style="text-align: center;" scope="col">DELIVERY</th>
					<th style="text-align: center;" scope="col">TOTAL</th>
					<th style="text-align: center;" scope="col"></th>
				</tr>
				</thead>
				<tbody id="cartTbody" style="text-align: center;"> 
				
				
				<c:forEach var="cart" items="${ cartList }" >
						
				
				<tr class="cartKorROW" id="cartKorROW1" style="font-size: 11pt;">
					<td style="text-align: center;">
					<input type="checkbox" name="orderCheck"/>
					<input type = "hidden" style = "display: none;" class = "sendCartno" name = "cartno"  value = "${ cart.cartno }" />
					</td>
					<td>
						<div style="float: left;">
							<a href="/Semi/product/detail.sa?prodcode=${cart.prodcode }">
							<img class="prodImg" src="/Semi/imgProd/${ cart.prodimg }"/>
							</a>
						</div>
						<div class="prodOption">	
							<ul>
								<li style="font-size: 16px;"><a href="/Semi/product/detail.sa?prodcode=${cart.prodcode }" class="listTitle">${ cart.prodname }</a></li>
								<li style="font-size: 12px;">[ 옵션 : ${ cart.model } ]</li>
							</ul>
						</div>
						
					</td>
					<td style="text-align: center;">
						<span style="font-weight: normal; font-size: 16px;"><del><span class="OriginPrice"><fmt:formatNumber value="${ cart.price }" pattern="###,###" /></span>WON</del></span>
						<br/>
	      				<span class="discPrice" style="font-size: 16px;"><fmt:formatNumber value="${ cart.saleprice }" pattern="###,###" /></span>WON
					</td>	
					<td style="text-align: center;"> 
						<div class = "quantity" style="float: left; padding-left: 38px;"> 
							<input type="text" class="qtyinput" value="${cart.quantity}" size="2"/>
						</div>
						<div style="float: left; padding:0; width: 22px; max-height: 26px; margin-bottom: 5px;">
							<img class="qtychange qtychangeUp" src="http://img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" />
							<img class="qtychange qtychangeDown" src="http://img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" />
						</div> 
						<br/>  
						<div class="countChange"><a class="countChangebtn">변경</a></div> 
					</td>
					<td style="text-align: center; font-size: 16px; ">-</td>
					<td style="text-align: center; font-size: 16px;">기본배송</td>
					<td style="text-align: center; font-size: 16px;" class = "freeDlv"></td>
					<td style="text-align: center; font-size: 16px;">
						<span class="discPrice">
							<fmt:formatNumber value="${ cart.prodOneTotal }" pattern="###,###" />
						</span>WON
					</td>
					<td style="text-align: center;">
						<a class = "orderOne"><img src="http://earpearp.com/img/btn_cart_order.gif" /></a> <br/>
					    <a class ="deleteOne"><img src="http://earpearp.com/img/btn_cart_del.gif" /></a>				    
					</td>	
					
				</tr>
				
				</c:forEach>
				
				</tbody>
			</table>
		</form>	
		<p class = "smallTotal" style="text-align: right; font-weight: bold;">SUBTOTAL <span class="cartPrice2 subTotal" id="Subtotal2"></span>WON 
		   + DELIVERY <span class="cartPrice2" id="Delivery2"></span>WON 
		   - DISCOUNT <span class="cartPrice2 salePrice"></span>WON 
		   = TOTAL : <span class="cartPrice1 totalPrice1" style="font-size: 18px;"></span>WON
		</p>
		
		</c:if>
		
		
		<c:if test="${ empty cartList  }" >
		<div id="cartForeign" class="cartTabContents" style="min-height: 100px;">
		    <span style="font-weight: bold; font-size: 18px;">장바구니가 비어있습니다.</span>
		</div>
		</c:if>
		
	</div>
	
	

	
	
	<div class="cartMid">
		<div class="cartLeft">
					
			<div id="layer" style="display: none; z-index: 9999;">
			<div class="header">
					<span id="title" style="color: white; ">총 할인금액 상세내역</span>
					<a class="close" onclick="myClose();">
						<img src="http://img.echosting.cafe24.com/skin/base/common/btn_close.gif"/>
					</a>
				</div>
				
				<div class="contents">
					<p>
						<strong class="price" style="color: #008BCC; font-size: 16px;"><span class ="salePrice" ></span>WON</strong>
					</p>
					<br/>
					<hr style="border: none; border-top: 1px dotted #707070; margin: 0px 0 5px 0;"/>
					
					<ul class="detail">
						<li>
							<strong class="detail term" style="float: left;">기간할인</strong> 
							<span class="price discount"><span class ="salePrice" ></span>WON</span>
						</li>
					</ul>
				</div>
			
			</div>
			
		<table id="cartTable">
			<tr class="cartTblROW" style="height: 50px;"><td class="cartTbldata" colspan="2"></td></tr>
			<tr class="cartTblROW">
				<td class="cartTbldata">SUBTOTAL</td>
				<td class="cartTbldata cartTblPrice"><span class="cartPrice1 subTotal" id="Subtotal1"></span>WON</td>
			</tr>
			<tr class="cartTblROW">
				<td class="cartTbldata">DELIVERY</td>
				<td class="cartTbldata cartTblPrice">+&nbsp;<span class="cartPrice1" id="Delivery1"></span>WON</td>
			</tr>
			<tr class="cartTblROW">
				<td class="cartTbldata">SALE PRICE
					<a id="detail"><img id="cartPriceBtn" onclick="javascript:ViewLayer();" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif"/></a>
				</td>
				<td class="cartTbldata cartTblPrice">-&nbsp;<span class="cartPrice1 salePrice"></span>WON</td>
			</tr>
			<tr class="cartTblROW cartTblRowTotal">
				<td class="cartTbldata">TOTAL</td>
				<td class="cartTbldata cartTblPrice" style="font-size: 20pt;">
					<span class="cartPrice1 totalPrice1"></span>WON</td>
			</tr>
		</table>
		</div>
	
		<div class="cartRight">
			<a class="cartURL cartOnly" id="deleteSelect" href="">
			<img src="http://earpearp.com/img/order/btn_select_delete.gif" />
			</a>
			<br/>
			<a class="cartURL cartOnly" id="deleteAll" href="">
			<img src="http://earpearp.com/img/order/btn_delete_all.gif" />
			</a>
			<br/>
			<a class="cartURL" href="/Semi/mainPage.sa">
			<img src="http://earpearp.com/img/order/btn_shopping.gif" />
			</a>
			<br/>
			<a class="cartURL" id="orderSelect" href="#">
			<img src="http://earpearp.com/img/order/btn_select_order.gif" />
			</a>
			<br/>
			<a class="cartURL" id="orderAll" href="#" >
			<img style="width:330px;" src="http://earpearp.com/img/order/btn_total_order.gif" />
			</a>
		</div>  
	</div>
	
	<div class="cartLast">
		<img src="http://earpearp.com/img/order/operation_guide.gif" style="width: 100%;"/>
	</div>		  
</div>



</div>


<jsp:include page="../footer.jsp" />

<%-- 
	상품디테일 --> 회원아이디, 제품번호, 수량, 옵션 (맵)
	위시		--> 회원아이디, 제품번호, 옵션	(맵)
	
	장바구니에서 주문 ---->> 장바구니seq, 회원아이디, 제품번호, 수량, 옵션 
--%>
