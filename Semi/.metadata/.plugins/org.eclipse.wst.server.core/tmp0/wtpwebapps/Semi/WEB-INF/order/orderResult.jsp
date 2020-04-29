<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp"/>
<style type="text/css">
	body {   
      font-family: 'Open Sans', NanumGothic,'Malgun Gothic', Dotum, sans-serif;
    }

	#wrap_view_result {
		margin: 100px 0 100px 0;
	}

	#wrap_view_result #container {
		margin: 0 auto;
	}
	
	#wrap_view_result .title_area {
		margin: 53px 0 50px;
		text-align: center;
	}
	
	#wrap_view_result .title_area h2 {
		display: inline-block;
	    letter-spacing: .3px;
	    padding: 0 2px;
	    position: relative;
	    color: #00a0e2;
	    font-weight: 900;
	    font-size: 30px;
	    border-bottom: solid 3px #00a0e2;
	}
	
	#wrap_view_result .order_area {
		margin: 0 auto;
		width: 85%;
	}
	
	#wrap_view_result .order_area .step4_img {
		width: 70%;
	}
	
	#wrap_view_result .order_area .order_info_point {
		width: 100%;
		font-size: 10pt;
		border: solid 3px #000000;
		height: 80px;
		margin: 25px 0 25px 0;
	}

	#wrap_view_result .order_area .order_info_point a.mileCss_A {
		text-decoration: none;
		color: #000000;
	}

	#wrap_view_result .order_area .order_info_point tr {
		border-bottom: solid 1px #e6e6e6;
	}

	#wrap_view_result .order_area .order_info_point tr td {
		border-right: solid 1px #e6e6e6;
		padding-left: 10px;
	}
	
	#wrap_view_result .order_area .order_info_point tr:first-child td:first-child {
		width: 10%;
		text-align: center;
		font-weight: bold;
		padding-left: 0;
	}
	
	#wrap_view_result .order_area .order_finalInfo {
		width: 100%; 
		height: 350px;
	}
	
	#wrap_view_result .order_area .order_finalInfo .finalInfo_inner {
		width: 50%;
		margin: 0 auto;
	}
	
	#wrap_view_result .order_area .order_finalInfo .finalInfo_inner img {
		width: 15%;
		float: left;
		margin-top: 20%;
		display: inline-block;
	}
	
	#wrap_view_result .order_area .order_finalInfo .finalInfo_inner ul {
		margin-top: 15%;
		float: right;
		list-style-type: none;
		font-size: 12pt;
	}
	
	#wrap_view_result .order_area .order_finalInfo .finalInfo_inner ul li a {
		color: #00a0e2;
		text-decoration: underline;		
		font-weight: bold;
	}
	
	#wrap_view_result .order_area .order_finalInfo .finalInfo_inner ul li:nth-child(2){
		line-height: 400%;
	}
	
	#wrap_view_result .order_area .order_finalInfo .finalInfo_inner ul li:first-child {
		font-size: 20pt;
		font-weight: bold;
		line-height: 200%;
	}
	
	#wrap_view_result .order_area .order_finalInfo .finalInfo_inner ul li .li_style1 {
		font-weight: bold;
	}
	
	 #wrap_view_result .order_area .order_list {
	 	 width: 100%; 
	 	 margin: 10px 0 30px 0; 
	 	 border: solid 1px #e6e6e6;
	 	 font-size: 10pt;
	 }
	 
	 #wrap_view_result .order_area .order_list tr {
	 	height: 45px;
	 }
	 
	 #wrap_view_result .order_area .order_list tr th, td:first-child {
		padding-left: 10px;
	}
	
	#wrap_view_result .order_area .order_list tbody td {
		text-align: center;
		border:solid 1px #e6e6e6;
		padding: 5px 0 5px 0;
	}
	
	#wrap_view_result .order_area .order_list tbody tr td a.orderProduct_A {
		text-decoration: none;
		font-weight: bold;
		font-size: 12pt;
		color: #000000;
		line-height: 200%;
	}
	
	#wrap_view_result .order_area .order_list tbody tr td a.orderProduct_A:hover {
		text-decoration: underline;
	}
	
	#wrap_view_result .order_area .order_list  tfoot tr:last-child td button:hover {
		background-color: #e6e6e6;
	}
	
	#wrap_view_result .order_area .order_list  tfoot tr:first-child td:first-child {
		border-bottom: solid 1px #e6e6e6; 
		background-color: #fbfbfb;
	}
	
	#wrap_view_result .order_area .order_list  tfoot tr:first-child td:first-child .order_deli { 
		 display: inline-block; 
		 float: left;
	}
	
	#wrap_view_result .order_area .order_list  tfoot tr:first-child td:first-child .order_calc { 
		 display: inline-block; 
		 float: right;
	}

	#wrap_view_result .order_area .order_list  tfoot .order_warning {
		background-color: #fff8f7; 
		color: red; 
		border-left: solid 1px white; 
		border-right: solid 1px white; 
		font-size: 9pt;
		border-bottom: solid 1px #e6e6e6;
		padding-left: 20px;
	}
	
	#wrap_view_result .order_area .order_list  tfoot tr:last-child td {
		border-bottom: solid 1px #000000; 
		border-left: solid 1px white; 
		border-right: solid 1px white; 
		padding: 10px 0 50px 10px;
	}
	
	#wrap_view_result .order_area .order_list tfoot .order_calc span.order_totalPrice {
		color: #00a0e2;
		font-size: 15pt;
		font-weight: bold;
		margin-left: 10px; 
		display: inline-block;
	}
	
	#wrap_view_result .order_area span.star {
		color: red;
	}
	
	#wrap_view_result .order_area .tableStyle1 { 
		margin: 0 0 50px 0;
	}
	
	#wrap_view_result .order_area .tableStyle1 table {
		margin: 10px 0 0 0;
		border: solid 1px #e6e6e6;
		width: 100%;
	}
	
	#wrap_view_result .order_area .tableStyle1 table tr td {
		border: solid 1px #e6e6e6;
	}
	
	#wrap_view_result .order_area .tableStyle1 table tr:first-child {
		 background-color: #fbfbfb;
		 font-size: 10pt;
	}

	#wrap_view_result .order_area .tableStyle1 table .tr_style {
		height: 70px;
		text-align: center;
		font-weight: bold;
	}
	
	#wrap_view_result .order_area .tableStyle1 table .tr_style td {
		width: 33.3%;
	}
	
	#wrap_view_result .order_area .tableStyle1 table .tr_style2 {
		height: 40px;
		font-size: 10pt;
	}
	
	#wrap_view_result .order_area .tableStyle1 table .tr_style2 td {
		background-color: #fbfbfb;
	}
	
	#wrap_view_result .order_area .tableStyle1 table .tr_style2 td:first-child {
		width: 150px;
	}
	
	#wrap_view_result .order_area .tableStyle1 table .tr_style2 td:last-child {
		padding-left: 10px;
	}
	
	#wrap_view_result .order_area .tableStyle1 table .tr_style2:last-child td:last-child {
		background-color: white;
		padding: 10px;
	}
	
	#wrap_view_result .order_area .tableStyle1 table .tr_style_css td {
		font-weight: bold;
		font-size: 15pt;
		height: 90px;
	}
	
	#wrap_view_result .order_area .tableStyle1 table .tr_style_css td:last-child {
		color: #00a0e2;
	}
	
	#wrap_view_result .order_area .order_howtopay {
		width: 100%;

	}

	#wrap_view_result .order_area .help {
		border: solid 1px #e6e6e6;
		margin: 40px 0 20px 0;
		display: inline-block; 
		width: 100%;
	}
	
	#wrap_view_result .order_area .help table {
		width: 100%;
	}
	
	#wrap_view_result .order_area .help tr:first-child td {
		background-color: #fbfbfb;
		font-weight: bold;
		font-size: 10pt;
		padding: 10px;
		border-bottom: solid 1px #e6e6e6;
	}
	
	#wrap_view_result .order_area .help tr:last-child td ol {
		margin: 20px;
		padding: 0;
	}
	
	#wrap_view_result .order_area .help2 {
		border: solid 1px #e6e6e6;
		margin: 20px 0 100px 0;
	}
	
	#wrap_view_result .order_area .help2 table {
		width: 100%;
	}
	
	#wrap_view_result .order_area .help2 tr:first-child td {
		background-color: #fbfbfb;
		font-weight: bold;
		font-size: 10pt;
		padding: 10px;
		border-bottom: solid 1px #e6e6e6;
	}
	
	#wrap_view_result .order_area .help2 tr td {
		font-size: 10pt;
		padding: 10px;
	}
	
	#wrap_view_result .order_area .help2 tr:last-child td {
		padding-bottom: 20px;
	}
	
	#wrap_view_result .order_area .help2 tr td ol {
		margin: 0;
		padding: 0 0 0 20px;
	}
	
	#wrap_view_result .order_area .finalBtns {
		width: 100%;
		text-align: right;
	}

	#wrap_view_result .whitebtn {
		border: solid 1px #e6e6e6; 
		background-color: white; 
		color: #000000; 
		margin-left: 10px;
	}

	
	#wrap_view_result button.keepShopbtn {
		border: solid 1px #e6e6e6; 
		background-color: white; 
		color: #000000; 
		width: 200px;
		height: 50px;
	}
	
	#wrap_view_result button.checkOrderbtn {
		border: solid 1px #e6e6e6; 
		background-color: gray; 
		color: white; 
		width: 200px;
		height: 50px;
	}
	
	#wrap_view_result button.keepShopbtn:hover, #wrap_view_result button.checkOrderbtn:hover {
		border: solid 1px #666666; 
	}
	
	#wrap_view_result .order_area .help ol li ,#wrap_view_result .order_area .help2 ol li {
		list-style-type: none;
		padding: 0 0 0 22px;
	}
	
	#wrap_view_result .order_area .item1 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -484px 0;
	}
	
	#wrap_view_result .order_area .item2 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -434px -100px;
	}
	
	#wrap_view_result .order_area .item3 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -384px -200px;
	}
	
	#wrap_view_result .order_area .item4 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -334px -300px;
	}
	
	#wrap_view_result .order_area .item5 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -284px -400px;
	}
	
	#wrap_view_result .layer {	
		width: 300px;
		position: absolute;
	}

	#wrap_view_result .layer > div.header {
		border: solid 1px #707070;
		border-bottom: none;
		background-color: #495164;
		height: 40px;
		padding: 8px 10px 8px 10px;
		text-align: left;
	}
 
	#wrap_view_result span#title {
		font-size: 12pt;
		font-weight: bold;
	}
	
	#wrap_view_result a.close {
		float: right;
	}
	
	#wrap_view_result a.close:hover {
		cursor: pointer;
	}
	
	#wrap_view_result .layer > div.contents {
		border: solid 1px #707070;
		min-height: 90px;
		padding: 10px 20px 10px 20px;
		background: white;
	}
 
 	#wrap_view_result ul.detail {
 		clear: both;
 		font-size: 10pt;
 		color: #707070;
 		padding-left: 10px;
 	}
 	
 	#wrap_view_result .term {
 		font-weight: normal;
 	}
 	
 	#wrap_view_result .price {
 		float: right;
 	}

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		
		 		 
	}); // end of document ready --------------
	
	// == 총 주문 내역보기 클릭 == // 
   	function ViewLayerO(){
   	  document.getElementById("layerO").style.display='inline';
   	}
	
 	// == 총 할인 내역보기 클릭 == //
   	function ViewLayerD(){
      document.getElementById("layerD").style.display='inline';
    }

   	// == 총 주문 내역보기 닫기 버튼 == // 
   	function myCloseO() {
   	  document.getElementById("layerO").style.display = "none";    
	}
   	
	// == 총 할인 내역보기 닫기 버튼 == // 
   	function myCloseD() {
      document.getElementById("layerD").style.display = "none";    
  	}
	
