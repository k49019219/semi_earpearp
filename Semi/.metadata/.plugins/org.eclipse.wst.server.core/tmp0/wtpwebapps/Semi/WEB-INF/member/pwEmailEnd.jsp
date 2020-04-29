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
	
	#Join_explain{
		font-weight: bold;
		font-size: 15pt;
		margin: 0 auto; 
		display: inherit;
		text-align: center;
		color: #00a0e2;
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
	
	
	#button_box{
	/* 	border: solid 1px orange; */
		padding: 20px 0px 20px 0px;
	}
	
	#idFind_button{
		display: block;
		margin: 0px auto;
		float: inherit;
    	cursor: pointer;
    	}
    	
    .fa{
    	padding: 0px 5px 0px 5px;
    	margin-left: 5px;
    }	 
    .thank{
    	border: solid 1px #dfdfdf;
    	margin-top: 6px;
    }
    
    #button_UpdateCancel{
		width: 120px;
		padding: 2px 8px;
		display: inline-block;
		box-sizing: border-box;
		border: 1px solid transparent;
		border-radius: 2px;
		line-height: 18px;
		vertical-align: middle;
		color: #fff;
		background-color: #bfbfbf;
		height: 35px;
	}
	
	 #button_UpdateCancel:hover {
		background-color: #a6a6a6;
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
	
		
	.loginBtn{
    	background-color: #4A5164; 
    	color: white;
    	font-size: 12px;
    	padding: 10px 8px;
    	display: inline-block;
		width: 120px;
		height: 40px;
		font-size: 10pt;
	}

	.loginBtn:hover {
		text-decoration: none;
		color: white; 
	}
	
	
</style>

<script type="text/javascript">
	
	
</script>

<title>Insert title here</title>
</head>
<body>

<div id="wrap">
	<div id="title_area">
		<p id="title">비밀번호 찾기<p><br/>
			
		<div id="Find_box">
			<div id="Find">
				<span id="Findid_title">비밀번호 찾기</span><br/>
				<span id="Join_explain">임시 비밀번호가 고객님 메일로 전송되었습니다.</span>  
			</div>
			 	
			<div style="border: solid 1px #dfdfdf; background-color: #eee; width: 500px; margin: 0 auto; margin-top: 15px; padding: 5px;">
				<i class="material-icons" style="position: relative; top: -0.5px; left: 5px;">priority_high</i>
				<span class="fa thank" style="font-weight: bold; border:none; font-size: 9pt; line-height: 18px; ">
				저희 쇼핑몰을 이용해주셔서 감사합니다.<br/>
			</div>
			
			<div id="Join1" style="font-size: 9pt; border: solid 1px #dfdfdf; width: 500px; padding: 10px; margin: 0 auto; border-top: hidden;">
				<table style="display: block; width: 1000px;">
					<th id="member_img"><img src="/Semi/images/img_member_default.gif" style="margin: 15px;"></th>
					<c:if test="${n == 1}">
						<td id="member_info" style="width: 300px; padding: 5px;">
					 		<div style="border-left: solid 1px #dfdfdf; line-height: 25px; padding-left: 10px;">
						 		<span style="color:#00a0e2; font-weight: bold;">${userid}</span> &nbsp;회원님,&nbsp;임시&nbsp;비밀번호를 <br/>
						 		<span style="color:#00a0e2; font-weight: bold;">${email}</span> &nbsp; 으로 보내드렸습니다.<br/>
						 		<span>고객님 즐거운 쇼핑 하세요!</span>
					 		</div>
						</td>	
					</c:if>
					       
					<c:if test="${n == -1}">
						<td>
	   	   				<span style="color:red;">메일 발송이 실패했습니다.</span> 
	   	   				</td>	
	   	   			</c:if>
					
				</table>
			</div>
			
			<div style="text-align: center; color: gray; font-size: 9pt; margin-top: 10px;">
			고객님의 비밀번호가 성공적으로 발송되었습니다. <br/>
			항상 고객님의 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.
			</div>
			
			 <div style="margin-top: 20px; text-align: center; margin-bottom: 30px; ">
			   	<span id="footerBtn">
					<a href="login.sa" class="loginBtn" style="color: white; text-decoration: none;"> 로그인</a>
				</span>
			 </div>
		</div>
	</div>
</div>

</body>
</html>


<jsp:include page="../footer.jsp" />  