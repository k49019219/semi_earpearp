<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../header.jsp"/>

<!-- COMMUNITY - Q&A + REVIEW 목록 -->

<style type="text/css">

	#wrap_commu {
		margin: 100px 0 100px 0;
	}
	
	#wrap_commu #container {
		margin: 0 auto;
		width: 85%;
	}
	
	#wrap_commu .title_area {
		margin: 53px 0 50px;
		text-align: center;
	}
	
	#wrap_commu .title_area h2 {
		display: inline-block;
	    letter-spacing: .3px;
	    padding: 0 2px;
	    position: relative;
	    color: #00a0e2;
	    font-weight: 900;
	    font-size: 30px;
	    border-bottom: solid 3px #00a0e2;
	    margin-bottom: 40px;
	}
	
	#wrap_commu .title_area ul {
		padding: 0;
	}
	
	#wrap_commu .title_area ul li {
		list-style-type: none;
		display: inline-block;
	}
	
	#wrap_commu .title_area ul li a {
		font-size: 18px;
    	font-weight: 900;
    	text-decoration: none;
    	color: #000000;
    	margin: 0 20px 0 20px;
	}
	
	#wrap_commu .title_area ul li a:hover {
		color: #00a0e2;
	}
	
	#wrap_commu .basic_table table {
		border: solid 2px #000000;
		border-top-width: 6px;
		border-collapse: collapse;
		width: 100%;
	}
	
	#wrap_commu .basic_table table th {
		font-size: 12pt;
	}
	
	#wrap_commu .basic_table table th, #wrap_commu .basic_table table td {
		height: 50px;
    	border: 2px solid #000;
	    padding: 14px 5px;
	    box-sizing: border-box;
	    line-height: 1.2;
	    vertical-align: middle;
	    text-align: center;
	}
	
	#wrap_commu .basic_table table td {
		color: #000000;
	}
	
	#wrap_commu .basic_table table a {
		text-align: left;
		text-decoration: none;
		color: #000000;
	}
	
	#wrap_commu .basic_table table a:hover {
		text-decoration: underline;
	}
	
	#wrap_commu #boardSearchForm .board_search_area {
		margin-top: 20px;
	}
	
	#wrap_commu #boardSearchForm .board_search_area select, input {
		border: 2px solid #000;
	    height: 37px;
	    box-sizing: border-box;
	    font-family: NanumGothic;
	    font-size: 16px;
	    font-weight: bold;
	    padding-left: 5px;
	    background-color: #fff;
	}
	
	#wrap_commu #boardSearchForm .board_search_area a {
		vertical-align: top;
	}
	
	#wrap_commu #boardSearchForm .board_search_area a:last-child {
		float: right;
	}
	
	#wrap_commu .board_paginate {
		margin-top: 40px;
		text-align: center;
	}
	
	#wrap_commu .board_paginate ul {
		display: inline-block;
	  	margin: 0 17px 0 17px;
	    padding: 0;
	}
	
	#wrap_commu .board_paginate li {
		display: inline-block;
	}

	#wrap_commu .board_paginate li span, #wrap_commu .board_paginate li a {
		display: block;
	    width: 31px;
	    padding: 7px 0 6px;
	    box-sizing: border-box;
	    font-size: 16px;
	    color: #000;
	    font-weight: bold;
	    line-height: 14px;
	}

	#wrap_commu .board_paginate .this {
		border: 2px solid #000000;
	}
	

