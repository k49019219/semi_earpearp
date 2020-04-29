<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../header.jsp"/>

<style type="text/css">

	body {   
      font-family: 'Open Sans', NanumGothic,'Malgun Gothic', Dotum, sans-serif;
    }

	#wrap_write {
		margin: 100px 0 100px 0;
	}

	#wrap_write #container {
		margin: 0 auto;
	}
	
	#wrap_write .title_area {
		margin: 53px 0 50px;
		text-align: center;
	}
	
	#wrap_write .title_area h2 {
		display: inline-block;
	    letter-spacing: .3px;
	    padding: 0 2px;
	    position: relative;
	    color: #00a0e2;
	    font-weight: 900;
	    font-size: 30px;
	    border-bottom: solid 3px #00a0e2;
	}
	
	#wrap_write .write_area {
		margin: 0 auto;
		width: 85%;
	}	
	
	#wrap_write .write_area form {
		margin: 0 auto;
		width: 100%;
		padding: 30px 0 30px 0;
		border: solid 1px #000000;
		border-top: solid 4px #000000;
	}
	
	#wrap_write .write_area form > div {
		width: 90%;
		margin: 0 auto;
	}
	
	#wrap_write .write_area form ul {
		padding: 0;
	}
	
	#wrap_write .write_area form li {
		margin: 0 auto;
		width: 90%;
		list-style-type: none;
		line-height: 300%;
		border-bottom: solid 1px #e6e6e6;
	}
	
	#wrap_write .write_area form li > label {
		display: inline-block;
		width: 200px;
		font-weight: bold;
		font-size: 13pt;
	}
	
	#wrap_write .write_area form li div {
		display: inline;
	}
	
	#wrap_write .write_area form li div label {
		width: 50px;
	}
	
	#wrap_write .write_area form li div input { 
		margin-right: 30px;
	}
	
	#wrap_write .write_area form textarea {
		width: 100%;
		height: 200px;
		padding: 15px; 
	}
	
	#wrap_write .write_area form input[type=file] {
		display: inline-block;
		line-height: 0;
	}
	
	#wrap_write .write_area form input[type=password], input[type=text] {
		line-height: 0;
	}
	
	#wrap_write .write_area form input[type=password], input[type=text], select {
		padding: 6px 16px;
	}
	
	#wrap_write .write_area form input[type=password], input[type=text], select, textarea {
		border-radius: 4px;
		border: solid 1px #000000;
	}
	
	#wrap_write .btn_area {
		margin: 0 auto;
		width: 85%;
	}
	
	#wrap_write .btn_area button {
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
	
	#wrap_write .btn_area .btnr {
		display: inline-block;
		float: right;
		margin-left: 10px;
	}
}

</style>

<script type="text/javascript">

$(document).ready(function(){
	
	var boardNo = ${boardNo}
	
	$("#write_finish").click(function(){
		
		var frm = document.writeFrm;
		
		if( $("#subject").val().trim() == "" ){
			alert("글 제목을 입력해주세요 :)");
			$("#subject").focus();
			return false;
		}
		
		frm.action="/Semi/board/free/writeAdmin.sa";
		frm.method="POST";
		frm.submit();
		
	});
	
}); // end of $(document).ready(function() --------------

</script>

	<div id="wrap_write">
		<div id="container">
			<div class="title_area">
				<h2>NOTICE</h2>
			</div>
			
		<c:if test="${contentForEditMap == null || contentForEditMap != null}">
			<div class="write_area">
				<form name="writeFrm" enctype="multipart/form-data">					
					<div class="contents">
						<ul>
							<li>
								<label>제 목</label>
								<select id="select" name="select" >
									<option value="공지">공지</option>
									<option value="일반">일반</option>
								</select>
								<input type="text" style="width: 100%;" id="subject" name="subject" value="${contentForEditMap.title}"/>
							</li>
							
							<li>
								<label>내 용</label>
								<textarea id="content" name="content" style="width: 100%; height: 200px; padding: 15px; font-size: 12pt;">${contentForEditMap.content}</textarea>
							</li>
							
							<li>
								<label>첨부파일 1</label>
								<input type="file" name="bImage1"/>
							</li>
							
							<li>
								<label>첨부파일 2</label>
								<input type="file" name="bImage2"/>
							</li>
							
							<li>
								<label>첨부파일 3</label>
								<input type="file" name="bImage3"/>
							</li>
							
							<li>
								<label>첨부파일 4</label>
								<input type="file" name="bImage4"/>
							</li>
							
							<li>
								<label>첨부파일 5</label>
								<input type="file" name="bImage5"/>
							</li>
						</ul>
						<input type="hidden" name="boardNo" value="${boardNo}"/>
						<input type="hidden" name="idx" value="${contentForEditMap.idx}"/>
					</div>
				</form>
			</div>
			
			<div class="btn_area">
				<button type="button" onclick="location.href='${goBackURL2}'">목 록</button>
				<button type="reset" class="btnr" onclick="javascript:history.back();">취 소</button>
				<button type="button" id="write_finish" class="btnr">등 록</button>
			</div>
		</c:if>
		</div>
	</div>

<jsp:include page="../../footer.jsp"/>
	