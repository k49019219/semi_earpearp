<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../header.jsp" />     

<style type="text/css">

/* 기본 */
body {
   font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
}

ul {
	padding: 0px;
}

li {
	display: inline-block;
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

.summary {
	border: solid 2px black;
	margin-top: 40px;
	text-align: center;
}

.menuTab {
	margin-top: 15px;
}

.unavailDiv {
	margin-top: 20px;
}

.pageDiv {
	margin-top: 30px;
	text-align: center;
}

.noticeDiv {
	border: 1px solid #d6d4d4;
	margin-top: 15px;
}

/* 적립금 타이틀 */

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
        width: 65px;
        border-bottom: solid 3px #00a0e2;
}

/* 전체 적립금 보여주기 */

.summary ul {
	padding: 15px 0;
	font-size: 12px;
	margin: 0px;
}

.summary ul > li {
	width: 46%;
	line-height: 300%;
}

.left {
	border-right: solid 1px #e6e6e6;
	display: inline-block;
	width: 50%;
	text-align: center;
}

.right {
	display: inline-block;
	width: 49%;
	text-align: center;
}

li.summTitle {
	text-align: left;
}

li.data {
	text-align: right;
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
    left: 21.2%;
    top: 55.25%;
    width: 13.65%;
    height: 2px;
    background: white;
    content: '';
}

/* 적립 내역 */
table.unavailTbl, .unavailTbl th, .unavailTbl td {
	border: solid 1px #d7d5d5;
}

.unavailTbl {
	width: 100%;
	font-size: 12px;
}

.unavailTbl th {
	background-color: #fbfafa;
	text-align: center;
	font-weight: normal;
}

.unavailTbl td {
	text-align: center;
	font-weight: bold;
	color: #757575;
}

.unavailTbl th, .unavailTbl td  {
	padding: 7px 10px;
}

td.date {
	text-align: center;
}

td.money {
	text-align: right;
}




/* 안내 */
.noticeDiv > h3 {
	border-bottom: solid 1px #e8e7e7;
	font-size: 12px;
	font-weight: bold;
    background: #fbfbfb;
    margin: 0px;
    padding: 10px;
}

.inner ul {
	margin: 15px 0px;
}


.inner li {
	display: block;
	color: #707070;
	margin: 2px 20px;
	font-size: 12px;
}

.inner img {
	margin-right: 10px;
}

</style>


<body>
<div class="container">
	<!-- MILEAGE 타이틀 -->
	<div class="titleArea">
		<h2 id="title">적립금</h2>
	</div>
	
	<!-- 적립금 보여주기 -->
	<div class="summary">
		<div class="left">
			<ul>
				<li class="summTitle">
					<span>총 적립금</span>
				</li>
				
				<li class="data">
					<span>0원</span>
				</li>
				
				<li class="summTitle">
					<span>사용된 적립금</span>
				</li>
				
				<li class="data">
					<span>0원</span>
				</li>
			</ul>
		</div>
		
		<div class="right">
			<ul>
				<li class="summTitle">
					<span>사용가능 적립금</span>
				</li>
				
				<li class="data">
					<span>0원</span>
				</li>
				
				<li class="summTitle">
					<span>미가용 적립금</span>
				</li>
				
				<li class="data">
					<span>0원</span>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 메뉴 TAB -->
	<div class="menuTab">
		<ul>
			<li class="tabLink selected">
				<a class="tabA" href="/Semi/myshop/mileage/historyList.sa">적립내역보기</a>
			</li>
			<li class="tabLink">
				<a class="tabA" href="/Semi/myshop/mileage/unavailList.sa">미가용적립내역보기</a>
			</li>
		</ul>
	</div>
	
	<!-- 적립 내역 -->
	<div class="unavailDiv">
		<table class="unavailTbl">
			<colgroup>
			<col style="width: 15%;">
			<col style="width: 15%;">
			<col style="width: 15%;">
			<col style="width: 15%;">
			<col style="width: 40%;">
			</colgroup>
			<tr>
				<th>주문날짜</th>
				<th>적립금</th>
				<th>관련 주문</th>
				<th>사용가능 예정일</th>
				<th>내용</th>
			</tr>
			
			<tr>
				<td class="noData" colspan="5"><span>적립금 내역이 없습니다.</span></td>
			</tr>
		</table>
	</div>
	
	<!-- 페이징 -->
	<div class="pageDiv">
		페이지
	</div>
	
	<!-- 안내 -->
	<div class="noticeDiv">
		<h3>적립금 안내</h3>
		<div class="inner">
			<ul>
				<li class="item1">
				<img src="/Semi/images/ico_number1.png"/>주문으로 발생한 적립금은 배송완료 후 20일 부터 실제 사용 가능한 적립금으로 전환됩니다. 배송완료 시점으로부터 20일 동안은 미가용 적립금으로 분류됩니다.
				</li>
				
				<li class="item2">
				<img src="/Semi/images/ico_number2.png"/>미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.
				</li>
				
				<li class="item3">
				<img src="/Semi/images/ico_number3.png"/>사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.
				</li>
			</ul>
		</div>
	</div>
</div>

</body>


<jsp:include page="../../footer.jsp" />  