</style>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var boardNo = "${boardNo}"
		var search_date = "${search_date}"
		var search_key = "${search_key}"

		if(boardNo == "2"){
			$(".writeday").hide();
			$(".attachImg").hide();
			$("#search_key_title_val").val("qnatitle");
			$("#search_key_con_val").val("qnacontent");
		}
		else if(boardNo =="3"){
			$(".writeday").show();
			$(".lockImg").hide();
			$("#search_key_title_val").val("revtitle");
			$("#search_key_con_val").val("revcontent");
		}

		// 페이지를 넘기더라도 검색했던 내용들이 그대로 유지되도록 고정
		if( search_date == "" && search_key == "" ){
			$("#search_date").val();
			$("#search_key").val();
			$("#search").val();
		}
		else {
			$("#search_date").val("${search_date}");
			$("#search_key").val("${search_key}");
			$("#search").val("${search}");
		}
		
		// enter 검색
		$("#search").bind("keydown",function(event){
			if(event.keyCode == 13){
				goSearch();
			}
		});
		
 		// 검색 버튼을 눌렀을 경우 아무것도 적지 않았거나 공백일 경우 alert
		$("#search_btn").click(function(){
			goSearch();
		});
 		
	}); // end of document ready ----------------
	
	
	function goDetailContent(idx, userid, prodcode){
		
		var loginuser = ${sessionScope.loginUser != null}
		var loginuserID = "${sessionScope.loginUser.userid}";
		var loginuserStatus = "${sessionScope.loginUser.status}";
		
		var boardNo = ${boardNo}
		
		if(boardNo =='2' && !loginuser){
			alert("문의글은 로그인 회원 전용 비밀글입니다 :)");
		}
		else if(boardNo =='2' && loginuserID != userid && loginuserStatus == '1'){
			alert("비밀글은 해당 글 작성자만 조회 및 수정 가능합니다. :)");
		}
		else if(boardNo =='2' && loginuserID == userid && loginuserStatus == '1'){
			location.href="/Semi/board/product/checkQnAPwd.sa?boardNo="+boardNo+"&idx="+idx;
		}
		else if(boardNo =='2' && loginuserStatus == '4'){
			location.href="/Semi/board/product/content.sa?boardNo="+boardNo+"&idx="+idx;
		}
		else if(boardNo =='3'){
			location.href="/Semi/board/product/content.sa?boardNo="+boardNo+"&idx="+idx+"&prodcode="+prodcode;
		}
	}
	
	function goSearch(){
		
	var frm = document.boardSearchForm;
			
		frm.action="/Semi/board/product/list.sa";
		frm.method="GET";
		frm.submit();
		
	} // end of goSearch()------------------
	
	function goWrite(boardNo){
		
		var loginuser = ${sessionScope.loginUser != null}

		if(!loginuser){
			alert("로그인을 먼저 진행해 주세요 :)");
		}
		else {
			location.href="/Semi/board/product/write.sa?boardNo=${boardNo}";
		}
		
	} // end of goWrite()------------------
	
	function goDetailAnswer(idx, userid){
		
		var loginuserID = "${sessionScope.loginUser.userid}";
		var loginuserStatus = "${sessionScope.loginUser.status}";
		
		if(loginuserID == userid || loginuserStatus == "4" ){
			location.href="/Semi/board/product/content.sa?boardNo="+${boardNo}+"&idx="+idx+"&check=Adm";
		}
		else {
			alert("질문자만 해당 답변 조회가 가능합니다. :-)");
		}
		
	}
	
	function goNoticeContent(idx, boardNo){
		location.href="/Semi/board/free/noticeDetail.sa?boardNo="+boardNo+"&idx="+idx;
	}
	
