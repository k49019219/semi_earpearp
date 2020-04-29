<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp"/>

<style type="text/css">
/* 기본 */
body {
   font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
}

ul {
	padding: 0;
}

li {
	list-style-type: none;
}


/* 기본 구조 div */
.container {
	width: 86.85%;
}

.headCategory {
	display: inline-block;
	width: 100%;
	color: #00a0e2;
}

.infoArea {
	display: inline-block;
	width: 100%;
	padding-bottom: 30px;
	margin-top: 20px;
}

.imgInfo {
	display: inline-block;
	width: 46%;
	float: left;
}

.detailInfo {
	display: inline-block;
	width: 46%;
	float: right;
}

.detailArea {
	border-top: solid 2px black;
	border-bottom: solid 2px black;
}

/* 이미지 보여주기 */
.keyImg {
	border: solid 2px black;
	border-top: solid 8px black;
}

.keyImg img {
    width: 100%;
    height: auto;
}

.listImg img {
    width: 75px;
    height: 75px;
    border: 1px solid #ececec;
	margin-top: 30px;
}

/* 오른쪽 디테일 */

.detailTbl {
	width: 100%;
}

.detailTbl td {
	padding-bottom: 20px;
	padding-left: 10px;
}

.detailTbl h2 {
	font-size: 30px;
    font-weight: 900;
    color: #ff3000;
    padding: 0px;
    margin: 0px;
}

.bold {
	font-weight: bold;
}

/* select */
.selectTbl {
	border-top: solid 2px black;
	border-bottom: solid 2px black;
	width: 100%;
	padding: 10px;
}

.selectTbl th, .selectTbl td {
	padding: 20px 10px;
}

#product_option_id {
	border: solid 2px black;
	font-weight: bold;
	margin-top: 10px;
	padding: 15px 10px;
	width: 100%;
}

div.total {
	font-size: 20px;
	font-weight: bold;
	padding: 40px 10px;
}

/* wish, cart, buy */

div.linkImg a {
	padding: 0px;
}

.btn {
	margin-right: 9px;
}

/* detail menu */

.detail_menu {
	width: 100%;
	padding-top: 20px;
	text-align: center;
}

.detail_menu li {
	display: inline-block;
	font-size: 18px;
	font-weight: 600;
	margin-right: 50px;
}

ul.detail_menu li.selected > a {
 color:#00a0e2;
 border-bottom: solid 4px #00a0e2; 
 text-decoration:none;
}

ul.detail_menu li > a {
 color:black; 
 text-decoration:none;
}


/* checkup */

.buy_product_info {
	margin: 80px 0 38px;
	text-align: center;
}

.buy_product_info h3 {
    font-size: 40px ;
    font-weight: 900;
    color: #ff3000 ;
    margin-bottom: 50px;
}

.buy_product_info p {
    font-size: 14px;
    color: #000;
    line-height: 24px;
    font-weight: 600;
}


/* board */

.board {
    margin: 60px 0 100px 0;
    border: 2px solid #000;
    font-weight: bold;
    line-height: 39px;
    text-align: center;
    font-size: 16px;
    color: #000;
}

.board_bottom{
    float: right;
}

/* 옵션 선택 테이블 */

table.optionTbl {
	border-bottom: solid 2px black;
	width: 100%;
}

table.optionTbl td {
	padding: 20px 0 10px 0;
}

p.product {
	font-size: 12px;
	font-weight: bold;
}

input.optionText {
	border: none;
	font-weight: normal;
    color: #757575;
}

span.quantity input {
	width: 24px;
	height: 24px;
}

td.right {
	text-align: right;
	font-size: 18px;
    font-weight: bold;
}

input#spinner {
	height: 16px;
}

a.delete {
	margin-left: 10px;
}

/* 게시판 */
.container .board_paginate {
	margin: 20px 0 20px 0;
	text-align: center;
}

.container .board_paginate ul {
	display: inline-block;
  	margin: 0 17px 0 17px;
    padding: 0;
}

.container .board_paginate li {
	display: inline-block;
}

.container .board_paginate li span, #wrap_commu .board_paginate li a {
	display: block;
    width: 31px;
    padding: 7px 0 6px;
    box-sizing: border-box;
    font-size: 16px;
    color: #000;
    font-weight: bold;
    line-height: 14px;
}

