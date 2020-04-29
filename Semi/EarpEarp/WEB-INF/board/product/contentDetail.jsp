<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../../header.jsp"/>

<style type="text/css">

	body {   
      font-family: 'Open Sans', NanumGothic,'Malgun Gothic', Dotum, sans-serif;
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
	
	#wrap_view .product_area {
		margin: 0 auto;
		width: 85%;
		border: solid 1px #e6e6e6;
	}
	
	#wrap_view .product_area table {
		width: 100%;
	}
	
	#wrap_view .product_area table .td_img  {
		width: 10%;
	}
	
	#wrap_view .product_area table img {
		vertical-align: middle;
		max-width: 80px;
		text-align: center;
		margin: 20px;
	}
	
	#wrap_view .product_area table a {
		font-weight: bold;
		text-decoration: none;
		color: #000000;
		font-size: 13pt;
	}
	
	#wrap_view .product_area table a:hover {
		text-decoration: underline;
	}
	
	#wrap_view .product_area table .td_price {
		font-weight: bold;
		color: #00a0e2;
		font-size: 13pt;
	}
	
	
	#wrap_view .empty_area {
		height: 50px;
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
	
	#wrap_view .board_comment {
		margin: 0 auto;
		width: 85%;
		border: solid 1px #e6e6e6;
	}
	
	#wrap_view .board_comment ul {
		list-style-type: none;	
		margin: 15px;
		padding: 0;
		line-height: 200%;
	}
	
	#wrap_view .board_comment ul li .comment_name {
		margin-right: 20px;
		font-weight: bold;
	}
	
	#wrap_view .board_comment ul li .comment_writeday {
		font-size: 10pt;
	}
	
	#wrap_view .board_comment .comment_contents {
		font-size: 10pt; 
		padding: 20px;
	}
	
	#wrap_view .board_comment ul li .li_btns {
		float: right;
	}
	
	#wrap_view .board_comment ul li button {
		margin-left: 10px;
		border: none;
		background-color: #000000;
		color: white;
		font-weight: bold;
		font-size: 10pt;
	}
	
	#wrap_view .contents_edit {
		border: solid 1px #e6e6e6;
		margin: 10px 0 20px 0;
	}
	
	#wrap_view .contents_edit .edit_btns {
		display: inline-block;
	}
	
	#wrap_view .contents_edit .edit_btns button {
		width: 60px;
		height: 60px;
		float: right;
	}
	
	#wrap_view .contents_edit textarea {
		width: 90%;
		height: 80px;
		margin-top: 10px;
		padding: 0;
	}
	
	#wrap_view .comment_area {
		margin: 0 auto;
		width: 85%;
	}
	
	#wrap_view .comment_area .comment_frm span {
		font-weight: bold;
		font-size: 12pt;
	}
	
	#wrap_view .comment_area .comment_frm ul {
		list-style-type: none;
		line-height: 300%;
		padding: 0;
	}
	
	#wrap_view .comment_area .comment_frm ul .li_inline {
		display: inline;
	}
	
	#wrap_view .comment_area .comment_frm ul li label {
		width: 70px;
	}
	
	#wrap_view .comment_area .comment_frm ul li input[type=text], input[type=password] {
		margin-right: 30px;
		height: 25px;
	}
	
	#wrap_view .comment_area .comment_frm ul li textarea {
		width: 100%;
		heigth: 30px;
		padding: 10px;
	}
	
	#wrap_view .areaPlus {
		width: 85%;
		text-align: center;
		margin:  0 auto;
		padding: 40px 0 40px 0;
		font-size: 11pt;
		font-weight: bold;
		border: solid 1px #e6e6e6;
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
		margin-bottom: 50px;
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
	
	#wrap_view .comBoxCss {
		border: solid 1px #e6e6e6;
		display: inline-block;
		margin: 50px 0px 20px 0px;
		width: 100%;
		font-weight: bold;
		text-align: center;
		min-height: 100px;
		padding-top: 40px;
	}
	
	#wrap_view .miniBlackBtn {
		border: none;
		background-color: #000000;
		color: white;
		font-weight: bold;
		font-size: 10pt;
		line-height: 200%;
		float: right;
	}
	
	#wrap_view .miniGrayBtn {
		border: solid 1px #e6e6e6;
		background-color: white;
		color: #000000;
		font-weight: bold;
		font-size: 10pt;
		line-height: 200%;
		float: right;
		border-radius: 2px;
	}
	
	#wrap_view .miniGrayBtn:hover {
		background-color: #e6e6e6;
	}
	
}

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		var boardNo = ${boardNo}
		if(boardNo=='2'){
			$(".title_area").html("<h2>Q&A</h2>");
			$(".for3").html("");
		}
		else if(boardNo=='3'){
			$(".title_area").html("<h2>REVIEW</h2>");
		}
		
		$(".contents_edit").hide();
		
		/////////////// 댓글 ////////////////
		
		goCommentListView();
		
		// 확인버튼을 누르면 
		$("#commentWriteSubmit").click(function(){
			
			var commentContents = $("#commentContents").val().trim();
			   
			var compwdSubmit = $("#compwdSubmit").val().trim();
			
			   if(commentContents == ""){
				   alert("내용을 작성해주세요 :)");
				   return; 
			   }
			
			   if(compwdSubmit == ""){
	               alert("비밀번호를 입력하세요");
	               return;
	           }
			   
			var queryString = $("form[name=commentFrm]").serialize();
			
			 $.ajax({
					   url:"/Semi/board/product/commentRegister.sa",
				   	   type:"POST",
				   	   data:queryString,
				   	   dataType:"JSON",
					   success: function(json){
						   
							   goCommentListView();
						    
							   $("#commentContents").val("").focus();  // 글 게시한 후 글쓰는 칸을 비우기 
						},
					    error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					    }
			   });
			
		}); // end of $("#commentWriteSubmit").click(function()
		

		$(document).on("click", ".com_btn", function(){

			var writeUserid = $(this).prev().prev().text();
		
			var loginUserID = '${(sessionScope.loginUser).userid}';
			 
			if(loginUserID != writeUserid) {
				alert("다른 사람이 쓴 글은 삭제가 불가합니다 :(");
			}
			else {

				var no = $(this).val();
				
				var bool = confirm("정말로 댓글을 삭제하시겠습니까?");
				
				if(bool) {
					$.ajax({
						url:"/Semi/board/product/commentDelete.sa",
						data:{"no":no},
						success:function(){

							location.href="javascript:history.go(0);";
						},
						error:function(){
							
						}
					});
				}
				else {
					alert("댓글 삭제를 취소하셨습니다.");
				}
			
			} 
			
		}); // end of $(document).on("click", ".com_btn", function(){-----------------
		
	
	}); // end of $(document).ready(function() --------------
	
			
	function goContentEdit(idx, qnaidx){
		
		var loginuserStatus = "${sessionScope.loginUser.status}";

		if(loginuserStatus == "1"){
			location.href="/Semi/board/product/write.sa?boardNo=${boardNo}&idx="+idx;
		}
		else if(loginuserStatus == "4"){
			location.href="/Semi/board/product/write.sa?boardNo=${boardNo}&idx="+qnaidx+"&check=Adm";
		}

	} // end of goContentEdit(qnaidx)--------------
	
	function goContentDelete(idx){
		 
		if (confirm("정말로 삭제하시겠습니까?") == true){

			var loginuserStatus = "${sessionScope.loginUser.status}";
			
			if(loginuserStatus == "1"){
				location.href="/Semi/board/product/deletePost.sa?boardNo=${boardNo}&idx="+idx;
			}
			else if(loginuserStatus == "4"){
				location.href="/Semi/board/product/deletePost.sa?boardNo=${boardNo}&idx="+idx+"&check=Adm";
			}
		}
		else {
		     return false;
		}
		
	} // end of goContentDelete(qnaidx)------------
	
	function goAdminComment(idx){
		
		location.href="/Semi/board/product/write.sa?boardNo=${boardNo}&idx="+idx;
		
	} // end of goAdminComment(qnaidx)---------------
	
	
	
	function goCommentListView(){
		
		   $.ajax({
			  url:"/Semi/board/product/commentList.sa",
			  type:"GET",
			  data:{ "revidx":"${DetailContentMap.idx}" }, // ${DetailContentMap.idx}
		   	  dataType:"json",
		   	  success:function(json){
		   		  
				var html = "";
				var idx = "";
				
				if (json.length > 0) { 
					
					$.each(json, function(index, item){
					   html += "<div id='com_top' style='border:solid 1px #e6e6e6; padding: 10px; margin-bottom: 10px;'>"
					         + "<span style='font-weight:bold; margin-right:10px;'>"+item.fk_userid+"</span>"+"&nbsp;"
					         + "<span>"+item.writeDay+"</span>"
					         + "<button type='button' class='com_btn miniGrayBtn' value='"+item.no+"'>삭제</button>"
					         + ""
					         + "<div id='com_bottom' style='margin-top: 15px; padding-left: 10px;'>"
					         + "<span>"+item.commentcontents+"</span>"
					         + "</div>"+"</br></div>";

					   idx = item.no;

					});  
					
				}// end of if -----------------------
				
				else {
					html += "<div class='comBoxCss'>등록된 댓글이 없습니다 :(</div>";
				
				}// end of else --------------------- 
				
				$("#showCommentContents").html(html);	 

		   	  },
		   	  error: function(request, status, error){
			  	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			   }
		   });
		   
	   } // end of function goCommentListView(){ -------------------
	
