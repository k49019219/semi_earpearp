<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <jsp:include page="../header.jsp" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	#wrap{
		/* border: solid 1px red; */	
		padding-bottom: 60px;
	}
	
	
	
	
	#title{
		font-weight: bold;
		text-underline-position: under;
		text-align: center;
		text-decoration: underline;
		font-size: 15pt;
		color: #00a0e2;
		margin-bottom: 45px;
		
	}
	
	.explain{
		text-align: center;
		font-size: 9pt;
	}
	
	#Findid_title{
		font-weight: bold;
		font-size: 15pt;
		/* border: solid 1px green; */
		margin: 0 auto; 
		display: inherit;
		text-align: center;
		
	}
	
	#Find_box{
		border: solid 1px #dfdfdf;
		height: 400px; 
		width: 1200px;
		margin: 0 auto;
		
	}
	
	.first_title{
		/* border: solid 1px red; */
		width: 160px;
		display: inline-block;
	}
	
	#Find{
		margin-top: 60px;
	/* 	border: solid 1px purple; */
		padding: 0px 200px 0px 200px;
	}
	
	#second_Find{
		/* border: solid 1px blue; */
		width: 350px;
		height: 150px;
		margin: 0 auto; 
		padding-top:20px;
		
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
</style>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		$('#phone_Find').hide();
		
		$('#Findradio1').click(function(){
			$('#email_Find').show();
			$('#phone_Find').hide();
		});
		
		$('#Findradio2').click(function(){
			$('#email_Find').hide();
			$('#phone_Find').show();
		});
	});
		
	function findBtn(){
		
		  var frm = document.pwFind;
		  frm.method = "POST";
		  frm.action = "pwFindEnd.sa";
		  frm.submit();
		
	}
	
</script>

<title>Insert title here</title>
</head>
<body>

<form name="pwFind">
<div id="wrap">
	<div id="title_area">
		<p id="title">비밀번호 찾기<p>
			
		<div id="Find_box">
			<div id="Find">
				<span id="Findid_title">비밀번호 찾기</span><br/>
				  <div id="second_Find">
					<span class="first_title">회원유형</span>
					<input type="radio" name="Findradio" value="email" id="Findradio1" checked/><label for="Findradio1">이메일</label>
					<input type="radio" name="Findradio" value="mobile" id="Findradio2"/><label for="Findradio2">휴대폰</label><br/>
					<span class="first_title">아이디</span>
					<input type="text" name="userid" style="width: 179px; height: 30px"/><br/>
					<span class="first_title">이름</span>
					<input type="text" name="name" style="width: 179px; height: 30px; margin:5px 0px 5px 0px " /><br/>
					<div id="email_Find">
						<span class="first_title">이메일로 찾기</span>
						<input class="email_Find" name="email" type="text" style="width: 179px; height: 30px;"/><br/>
					</div>
					<div id="phone_Find" >
						<span class="first_title">휴대폰 번호로 찾기</span>
						<input type="text" name="mobile1" maxlength="3" style="width: 50px; height: 30px"/>-<input name="mobile2" type="text" maxlength="4" style="width: 60px; height: 30px"/>-<input type="text" name="mobile3" maxlength="4" style="width: 60px; height: 30px"/>
				    </div>
				  </div>
			</div>
				<div id="button_box">
				<a type="submit"><img onclick="findBtn();" id="idFind_button" src="/Semi/images/if_Find.png"></a>
				</div>
		</div>
	</div>
</div>
</form>
</body>
</html>



<jsp:include page="../footer.jsp" />  
 