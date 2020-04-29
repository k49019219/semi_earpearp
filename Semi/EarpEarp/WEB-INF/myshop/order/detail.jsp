<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../header.jsp"/>
<style type="text/css">

/* 기본 */
body {
   font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
}

span {
	display: block;
}

/* 기본 구조 div */
.container {
	width: 86.85%;
}

.titleArea {
	display: inline-block;
	width: 100%;
	text-align: center;
}

.title > h3 {
	font-size: 12px;
	font-weight: bold;
}

.payArea {
	margin-top: 50px;
}

.orderArea {
	margin-top: 50px;
}

#noticeArea {
	margin-top: 30px;
}

h3 {
	margin-left: 5px;
}

ul {
	padding: 0px;
}

li {
	list-style-type: none;
}

/* 기본 테이블 */

table, td {
	border: solid 1px #d7d5d5;
}

table {
	width: 100%;
}

td{
	padding: 10px;
	font-size: 12px;
}

td.infoTitle {
	width: 13%;
	background-color: #fbfafa;
}



/* 주문상세조회 타이틀 */
h2#title {
		display: inline-block;
	    letter-spacing: .3px;
	    color: #00a0e2;
	    font-weight: 900;
	    font-size: 20px;
}
	
h2#title:after {
		content: "";
        display: block;
        width: 125px;
        border-bottom: solid 3px #00a0e2;
}


/* 주문정보 테이블 */

table#prodInfo {
	/* border: solid 1px #d7d5d5; */
	text-align: center;
}

table#prodInfo th {
	border: solid 1px #d7d5d5;
	background: #fbfafa;
	text-align: center;
	font-weight: normal;
	font-size: 12px;
	padding: 10px 0px;
}


table#prodInfo td {
	border: none;
	border-bottom: solid 1px #d7d5d5;
}

td#sum {
	text-align: right;

}

td#delivery {
	text-align: left;
}

span.deliveryData {
	display: inline-block;
}

span#sumData {
	color: #008bcc;
	font-weight: bold;
	font-size: 18px;
}

tr#backColor{
	background: #fbfafa;
}

a.prodLink {
	color: black;
	font-weight: bold;
	font-size: 12px;
	text-align: left;
	cursor: pointer;
}

a.prodLink:hover {
	text-decoration: underline;
}

span.option {
	color: #757575;
	text-align: left;
}

div#show {
	text-align: right;
	margin: 10px 1px 0px 0px;
}

table#noticeInfo h4 {
	color: #404040;
    font-size: 12px;
    font-weight: normal;
}

table#noticeInfo ul {
	padding: 0px;
	margin-left: 15px;
}

table#noticeInfo li {
	list-style-type: none;
}

span.notice {
	display: inline-block;
	line-height: 180%;
	color: #707070;
}

table#noticeInfo img {
	position: relative;
	top: -1.5px;
	margin-right: 4px;
}

.bold {
	font-weight: bold;
}

td#payPrice {
	color: #008bcc;
	font-size: 18px;
}


/* 총 주문금액 상세내역 */
div#sumLayer {
	border: solid 1px #757575;
	background-color: white;
	width: 302px;
    height: 180px;
    position: absolute;
    top: 530px;
    left: 400px;
    display: none;
}

div.sumHeader {
    color: #fff;
    background: #495164;
    height: 30px;
}

div.sumHeader h3 {
	display: inline-block;
	font-size: 14px;
	margin: 7px 130px 0px 10px;
}

div.sumHeader img {
	margin-bottom: 3px;
}

div.sumContent {
	margin: 20px; 
}

/* 추가할인 내역 보기 */
button.btn {
    display: inline-block;
    padding: 2px 8px;
    border: 1px solid #d1d1d1;
    border-radius: 2px;
    font-family: "굴림",Gulim;
    font-size: 12px;
    line-height: 18px;
    font-weight: normal;
    text-align: center;
    color: #222;
    background-color: #fff;
}


div#saleLayer {
   width: 302px;
   height: 130px;
   border: solid 1px #757575;
   display: none;
   position: absolute;
   left: 400px;
   top: 700px; 
   background-color: white;
}

div.saleHeader {
    padding: 7px 35px 7px 19px;
    color: #fff;
    background: #495164;
    height: 30px;
    vertical-align: center;
}

div.saleHeader h3 {
   position: relative;
   top: -19px;
   left: -10px;
   display: inline-block;
   font-size: 14px;
   font-weight: bold;
   color: white;
}

span.font {
    padding: 20px 0 15px 0;
    margin: 0px 8px;
    color: #008bcc;
    font-size: 16px;
    font-weight: bold;
    text-align: right;
    border-bottom: 1px dotted #b0b1b3;
    display: block;
}

span.term {
	font-size: 12px;
	color: #757575;
}

span.left {
	display: inline-block;
	margin: 8px 0px 0px 10px;
}

span.right {
   float: right;
   margin-top: 8px;
   margin-right: 8px;
}

