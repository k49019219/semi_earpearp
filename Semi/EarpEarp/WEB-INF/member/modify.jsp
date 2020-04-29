<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../header.jsp" /> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
  
	#JoinWrap{
		/* border: solid 1px pink;  */
		padding: 35px 50px 35px 50px;
		width: 70%;
		margin: 0 auto;
		
	}
	
 	#titlearea{
	 	/*  border: solid 1px purple;  */ 
	 	padding: 0px 30px 35px 30px;
		text-align: center; 
		color: #00a0e2;
		text-decoration: underline;
		margin: 20px 100px 50px 100px;
	}
	
	.joinTH{
		border: solid 1px #dfdfdf; 
		width: 150px;
		padding: 11px 0px 11px 10px;
		display: inline-block;
		background-color:#fbfafa;
		border-bottom: hidden;
		border-right: hidden;
	}
	
	.joinTD{
	    border: solid 1px #dfdfdf; 
		width: 780px;
		display:inline-block;
		padding: 8px 0px 8px 8px;
		background-color: white;
		border-bottom: hidden;
	}
	
	#memberJoinbutton{
		display: block;
		margin: 30px 0px 10px 0px;
		
	}
	
	#memberJoinbutton1{
		display: block;
		margin: 0px auto;
		float: inherit;
    	cursor: pointer;
	}
	
	span.error {
		color: red;
		font-size: 10pt;
	}
	
	#member_img{
		border: solid 1px #dfdfdf; 
		margin: 15px;
		border-right: hidden;
		
	}
	
	#member_info{
		border: solid 1px #dfdfdf; 
		width: 780px;
	}

	#button_Update{
		width: 120px;
		padding: 2px 8px;
		display: inline-block;
		box-sizing: border-box;
		border: 1px solid transparent;
		border-radius: 2px;
		line-height: 18px;
		vertical-align: middle;
		color: #fff;
		background-color: #666666;
		height: 35px;
		margin-left: 50px;
	}
	
	#button_Update:hover{
		background-color:#4d4d4d;
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
	
	#button_UpdateCancel:hover{
		background-color: #a6a6a6;
	}
	
	#button_Delete{
		float: right;
		border: 1px solid #d1d1d1;
		border-radius: 2px;
		font-size: 12px;
		line-height: 18px;
		color: #222;
		background-color: white;
		padding: 5px;
	}
	
	#button_Delete:hover{
		cursor: pointer;
		background-color: #e6e6e6;
	}
	
	.modify_button{
		margin-left: 7px;
	}
	
	.modify_button:hover{
		cursor: pointer;
		background-color: #008CBA;
	}

	#layer {	     
		border: solid 1px black; 
		width: 300px;    
		color: #ff6666; 
		padding: 10px;
		font-size: 9pt;
		line-height: 1.5;
		background: white;
		position: absolute;
	}   
