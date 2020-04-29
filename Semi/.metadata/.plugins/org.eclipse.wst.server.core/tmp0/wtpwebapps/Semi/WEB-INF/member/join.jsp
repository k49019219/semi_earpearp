<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="../header.jsp" /> 

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
		margin: 0px 100px 50px 100px;
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
	
		 $(".Hide_Join1").hide();
		 $(".Hide_Join2").hide();
		 $(".Hide_Join3").hide();
		 
		 $("input:checkbox[id=allCheck]").click(function(){
			
						var bool = $(this).prop("checked"); 
						
						$("input:checkbox[class=Wholeagree]").prop("checked", bool);
				  });
	 
		 $("input:checkbox[class=Wholeagree]").click(function(){
			 
			 var flag = false;
			 
			 $("input:checkbox[class=Wholeagree]").each(function() {
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
		+
		
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
		

	//===========================================================================	아이디
			
		$("#userid").blur(function(){
				
			// 조건: 영문소문자 또는 숫자 4~16자로 입력
	
			var bool = myUseridCheck($(this).val());
			
			if(!bool) { // 틀린 아이디 입력했을 때 
				$("span.userid_error").html("&nbsp;아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요.");
				$("span.userid_error").css('display','');
				$("#idInfo").css('display','none');
			}
			else {
				isExistIdCheck();
			}
		
		}); // end of $("input#userid").blur(function() ---------------------------
	
//		===========================================================================	비밀번호 

		$("input#pwd").blur(function(){
			//  (영문 대소문자/숫자/특수문자 조합, 8자~16자)
			
			$("#layer").css('display','none');
			
			var bool = myPasswdCheck($(this).val());
			
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
			     
			var pos_top = pos.top*0.75; 
			
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
 

	function goRegister(event) {
	  
	  var useridbool = myUseridCheck(document.getElementById("userid").value)
	  var idDuplicate = document.getElementById("idDuplicate").value;
	  var pwdbool = myPasswdCheck(document.getElementById("pwd").value);
	  var pwdCheckbool
	  = myPasswdCheck2(document.getElementById("pwd").value, document.getElementById("pwdCheck").value);
	  var email = document.getElementById("email");
	  var emailbool = myEmailCheck(email.value);
	  
	  // 휴대폰 유효성 검사 
	  var hp2 = document.getElementById("hp2");
	  var hp3 = document.getElementById("hp3");
	  var regExp1 = /^[1-9][0-9]{2,3}$/;
	  var regExp2 = /^\d{4}$/;
	  var hp2bool = regExp1.test(hp2.value);
	  var hp3bool = regExp2.test(hp3.value);
	  
	  // 생년월일 유효성 검사
	  var birthYear = document.getElementById("birthdayyy");
	  var regExp3 = /^(19|20)\d{2}$/;        // \d 는 [0-9] 와 같음 	
	  var bYbool = regExp3.test(birthYear.value);
	  var birthMM = document.getElementById("birthdaymm").value;
	  var birthDate = document.getElementById("birthdaydd").value;
		 
	  var now = new Date();
	  var currentYear = now.getFullYear(); 
		
		
	  if( $("#userid").val().trim() == "" ) {
		  alert("아이디 항목은 필수 입력값입니다.");
		  $("#userid").focus();
		  return;
	  }  
	  else if (!useridbool) {
		  alert("올바른 아이디를 입력하세요.");
		  $("#userid").val("").focus();
		  return;
	  }
	  else if (!idDuplicate) {
		  alert("이미 사용중인 아이디입니다.");
		  $("#userid").val("").focus();
		  return;
	  }
	  else if( $("#pwd").val().trim() == "" ||  $("#pwdCheck").val().trim() == ""  ) {
		  alert("비밀번호 항목은 필수 입력값입니다.");
		  $("#pwd").val("");
		  $("#pwdCheck").val("");
		  $("#pwd").focus();
		  return;
	  }
	  else if ( !pwdbool ) {
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
	  else if ( $("#name").val().trim() == "" ) {
		  alert("이름 항목은 필수 입력값입니다.");
		  return;
	  } 
	  else if ( $("#hp2").val().trim() == "" ) {
		  alert("휴대전화 항목은 필수 입력값입니다.");
		  $("#hp2").val("").focus();
		  return;
	  } 
	  else if (!hp2bool || !hp3bool) {
	      alert("올바른 휴대전화번호를 입력 하세요.");
	      $("#hp2").val("").focus();
	       return;
	  }
	  else if ( $("#email").val().trim() == "" ) {
		  alert("이메일 항목은 필수 입력값입니다.");
		  $("#email").focus();
		  return;
	  } 
	  else if (!emailbool) {
	        alert("입력하신 이메일을 사용할 수 없습니다.");
	        $("#email").val("").focus();
	    	return;
	   }
	  else if( !$("input:radio[name=gender]").is(":checked")) {
		  alert("성별을 선택하셔야 합니다.");
		  return;
	  }
	  else if ( $("#birthdayyy").val().trim() == ""
			     || $("#birthdaymm").val().trim() == "" 
			     || $("#birthdaydd").val().trim() == ""  ) {
		  alert("생년월일 항목은 필수 입력값입니다.");
   		  birthYear.focus();
		  return;
	  }
	  else if ( !bYbool || parseInt(birthMM)<1 || parseInt(birthMM)>12
                 || parseInt(birthDate)<1 || parseInt(birthDate)>31 ) {
		  alert("존재하지 않는 날짜 입니다.");
		  birthYear.focus();
		  return;
	  }
	  else if ( parseInt($("#birthdayyy").val().trim()) > currentYear ) {
			alert("출생년도는 현재년도보다 작아야 합니다.");
			$("#birthYear").val("").focus();
			return;
	  }	
	  else if( !$("input:checkbox[id=agree1]").is(":checked") ) {
		  alert("이용약관에 동의 하세요.");
		  return;
	  } 
	  else if( !$("input:checkbox[id=agree2]").is(":checked") ) {
		  alert("이용약관에 동의 하세요.");
		  return;
	  } 
	 
	  var frm = document.registerFrm;
	  frm.method = "POST";
	  frm.action = "joinInsert.sa";
	  frm.submit();
	  
	};// end of function goRegister(event)----------
	
	//===========================================================================	아이디
	
	function myUseridCheck(userid) {
		// 조건: 영문소문자 또는 숫자 4~16자로 입력
		var regExp = /^[a-z0-9]{4,16}$/;
		var bool = regExp.test(userid);
		return bool;
	}; 
	
	//	===========================================================================	비밀번호 

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
	
	 //== 이메일 주소를 검사하는 함수 == // 
	function myEmailCheck(email) {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		var bool = regExp.test(email);  // 리턴타입은 boolean 
		return bool;
		
	}; // end of myEmailCheck(email) ===============
		
	// == 아이디 중복 검사 == //
	function isExistIdCheck(){

		var userid = $("#userid").val().trim();
		
		$.ajax({
			url:"<%= request.getContextPath()%>/member/idDuplicateCheck.sa",   
			data: {"userid" : userid},
			dataType:"json",
			success: function(json) {  
				$("span.userid_error").css('display','');
				$("span.userid_error").html(json.msg);
				
				$("#idDuplicate").val(json.bool);
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	
	}
	

  	function myClose() {
     	  document.getElementById("layer").style.display = "none";    
  	}
  	
</script>


<form name="registerFrm" method="post">
<div id="JoinWrap">
	<div id="titlearea">
		<h4 style="font-weight: bold; text-underline-position: under;" >JOIN</h4>
	</div>
	
	<div id="Join1">
		<table style="display: block; width: 1000px;">
			<tr>
			<th class="joinTH" style="border-bottom: solid 1px #dfdfdf;">회원구분<img src="/Semi/images/ico_required_blue.gif"></th>
			<td class="joinTD" style="border-bottom: solid 1px #dfdfdf;">
				<label for="Join1_type1"><input id="Join1_type1" type="radio" name="sort" checked style="height: 12px;"/>개인회원</label>
				
			</td>
			</tr>
			
			<th class="joinTH Hide_Join1">사업자구분<img src="/Semi/images/ico_required_blue.gif"></th>
			<td class="joinTD Hide_Join1">
				<label for="Join1_type4"><input id="Join1_type4" type="radio" name="sort_2" checked/>개인사업자</label>
				<label for="Join1_type5"><input id="Join1_type5" type="radio" name="sort_2"/>법인사업자</label>
				
			</td>
			
			<th class="joinTH Hide_Join2" style="height: 110px; padding-top: 40px;">회원인증<img src="/Semi/images/ico_required_blue.gif"></th>
			<td class="joinTD Hide_Join2">
				<span>법인명<br/><input type="text"style="width: 70px"/></span><br/>
				<span>법인번호<br/><input type="text" maxlength="6" style="width: 70px"/></span>
				-<input type="password" maxlength="6" style="width: 70px"/>
			</td>
			
			<th class="joinTH Hide_Join3" style="height: 162px; padding-top: 70px;">회원인증<img src="/Semi/images/ico_required_blue.gif"></th>
			<td class="joinTD Hide_Join3">
				<span>이름명(Name)&nbsp;<input type="text"style="width: 70px"/></span><br/>
				<span>외국인 등록번호&nbsp;<input type="text" style="margin:5px 0px 5px 0px;"/><br/></span>
				<p>회사는 회원의 본인확인 및 서비스제공을 위하여 고유식별정보를 수집하여 보관하며 개인정보처리방침에 따라
보유 및 이용합니다. 고유식별정보 제공을 거부하는 경우 서비스 이용이 제한됩니다.</p>
				<input type="checkbox" id="for_agree"/><label for="for_agree">고유식별정보 처리에 동의합니다.</label>
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
				 	<input type="text" name="userid" id="userid"/>
				 	<span class="error userid_error">&nbsp;아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요.</span>&nbsp;<span id="idInfo">(영문소문자/숫자, 4~16자)</span>
					<input type="hidden" id="idDuplicate" />
				</td>	
			</tr>
			
			<tr>	      
				<th class="joinTH" style="max-height: 43px;">비밀번호<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD"> 
					<div id="pwdLayer">
					<input type="password" name="pwd" id="pwd"/><span class="error pwd_error">&nbsp;비밀번호를 올바르게 입력하세요.</span><span>&nbsp;(영문 대소문자/숫자/특수문자 조합, 8자~16자)</span>	
					 </div>		
				</td>
			</tr>
				
			<tr>
			<th class="joinTH">비밀번호 확인<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD">
				 	<input type="password" name="pwdCheck" id="pwdCheck"/><span class="error pwdCheck_error">&nbsp;비밀번호가 일치하지 않습니다.</span>
				</td>	
			</tr>
			
			<tr>	
			<th class="joinTH">이름<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD">
				 	<input type="text" id="name" name="name"/>
				</td>	
			</tr>
			<tr>	
				<th class="joinTH" style="height: 106px; padding-top: 40px;">주소</th>
				<td class="joinTD">
				 	<input type="text" name="post" id="sample6_postcode" placeholder="&nbsp;우편번호">
				 	 <button type="button" id="zipcodeSearch" style="cursor: pointer;" onclick="sample6_execDaumPostcode()">우편번호</button><br/>
					<input type="text" name="addr1" id="sample6_address" placeholder="&nbsp;주소" style="margin: 5px 0px 5px 0px"><br>
					<input type="text" name="addr2" id="sample6_detailAddress" placeholder="&nbsp;상세주소">
					<input type="text" name="addr3" id="sample6_extraAddress" placeholder="&nbsp;참고항목">
			
				</td>	
			</tr>
				
			<tr>
				<th class="joinTH">일반전화</th>
				<td class="joinTD">
					<select name="Gephone_1" id = "Gephone_1" class="myselect">  <!-- select 태그: 블라인드열어서 카테고리보기 -->
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
					</select>-
					<input type="text" name="Gephone_2" maxlength="4" style="width: 70px"/>-
					<input type="text" name="Gephone_3" maxlength="4" style="width: 70px"/>				 	

				</td>
			</tr>	
			
			<tr>	
			<th class="joinTH">휴대전화<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD">
				 	<select name="phone_1" id = "phone_1" class="myselect">  <!-- select 태그: 블라인드열어서 카테고리보기 -->
								<option value="010">010</option>
								<option value="011" >011</option>
								<option value="016" >016</option>
								<option value="017" >017</option>
					</select>-
					<input type="text" id="hp2" name="phone_2" maxlength="4" style="width: 70px" class="inputHP"/>-
					<input type="text" id="hp3" name="phone_3" maxlength="4" style="width: 70px" class="inputHP"/>
				</td>	
			</tr>
			
			<tr>	
				<th class="joinTH" style="border-bottom: solid 1px #dfdfdf;">이메일<img src="/Semi/images/ico_required_blue.gif"></th>
				<td class="joinTD" style="border-bottom: solid 1px #dfdfdf;">
				 	<input type="text" name="email" id="email"/><span class="error email_error">&nbsp;올바른 형식의 이메일을 입력하세요.</span>
				</td>
			</tr>	
		</table>
 	
 			
	<div id="Join3">
	  <span style="display: block; font-weight: bold; font-size: 12pt; margin:30px 0px 20px 0px;">추가정보</span>	
		<table style="display: block; width: 1000px;">	
			<th class="joinTH">성별<img src="/Semi/images/ico_required_blue.gif"></th>
			<td class="joinTD" style="height: 43px;">
				<input id="Join3_type1" type="radio" name="gender"  value="1" /><label for="Join3_type1" style="font-weight: lighter;">&nbsp;남자</label>
				<input id="Join3_type2" type="radio" name="gender"  value="2" /><label for="Join3_type2" style="font-weight: lighter;">&nbsp;여자</label>
			</td>
			<th class="joinTH" style="border-bottom: solid 1px #dfdfdf;">생년월일<img src="/Semi/images/ico_required_blue.gif"></th>
			<td class="joinTD" style="height: 43px; border-bottom: solid 1px #dfdfdf;">
				<input name="birthdayyy" id="birthdayyy" type="text" maxlength="4" style="width: 70px" class="inputBirth"/>&nbsp;년&nbsp;
				<input name="birthdaymm" id="birthdaymm" type="text" maxlength="2" style="width: 50px" class="inputBirth"/>&nbsp;월&nbsp;
				<input name="birthdaydd" id="birthdaydd" type="text" maxlength="2" style="width: 50px" class="inputBirth"/>&nbsp;일&nbsp;
				<!-- 
				<label for="Join3_type3" style="font-weight: lighter;"><input id="Join3_type3" type="radio" name="birth"/>&nbsp;양력</label>
				<label for="Join3_type4" style="font-weight: lighter;"><input id="Join3_type4" type="radio" name="birth"/>&nbsp;음력</label>
			     -->
			</td>
		</table>	
	</div>
								
	
	<div id="Join4">
		<span style="display: block; font-weight: bold; font-size: 12pt; margin:30px 0px 20px 0px;">전체동의</span>
		   <div style="background-color:#fbfafa; border: solid 1px #dfdfdf; display: block; width: 1000px;">
		   	  <div style="padding:8px 0px 8px 8px; border-bottom: solid 1px #dfdfdf; ">
						&nbsp;<input type="checkbox" id="allCheck" /><label for="allCheck">&nbsp;이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</label>
		   	  </div>
		   	  <div style="padding:10px 0px 10px 10px;">
		   	  	<p style="font-weight: bold; ">[필수] 이용약관 동의</p>
		   	  		<iframe src="/Semi/agree/agree.html" width="95%" height="150px" class="box" ></iframe>
		   	  	<br/><span>이용약관에 동의하십니까?&nbsp;</span><input type="checkbox" id="agree1" class="Wholeagree"/><label for="agree1">&nbsp;동의함</label>
		   	  	
		   	  </div>
		   	
		   	  
		   	  <div style="padding:10px 0px 10px 10px; ">
		   	  	<p style="font-weight: bold;">[필수] 개인정보 수집 이용 동의</p>
		   	  		<iframe src="/Semi/agree/agree2.html" width="95%" height="150px" class="box" ></iframe>
		   	  	<br/><span>개인정보 수집 및 이용에 동의하십니까?&nbsp;</span><input type="checkbox" id="agree2" class="Wholeagree"/><label for="agree2">&nbsp;동의함</label>
		   	  	
		   	  </div>
		   	  
		   	   <div style="padding:10px 0px 10px 10px;">
		   	  	<p style="font-weight: bold;">[선택] 쇼핑정보 수신 동의</p>
		   	  		<iframe src="/Semi/agree/agree3.html" width="95%" height="150px" class="box" ></iframe>
		   	  	<br/><span>이메일 수신을 동의하십니까?&nbsp;</span><input type="checkbox" name="emailCheck" value="1" id="agree3" class="Wholeagree"/><label for="agree3">&nbsp;동의함</label>
		   	  	
		   	  </div>
		   </div>
		   
		   <div id="memberJoinbutton">
		   		<a type="submit"><img onClick="goRegister(event);" id="memberJoinbutton1" src="/Semi/images/memberjoin.png"></a>
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

<jsp:include page="../footer.jsp" />  
 