.container .board_paginate .this {
	border: 2px solid #000000;
}

.container .basic_table .qnaListForProd {
	border: solid 2px #000000;
	border-top-width: 6px;
	border-collapse: collapse;
	width: 100%;
	margin-top: 60px;
}

.container .basic_table th {
	font-size: 12pt;
}

.container .basic_table th, .container .basic_table td {
	height: 50px;
   	border: 2px solid #000;
    padding: 14px 5px;
    box-sizing: border-box;
    line-height: 1.2;
    vertical-align: middle;
    text-align: center;
}

.container .basic_table td {
	color: #000000;
}

.container .basic_table a {
	text-align: left;
	text-decoration: none;
	color: #000000;
}

.container .basic_table a:hover {
	text-decoration: underline;
}

.container .basic_table .qnaListForProd button {
	 border: solid 1px #d9d9d9; 
	 padding: 5px 8px 5px 8px;  
	 background-color: white;
	 margin-right: 5px;
}

</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
<script type="text/javascript" >

$(function() {
	
	$(".checkBoard").hide();
	
	// option 선택 시 table, spinner 생성하고
	// spinner 선택 시 각각의 price와 total price 나타냄
	$("#product_option_id").each(function(index){
			$('#product_option_id').on('change', function() {
				
				// 옵션을 선택할 때마다 테이블(tr)을 추가한다.
				// input(spinner)와 각각의 가격을 보여주는 span(price)은 for each문을 통해 0부터 id를 가진다.
				$(".optionTbl").css("display", "");
				
				var sel = $('#product_option_id option:selected').val();
				var html = "";
			
				html += "<tr class='option_product'>";
				html += "<td>";
				html += "<input type='hidden' class='option_box_id' id='option_box_id"+index+"' name='prodcode"+index+"' value='${pvo.prodcode}' />";
				html += "<p class='product'>${pvo.prodname}<br> ";
				html += "- <input type='text' class='optionText' name='model"+index+"' value='"+sel+"' style='border: none;'/></p>";
				html += "</td>";
				html += "<td>";
				html += "<span class='quantity' style='width: 65px;'>";
				html += "</td>";
				html += "<td>";
				html += "<span class='quantity' style='width: 65px;'>";
				html += "<input type='text' class='spinner' id='spinner"+index+"' name='oqty"+index+"' value='1'/>";
				html += "</span>";
				html += "<a class='delete' style='cursor: pointer'><img src='//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif'></a>";
				html += "</td>";
				html += "<td class='right'>"; 
				html += "<span class='price' id='option_box_price"+index+"'><fmt:formatNumber value='${category.price}' pattern='###,###'/></span>WON";	
				html += "</td>";
				html += "</tr>";
				
				$(".optionTbl").append(html);
				 
				sum();
				
				var length = $(".spinner").length;
				$("#spinLen").val(length);
				
				
				
				// input(spinner)마다 spinner를 생성한다.
				var value = 0;
				var totalPrice = 0;
				$('#spinner'+index).spinner({
					spin : function(event, ui) {
						if (ui.value > 999) {
							alert("최대 주문수량을 초과하였습니다.");
							$(this).spinner("value", 999);
							return false;
						} else if (ui.value < 1) {
							$(this).spinner("value", 1);
							alert("최소 주문수량은 1개 입니다.");
							return false;
						}
						// 스피너를 증가, 감소할 때마다 price를 보여준다.
						var price = ui.value * '${category.price}';
						$(this).closest("td").next().children("span").html(price.toLocaleString('en'));
					}
				
				}); // spinner	
				
				// delete 이미지 클릭 시 해당 tr 삭제
	            $(".delete").bind("click",function(){
	               $(this).closest("tr").html("");
	            }); // delete click
	            
	           
	            
				index = index +1;
			}); // select 선택 시 change
			
	}); // for each
	
	// 스피너를 증가, 감소할 때마다 총 금액과 count 보여짐
	$(document).bind("spinstop", ".spinner", function(){
		sum();
	});
	
	

}); // function