</style>
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	

	////////////////////////////////////////////// 다음 우편번호 
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	
	 // == 체크박스 전체선택 / 전체해제 에서 
	 //    하위 체크박스에 체크가 1개라도 체크가 해제되면 체크박스 전체선택/전체해제 체크박스도 체크가 해제되고
	 //    하위 체크박스에 체크가 모두 체크가 되어지지면  체크박스 전체선택/전체해제 체크박스도 체크가 되어지도록 하는 것 == // 
	 $(document).ready(function() {
	
		 $("#Gephone_1 option[value='${sessionScope.loginUser.tp1}']").attr("selected", true);
		 $("#phone_1 option[value='${sessionScope.loginUser.hp1}']").attr("selected", true);	
		 
		 $(".Hide_Join1").hide();
		 $(".Hide_Join2").hide();
		 $(".Hide_Join3").hide();
		 
		 ////////////////////////////////////////////////////////////////////////
		 if ( ${ (sessionScope.loginUser).gender } == 1 ) {
			 
			 $('input:radio[name="gender"][value="1"]').prop('checked', true);
		 }
		 else {
			 $('input:radio[name="gender"][value="2"]').prop('checked', true);
		 }
		 
 	
		/////////////////////////////////////////////////////////////////////////
		
		$("input:checkbox[id=allCheck]").click(function(){
			
						var bool = $(this).prop("checked"); 
						
						$("input:checkbox[name=Wholeagree]").prop("checked", bool);
				  });
	 
		$("input:checkbox[name=Wholeagree]").click(function(){
			 
			 var flag = false;
			 
			 $("input:checkbox[name=Wholeagree]").each(function() {
				 var bool = $(this).prop("checked");
				 if(!bool) {
					 $("input:checkbox[id=allCheck]").prop("checked", false);
					 flag = true;
					 return false;
				 }
			 });
			 
			 if(!flag)
				 $("input:checkbox[id=allCheck]").prop("checked", true); 
			 
		 });
		
		
		///////////////////////////////////////////////////////// 회원구분 
		/* 
		$('#Join1_type2').click(function(){
			$('.Hide_Join1').show();
			$('.Hide_Join3').hide();
		});
		
		$('#Join1_type5').click(function(){
			$('.Hide_Join2').show();
			$('.Hide_Join3').hide();
		});
		
		$('#Join1_type3').click(function(){
			$('.Hide_Join3').show();
			$('.Hide_Join1').hide();
			$('.Hide_Join2').hide();
		});
		
		$('#Join1_type1').click(function(){
			$('.Hide_Join1').hide();
			$('.Hide_Join2').hide();
			$('.Hide_Join3').hide();
		});
		
		$('#Join1_type4').click(function(){
			$('.Hide_Join2').hide();
			$('.Hide_Join3').hide();
		}); */
		
		
	//////////////////////////////////////// ================================= 유효성 검사 
	
		$("span.error").css('display','none');
		$("input#userid").blur(function(){
	
//	===========================================================================	아이디
			
		// 조건: 영문소문자 또는 숫자 4~16자로 입력

		var regExp = /^[a-z0-9]{4,16}$/;
		
		// 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기 
		var bool = regExp.test($(this).val());  // 리턴타입은 boolean 
		
		if(!bool) { // 틀린 아이디 입력했을 때 
			$("span.userid_error").css('display','');
		
		}
		
		else {  // 틀린 아이디 에러 메세지를 띄우고 다시 올바르게 아이디를 입력했을 때 
			$("span.userid_error").css('display','none');
		
			$(":input").attr("disabled", false);
			$("input#passwd").focus();
			
			}
		}); // end of $("input#userid").blur(function() ---------------------------
	
//		===========================================================================	비밀번호 

		$("input#pwd").blur(function(){
			
			$('#layer').hide();
			
			//  (영문 대소문자/숫자/특수문자 조합, 8자~16자)
			var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;

			var bool = regExp.test($(this).val());
			
			if(!bool) {
				$("span.pwd_error").css('display','');
			
			}
			
			else {  // 틀린 암호 에러 메세지를 띄우고 다시 올바르게 암호를 입력했을 때 
				$("span.pwd_error").css('display','none');
			
				$(":input").attr("disabled", false);
				}
			}); // end of $("input#passwd").blur(function()
			
		$("input#pwd").focus(function(){
			  
			var lay_pop = $('#layer'); 
			var pos = $('#pwdLayer').offset();     
			      
			var pos_top = pos.top*0.78; 
			
			lay_pop.css('position','absolute');
			lay_pop.css('top', pos_top);    // 레이어 위치 지정
			lay_pop.css('left', pos.left);
			
			lay_pop.show();
	 
		});					
//		 =========================================================================== 비밀번호 확인

		$("input#pwdCheck").blur(function(){
			
			if( $(this).val() != $("input#pwd").val() ){
				$("span.pwdCheck_error").html("&nbsp;비밀번호가 일치하지 않습니다.");
				$("span.pwdCheck_error").css('display','');
			
			}
			
			else {
				$("span.pwdCheck_error").empty();
				
				
			}
		}); // end of $("input#passwdCheck") --------------------
			
		// =========================================================================== 이메일 
		 $("input#email").blur(function(){
			
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
			
			// 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기 
			var bool = regExp.test($(this).val());  // 리턴타입은 boolean 
			
			if(!bool) {
				$("span.email_error").css('display','');
			
			}
			
			else {  // 틀린 아이디 에러 메세지를 띄우고 다시 올바르게 아이디를 입력했을 때 
				$("span.email_error").css('display','none');
				
				}
			
		});		 
		
		
 	}); // end of $(doc"src/my/filter"ument).ready()-------------------------
 
    function goUpdate(){
 		
	   	var pwdbool = myPasswdCheck(document.getElementById("pwd").value);
	  	var pwdCheckbool
	  	 = myPasswdCheck2(document.getElementById("pwd").value, document.getElementById("pwdCheck").value);
	  	 
	  	if ( !pwdbool ) {
			  alert("올바른 비밀번호를 입력하세요.");
			  $("#pwd").val("").focus();
			  return;
		 }
	 	else if ( !pwdCheckbool ) {
			  alert("비밀번호와 비밀번호 확인 값이 동일하지 않습니다.");
			  $("#pwd").val("").focus();
			  $("#pwdCheck").val("")
			  return;
		 }
	 	else if( !$("input:radio[name='emailCheck']").is(":checked") ) {
			  alert("이메일 수신여부에 동의 하세요.");
			  return;
		}  
	 	else {
	 		var frm = document.registerFrm;
		   	 frm.method = "POST";
		   	 frm.action = "memberUpdate.sa";
		   	 frm.submit();
	 	}
 	};
 	
 	function myPasswdCheck(pwd) {
		//  (영문 대소문자/숫자/특수문자 조합, 8자~16자)
		var regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);  
		var bool = regExp.test(pwd);
		return bool;
		
	}; 

	function myPasswdCheck2(pwd, pwdCheck) {
		//  비밀번호 확인
		var pwd = document.getElementById("pwd");
		var pwdCheck = document.getElementById("pwdCheck");
		var bool = true;
		if( pwd.value != pwdCheck.value ){
			bool = false;
		}
		return bool;
	}; 
	
	function goDelete(){
		
	 	var pwdbool = myPasswdCheck(document.getElementById("pwd").value);
	  	var pwdCheckbool
	  	 = myPasswdCheck2(document.getElementById("pwd").value, document.getElementById("pwdCheck").value);
	  	 

	  	var bool = confirm('탈퇴 후 회원님의 마일리지는 0으로 초기화됩니다.\n탈퇴하시겠습니까?');
		if ( bool ){
	 		var frm = document.registerFrm;
		   	frm.method = "POST";
		   	frm.action = "memberDelete.sa";
		   	frm.submit();
		}
	}
	
  	function myClose() {
   	  document.getElementById("layer").style.display = "none";    
	}
	
