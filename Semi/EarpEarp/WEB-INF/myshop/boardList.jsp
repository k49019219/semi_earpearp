<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<!-- mypage -- board 페이지 -->
<style type="text/css">
	#wrap_commu #container {
		margin: 0 auto;
		width: 85%;
	}
	
	#wrap_commu .title_area {
		margin: 40px 0 30px;
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
		margin-bottom: 50px;
	}
	
	#wrap_commu .basic_table table th {
		font-size: 12pt;
	}
	
	#wrap_commu .basic_table table th, td {
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
	
	#wrap_commu .board_paginate {
		margin: 40px 0 50px 0;
		text-align: center;
	}
	
	#wrap_commu .board_paginate ul {
		display: inline-block;
	  	margin: 0 17px 0 17px;
	    font-size: 0;
	    line-height: 0;
	    padding: 0;
	}
	
	#wrap_commu .board_paginate li {
		display: inline-block;
	}
	
	#wrap_commu .board_paginate li a {
		display: block;
		text-decoration: none;
	    width: 31px;
	    padding: 7px 0 6px;
	    box-sizing: border-box;
	    font-size: 16px;
	    color: #000;
	    font-weight: bold;
	    line-height: 14px;
	    background: #fff;
	    vertical-align: top;
	}
	
	#wrap_commu .board_paginate a.this {
		border: 2px solid #000000;
	}
	
	/* board select tag*/
	#board_sort {
		height : 35px;
		font-size:12pt;
		border : 1px solid #d9d9d9;
	}

	div.select_sort > p {
		margin-bottom:7px;
	}
	
	div#ifNoneContents {
		text-align : center;
		margin : 60px 0;
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

	function goDetailContent(idx, pcode, bno){
		
		if(bno == '2'){
			location.href="/Semi/board/product/content.sa?boardNo="+bno+"&idx="+idx;
		}
		else if(bno == '3'){
			location.href="/Semi/board/product/content.sa?boardNo="+bno+"&idx="+idx+"&prodcode="+pcode;
		}
		
	}
	
	function goDetailAnswer(idx){
		location.href="/Semi/board/product/content.sa?boardNo=2&idx="+idx+"&check=Adm";
	}
	
</script>

<div id="wrap_commu">
	<div id="container">
		<div class="title_area">
			<h2>BOARD</h2>
		</div>
		
		<div class="basic_table">				
			<table>
				<thead>
					<tr>
						<th style="width: 65px;">no</th>
						<th style="width: 180px;">category</th>
						<th>subject</th>
						<th style="width: 200px;">date</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${not empty MyBoardList}">
						<c:forEach var="List" items="${MyBoardList}" varStatus="status">
							<tr style="text-align: center; font-weight: bold;">
								<td>${startIdx-status.index}</td>
								<td>
									<c:if test="${List.boardno eq '2'}">								
										<span style="font-size: 11pt; font-weight: bold;">Q&A</span>
									</c:if>
									<c:if test="${List.boardno eq '3'}">								
										<span style="font-size: 11pt; font-weight: bold;">REVIEW</span>
									</c:if>
								</td>
								<td style="text-align: left; padding-left: 30px;">
									<a href="javascript:void(0);" onclick="goDetailContent('${List.idx}','${List.prodcode}','${List.boardno}');">  
								    	<span style="font-weight: bold; margin-right: 5px;">${List.title}</span>
									</a>
									<c:if test="${List.boardno eq '3' && not empty TitlecomList}">
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
								<td class="writeday">${List.writeday}</td>
								<td style="display: none;">${List.idx}</td>
							</tr>
							
							<c:if test="${not empty AdmComList}">
								<c:forEach var="AdmComList" items ="${AdmComList}">
									<c:if test="${List.idx == AdmComList.fk_qnaidx}">
										<tr style="font-weight: bold;">
											<td></td>
											<td></td>
											<td style="text-align: left; padding-left: 30px;">
												<a href="javascript:void(0);" onclick="goDetailAnswer('${AdmComList.fk_qnaidx}');">  
													<img src="/Semi/images/ico_re.gif" alt="re" style="padding-bottom: 2px;"> ${List.name}님 문의에 대한 답변글
													<img src="/Semi/images/ico_lock.gif" alt="lock" style="padding-bottom: 2px;">
													<c:if test="${AdmComList.admwriteday eq today}">
													<img src="/Semi/images/ico_new.gif" alt="lock" style="padding-bottom: 2px;">
													</c:if>
												</a>
											</td>
											<td></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>
					</tbody>
					
					<c:if test="${ empty MyBoardList }">
						<tbody>
							<tr>
								<td colspan="5" style="padding: 30px 0 30px 0;"><span style="font-size: 12pt; font-weight: bold; ">작성된 게시물이 없습니다  :(</span></td>
							</tr>
						</tbody>
					</c:if>	
			</table>	
		</div> 
		
		<div class="board_paginate">
			${pageBar}
		</div>
	
	</div>
</div>
	
<jsp:include page="../footer.jsp"/>
