<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="../header.jsp" />  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
<style>
	#wrap{
	/* 	border: solid 1px red;	 */
		padding-bottom: 60px;
	}
	
	#title{
		font-weight: bold;
		text-underline-position: under;
		text-align: center;
		text-decoration: underline;
		font-size: 14pt;
		color: #00a0e2;
	}

	
	#Findid_title{
		font-weight: bold;
		font-size: 14pt;
		/* border: solid 1px green; */
		margin: 0 auto; 
		display: inherit;
		text-align: center;
	}

	#Find_box{
		border: solid 1px #dfdfdf;
		width: 1200px;
		margin: 0 auto;
	}
	
	#Find{
		margin-top: 30px;
	/* 	border: solid 1px purple; */
		padding: 0px 200px 0px 200px;
	}
	
	.material-icons{
 		color:#F76560; 
 		font-size: 10pt; 
 		border: solid 1px #ddd;
 		position: relative;
 		top: 3px;
 		padding: 1px;
 		border-radius: 3px;
 		text-align: left;
 	}

	.goBtn{
    	background-color: #4A5164; 
    	color: white;
    	font-size: 12px;
    	padding: 10px 8px;
    	display: inline-block;
		width: 150px;
		height: 40px;
		font-size: 10pt;
		border: solid 1px #4A5164;
	}

	.cancelBtn{
    	background-color: white;
    	color: black;
    	font-size: 12px;
    	padding: 10px 8px;
    	display: inline-block;
		width: 150px;
		height: 40px;
		font-size: 10pt;
		border: solid 1px #ddd;
	}
	
	.goBtn:hover {
		cursor: pointer;
		text-decoration: none;
		color: white; 
	}
	
	.cancelBtn:hover {
		text-decoration: none;
		color: black; 
		background-color: #eee;
		cursor: pointer;
	}
	
	.left {
		width: 150px;
	}
	
	.info {
		color: #00a0e2;
		font-weight: bold;
	}
	
</style>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		$('#selPhone').hide();
		
		$('#Findradio1').click(function(){
			$('#selEmail').show();
			$('#selPhone').hide();
		});
		
		$('#Findradio2').click(function(){
			$('#selEmail').hide();
			$('#selPhone').show();
		});
	});

	
	function goSubmit(){
		
		 var frm = document.pwdEmail;
		  frm.method = "POST";
		  frm.action = "pwEmail.sa";
		  frm.submit();
		
	};

</script>

<title>Insert title here</title>
</head>
<body>

<form name="pwdEmail">
<div id="wrap">
	<div id="title_area">
		<p id="title">비밀번호 찾기<p><br/>
			
		<div id="Find_box">
			<div id="Find">
				<span id="Findid_title">임시 비밀번호 전송</span><br/>
			</div>
			 	
			<div id="Join1" style="font-size: 10pt; width: 500px; padding: 10px; margin: 0 auto; border-top: hidden;">
				<table style="display: block; width: 1000px;">
					<tr>
						<td class="left">임시 비밀번호</td>
						<td>
						<input type="radio" name="Findradio" value="email" id="Findradio1" checked/><label for="Findradio1">이메일</label>
						</td>
						<td>
						<input type="radio" name="Findradio" value="mobile" id="Findradio2"/><label for="Findradio2">휴대폰</label><br/>
						</td>
					</tr>
					
					<tr id="selEmail">
						<td class="left">이메일</td>
						<td class="info"><input name="email" type="text" value="${email}" style="border: none;"/></td>
					</tr>
					
					<tr id="selPhone">
						<td class="left">휴대폰 번호 </td>
						<td class="info"><input name="mobile" type="text" value="${mobile1}-${mobile2}-${mobile3}" style="border: none;" /></td>
					</tr>
				</table>
			</div>
			
			<input type="hidden" name="userid" value="${userid}" />
		
			 <div style="margin-top: 20px; text-align: center; margin-bottom: 30px; ">
			   	<span id="footerBtn">
					<a onclick="goSubmit();" class="goBtn" style="color: white; text-decoration: none;"> 임시 비밀번호 전송</a>
					<a href="/Semi/mainPage.sa" class="cancelBtn">취소</a>
				</span>
			 </div>
		</div>
	</div>
</div>
</form>
</body>
</html>


<jsp:include page="../footer.jsp" />  