</script>


<title>Insert title here</title>
</head>
<body>


<form name="registerFrm" method="post">
<div id="JoinWrap">
	<div id="titlearea">
		<h4 style="font-weight: bold; text-underline-position: under;" >회원정보수정</h4>
	</div>
	
	<div id="Join1">
		<table style="display: block; width: 1000px;">
			<th id="member_img"><img src="/Semi/images/img_member_default.gif" style="margin: 15px;"></th>
				<td id="member_info">
				 	<span style="border-left: solid 1px #dfdfdf; padding:25px; font-size: 13pt;">&nbsp;저희 쇼핑몰을 이용해 주셔서 감사합니다.&nbsp;
				 	<span style="font-weight: bold; color: #00a0e2;">${ (sessionScope.loginUser).name } 님</span>
				</td>	
		</table>
	</div>
		
	<div id="Join2">
	<span style="display: block; font-weight: bold; font-size: 12pt; margin:30px 0px 20px 0px;">기본정보</span>
	<span style="display: block; font-size: 8pt; float:right;"><img src="/Semi/images/ico_required_blue.gif">필수입력사항</span>
		<table style="display: block; width: 1000px;">
			<tr>
			<th class="joinTH">아이디<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD">
				 	<input type="text" id="userid" name="userid" value="${sessionScope.loginUser.userid}" readonly/><span class="error userid_error">&nbsp;아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요.</span><span>&nbsp;(영문소문자/숫자, 4~16자)</span>
				</td>
			</tr>		
			<th class="joinTH">비밀번호<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD">
				 	<div id="pwdLayer">
					<input type="password" name="pwd" id="pwd"/><span class="error pwd_error">&nbsp;비밀번호를 올바르게 입력하세요.</span><span>&nbsp;(영문 대소문자/숫자/특수문자 조합, 8자~16자)</span>	
					 </div>		
				</td>	
			<th class="joinTH">비밀번호 확인<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD">
				 	<input type="password" id="pwdCheck"/><span class="error pwdCheck_error">&nbsp;비밀번호가 일치하지 않습니다.</span>
				</td>	
			<th class="joinTH">이름<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD">
				 	<input type="text" name="name" value="${sessionScope.loginUser.name}"/>
				</td>	
			<th class="joinTH" style="height: 106px; padding-top: 40px;">주소</th>
				<td class="joinTD">
				 	<input type="text" name="post" value="${sessionScope.loginUser.post}" id="sample6_postcode" placeholder="&nbsp;우편번호">
				 	 <button type="button" style="cursor: pointer;" onclick="sample6_execDaumPostcode()">우편번호</button><br/>
					<input type="text" name="addr1" value="${sessionScope.loginUser.addr1}" id="sample6_address" placeholder="&nbsp;주소" style="margin: 5px 0px 5px 0px; width:250px; "><br/>
					<input type="text" name="addr2" value="${sessionScope.loginUser.addr2}" id="sample6_detailAddress" placeholder="&nbsp;상세주소">
					
				</td>	
			<th class="joinTH">일반전화</th>
				<td class="joinTD">
					<select name="tp1" id = "Gephone_1" class="myselect">  <!-- select 태그: 블라인드열어서 카테고리보기 -->
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
					</select>-
					<input type="text" name="tp2" value="${sessionScope.loginUser.tp2}" maxlength="4" style="width: 70px"/>-
					<input type="text" name="tp3" value="${sessionScope.loginUser.tp3}" maxlength="4" style="width: 70px"/>				 	

				</td>	
			<th class="joinTH">휴대전화<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD">
				 	<select name="hp1" id = "phone_1" class="myselect">  <!-- select 태그: 블라인드열어서 카테고리보기 -->
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
					</select>-
					<input type="text" name="hp2" value="${sessionScope.loginUser.hp2}" maxlength="4" style="width: 70px"/>-
					<input type="text" name="hp3" value="${sessionScope.loginUser.hp3}" maxlength="4" style="width: 70px"/>
				</td>	
			<th class="joinTH">이메일<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD" >
				 	<input type="text" name="email" value="${sessionScope.loginUser.email}" id="email"/><span class="error email_error">&nbsp;올바른 형식의 이메일을 입력하세요.</span>
				</td>  
			<th class="joinTH" style="height:64px; border-bottom: solid 1px #dfdfdf;" >이메일&nbsp;수신여부<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD" style="border-bottom: solid 1px #dfdfdf;">
					<input id="emailCheck1" type="radio" name="emailCheck" value="1"/><label for="emailCheck1" >&nbsp;수신함</label>
					<input id="emailCheck2" type="radio" name="emailCheck" value="0" /><label for="emailCheck2" >&nbsp;수신안함</label>
					<br/>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.
				</td>	  
		</table>
 	   
 			
	<div id="Join3">
	  <span style="display: block; font-weight: bold; font-size: 12pt; margin:30px 0px 20px 0px;">추가정보</span>	
		<table style="display: block; width: 1000px;">	
			<th class="joinTH">성별<img src="/Semi/images/ico_required_blue.gif"></th>
			<td class="joinTD" style="height: 43px;">
				<input id="Join3_type1" type="radio" name="gender" value="1"/><label for="Join3_type1" style="font-weight: lighter;">&nbsp;남자</label>
				<input id="Join3_type2" type="radio" name="gender" value="2" /><label for="Join3_type2" style="font-weight: lighter;">&nbsp;여자</label>
			</td>
			<th class="joinTH" style="border-bottom: solid 1px #dfdfdf;" >생년월일<img src="/Semi/images/ico_required_blue.gif"></th>
			<td class="joinTD" style="height: 44px; border-bottom: solid 1px #dfdfdf;">
				<input type="text" readonly name="birthdayyy" value="${sessionScope.loginUser.birthdayyy}" maxlength="4" style="width: 70px"/>&nbsp;년&nbsp;
				<input type="text" readonly name="birthdaymm" value="${sessionScope.loginUser.birthdaymm}"  maxlength="2" style="width: 50px"/>&nbsp;월&nbsp;
				<input type="text" readonly name="birthdaydd" value="${sessionScope.loginUser.birthdaydd}" maxlength="2" style="width: 50px"/>&nbsp;일&nbsp;
			</td>
			
		</table>	
	</div>
								
	  <input type="hidden" name="idx" value="${sessionScope.loginUser.idx}" > 
	<div id="Join4">
		
	   <div id="memberUpdate" style="margin-top: 30px; width: 930px; text-align: center;">
	   		<button class="modify_button" onclick ="goUpdate();" id="button_Update" type="button" style="display:inline;">회원정보수정</button>
	   		<button class="modify_button" onclick="location.href='/Semi/mainPage.sa'" id="button_UpdateCancel" type="button" style="display:inline;">취소</button>
	   		<button id="button_Delete" onclick ="goDelete();" type="button">회원탈퇴</button>
	   </div>
		   
	</div>
	
	
		<div id="layer" style="display: none; z-index: 9999;">
		 <div style="padding: 5px 0; font-weight: bold;">
		 	※   비밀번호 입력조건
			<a class="close" onclick="myClose();" tabindex="-1" style="position: relative; top: -5px;">
				<img src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif"/>
			</a>   
		 </div>           
	                  
		 <div>
		 - 대소문자/숫자/특수문자 조합, 8~16자<br/>  
		 - 입력가능 특수문자 <br/>        
		    &nbsp; &nbsp; ~ ' ! @ # $ ^ () _ - = {} [] | ; : < >, . ? /<br/>
		 - 공백 입력 불가능   <br/>
		 </div>
	</div>    
	
	  
</div>
</div>
</form>
</body>

</html>

<jsp:include page="../footer.jsp" />  