</script>

	<div id="wrap_commu">
		<div id="container">
			
			<div class="title_area">
				<h2>COMMUNITY</h2>
				<ul class="list_sublink">
					<li><a href="/Semi/board/free/list.sa?boardNo=1">NOTICE</a></li>
					<li><a href="/Semi/board/product/list.sa?boardNo=2">Q&A</a></li>
					<li><a href="/Semi/board/product/list.sa?boardNo=3">REVIEW</a></li>
				</ul>
			</div>
			
			<div class="basic_table">
				<table>
					<thead>
						<tr>
							<th style="width: 65px;">no</th>
							<th style="width: 140px;">product</th>
							<th>subject</th>
							<th style="width: 180px;">name</th>
							<th class="writeday" style="width: 180px;">date</th>
						</tr>
					</thead>
					
					<tbody>
					<c:if test="${not empty NoticeList}">
						<c:forEach var="NoticeList" items="${NoticeList}">
							<tr style="text-align: center;">
								<td>${NoticeList.subject}</td>
								<td></td>
								<td style="text-align: left; padding-left: 30px;">
									<a href="javascript:void(0);" onclick="goNoticeContent('${NoticeList.idx}','${NoticeList.fk_boardno}');">  
								    	<span style="font-weight: bold; margin-right: 5px;">${NoticeList.title}</span>
									</a>
									<c:if test="${NoticeList.writeday eq today}">
									<img src="/Semi/images/ico_new.gif" alt="lock" style="padding-bottom: 2px;">
									</c:if>
								</td>
								<td style="font-weight: bold;">${NoticeList.name}</td>
								<td class="writeday">${NoticeList.writeday}</td>
								<td style="display: none;">${NoticeList.idx}</td>
							</tr>
						</c:forEach>
					</c:if>
					
					<c:if test="${not empty boardList}">
						<c:forEach var="List" items="${boardList}" varStatus="status">
							<tr style="text-align: center;">
								<td>${startIdx-status.index}</td>
								<td>
									<c:if test="${not empty List.fk_prodcode}">								
										<a href="/Semi/product/detail.sa?prodcode=${List.fk_prodcode}&cateno=${List.fk_cateno}">
											<img src="/Semi/imgProd/${List.prodimg}" style="width: 50px; height: 50px; display: block; margin: 0 auto;" alt="상품대표이미지"/>
											<span style="font-size: 9pt;">${List.prodname}</span>
										</a>
									</c:if>
								</td>
								<td style="text-align: left; padding-left: 30px;">
									<a href="javascript:void(0);" onclick="goDetailContent('${List.idx}','${List.fk_userid}','${List.fk_prodcode}');">  
								    	<span style="font-weight: bold; margin-right: 5px;">${List.title}</span>
									</a>
									<img class="lockImg" src="/Semi/images/ico_lock.gif" alt="lock" style="padding-bottom: 2px;">
									<c:if test="${List.rimg1 ne 'none' || List.rimg2 ne 'none' || List.rimg3 ne 'none' || List.rimg4 ne 'none' || List.rimg5 ne 'none'}">
										<img class="attachImg" src="/Semi/images/ico_attach2.gif" alt="file" style="padding-bottom: 2px;">
									</c:if>
									<c:if test="${not empty TitlecomList}">
										<c:forEach var="TitlecomList" items="${TitlecomList}">
												<c:if test="${List.idx eq TitlecomList.idx}">
													<span style="color:#00a0e2; font-weight:bold;">[${TitlecomList.cnt}]</span>
												</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${List.writeday eq today}">
										<img src="/Semi/images/ico_new.gif" alt="lock" style="padding-bottom: 2px;">
									</c:if>
									
								</td>
								<td style="font-weight: bold;">${List.name}</td>
								<td class="writeday">${List.writeday}</td>
								<td style="display: none;">${List.idx}</td>
							</tr>
							
							<c:if test="${boardNo eq '2' && not empty AdminList}">
								<c:forEach var="AdminList" items ="${AdminList}">
									<c:if test="${List.idx == AdminList.fk_qnaidx}">
										<tr style="font-weight: bold;">
											<td></td>
											<td></td>
											<td style="text-align: left; padding-left: 30px;">
												<a href="javascript:void(0);" onclick="goDetailAnswer('${AdminList.fk_qnaidx}','${List.fk_userid}');">  
													<img src="/Semi/images/ico_re.gif" alt="re" style="padding-bottom: 2px;"> ${List.name}님 문의에 대한 답변글
													<img src="/Semi/images/ico_lock.gif" alt="lock" style="padding-bottom: 2px;">
													<c:if test="${AdminList.admwriteday eq today}">
													<img src="/Semi/images/ico_new.gif" alt="lock" style="padding-bottom: 2px;">
													</c:if>
												</a>
											</td>
											<td>${AdminList.name}</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>
					</tbody>
					
					<c:if test="${ empty boardList }">
						<tbody>
							<tr>
								<td colspan="5" style="padding: 30px 0 30px 0;"><span style="font-size: 13pt; font-weight: bold; ">작성된 게시물이 없습니다  :(</span></td>
							</tr>
						</tbody>
					</c:if>	
				</table>	
			</div>
			
			<div class="board_bottom_area">
				<form name="boardSearchForm" id="boardSearchForm">
					<div class="board_search_area">
						<select id="search_date" name="search_date">
							<option value="week">일주일</option>
							<option value="month">한달</option>
							<option value="month3">세달</option>
							<option value="all">전체</option>
						</select>
						
						<select id="search_key" name="search_key">
							<option id="search_key_title_val">제목</option>
							<option id="search_key_con_val">내용</option>
							<option value="name">글쓴이</option>
							<option value="prodname">상품명</option>
						</select>
						<input type="text" id="search" name="search" class="inputTypeText"/>
						<input type="text" style="display: none;"/>
						<input type="hidden" name="boardNo" value="${boardNo}"/>
						<input type="hidden" name="size" value="${size}"/>

						<img style="vertical-align: top; cursor: pointer;" id="search_btn" src="/Semi/images/btn_search.gif" alt="찾기"/> 
						
						<a href="javascript:void(0);" onclick="goWrite('${boardNo}');">
							<img id="write_btn" src="/Semi/images/btn_write.gif" alt="글쓰기">
						</a>
					</div>
				</form>		
			</div>

			<div class="board_paginate">
				${pageBar}
			</div>

		</div>
	</div>
	
<jsp:include page="../../footer.jsp"/>

	