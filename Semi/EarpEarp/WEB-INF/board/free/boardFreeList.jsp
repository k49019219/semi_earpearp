<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../header.jsp"/>

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

<script>
	
	$(document).ready(function(){
		
		var boardNo = "${boardNo}"
		var search_date = "${search_date}"
		var search_key = "${search_key}"

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
		
		$("#search").bind("keydown",function(event){
			if(event.keyCode == 13){
				goSearch();
			}
		});
		
 		// 검색 버튼을 눌렀을 경우 아무것도 적지 않았거나 공백일 경우 alert가 뜹니다.
		// 그 반대의 경우는 submit으로 DB select
		$("#search_btn").click(function(){
			
			goSearch();
			
		}); // end of $("#search_btn").click(function(){------------
		
	}); // end of document ready -------------
	
	function goDetailContent(idx){

		
		location.href="/Semi/board/free/noticeDetail.sa?boardNo=${boardNo}&idx="+idx;

	}
	
	function goSearch(){
		
	var frm = document.boardSearchForm;
			
		frm.action="/Semi/board/free/list.sa";
		frm.method="GET";
		frm.submit();
		
	} // end of goSearch()------------------
	
	function goWrite(boardNo){
		
		location.href="/Semi/board/free/writeAdmin.sa?boardNo=${boardNo}";
		
	} // end of goWrite()------------------
	
	
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
							<th>subject</th>
							<th style="width: 180px;">name</th>
							<th style="width: 180px;">date</th>
						</tr>
					</thead>
					
					
					<c:if test="${not empty boardList}">
						<c:forEach var="List" items="${boardList}" varStatus="status">
							<tbody>
								<tr style="text-align: center;">
									<c:if test="${List.subject eq '공지'}">
										<td>${List.subject}</td>
									</c:if>
									<c:if test="${List.subject eq '일반'}">
										<td>${startIdx-status.index}</td>
									</c:if>
									<td style="text-align: left; padding-left: 30px;">
										<a href="javascript:void(0);" onclick="goDetailContent(${List.idx});">  
									    	<span style="font-weight: bold; margin-right: 5px;">${List.title}</span>
										</a>
										<c:if test="${List.writeday eq today}">
										<img src="/Semi/images/ico_new.gif" alt="lock" style="padding-bottom: 2px;">
										</c:if>
									</td>
									<td style="font-weight: bold;">${List.name}</td>
									<td>${List.writeday}</td>
									<td style="display: none;">${List.idx}</td>
								</tr>
							</tbody>
						</c:forEach>
					</c:if>

					
					<c:if test="${ empty boardList }">
						<tbody>
							<tr>
								<td colspan="5" style="padding: 30px 0 30px 0;"><span style="font-size: 13pt; font-weight: bold; ">작성된 게시물이 없습니다  :(</span></td>
							</tr>
						</tbody>
					</c:if>	
				</table>	
			</div>
			
			<div class="board_bottom_area clear">
				<form name="boardSearchForm" id="boardSearchForm">
					<div class="board_search_area">
						<select id="search_date" name="search_date">
							<option value="week">일주일</option>
							<option value="month">한달</option>
							<option value="month3">세달</option>
							<option value="all">전체</option>
						</select>
						
						<select id="search_key" name="search_key">
							<option value="notititle">제목</option>
							<option value="noticontent">내용</option>
						</select>
						<input type="text" id="search" name="search" class="inputTypeText">
						<input type="text" style="display: none;"/>
						<input type="hidden" name="boardNo" value="${boardNo}"/>
						<input type="hidden" name="size" value="${size}"/>

						<img style="vertical-align: top; cursor: pointer;" id="search_btn" src="/Semi/images/btn_search.gif" alt="찾기"/> 
						
						<c:if test="${sessionScope.loginUser.status eq '4'}">
							<a href="javascript:void(0);" onclick="goWrite('${boardNo}');">
								<img id="write_btn" src="/Semi/images/btn_write.gif" alt="글쓰기">
							</a>
						</c:if>
						
					</div>
				</form>		
			</div>

			<div class="board_paginate" >
				${pageBar}
			</div>
			
		</div>
	</div>
	
<jsp:include page="../../footer.jsp"/>