function sum() {
	
	var sumCnt = 0;
	var sumPrice = 0;
	for(var i=0; i<$(".spinner").length; i++) {
		var index = "#spinner"+i;
		var cnt = $(index).val();
			
		sumCnt += parseInt(cnt);
		sumPrice = sumCnt * ${category.saleprice};
		
	}
	
	$("#count").text(sumCnt);
	$("#totalPrice").html(sumPrice.toLocaleString('en'));
}


function goCart() {

	$("#mode").val("0");
	
	var frm = document.wishCartFrm;

	if( $("#spinLen").val()=="" ) {
		alert("먼저 상품을 선택해 주세요.");	
	}
	else {
		frm.action = "/Semi/order/addBasket.sa";
		frm.method = "POST";
		frm.submit();
	}
}

function goWish() {
	var frm = document.wishCartFrm;

	if( $("#spinLen").val()=="" ) {
		alert("먼저 상품을 선택해 주세요.");	
	}
	else {
		frm.action = "/Semi/myshop/wishAdd.sa";
		frm.method = "POST";
		frm.submit();
	}
}

/* ===== board ===== */

function goWrite(prodcode){
	
	var loginuser = ${sessionScope.loginUser != null}
	
	if(!loginuser){
		alert("로그인을 먼저 진행해주세요 :)");
	}
	else {
		location.href="/Semi/board/product/write.sa?boardNo=2&prodcode="+prodcode;
	}
}

// 사용자 글 수정
function goEditAnswer(bidx){
	location.href="/Semi/board/product/write.sa?boardNo=2&idx="+bidx;
}

// 사용자 게시글 클릭 시 비밀번호 확인 창 (status.count, loginuserId)
function openCheckPwd(idx,userid){
	
	var loginuserID = '${sessionScope.loginUser.userid}';
	var loginuserStatus = '${sessionScope.loginUser.status}';
	
	if(loginuserID == userid || loginuserStatus == '4'){
		$("#check"+idx).toggle();
		$(".checkBoard").not($("#check"+idx)).hide();
		
		if(loginuserStatus == '4'){
			$("#onlyAdmin"+idx).html("<span style='color:red;'>[관리자전용알림]</span> 확인 클릭 시 내용 열람 가능");
		}
	}
	else {
		alert("비밀글은 작성자만 조회 및 수정 가능합니다. \n먼저 로그인을 진행해주세요 :)");
		return false;
	}
	
}

// 관리자 또는 일반 회원에 따른 게시글 조정 
function goCheckPwd(pwd,idx,bidx,bcon){
	
	var userStatus = '${sessionScope.loginUser.status}';
	
	if(userStatus != '4'){
	
		if( $("#qnaPwd"+idx).val().trim() == "" ){
			alert("비밀번호를 입력해주세요 !");
			$("#qnaPwd"+idx).focus();
			return false;
		}
		
		var regExp = /^[0-9]{4}$/;
		
		var bool = regExp.test($("#qnaPwd"+idx).val().trim());
		if(!bool){
			alert("비밀번호는 숫자 4자리로만 작성해주세요 :)");
			return false;
		}
		else{
			if(pwd == $("#qnaPwd"+idx).val()){
				$("#check"+idx).html("<td colspan='4'><div class='conArea' style='margin: 10px;'>"+bcon+"</div>"
									+"<div style='display: block; float: right;'>"
									+"<button type='button' onclick='goEditAnswer("+bidx+");'>수정</button>"
									+"<button type='button' onclick='goDelete("+bidx+");'>삭제</button>"
									+"</div></td>");
			}
			else {
				alert("비밀번호를 다시 확인해주세요 :(");
				$("#qnaPwd"+idx).val("");
				$("#qnaPwd"+idx).focus();
			}
			
		}
	} // end of if---------------------
	else if(userStatus == '4'){
		$("#check"+idx).html("<td colspan='4'><div class='conArea' style='margin: 10px;'>"+bcon+"</div>"
							+"<div style='display: block; float: right;'>"
							+"<button type='button' onclick='goEditAnswer("+bidx+");'>답변</button>"
							+"</div></td>");
	}
	
}

function goDelete(bidx){
	
	if (confirm("정말로 삭제하시겠습니까?") == true){
		location.href="/Semi/board/product/deletePost.sa?boardNo=2&idx="+bidx;
	}
	else {
	     return false;
	}
}