</script>

<div id="wrap_view">
	<div id="container">
		<div class="title_area"></div>

		<c:if test="${DetailContentMap != null}">
			<c:if test="${DetailContentMap.prodimg != null}">
				<div class="product_area">
					<table>
						<tr>
							<td rowspan="2" class="td_img">
								<img src="/Semi/imgProd/${DetailContentMap.prodimg}" alt="해당상품이미지">
							</td>
						</tr>
						<tr>
							<td><a href="/Semi/product/detail.sa?prodcode=${DetailContentMap.prodcode}&cateno=${DetailContentMap.cateno}">${DetailContentMap.prodname}</a>
								<br><br>
								<span class="td_price"><fmt:formatNumber value="${DetailContentMap.price}" pattern="###,###"/>WON</span>
							</td>
						</tr>
					</table>
				</div>
			</c:if>

			<div class="empty_area"></div>
			
			<div class="view_area">
				<div class="view_contents">
					<table>
						<tbody>
							<c:if test="${ not empty DetailContentMap.title }">
								<tr>
									<th>제 목</th>
									<td>${ DetailContentMap.title }</td>
								</tr>
							</c:if>
							
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
									<div>
										<img src="/Semi/images/${DetailContentMap.image1}" alt="" style="width: 40%; height: 40%; display: block; margin-bottom: 10px;"/>
										<img src="/Semi/images/${DetailContentMap.image2}" alt="" style="width: 40%; height: 40%; display: block; margin-bottom: 10px;"/>
										<img src="/Semi/images/${DetailContentMap.image3}" alt="" style="width: 40%; height: 40%; display: block; margin-bottom: 10px;"/>
										<img src="/Semi/images/${DetailContentMap.image4}" alt="" style="width: 40%; height: 40%; display: block; margin-bottom: 10px;"/>
										<img src="/Semi/images/${DetailContentMap.image5}" alt="" style="width: 40%; height: 40%; display: block; margin-bottom: 10px;"/>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="btn_area">
				<button type="button" onclick="location.href='${goBackURL2}'">목 록</button>
				<c:if test="${(sessionScope.loginUser).userid == DetailContentMap.fk_userid}">
					<button type="button" style="float:right;" onclick="goContentDelete(${DetailContentMap.idx});">삭 제</button>
					<button type="button" style="float:right; margin-right: 10px;" onclick="goContentEdit('${DetailContentMap.idx}','${DetailContentMap.fk_qnaidx}');">수 정</button>
				</c:if>
				<c:if test="${(sessionScope.loginUser).status == 4}">
					<button type="button" style="float:right; margin-right: 10px;" onclick="goAdminComment('${DetailContentMap.idx}')">답 변</button>
				</c:if>
			</div>
		
		<%-- -------------------------------------------------------------------------------------------- --%>
			<div class="empty_area"></div>		
		
			<div class="for3">
				<c:if test="${sessionScope.loginUser == null}">
					<div class="comment_area areaPlus">
						<span>회원에게만 댓글 작성 권한이 있습니다.</span>
					</div>
				</c:if>
				
				<div id="viewComments"></div>	
				
				<div class="comment_area">
		 			<c:if test="${sessionScope.loginUser != null}"> 
						<form name ="commentFrm" class="comment_frm" style="margin-bottom: 30px;">
							<span>댓글달기</span>
							<ul>
								<li class="li_inline">
									<label>작성자</label>
									<input type="text" name="fk_userid" value="${sessionScope.loginUser.userid}">
								</li>
								<li class="li_inline">
									<label>비밀번호</label>
									<input type="password" name="rev_passwd" id="compwdSubmit" maxlength="4">
								</li>
								<li>
									<textarea  name="commentContents" id="commentContents"></textarea>
									<input type="hidden" name="fk_revidx" value="${DetailContentMap.idx}" />   
								</li>
								<li>
									<button type="button" class="miniBlackBtn" id="commentWriteSubmit">확인</button>
								</li>
							</ul>
						</form>
					</c:if>
				
					<div id="showCommentContents" style="margin-top: 70px;"></div>
		
				</div>
			</c:if>
			
			<div class="move_area">
				<table class="move_table">
					<c:if test="${PreNextRev.nextidx != null}">
						<tr>
							<th>
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_move_prev.gif">
								<span>다음글</span>
							</th>
							<td>
							<a href="/Semi/board/product/content.sa?boardNo=${boardNo}&idx=${PreNextRev.nextidx}">
								&nbsp;<span>${PreNextRev.next_title}</span>
							</a>	
							</td>
						</tr>
					</c:if>
					
					<c:if test="${PreNextRev.nextidx == null}">
						<tr>
							<th>
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_move_prev.gif">
								<span>다음글</span>
							</th>
							<td>
								&nbsp;<span>다음 글이 없습니다.</span>
							</td>
						</tr>
					</c:if>
					
					<c:if test="${PreNextRev.preidx != null}">
						<tr>
							<th>
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_move_next.gif">
								<span>이전글</span>
							</th>
							<td><a href="/Semi/board/product/content.sa?boardNo=${boardNo}&idx=${PreNextRev.preidx}">
								&nbsp;<span>${PreNextRev.pre_title}</span>
							</a></td>
						</tr>
					</c:if>
					
					<c:if test="${PreNextRev.preidx == null}">
						<tr>
							<th>
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_move_next.gif">
								<span>이전글</span>
							</th>
							<td>
								&nbsp;<span>이전 글이 없습니다.</span>
							</td>
						</tr>
					</c:if>
				</table>
			</div> 
			
			<div class="same_area">
				<span>관련글 보기</span>
				<table>
					<thead>
						<tr>
							<th style="width: 65px;">no</th>
							<th style="width: 220px;">product</th>
							<th>subject</th>
							<th style="width: 180px;">name</th>
							<th style="width: 200px;">date</th>
						</tr>
					</thead>
					
					<tbody>
					<c:if test="${not empty relationList}">
						<c:forEach var="List" items="${relationList}" varStatus="status">
							<tr style="font-size: 10pt; font-weight: bold;">
								<td>${ status.count }</td>
								<td id="sameReviewSubject">
									${List.prodname}
								</td>
								<td>
									<a style="color: #333333;" href="/Semi/board/product/content.sa?boardNo=${boardNo}&idx=${List.revidx}&prodcode=${List.prodcode}">
										${List.revtitle}
									</a>
								</td>
								<td><span>${List.name}</span></td>
								<td><span>${List.revwriteday}</span></td>
							</tr>
						</c:forEach>
					</c:if>				
					<c:if test="${empty relationList}">
						<tr>
							<td colspan="5" style="padding: 30px 0 30px 0;">
								<span style="font-size: 10pt; font-weight: bold; text-align: center;">관련된 게시물이 없습니다  :(</span>
							</td>
						</tr>
					</c:if>	
					</tbody>
				</table>	
			</div>
			
		<c:if test="${DetailContentMap == null}">
		</c:if>
	</div>
</div>
	
<jsp:include page="../../footer.jsp"/>