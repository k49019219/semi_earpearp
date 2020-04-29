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

	.pwfindBtn{
    	background-color: #84868B;
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
	
	.pwfindBtn:hover {
		text-decoration: none;
		color: white; 
		background-color: gray;
	}
	
	
</style>

<script type="text/javascript">
	
	
</script>

<title>Insert title here</title>
</head>
<body>

<div id="wrap">
	<div id="title_area">
		<p id="title">아이디 찾기<p><br/>
			
		<div id="Find_box">
			<div id="Find">
				<span id="Findid_title">아이디 찾기</span><br/>
				<span id="Join_explain">고객님 아이디 찾기가 완료 되었습니다.</span>  
			</div>
			 	
			<div style="border: solid 1px #dfdfdf; background-color: #eee; width: 500px; margin: 0 auto; margin-top: 15px; padding: 5px;">
				<i class="material-icons" style="position: relative; top: -8px; left: 5px;">priority_high</i>
				<span class="fa thank" style="font-weight: bold; border:none; font-size: 9pt; line-height: 18px; ">
				저희 쇼핑몰을 이용해주셔서 감사합니다.<br/>
				다음정보로 가입된 아이디가 총 <span id="findNum" style="color: #00a0e2"> 1 </span>개 있습니다.</span>
			</div>
			<div id="Join1" style="font-size: 9pt; border: solid 1px #dfdfdf; width: 500px; padding: 10px; margin: 0 auto; border-top: hidden;">
				<table style="display: block; width: 1000px;">
					<th id="member_img"><img src="/Semi/images/img_member_default.gif" style="margin: 15px;"></th>
					<td id="member_info" style="width: 300px; padding: 5px;">
				 		<div style="border-left: solid 1px #dfdfdf; line-height: 25px; padding-left: 10px;">
					 		<span>이름</span> &nbsp;:&nbsp;<span style="font-weight: bold;">${name}</span><br/>
					 		
					 		<c:if test="${ type.equals('mobile') }">
					 		<span>휴대폰번호</span>&nbsp;:&nbsp; ${mobile1}-${mobile2}-${mobile3}<br/>
					 		</c:if>
					 		<c:if test="${type.equals('email')}">
					 		<span>이메일</span>&nbsp;:&nbsp; ${email}<br/>
					 		</c:if>
					 		
					 		<span>아이디&nbsp;:&nbsp;<span style="font-weight: bold;">${userid}</span>&nbsp;(개인회원, <fmt:formatDate value="${registerday}" pattern="yyyy-MM-dd" />&nbsp;가입)<br/>
					 		</span>
					 		<span>고객님 즐거운 쇼핑 하세요!</span>
				 		</div>
					</td>	
				</table>
			</div>
			
			<div style="text-align: center; color: gray; font-size: 9pt; margin-top: 10px;">
			고객님의 아이디 찾기가 성공적으로 이루어졌습니다. <br/>
			항상 고객님의 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.
			</div>
			
			 <div style="margin-top: 20px; text-align: center; margin-bottom: 30px; ">
			   	<span id="footerBtn">
					<a href="login.sa" class="loginBtn" style="color: white; text-decoration: none;"> 로그인</a>
					<a href="passwordFind.sa" class="pwfindBtn" style="color: white; text-decoration: none;">비밀번호 찾기</a>
				</span>
			 </div>
		</div>
	</div>
</div>

</body>
</html>


<jsp:include page="../footer.jsp" />  