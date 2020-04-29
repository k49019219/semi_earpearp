<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">

	body {
	
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;s
	
	}

	th {
	
		width : 100px;
		background-color : #00a0e2;
		color : white;
		
	}
	
	tr {
		
		line-height: 200%;
	}
	
	h3 {
	
		color : #00a0e2;
		margin-bottom: 10px;
		
	}
	td {
		
		padding-left: 20px;
	}

	.cancelBtn {
	
		    display: inline-block;
		    box-sizing: border-box;
		    padding: 2px 8px;
		    border: 1px solid #d1d1d1;
		    border-radius: 2px;
		    font-family: "굴림",Gulim;
		    font-size: 12px;
		    line-height: 18px;
		    text-align: center;
		    color: #222;
		    background-color: white;
		    cursor : pointer;
		     
	}

</style>

<script type="text/javascript" >
	
	$(function() {
		
		$(".cancelBtn").click(function() {
			
			self.close();
			
		});
	});
	

</script>
</head>
<body>
	<div style = "text-align : center;  border-bottom : 3px solid #00a0e2; width : 100px; margin-bottom: 20px; " >
		<h3>회원 정보</h3>
	</div>
	<table>
			<tr>
				<th scope = "row">회원번호</th>
				<td>${ user.idx }</td>
			</tr>
			<tr>
				<th scope = "row">아이디</th>
				<td>${ user.userid }</td>
			</tr>
			<tr>
				<th scope = "row">회원명</th>
				<td>${ user.name }</td>
			</tr>
			<tr>
				<th scope = "row">이메일</th>
				<td>${ user.email }</td>
			</tr>
			<tr>
				<th scope = "row">휴대폰</th>
				<td>${ user.hp1 } - ${ user.hp2 } - ${ user.hp3 }</td>
			</tr>
			<tr>
				<th scope = "row">우편번호</th>
				<td>${ user.post }</td>
			</tr>
			<tr>
				<th scope = "row">주소</th>
				<td>${ user.addr1 }</td>
				<td>${ user.addr2 }</td>
			</tr>
			<tr>
				<th scope = "row">성별</th>
				<td>
					<c:if test="${user.gender == 1}"> 남성 </c:if>
					<c:if test="${user.gender == 2}"> 여성 </c:if>
				</td>
			</tr>
			<tr>
				<th scope = "row">생년월일</th>
				<td>${ user.birthdayyy } / ${ user.birthdaymm } / ${ user.birthdaydd }</td>
			</tr>
			<tr>
				<th scope = "row">가입일자</th>
				<td>${ user.registerday }</td>
			</tr>
	</table>
	<div style = "width:419px; text-align: center; margin-top: 18px;">
		<button class="cancelBtn" >확인</button>
	</div>
</body>
</html>