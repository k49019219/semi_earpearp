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

ul {
	padding: 0px;
}

li {
	list-style-type: none;
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

.menuTab {
	margin-top: 30px;
}

.selectDiv {
	margin-top: 20px;
}

.tableDiv {
	margin-top: 50px;
}



/* ORDER 타이틀 */

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
        width: 80px;
        border-bottom: solid 3px #00a0e2;
}


/* 메뉴 TAB */
.menuTab > ul {
	border: solid 2px black;
	margin: 0px;
	font-size: 16px;
	font-weight: bold;
}

li.tabLink {
	border-right: solid 2px black;
	display: inline-block;
	width: 16%;
	text-align: center;
	padding: 15px 0px;
}

.tabLink > a {
	color: black;
	cursor: pointer;
}

li.selected:after {
    position: absolute;
    left: 7.65%;
    top: 36.8%;
    width: 13.4%;
    height: 2px;
    background: white;
    content: '';
}

/* 조회 메뉴 */
div.selectBox {
	border: solid 2px black;
}

div.stateSelect {
	display: inline-block;
	width: 10.65%;
	border-right: solid 1px #d1d1d1;
	margin: 15px;
}

select {
	font-family: "돋움",Dotum;
	font-size: 12px;
	margin-left: 3px;
	padding: 3px 0px;
}

div.period {
	display: inline-block;
	position: relative;
	top: 6.5px;
	left: -5px;
}

img.periodImg {
	float: left;
	cursor: pointer;
}

ul.notice {
	margin-top: 10px;
}

li.noticeList {
	padding: 0 0 0 9px;
    background: url(//img.echosting.cafe24.com/skin/base/common/ico_square2.gif) no-repeat 4px 7px;
    color: #939393;
    font-size: 12px;
}

input.dateBtn {
    position: relative;
    top: 4px;
}

input.date {
	display: inline-block;
	font-family: "돋움", Dotum;
	font-size: 12px;
	padding: 3px 10px 1px 5px;
}

span.dateTxt {
	display: inline-block;
	font-family: "돋움",Dotum;
	font-size: 12px;
}

input#selectBtn {
	font-family: "돋움",Dotum;
	margin-left: 5px;
	position: relative;
	top: 8px;
}

/* 상세 테이블 */

table.orderTbl{
	width: 100%;
}

table.orderTbl th {
	text-align: center;
	font-size: 19px;
	border-bottom: solid 1px black;
	padding-bottom: 8px;
}

table.orderTbl td {
	height: 193px;
	text-align: center;
}

table.orderTbl td.fontTbl {
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
	width:150px;
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

/*한 주문당 하나의 주문번호만 보이도록 나머지 행을 숨긴다.*/
.hidden {
	display:none;
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

$( function() {
	
	var startDate = "${startDate}";
	var endDate = "${endDate}";
	var status = "${status}";
	
	if(status!=""){
		$("select#orderStatus").val(status).prop("selected", true);
	} else {
		$("select#orderStatus").val("전체 주문처리상태").prop("selected", true);
	}
		
	/* 달력 나타남 */
	$(".calendar").datepicker({
      showButtonPanel: true,
      dateFormat: "yy-mm-dd",
    });
	
/* 	$(".calendar").datepicker('setDate', 'today');
	 */
    $("#startDate").datepicker();                    
    $("#endDate").datepicker();
    
    if(startDate!=""){ // 만일 값을 변경하는 경우라면
		// start ~ end date의 초기값 변경
	    $('#startDate').datepicker('setDate', '${startDate}');
	    $('#endDate').datepicker('setDate', '${endDate}');		
	}
    else { // 초기 화면이라면
    	
    	//startDate의 초기값을 오늘 날짜로 설정
        $('#startDate').datepicker('setDate', 'today');
        // endDate의 초기값을 내일로 설정
        $('#endDate').datepicker('setDate', '+1D');
    }
    
	$("div.tableDiv > table > tbody > tr > td:first-child").removeClass("hidden");
	
	
	// 주문처리 상태 조건을 선택했을때
	$("#orderStatus").change(function(){
		var status = $(this).val();
		
		javascript:location.href='/Semi/myshop/order/list.sa?startDate='+encodeURI(startDate)+'&endDate='+encodeURI(endDate)+'&status='+encodeURI(status);
	});
	
	// 기간별 조회 버튼을 눌렀을때
	$(".periodImg").click(function(){
		
		var period = $(this).prop('alt');
		var status = $("#orderStatus").val();
		
		javascript:location.href='/Semi/myshop/order/list.sa?period='+encodeURI(period)+'&status='+encodeURI(status);
	});
	
	// 달력 옆의 조회 버튼을 눌렀을때
	$("#selectBtn").click(function(){
		
		startDate = $("input#startDate").val();
		endDate = $("input#endDate").val();
		
		javascript:location.href='/Semi/myshop/order/list.sa?startDate='+encodeURI(startDate)+'&endDate='+encodeURI(endDate)+'&status='+encodeURI(status);
		
	});
	
} );

</script>

<body>
<div class="container">
	<!-- ORDER 타이틀 -->
	<div class="titleArea">
		<h2 id="title">ORDER</h2>
	</div>
	
	
	<!-- 메뉴 TAB -->
	<div class="menuTab">
		<ul>
			<li class="tabLink selected">
				<a class="tabA">주문내역 조회 (${numofOrder})</a>
			</li>
		</ul>
	</div>
	
	<!-- 조회 메뉴 -->
	<div class="selectDiv">
		<div class="selectBox">
			<div class="stateSelect">
			<select id="orderStatus">
				<option value="전체 주문처리상태">전체 주문처리상태</option>
				<option value="결제완료">결제완료</option>
				<option value="배송준비중">배송준비중</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송완료</option>
<%-- 			우리는 취소,반품 기능이 없으므로 아래 생략
				<option value="취소">취소</option>
				<option value="교환">교환</option>
				<option value="반품">반품</option> --%>
			</select>
			</div>
			<div class="period"> 
			<%-- 아래 이미지 클릭만해도 옆에 달력 기간이 바뀌고 
			오늘/1주일/1개월/3개월/6개월별 주문 목록이 떠야함 --%>
				<a><img class="periodImg" alt="오늘" src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"></a>
				<a><img class="periodImg" alt="1주일" src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"></a>
				<a><img class="periodImg" alt="1개월" src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"></a>
				<a><img class="periodImg" alt="3개월" src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"></a>
				<a><img class="periodImg" alt="6개월" src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif"></a>
			</div>
			
			<input id="startDate" class="date calendar" type="text" size="10" value=""/>
			<input type="image" class="dateBtn calendar startDate" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"/>
			<span class="dateTxt">~</span>
			<input id="endDate" class="date calendar" type="text" size="10" value=""/>
			<input type="image" class="dateBtn calendar endDate" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" />
			<input id="selectBtn" type="image" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif" />
		</div><%-- selectBtn, 누르면 해당 기간의 주문을 조회한다. --%>
		
		<ul class="notice">
			<li class="noticeList">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
			<li class="noticeList">주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
			<li class="noticeList">취소/교환/반품 신청은 주문 완료일 기준 30일까지 가능합니다.</li>
		</ul>
		
	</div>
	
	
	<!-- 상세 테이블 -->
	<div class="tableDiv">
		<table class="orderTbl">
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
						<th>Order<br/>Number</th>
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
								<td class="fontTbl">
									${order.orderstatus}
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
			
			<!-- 페이지 -->
			<div class="pagination" align="center">
				${pageBar}
			</div>
			
		</div>
	</div>
	
</body>
<jsp:include page="../../footer.jsp"/>