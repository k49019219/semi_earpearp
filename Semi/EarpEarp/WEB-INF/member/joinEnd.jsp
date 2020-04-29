<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp" /> 

 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
		height: 400px; 
		width: 1200px;
		margin: 0 auto;
		
	}
	
	
	#Find{
		margin-top: 60px;
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
	
	
</style>

<script type="text/javascript">
	
	
</script>

<title>Insert title here</title>
</head>
<body>

<div id="wrap">
	<div id="title_area">
		<p id="title">회원가입 완료<p><br/>
			
		<div id="Find_box">
			<div id="Find">
				<span id="Findid_title">회원가입</span><br/>
				<span id="Join_explain">회원가입이 완료되었습니다.</span>  
			</div>
			
			<div style="border: solid 1px #dfdfdf; width: 400px; margin: 0 auto; margin-top: 15px; height: 30px;">
				<span class="fa fa-exclamation thank" style="color:red;"></span>
				<span class="fa thank" style="font-weight: bold; border:none;">저희 쇼핑몰을 이용해주셔서 감사합니다.</span>
			</div>
			<div id="Join1" style="border: solid 1px #dfdfdf; width: 400px; margin: 0 auto; border-top: hidden;">
				<table style="display: block; width: 1000px;">
					<th id="member_img"><img src="/Semi/images/img_member_default.gif" style="margin: 15px;"></th>
					<td id="member_info" style="width: 250px; padding: 0px;">
				 		<div style="border-left: solid 1px #dfdfdf; line-height: 25px;">
				 		<span>&nbsp;&nbsp;아이디</span> &nbsp;:&nbsp;${userid}<br/>
				 		<span>&nbsp;&nbsp;이름</span>  &nbsp;:&nbsp; ${name}<br/>
				 		<span>&nbsp;&nbsp;이메일</span>  &nbsp;:&nbsp; ${email}
				 		</div>
					</td>	
				</table>
			</div>
			
			   <div style="margin-top: 30px;text-align: center;">
			   		
			   		<a href="/Semi/mainPage.sa"><button class="modify_button" id="button_UpdateCancel" type="button" style="display:inline;">
			   		메인으로 이동</button></a>
			   		
			   </div>
		</div>
	</div>
</div>

</body>
</html>



<jsp:include page="../footer.jsp" />  
 