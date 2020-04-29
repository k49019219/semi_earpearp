<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../header.jsp" />  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 

<style>

	#wrap{
		/* border: solid 1px pink; */
		padding: 35px 50px 35px 50px;
		width: 60%;
		margin: 0 auto;
	}
	
	#fontlogin{
	 	/* border: solid 1px purple; */
	 	padding: 0px 30px 35px 30px;
		text-align: center; 
		color: #00a0e2;
		text-decoration: underline;
		margin: 20px 100px 50px 100px;
	}
	
	#loginbox{
		/* border: solid 1px orange; */
		width: 450px; 
		margin: 0 auto;
		margin-bottom: 70px;
	}
	
	#wrap2{
		/* border: solid 1px black; */
		height: 300px;
	}
	
	#forgot{
	    /* border: solid 1px blue; */
	    text-decoration: none;
	    padding: 0px;
	    
	    
	}

	.linka{
		text-decoration: none;
		border: none;
		color: black;
	}
</style>

<title>Insert title here</title>



<script type="text/javascript">
	
	$(document).ready(function(){

		$("#loginButton").click(function(){
			
			goLogin();
		});
		
		$("#pwd").keydown(function(event){  // keydown : 키보드 눌렀을 때  <-> keyup : 누르고 뗄때
			                                     // event : key down 이벤트
			// 암호입력란에 엔터를 했을 경우, 로그인 시도한다.
			if(event.keyCode == 13) {  // key down 한 이벤트의 키가 1. ==> // 엔터 : keyCode 13 (대소문자 구분!)
				goLogin();
			}
			
		});		
		   
	});  // end of 4(document).ready()==========================
		
	function goLogin(){
		// alert("로그인 처리");
		
		var loginUserid = $("#userid").val().trim();
		var loginPwd = $("#pwd").val().trim();
		
		if(loginUserid == "") {
			alert("아이디 항목은 필수 입력값입니다.");
			$("#userid").val("").focus();
			return;
		}
		else if(loginPwd == "") {
			alert("패스워드 항목은 필수 입력값입니다.");
			$("#pwd").val("").focus();
			return;
		}
		
		var frm = document.loginFrm;
		frm.method = "post";
		frm.action ="<%= request.getContextPath() %>/member/loginEnd.sa";
		frm.submit();
			
	}; // end of goLogin()=================	
		
</script>		


</head>
<body>


<form name="loginFrm">
<div id="wrap">
		<div id="fontlogin"><h4 style="font-weight: bold; text-underline-position: under;">LOG IN</h4></div>
		<div id="wrap2">
		  <div id="loginbox">
			<table id="loginmain" style="display: inline-block; height: 110px;">
				<tr>
					<td style="width: 20%; font-weight: bold; font-size: 14pt;">ID&nbsp;<span class="star"></span></td>
					<td style="width: 80%; text-align: left;">
					    <input type="text" style="border: solid 1.5px black; height: 30px; width: 230px;" name="userid" id="userid" class="requiredInfo" required />&nbsp;&nbsp;
					    <img id="idcheck" style="vertical-align: middle;" />
					</td>
					<td rowspan="2">
					 <a href="#" id="loginButton"><img src="/Semi/images/btn_login.gif"/></a>
					</td> 
				</tr>
				<tr>
					<td style="width: 20%; font-weight: bold; font-size: 14pt;">PASS&nbsp;<span class="star"></span></td>
					<td style="width: 80%; text-align: left;"><input type="password" style="border: solid 1.5px black; height: 30px; width: 230px;"name="pwd" id="pwd" class="requiredInfo" required />
					
					</td>
					
				</tr>			
			</table>
				
				<ul id="forgot" style="font-size: 14pt; font-weight: bold; margin: 15px 0px 15px 0px;"/>
						<li style="display: inline-block;"><a class="linka" href="/Semi/member/idFind.sa">Forgot Your ID? &</a></li>
						<li style="display: inline-block; margin-bottom: 35px;"><a class="linka" href="/Semi/member/passwordFind.sa">Forgot Your Password?</a></li>
				</ul>
			
			<div style="border: solid 1.5px black;"></div><br/>
			
			<table style="width: 100%; height: 70px;">
				<tr>
					<td><span style="border: none; font-size: 14pt; font-weight: bold;">Are you not a member? Join Now!</span></td>
					<td rowspan="2">
					 <a href="/Semi/member/join.sa" style="float:right;"><img  src="/Semi/images/btn_join.gif"/></a>
					</td> 
				</tr>
			</table>
			
			
		</div>
		
	</div>
</div>
</form>

</body>

</html>

<jsp:include page="../footer.jsp" />  