</script>


<div id="wrap_view_result">
	<div id="container">
		<div class="title_area">
			<h2>주문완료</h2>
		</div>
			
			<div class="order_area">
			
				<div align="center">
				<img class="step4_img" src="/Semi/images/img_order_step4.png" alt="주문 4단계">
				</div>
				
				<table class="order_info_point">
					<tr>
						<td rowspan="2">혜택정보</td>
						<td>${sessionScope.loginUser.name}</td>
					</tr>
					<tr>
						<td><a href="/Semi/myshop/mileage/historyList.sa" class="mileCss_A">가용적립금 : <span style="color:#00a0e2; font-weight: bold;">${ableMileage} WON</span></a></td>
					</tr>
				</table>
				
				<div class="order_finalInfo">
					<div class="finalInfo_inner">
						<img alt="orderCheck" src="//img.echosting.cafe24.com/skin/base/order/bg_result.png">
						<ul>
							<li>고객님의 주문이 완료되었습니다.</li>
							<li>주문내역 및 배송에 관한 안내는 <a href="/Semi/myshop/order/list.sa">주문조회</a>를 통하여 확인 가능합니다.</li>
							<li></li>
							<li>주문번호 : <span class="li_style1">${mapOrderShippment.ordernum}</span></li>
							<li>주문일자 : ${mapOrderShippment.orderdate}</li>
						</ul>
					</div>
				</div>
				
				<div class="tableStyle1">
					<b>결제 정보</b>
					<table>
						<tr class="tr_style2">
							<td>최종결제금액</td>
							<td>
								<span style="color:#00a0e2; font-weight: bold; font-size: 14pt;">
								<fmt:formatNumber value="${price.totalPayment}" pattern="###,###" /> WON
								</span></td>
						</tr>
						<tr class="tr_style2">
							<td>결제수단</td>
							<td style="background-color: white;">
								결제수단(
								<c:if test="${howtopay=='payCard'}">
									신용카드
								</c:if>
								<c:if test="${howtopay!='payCard'}">
									카카오페이
								</c:if>
								)								
							</td>
						</tr>
					</table>
				</div>
				
				<table class="order_list">
					<b>주문 상품 정보</b>
					<tbody>
						<tr class="tbody_th" style="background-color: #fbfbfb">
							<td style="width: 10%;">이미지</td>
							<td>상품정보</td>
							<td>판매가</td>
							<td>수량</td>
							<td>적립금</td>
							<td>배송구분</td>
							<td>합계</td>
						</tr>
					
						<c:if test="${productList != null}">
						<c:forEach var="product" items="${productList}" varStatus="status">
							<tr>
								<td><a href="/Semi/product/detail.sa?prodcode=${product.prodcode}&cateno=${product.cateno}"><img src="/Semi/imgProd/${product.prodimg}" alt="주문할상품이미지" style="width: 100px;"></a></td>
								<td><a href="/Semi/product/detail.sa?prodcode=${product.prodcode}&cateno=${product.cateno}" class="orderProduct${status.count}">${product.prodname}</a>
									<div class="orderOption">[옵션: <span class="thisModel">${product.model}</span>]</div>
								</td>
								<td><span style="text-decoration: line-through; font-weight:normal !important;"><fmt:formatNumber value="${product.price}" pattern="###,###" /><span>WON</span></span><br/>
									<span style="font-weight:bold;"><fmt:formatNumber value="${product.saleprice}" pattern="###,###" /><span>WON</span></span>
								</td>
								<td class="qty">${product.qty}</td>
								<td>-</td>
								<td>기본배송</td>
								<td><span style="font-weight: bold;"><fmt:formatNumber value="${product.saleprice*product.qty}" pattern="###,###" /> WON</span></td>
							</tr>
						</c:forEach>
					</c:if>
						
					</tbody>
					
					<tfoot>
						<tr>
							<td colspan="7" style="padding: 2% 1%;">
								<div class="order_deli">[기본배송]</div>
								<div class="order_calc" style="display: inline-block; float: right; padding-right: 10px;">
									상품구매금액 <span style="font-weight: bold;"><fmt:formatNumber value="${price.totalPayment}" pattern="###,###" /> </span>
									+ 배송비 <fmt:formatNumber value="${mapOrderShippment.shippingprice}" pattern="###,###" /> 
									+ 지역별배송비 0 
									- 상품할인금액 <fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> 
									= 합계: <span class="order_totalPrice"><fmt:formatNumber value="${price.totalPayment}" pattern="###,###" /> WON</span>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
				
				<div class="tableStyle1">
					<table style="border: solid 3px #000000;">
						<tr class="tr_style">
							<td>총 주문 금액
								<button type="button" class="whitebtn" onclick="javascript:ViewLayerO();" style="font-weight: normal;">내역보기</button>
									<div id="layerO" class="layer" style="display: none; z-index: 9999;">
										<div class="header">
											<span id="title" style="color: white; ">총 주문금액 상세내역</span>
											<a class="close" onclick="myCloseO();">
												<img src="http://img.echosting.cafe24.com/skin/base/common/btn_close.gif"/>
											</a>
										</div>
											
										<div class="contents">
											<p>
												<strong class="price" style="color: #008BCC; font-size: 16px;"><fmt:formatNumber value="${price.totalPayment}" pattern="###,###" /> WON</strong>
											</p>
											<br/>
											<hr style="border: none; border-top: 1px dotted #707070; margin: 0px 0 5px 0;"/>
											
											<ul class="detail">
												<li>
													<strong class="detail term" style="float: left;">배송비</strong> 
													<span class="price discount"><fmt:formatNumber value="${mapOrderShippment.shippingprice}" pattern="###,###" />  WON</span>
												</li>
												<li>
													<strong class="detail term" style="float: left;">지역별 배송비</strong> 
													<span class="price discount">0 WON</span>
												</li>
											</ul>
										</div>	
									</div>
							</td>
							<td>총 할인 금액</td>
							<td>총 결제 금액</td>
						</tr>
						<tr class="tr_style tr_style_css">
							<td><fmt:formatNumber value="${price.totalOriginalPrice}" pattern="###,###" /> WON</td>
							<td>-<fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> WON</td>
							<td>= <fmt:formatNumber value="${price.totalPayment}" pattern="###,###" /> WON</td>
						</tr>
					</table>
					
					<table>
						<tr class="tr_style2" style="font-weight: bold; font-size: 12pt;">
							<td>총 할인금액</td>
							<td colspan="2"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> WON</td>
						</tr>
						<tr class="tr_style2">
							<td>추가할인금액</td>
							<td colspan="2" style="background-color: white;"> <fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" />WON 
								<button type="button" class="whitebtn" onclick="javascript:ViewLayerD();" style="font-weight: normal;">내역보기</button>
									<div id="layerD" class="layer" style="display: none; z-index: 9999;">
										<div class="header">
											<span id="title" style="color: white; ">총 할인금액 상세내역</span>
											<a class="close" onclick="myCloseD();">
												<img src="http://img.echosting.cafe24.com/skin/base/common/btn_close.gif"/>
											</a>
										</div>
											
										<div class="contents">
											<p>
												<strong class="price" style="color: #008BCC; font-size: 16px;"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> WON</strong>
											</p>
											<br/>
											<hr style="border: none; border-top: 1px dotted #707070; margin: 0px 0 5px 0;"/>
											
											<ul class="detail">
												<li>
													<strong class="detail term" style="float: left;">기간할인</strong> 
													<span class="price discount"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> WON</span>
												</li>
											</ul>
										</div>	
									</div>
							</td>
						</tr>
					</table>
				</div>
				
				
			
				<div class="tableStyle1">
					<b>배송지 정보</b>
					<table>
						<tr class="tr_style2">
							<td>받으시는분</td>
							<td style="background-color: white;">${mapOrderShippment.receiver}</td>
						</tr>
						<tr class="tr_style2">
							<td>우편번호</td>
							<td style="background-color: white;">${mapOrderShippment.post}</td>
						</tr>
						<tr class="tr_style2">
							<td>주소</td>
							<td style="background-color: white;">${mapOrderShippment.address}</td>
						</tr>
						<tr class="tr_style2">
							<td>일반전화</td>
							<td style="background-color: white;"></td>
						</tr>
						<tr class="tr_style2">
							<td>휴대전화</td>
							<td style="background-color: white;">${mapOrderShippment.hp}</td>
						</tr>
						<tr class="tr_style2">
							<td>배송메시지</td>
							<td style="background-color: white;">${mapOrderShippment.shippingmsg}</td>
						</tr>						
					</table>
				</div>
				
				<div class="finalBtns">
					<button type="button" class="keepShopbtn" onclick="javascript:location.href='/Semi/mainPage.sa'">쇼핑계속하기</button>
					<button type="button" class="checkOrderbtn" onclick="javascript:location.href='/Semi/myshop/order/list.sa'">주문확인하기</button>
			    </div>
			    
				<div class="help2">
					<table>
						<tbody>
							<tr>
								<td>
								이용안내
								</td>
							</tr>
							<tr>
								<td>
									 <ol>
									 	<li class="item1">비회원 주문의 경우, 주문번호를 꼭 기억하세요. 주문번호로 주문조회가 가능합니다.</li>
										<li class="item2">배송은 결제완료 후 지역에 따라 3일 ~ 7일 가량이 소요됩니다.</li>
										<li class="item3">상품별 자세한 배송과정은 주문조회를 통하여 조회하실 수 있습니다.</li>
										<li class="item4">주문의 취소 및 환불, 교환에 관한 사항은 이용안내의 내용을 참고하십시오.</li>
			            			</ol>
								</td>
							</tr>
						
							<tr>
								<td>세금계산서 발행 안내</td>
							</tr>
							<tr>
								<td>
									<ol>
										<li class="item1">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
										<li class="item2">세금계산서는 사업자만 신청하실 수 있습니다.</li>
										<li class="item3">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
										<li class="item4">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
										<li class="item5">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
			                		</ol>
								</td>
							</tr>
							
							<tr>
								<td>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</td>
							</tr>
							<tr>
								<td>
									 <ol>
									 	<li class="item1">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</li>
										<li class="item2">신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
										<li class="item3">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
						            </ol>
								</td>
							</tr>
							<tr>
								<td>현금영수증 이용안내</td>
							</tr>
							<tr>
								<td>
								    <ol>
										<li class="item1">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</li>
						                <li class="item2">현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
						                <li class="item3">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
						                <li class="item4">현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
						                <li class="item5">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
						            </ol>
								</td>
							</tr>
						
						</tbody>
					</table>
				</div>
				
		</div>
	</div>		
</div>
<jsp:include page="../footer.jsp"/>