function openAnswer(userid,idx){
	
	var loginuserID = "${sessionScope.loginUser.userid}";
	var loginuserStatus = "${sessionScope.loginUser.status}";
	
	if(loginuserID == userid || loginuserStatus == "4" ){
		$("#answer"+idx).toggle();
	}
	else {
		alert("질문자만 해당 답변 조회가 가능합니다. :-)");
	}
}

function onlyEditAnswer(qnaidx){
	location.href="/Semi/board/product/write.sa?boardNo=2&idx="+qnaidx+"&check=Adm";
}
</script>

<body>
	<!-- 
		바로주문: prodcode, qty, model, cateno, prodname, prodimg, price, saleprice, spinnerLength
		장바구니, 위시: 제품코드, 옵션, 수량, spinnerLength 
	-->
	
	<div class="container">
		<div class="headCategory">
			<span class="bold">홈 / SHOP / CASE / ${category.catename} CASE / ${category.catename}</span>
		</div>
		
		<div class="infoArea">
			<div class="imgInfo">
				<div class="keyImg"><img src="/Semi/imgProd/${pvo.prodimg}" class="BigImage"/></div>
				<div class="listImg"><img src="/Semi/imgProd/${pvo.prodimg}" class="ThumbImage"/></div>
			</div>
			<div class="detailInfo">
					<div class="detailDiv">
						<table class="detailTbl">
							<colgroup>
								<col style="width: 30%;">
								<col style="width: 70%;">
							</colgroup>
						
							<tr>
								<td colspan="2"><h2>${pvo.prodname}</h2></td>
							</tr>
							
							<tr>
								<td><span class="bold">Sale info</span></td>
								<td><span class="bold">기간한정세일 12.06-12.12</span></td>
							</tr>
							
							<tr>
								<td><span class="bold">Price</span></td>
								<td><span><del><fmt:formatNumber value="${category.price}" pattern="###,###"/>WON</del></span></td>
							</tr>
							
							<tr>
								<td><span class="bold">Sale price</span></td>
								<td><span class="bold"><fmt:formatNumber value="${category.saleprice}" pattern="###,###"/>WON</span></td>
							</tr>
							
							<tr>
								<td><span class="bold">Made in</span></td>
								<td><span>대한민국</span></td>
							</tr>
							
							<tr>
								<td><span class="bold">Brand</span></td>
								<td><span>earpearp</span></td>
							</tr>
						</table>
					</div>
					
					
					<div class="selectDiv">
						<table class="selectTbl">
						<colgroup>
							<col style="width: 30%;">
							<col style="width: 70%;">
						</colgroup>
						<tr id="devicetype">
						<th>기종</th>
						<td><select name="option" id="product_option_id" class="ProductOption">
						<option value="*" disabled selected>- [필수] 옵션을 선택해 주세요 -</option>
						<option value="**" disabled>-------------------</option>
						<option value="IPHONE 5_5S_SE">IPHONE
							5_5S_SE</option>
						<option value="IPHONE 6_6S" >IPHONE 6_6S</option>
						<option value="IPHONE 6+_6S+">IPHONE
							6+_6S+</option>
						<option value="IPHONE 7_8" >IPHONE 7_8</option>
						<option value="IPHONE 7+_8+" >IPHONE
							7+_8+</option>
						<option value="IPHONE X_XS" >IPHONE X_XS</option>
						<option value="IPHONE XR" >IPHONE XR</option>
						<option value="IPHONE XMAX" >IPHONE XMAX</option>
						<option value="IPHONE 11" >IPHONE 11</option>
						<option value="IPHONE 11 pro" >IPHONE 11
							pro</option>
						<option value="IPHONE 11 pro max" >IPHONE
							11 pro max</option>
						<option value="GALAXY S5" >GALAXY S5</option>
						<option value="GALAXY S6" >GALAXY S6</option>
						<option value="GALAXY S6edge" >GALAXY
							S6edge</option>
						<option value="GALAXY S6edge+" >GALAXY
							S6edge+</option>
						<option value="GALAXY S7" >GALAXY S7</option>
						<option value="GALAXY S7edge" >GALAXY
							S7edge</option>
						<option value="GALAXY S8" >GALAXY S8</option>
						<option value="GALAXY S8+" >GALAXY S8+</option>
						<option value="GALAXY S9" >GALAXY S9</option>
						<option value="GALAXY S9+" >GALAXY S9+</option>
						<option value="GALAXY S10" >GALAXY S10</option>
						<option value="GALAXY S10+" >GALAXY S10+</option>
						<option value="GALAXY S10E" >GALAXY S10E</option>
						<option value="GALAXY note3" >GALAXY
							note3</option>
						<option value="GALAXY note4" >GALAXY
							note4</option>
						<option value="GALAXY note5" >GALAXY
							note5</option>
						<option value="GALAXY note7_FE" >GALAXY
							note7_FE</option>
						<option value="GALAXY note8" >GALAXY
							note8</option>
						<option value="GALAXY note9" >GALAXY
							note9</option>
						<option value="GALAXY note10" >GALAXY
							note10</option>
						<option value="GALAXY note10 pro" >GALAXY
							note10 pro</option>
						<option value="GALAXY alpha" >GALAXY
							alpha</option>
						<option value="GALAXY A5(2015)" >GALAXY
							A5(2015)</option>
						<option value="GALAXY A7(2015)" >GALAXY
							A7(2015)</option>
						<option value="GALAXY A5(2016)" >GALAXY
							A5(2016)</option>
						<option value="GALAXY A7(2016)" >GALAXY
							A7(2016)</option>
						<option value="GALAXY A7(2018)" >GALAXY
							A7(2018)</option>
						<option value="GALAXY A8(2015)" >GALAXY
							A8(2015)</option>
						<option value="GALAXY A8(2018)" >GALAXY
							A8(2018)</option>
						<option value="GALAXY s10 5g" >GALAXY s10
							5g</option>
						<option value="LG-G3" >LG-G3</option>
						<option value="LG-G4" >LG-G4</option>
						<option value="LG-G5" >LG-G5</option>
						<option value="LG-G6" >LG-G6</option>
						<option value="LG-G7" >LG-G7</option>
						<option value="LG-V10" >LG-V10</option>
						<option value="LG-V20" >LG-V20</option>
						<option value="LG-V30" >LG-V30</option>
						<option value="LG-V40" >LG-V40</option></select>
						<p class="value"></p></td>
					</tr>
						</table>
					<form name="wishCartFrm">
						<div class="tableDisplay">
							<table class='optionTbl' style="display: none">
				 			<colgroup>
				 			<col style='width: 40%'>
				 			<col style='width: 30%'>
				 			<col style='width: 30%'>
				 			</colgroup>
						
							</table>
						</div>
						<div class="total">
							<span>TOTAL PRICE (count): </span>
							<span style="float: right;">
								<span id="totalPrice">0</span>WON
								(<span id="count">0</span>개)
							</span>
							
							
							<input type="hidden" id="spinLen" name="length" value="" />
							<input type="hidden" id="mode" name="mode" value="" />
						</div>
					
						<div class="linkImg" style="float: right;">
							
	                		<img src="/Semi/images/btn_cart.png" alt="장바구니 담기" onclick="goCart();" style="cursor: pointer;">
	                		<img src="/Semi/images/btn_wish.gif" alt="관심상품 등록" onclick="goWish();" style="margin-left:10px; cursor: pointer;">
						</div>
					</form>
					</div>
			
			</div>
		</div>
		
		<div class="detailArea" id="prdDetail">
			<div class="detailMenu">
				<ul class="detail_menu" style="padding-bottom:5px;">
					<li class="selected">
						<a href="#prdDetail">DETAIL INFO</a>
					</li>
		
		            <li>
		            	<a href="#prdInfo">CHECK UP</a>
		            </li>
		          
		            <li>
		            	<a href="#prdQnA">Q&amp;A</a>
		            </li>
		        </ul>
			</div>
			<div class="detailCont">
				<div style="text-align: center;">
					<img src="/Semi/imgProd/${imgfilename}">
					<img style="width: 800px; height: 771px;"
						src="/Semi/images/copy-1561715128-ECA3BCEBACB8EC8B9CED9584EB8F85EC82ACED95AD28ECBBACEB9FACECA0A4EBA6ACECBC80EC9DB4EC8AA429.jpg">
				</div>
			</div>
		</div>
		
		<div class="detailArea" id="prdInfo">
			<div class="detailMenu">
				<ul class="detail_menu" style="padding-bottom:5px;">
					<li>
						<a href="#prdDetail">DETAIL INFO</a>
					</li>
		
		            <li class="selected">
		            	<a href="#prdInfo">CHECK UP</a>
		            </li>
		          
		            <li>
		            	<a href="#prdQnA">Q&amp;A</a>
		            </li>
		        </ul>
			</div>
			<div class="checkUpCont">
				<div class="buy_product_info">
					<h3>PRODUCT INFOMATION</h3>
					<p>
						ㆍ어프어프 케이스는 주문과 동시에 제작되는 주문제작 상품이므로, 단순변심에 의한 반품/환불이 불가능합니다.<br>
						ㆍ제품색상은 모니터설정과 해상도에 따라 색상의 차이가 있을수 있으며, 이는 불량이 아닌점 참고부탁드립니다.<br>
						ㆍ사진촬영은 대표기종인 아이폰7로 촬영되었으니 주문시 기종명 꼭 확인부탁드립니다.<br> ㆍ3D 곡면인쇄의
						특성상 양쪽 여백이 미세하게 다를수도 있으며 이는 불량이 아닙니다.<br> ㆍ곡선의 경우 살짝 휘는 현상이
						생길수 있으니 이는 교환/반품 사유에 포함되지 않습니다.<br> ㆍ샘플 이미지의 경우 예시로 합성된 이미지로
						실제품과 색상차이 및 이미지 차이가 있을수 있으니 참고부탁드립니다.<br> ㆍ대표기종과 카메라 부분이 다를수
						있으며, 위치변동 및 짤림현상은 불량 사유가 아니시며, 이는 교환/환불이 불가능한점 참고후 구매부탁드립니다.<br>
						<br> ㆍ배송안내 <br> 배송기간은 입금 확인일로부터 주말, 공휴일을 제외하고 약 3-5일 정도
						소요됩니다.<br> 5만원 이상 구매 시 배송료는 무료이며, 5만원 미만 구매시 2,500원의 배송료가
						추가됩니다.<br> 입금 확인 순으로 순차배송되며, 제품 제작기간이 1-2일 소요되는 점 양해 바랍니다.<br>
						<br> ㆍ교환 및 환불방법<br> 교환 및 환불을 원하시는 상품은 구매처에 문의를 남겨주신후
						CJ대한통운 (1588-1255) 또는<br> CJ대한통운택배((www.doortodoor.co.kr)
						사이트를 통해 직접 반품접수 후 보내주세요.<br>
						<br> ㆍ반품 배송비 안내<br> 단순교환/반품: 왕복배송비 5,000원 동봉 후 착불로
						발송해주세요.<br> 편의점/타 택배사 이용시 2,500원 동봉 후 선불로 발송해 주시면 됩니다.<br>
						(*CJ편의점 택배라도 착불배송이 불가하며, 착불로 도착시 해당 배송비만큼 고객부담)<br>
						<br> ㆍ반품시 유의사항 교환/환불 요청시 (불량/오배송이 인정된상품 포함)새상품과<br> 동일하지
						않을경우 교환/환불처리가 불가합니다. (이런경우는 반송처리만 가능하며, 반송비 2,500원은 고객부담.)<br>
						<br> ㆍ환불시 유의사항 무통장 입금 : 환불받으실 은행명,예금주, 계좌번호를 신청서에 작성해주세요. 수령
						후 72시간 내에 환불 처리됩니다.<br> 카드결제 : 수령 후 1-2일 내에 카드 취소 처리되며,환불은
						카드사에서 고객님 계좌로 입금하는데 최소 2-7일 정도 소요됩니다.<br> 계좌 이체 및 휴대폰 결제 : 카드
						취소와 동일하나 환불을 처리해주는 업체가 다릅니다. (각 휴대폰 통신사,PG사)<br> 휴대폰 결제 &amp;
						에스크로 : 부분취소가 불가하오니, 배송비와 환불하지 않는 금액을 같이 입금해주셔야 처리 가능합니다.<br>
						</p>
				</div>
			</div>
		</div>
		
		<div class="QnaArea" id="prdQnA">
			<div class="detailMenu">
				<ul class="detail_menu" style="padding-bottom:5px;">
					<li>
						<a href="#prdDetail">DETAIL INFO</a>
					</li>

		            <li>
		            	<a href="#prdInfo">CHECK UP</a>
		            </li>
		          
		            <li class="selected">
		            	<a href="#prdQnA">Q&amp;A</a>
		            </li>
		        </ul>
			</div>
			
			<%-- 추가 --%>
			<div class="basic_table">
				<table class="qnaListForProd">
					<thead>
						<tr>
							<th style="width: 65px;">no</th>
							<th>subject</th>
							<th style="width: 180px;">name</th>
						</tr>
					</thead>
					<tbody style="font-weight: bold;">
					<c:if test="${not empty QnaList}">
						<c:forEach var="List" items="${QnaList}" varStatus="status">
								<tr>
									<td>${startIdx-status.index}</td>
									<td>
										<a href="javascript:void(0);" onclick="openCheckPwd('${status.count}','${List.fk_userid}')">
										${List.title}
										</a>
										<img src="/Semi/images/ico_lock.gif" alt="lock" style="padding-bottom: 2px;">
										<c:if test="${List.writeday eq today}">
										<img src="/Semi/images/ico_new.gif" alt="lock" style="padding-bottom: 2px;">
										</c:if>
									</td>
									<td>${List.name}</td>
									<td style="display: none;">${List.writeday}</td>
								</tr>
								<tr class="checkBoard" id="check${status.count}" style="background-color: #f8f8f8;">
									<td colspan="4">
										<label>비밀번호</label>
										<input type="password" id="qnaPwd${status.count}" name="qnaPwd" value="" autofocus maxlength="4"  style="margin: 0 10px 0 10px;"/>
										<button type="button" onclick="goCheckPwd('${List.pwd}','${status.count}','${List.idx}','${List.content}')">확인</button>
										<span id="onlyAdmin${status.count}"></span>
									</td>
								</tr>
							
							<c:if test="${not empty AdminList}">
								<c:forEach var="AdminList" items ="${AdminList}">
									<c:if test="${List.idx == AdminList.fk_qnaidx}">
										<tr style="font-weight: bold;">
											<td></td>
											<td style="padding-left: 250px;">
												<a href="javascript:void(0);" onclick="openAnswer('${List.fk_userid}','${status.count}');">  
													<img src="/Semi/images/ico_re.gif" alt="re" style="padding-bottom: 2px;"> ${List.name}님 문의에 대한 답변글
													<img src="/Semi/images/ico_lock.gif" alt="lock" style="padding-bottom: 2px;">
													<c:if test="${AdminList.admwriteday eq today}">
													<img src="/Semi/images/ico_new.gif" alt="lock" style="padding-bottom: 2px;">
													</c:if>
												</a>
											</td>
											<td>${AdminList.name}</td>
										</tr>
										<tr class="checkBoard" id="answer${status.count}" style="background-color: #f8f8f8;">
											<td colspan="4">
												<div class="answerArea" style="margin: 10px;">
												${AdminList.admcontent}
												</div>
												<c:if test="${AdminList.status eq sessionScope.loginUser.status}">
													<div style="display: block; float: right;">
														<button type='button' onclick="onlyEditAnswer('${AdminList.fk_qnaidx}')">수정</button>
														<button type='button' onclick="goDelete('${AdminList.idx}')">삭제</button>
													</div>
												</c:if>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty QnaList}">
						<tr>
							<td colspan="3">
								<span style="font-weight: bold; font-size: 11pt;">게시물이 없습니다.</span>
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<div class="board_bottom" style="margin-top: 30px; width: 100%; text-align: right;">
				<span class="board_btn_area"> 
				<a href="javascript:void(0);" onclick="goWrite('${pvo.prodcode}');">
					<img src="/Semi/images/btn_write.gif" alt="작성하기">
				</a> 
				<a href="/Semi/board/product/list.sa?boardNo=2">
					<img src="/Semi/images/btn_list.gif" alt="모두보기">
				</a>
				</span>
			</div>
			<div class="board_paginate">
				${pageBar}
			</div>
		</div>
	</div>
</body>

<jsp:include page="../footer.jsp"/>