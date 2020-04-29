<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../header.jsp"/>

<style type="text/css">

	body {   
      font-family: 'Open Sans', NanumGothic,'Malgun Gothic', Dotum, sans-serif;
    }

	#wrap_view {
		margin: 100px 0 100px 0;
	}

	#wrap_view #container {
		margin: 0 auto;
	}
	
	#wrap_view .title_area {
		margin: 53px 0 50px;
		text-align: center;
	}
	
	#wrap_view .title_area h2 {
		display: inline-block;
	    letter-spacing: .3px;
	    padding: 0 2px;
	    position: relative;
	    color: #00a0e2;
	    font-weight: 900;
	    font-size: 30px;
	    border-bottom: solid 3px #00a0e2;
	}
	
	#wrap_view .view_area {
		margin: 0 auto;
		width: 85%;
		padding: 30px 0 30px 0;
		border: solid 1px #000000;
		border-top: solid 4px #000000;
	}	
	
	#wrap_view .view_area .view_contents {
		width: 90%;
		margin: 0 auto;
	}
	
	#wrap_view .view_area .view_contents table {
		line-height: 300%;
		width: 100%;
	}
	
	#wrap_view .view_area .view_contents table tbody th {
		width: 10%;
		font-size: 13pt;
		font-weight: bold;
	}
	
	#wrap_view .view_area .view_contents table tbody ul {
		margin: 0 auto;
	    width: 100%;
	    padding-left: 10px;
	    list-style-type: none;
	    border-bottom: solid 1px #e6e6e6;
	}
	
	#wrap_view .view_area .view_contents table tbody ul li {
		margin-top: 20px;
		font-size: 10pt;
	}
	
	#wrap_view .view_area .view_contents table tbody ul li b {
		margin-right: 10px;
	}
	
	#wrap_view .view_area .view_contents #imgArea img {
		margin: 0 auto; 
		display: block; 
		margin-bottom: 10px;
	}
	
	#wrap_view .btn_area {
		margin: 0 auto;
		width: 85%;
	}
	
	#wrap_view .btn_area button {
		width: 100px;
		height:40px;
		color: white;
		font-size: 12pt;
		font-weight: bold;
		background-color: #000000;
		margin: 30px 0 30px 0;
		cursor: pointer;
		border: none;
		text-align: center;
		text-decoration: none;
		display: inline-block;
	}
	
	#wrap_view .move_area {
		margin: 0 auto;
		width: 85%;
	}
	
	#wrap_view .move_area .move_table {
		line-height: 300%;
		margin-top: 50px;
		width: 100%;
	}
	
	#wrap_view .move_area .move_table tr {
		border-bottom: solid 1px #e6e6e6;
		
	}
	
	#wrap_view .move_area .move_table th {
		width: 10%;
		padding-left: 30px;
	}
	
	#wrap_view .move_area .move_table td a {
		text-decoration: none;
		color: #000000;
	}
	
	#wrap_view .move_area .move_table td a:hover {
		text-decoration: underline;
	}
	
	#wrap_view .same_area {
		margin: 0 auto;
		width: 85%;
		padding-top: 60px;
	}
	
	#wrap_view .same_area span {
		font-weight: bold;
		
		font-size: 12pt;
	}
	
	#wrap_view .same_area table {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		line-height: 250%;
	}
	
	#wrap_view .same_area table th {
		text-align: center;
		border-bottom: solid 1px #e6e6e6;
	}
	
}

</style>

<script type="text/javascript">

	$(document).ready(function(){
	
	}); // end of $(document).ready(function() --------------
		
	function goContentEdit(idx){
		
		location.href="/Semi/board/free/writeAdmin.sa?boardNo=${boardNo}&idx="+idx;
		
	} // end of goContentEdit(qnaidx)--------------
	
	function goContentDelete(idx){
		 
		if (confirm("정말로 삭제하시겠습니까?") == true){
	
			location.href="/Semi/board/free/deletePost.sa?boardNo=${boardNo}&idx="+idx;
		
		}
		else {
		     return false;
		}
		
	} // end of goContentDelete(qnaidx)------------

</script>

	<div id="wrap_view">
		<div id="container">
			<div class="title_area">
				<h2>NOTICE</h2>
			</div>
			
			<c:if test="${ DetailContentMap != null }">			
				<div class="view_area">
					<div class="view_contents">
						<table>
							<tbody>
								<tr>
									<th>제 목</th>
									<td>${ DetailContentMap.title }</td>
								</tr>
								
								<tr>
									<th>작성자</th>
									<td>${ DetailContentMap.name }</td>
								</tr>
								
								<tr>
									<td colspan="2">
										<ul>
											<li><b>작성일</b><span id="writeDate">${ DetailContentMap.writeday }</span></li>
										</ul>
										<div id="contents" style="margin-bottom: 10px;">
										${ DetailContentMap.content }
										</div>
										<div id="imgArea">
										<img src="/Semi/images/${DetailContentMap.image1}" alt=""/>
										<img src="/Semi/images/${DetailContentMap.image2}" alt=""/>
										<img src="/Semi/images/${DetailContentMap.image3}" alt=""/>
										<img src="/Semi/images/${DetailContentMap.image4}" alt=""/>
										<img src="/Semi/images/${DetailContentMap.image5}" alt=""/>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="btn_area">
					<button type="button" onclick="location.href='${goBackURL2}'">목 록</button>
					<c:if test="${(sessionScope.loginUser).status == DetailContentMap.status}">
						<button type="button" style="float:right;" onclick="goContentDelete(${DetailContentMap.idx});">삭 제</button>
						<button type="button" style="float:right; margin-right: 10px;" onclick="goContentEdit(${DetailContentMap.idx});">수 정</button>
					</c:if>
				</div>
			</c:if>
			
			<div class="move_area">
				<table class="move_table">
					<c:if test="${not empty PreNextPostMap.next_title}">
						<tr>
							<th>
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_move_prev.gif">
								<span>다음글</span>
							</th>
							<td>
								<a href="javascript:location.href='/Semi/board/free/noticeDetail.sa?boardNo=1&idx=${PreNextPostMap.nextidx}'">
								<span>${PreNextPostMap.next_title}</span>
								</a>
							</td>
						</tr>
					</c:if>
					<c:if test="${not empty PreNextPostMap.pre_title}">
						<tr>
							<th>
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_move_next.gif">
								<span>이전글</span>
							</th>
							<td>
								<a href="javascript:location.href='/Semi/board/free/noticeDetail.sa?boardNo=1&idx=${PreNextPostMap.preidx}'">
								<span>${PreNextPostMap.pre_title}</span>
								</a>
							</td>
						</tr>
					</c:if>
				</table>
			</div>
	
			
		</div>
	</div>
	
<jsp:include page="../../footer.jsp"/>