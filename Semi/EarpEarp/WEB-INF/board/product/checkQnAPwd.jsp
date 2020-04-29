<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	
	#wrap_view .check_area {
		width: 85%;
		height: 350px;
		border: solid 1px #e6e6e6;
		margin: 0 auto;
		text-align: center;
		padding: 30px 0 30px 0;
	}

	#wrap_view .check_area h3 {
		font-weight: bold;
	}

	#wrap_view .check_area .notice {
		font-size: 10pt;
	}
	
	#wrap_view .check_area .notice_blue {
		color: #00a0e2;
		font-weight: bold;
	}
	
	#wrap_view .check_area form {
		margin: 60px 0 70px 0;
	}
	
	#wrap_view .check_area label {
		width: 100px;
		text-align: left;
	}
	
	#wrap_view .check_area .choice_area button {
		width: 100px;
		height: 40px;
		border: none;
		background-color: #000000;
		color: white;
		font-weight: bold;
		font-size: 12pt;
	}
	
	#wrap_view .check_area .choice_area button:last-child {
		margin-left: 20px;
	}
}
	
</style>


<script type="text/javascript">

	$(document).ready(function(){
		
		var boardNo = ${boardNo}
		if(boardNo=='2'){
			$(".title_area").html("<h2>Q&A</h2>");
		}
		else if(boardNo=='3'){
			$(".title_area").html("<h2>REVIEW</h2>");
		}
		
	}); // end of document ready -------------
	
	function goCheckPwd(){
		
		var frm = document.contentEditFrm;
		
		if( $("#contentEditPwd").val().trim() == "" ){
			alert("비밀번호를 입력해주세요 !");
			$("#contentEditPwd").focus();
			return false;
		}
		
		var regExp = /^[0-9]{4}$/;
		
		var bool = regExp.test($("#contentEditPwd").val().trim());
		if(!bool){
			alert("비밀번호는 숫자 4자리로만 작성해주세요 :)");
			return false;
		}
		
		frm.action = "/Semi/board/product/checkQnAPwd.sa";
		frm.method = "POST";
		frm.submit();
		
	}

</script>

<div id="wrap_view">
	<div id="container">
		<div class="title_area">
		</div>
		
		<div class="check_area">
			<h3>게시글 수정 및 삭제</h3> 
			<br>
			<span class="notice">게시글 등록 시 입력한&nbsp;<span class="notice_blue">비밀번호를 입력해주세요.</span></span>
			
			<form name="contentEditFrm">
				<label>비밀번호</label>
				<input type="password" id="contentEditPwd" name="contentEditPwd" maxlength="4" autofocus>
				<input type="hidden" name="idx" value="${idx}"/>
				<input type="hidden" name="boardNo" value="${boardNo}"/>
				<input type="text" style="display: none;">
			</form>
			
			<div class="choice_area">
				<button type="button" onclick="javascript:history.back();">취소</button>				
				<button type="button" onclick="goCheckPwd()">확인</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../../footer.jsp"/>