.close {
   position: relative;
   left: 23px;
   top: -4px;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

	function openSumLay() {
    	$("#sumLayer").show();
	}

	function closeSumLay() {
    	$("#sumLayer").hide();
	}

    function openSaleLay() {
        $("#saleLayer").show();
    }

    function closeSaleLay() {
        $("#saleLayer").hide();
    }

</script>


<body>

<div class="container">
	<!-- 주문상세조회 타이틀 -->
	<div class="titleArea">
		<h2 id="title">주문상세조회</h2>
	</div>
	
	<!-- 주문정보 테이블 -->
	<div class="orderArea">
		<div class="title">
			<h3>주문정보</h3>
		</div>
		<div id="orderDiv">
			<table id="orderInfo">
				<tr>
					<td class="infoTitle">주문번호</td>
					<td class="data">${orderInfo.ordernum}</td>
				</tr>
				<tr>
					<td class="infoTitle">주문일자</td>
					<td class="data">${orderInfo.orderdate}</td>
				</tr>
				<tr>
					<td class="infoTitle">주문자</td>
					<td class="data">${sessionScope.loginUser.name}</td>
				</tr>
				<tr>
					<td class="infoTitle">주문처리상태</td>
					<td class="data">${orderInfo.orderstatus}</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="payArea">
		<div class="title">
			<h3>결제정보</h3>
		</div>
		<div id="payDiv">
			<table id="payInfo">
				<tr>
					<td class="infoTitle bold">총 주문금액</td>
					<td class="data bold" id="orderPrice"><fmt:formatNumber value="${orderInfo.totalOriginalPrice+orderInfo.shippingprice}" pattern="###,###" /> WON
					
					<!-- 내역 보기 버튼-->
					<button type="button" class="btn" onclick="openSumLay();">내역보기</button>
					
					</td>
				</tr>
				<tr>
					<td class="infoTitle bold">총 할인금액</td>
					<td class="data bold" id="disPrice"><fmt:formatNumber value="${orderInfo.totalSalePrice}" pattern="###,###" /> WON</td>
				</tr>
				<tr>
					<td class="infoTitle">추가할인금액</td>
					<td class="data" id="addDiscount"><fmt:formatNumber value="${orderInfo.totalSalePrice}" pattern="###,###" /> WON
					
					<!-- 내역 보기 버튼-->
					<button type="button" class="btn" onclick="openSaleLay();">내역보기</button>
					
					</td>
				</tr>
				<tr>
					<td class="infoTitle bold" id="paySum">총 결제금액</td>
					<td class="data bold" id="payPrice"><fmt:formatNumber value="${orderInfo.totalprice}" pattern="###,###" /> WON</td>
				</tr>
				<tr>
					<td class="infoTitle">결제수단</td>
					<td class="data">${orderInfo.paymentoption}</td>
				</tr>
			</table>
			
			<!-- 총 주문금액 내역 보기 -->
			<div id="sumLayer">
				<div class="sumHeader">
					<h3>총 주문금액 상세내역</h3>
					<a onclick="closeSumLay();"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif"></a>
				</div>
				<div class="sumContent">
					<span class="font" style="padding: 0 0 10px 0;"><fmt:formatNumber value="${orderInfo.totalOriginalPrice}" pattern="###,###" /> WON</span>
					<ul>
						<li>
							<span class="term left">상품금액</span>
							<span class="term right"><fmt:formatNumber value="${orderInfo.totalOriginalPrice-orderInfo.shippingprice}" pattern="###,###" /> WON</span>
						</li>
						<li>
							<span class="term left">배송비</span>
							<span class="term right"><fmt:formatNumber value="${orderInfo.shippingprice}" pattern="###,###" /> WON</span>
						</li>
						<li>
							<span class="term left">지역별 배송비</span>
							<span class="term right">0 WON</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 내역 보기 끝 -->
			
			<!-- 추가할인 내역 보기 -->
			<div id="saleLayer">
		        <div class="saleHeader">
		            <h3>추가금액할인 내역보기</h3>
		            <a class="close" onclick="closeSaleLay();"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif"></a>
		        </div>
		        <div class="content">
		            <span class="font"><fmt:formatNumber value="${orderInfo.totalSalePrice}" pattern="###,###" />  WON</span>
		          	<span class="term left">기간할인</span><span class="term right"><fmt:formatNumber value="${orderInfo.totalSalePrice}" pattern="###,###" />  WON</span>
				</div>
			</div>
			<!-- 내역 보기 끝 -->
		</div>
	</div>
	
	<div class="orderArea">
		<div class="title">
			<h3>주문 상품 정보</h3>
		</div>
		<div id="prodDiv">
			<table id="prodInfo">
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 42%;">
				<col style="width: 8%;">
				<col style="width: 10%;">
				<col style="width: 10%;">
				<col style="width: 10%;">
				<col style="width: 10%;">
			</colgroup>
			
				<tr>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>판매가</th>
					<th>배송구분</th>
					<th>주문처리상태</th>
					<th>취소/교환/반품</th>
				</tr>
				<c:if test="${orderDetail!=null}">
					<c:forEach var="order" items="${orderDetail}">
						<tr>
							<td><a href="/Semi/product/detail.sa"><img src="/Semi/imgProd/${order.prodimg}" style="width: 100px;"/></a></td>
							<td> 									<%-- $ {orderDetail.prodimg} --%>
								<a class="prodLink" href="/Semi/product/detail.sa?prodcode=${order.prodcode}&cateno=${order.cateno}">
								<span>${order.prodname}</span></a>
								<span class="option">[옵션: ${order.model}]</span>
							</td>
							<td>${order.quantity}</td>
							<td>
								<span><del><fmt:formatNumber value="${order.price}" pattern="###,###" /> WON</del></span>
								<span><b><fmt:formatNumber value="${order.saleprice}" pattern="###,###" /> WON</b></span>
							</td>
							<td>${orderInfo.shippingstatus}</td>
							<td style="color: #008bcc;">${orderInfo.orderstatus}</td>
							<td>-</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<tr id="backColor">
					<td id="delivery">[<span class="deliveryData">${orderInfo.shippingstatus}</span>]</td>
					<td colspan="6" id="sum">상품구매금액 <span class="deliveryData"><b><fmt:formatNumber value="${orderInfo.totalprice-orderInfo.shippingprice}" pattern="###,###" /></b></span> + 배송비 <span class="deliveryData"><fmt:formatNumber value="${orderInfo.shippingprice}" pattern="###,###" /></span> + 지역별배송비 <span class="deliveryData">0</span> = 합계 : <span id="sumData" class="deliveryData"><fmt:formatNumber value="${orderInfo.totalprice}" pattern="###,###" /> WON</span></td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="orderArea">
		<div class="title">
			<h3>배송지정보</h3>
		</div>
		<div id="addrDiv">
			<table id="addrInfo">
				<tr>
					<td class="infoTitle">받으시는 분</td>
					<td>${orderInfo.receiver}</td>
				</tr>
				
				<tr>
					<td class="infoTitle">우편번호</td>
					<td>${orderInfo.post}</td>
				</tr>
				
				<tr>
					<td class="infoTitle">주소</td>
					<td>${orderInfo.address}</td>
				</tr>
				
				<tr>
					<td class="infoTitle">일반전화</td>
					<td>-</td>
				</tr>
				
				<tr>
					<td class="infoTitle">휴대전화</td>
					<td>${orderInfo.hp}</td>
				</tr>
				
				<tr>
					<td class="infoTitle">배송메시지</td>
					<td>${orderInfo.shippingmsg}</td>
				</tr>
			</table>
			<div id="show">
				<a href="/Semi/myshop/order/list.sa" id="showList"><img src="/Semi/images/ico_order_list.png"></a>
			</div>
		</div>
	</div>
	
	<div id="noticeArea">
		<table id="noticeInfo">
			<tr>
				<td>이용안내</td>
			</tr>
	
			<tr>
				<td>
					<h4>신용카드매출전표 발행 안내</h4>
					<span class="notice" style="margin-left: 13px; margin-bottom: 10px;">신용카드 결제는 사용하는 PG사 명의로 발행됩니다.</span>
					
					<h4>세금계산서 발행 안내</h4>
					<ul>
						<li>
							<img src="/Semi/images/ico_number1.png"/>
							<span class="notice">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number2.png"/>
							<span class="notice">세금계산서는 사업자만 신청하실 수 있습니다.</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number3.png"/>
							<span class="notice">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number4.png"/>
							<span class="notice">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number5.png"/>
							<span class="notice">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number6.png"/>
							<span class="notice" style="margin-bottom: 10px;">세금계산서는 실결제금액에 대해서만 발행됩니다.(적립금과 할인금액은 세금계산서 금액에서 제외됨)</span>
						</li>
					</ul>
					
					<h4>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경 안내</h4>
					<ul>
						<li>
							<img src="/Semi/images/ico_number1.png"/>
							<span class="notice">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며
							신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number2.png"/>
							<span class="notice" style="margin-bottom: 10px;">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</span>
						</li>
					</ul>
					
					<h4>현금영수증 이용안내</h4>
					<ul>
						<li>
							<img src="/Semi/images/ico_number1.png"/>
							<span class="notice">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number2.png"/>
							<span class="notice">현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number3.png"/>
							<span class="notice">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number4.png"/>
							<span class="notice">현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</span>
						</li>
						<li>
							<img src="/Semi/images/ico_number5.png"/>
							<span class="notice" style="margin-bottom: 10px;">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</span>
						</li>
					</ul>
					
				</td>
			</tr>
		</table>
	</div>

</div>
	
</body>
<jsp:include page="../../footer.jsp"/>