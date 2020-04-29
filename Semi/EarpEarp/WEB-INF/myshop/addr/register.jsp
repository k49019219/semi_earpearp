<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
         
<jsp:include page="../../header.jsp" />  


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>addrRegister</title>

<style>

	header {
	
		margin-bottom: 0px;
	}
	
	#bannerh2 {
		font-size : 20px;
		font-weight: 900; 
		color:#00a0e2;
		text-decoration: underline;
		text-underline-position: under;
	}
	/* 
	#bannerh2::after {
		margin : 0 45.15%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:218px;
	    width : 153px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	}
	 */
	h2 {
	
		margin-bottom: 50px;
	
	}

	#addrRegisterTbl {
	
		border: 1px solid #d7d5d5;
		width : 96%;
		margin : 0 auto;
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
	    font-size: 12px;
	
	}
	
	#addrRegisterTbl th {
	
	    padding: 11px 0 10px 18px;
	    border: 1px solid #dfdfdf;
	    border-bottom-width: 0;
	    color: #353535;
	    text-align: left;
	    font-weight: normal;
	    background-color: #fbfafa;
	    width : 120px;
	}
	
	#addrRegisterTbl td {
		padding: 11px 10px 10px;
	    border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    text-align: left;
	    word-break: break-all;
	    word-wrap: break-word;
		
	
	}     
	
	#addrRegisterTbl td select {
		
		width : 60px;
		height: 24px;
    	border: 1px solid #d5d5d5;
	}
	
	#checkSave {
		text-align: right !important;
		
	}

	
	#addrBtn, #cancelBtn {
	
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
		     
	}
	
	#submitBtn {
		    display: inline-block;
		    box-sizing: border-box;
		    padding: 2px 8px;
		    border: 1px solid transparent;
		    border-radius: 2px;
		    font-family: "굴림",Gulim;
		    font-size: 12px;
		    line-height: 18px;
		    text-align: center;
		    color: white;
		    background-color: #4a5164;
		    
	
	}
	
	
	input[type=text] {
	   	height: 24px;
	    line-height: 20px;
	    padding: 2px 4px;
	    border: 1px solid #d5d5d5;
	    color: #353535;
	    font-size: 12px;
	}
	
	#addrSubBtn button {
		
		width: 96px;
		padding: 6px 8px;
	    
	}
	
	#addrWarring {
		
		text-align: left;
		border: solid 1px #dfdfdf;
		width : 96%;
		margin : 0 auto;
	}
	
	#addrWarring h3 {
		
		
	    padding: 9px 0 6px 10px;
	    border-bottom: 1px solid #e8e7e7;
	    color: #101010;
	    font-size: 12px;
	    background: #fbfbfb;
	    margin-top: 0;
	    font-weight: bold;
	
	}
	
	#addrWarring li {
	
		list-style-type:none; 
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
    	font-size: 11.8px;
    	/* line-height : 18px; */
    	padding-left: 22px;
   	    color: #757575;
   	   	
	}
	
	#addrWarring li span {
		vertical-align: text-bottom;
	}
	
	.ico_number {
	
		margin-right: 7px;
		margin-bottom : 3px;
	
	}
	
</style>

<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	
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
	
	$(document).ready(function(){
		

		 $("#Gephone_1 option[value='${sessionScope.loginUser.tp1}']").attr("selected", true);
		 $("#phone_1 option[value='${sessionScope.loginUser.hp1}']").attr("selected", true);	
		 
		$("#submitBtn").click(function(){
			
			  if( $("#destination").val().trim() == "" ) {
				  alert("배송지명 항목은 필수 입력값입니다.");
				  
				  return;
			  }  
			  else if( $("#receiver").val().trim()  == "" ) {
				  alert("성명 항목은 필수 입력값입니다.");
				
				  return;
			  }  
			  else if( $("#sample6_postcode").val().trim()  == "" ) {
				  alert("주소 항목은 필수 입력값입니다.");
				
				  return;
			  }  
			  else if( $("#sample6_address").val().trim() == "" ) {
				  alert("주소 항목은 필수 입력값입니다.");
				 
				  return;
			  }  
			  else {
				  var frm = document.addrRegisterFrm;
				  frm.method = "POST";
				  frm.action = "registerEnd.sa";
				  frm.submit();
			  }
			
		})
	});
</script>

</head>
<body>
	<div id="contents"> 
		<div class="container text-center">    
		  <div id = "banner">
		  		<h2>
		  			<span id = "bannerh2">배송 주소록 관리</span>
		  		</h2>
		  </div>
		  
		  <form name = "addrRegisterFrm">
		  	<table id = "addrRegisterTbl" >
		  		<tr>
		  			<th scope = "row">
		  				배송지명
		  				<img src="/Semi/images/ico_required_blue.gif" alt="필수" />
		  			</th>
		  			
		  			<td>
		  				<input type = "text" id="destination" name="destination" style = "width : 180px;"/>
		  			</td>
		  		</tr>
		  	
		  		<tr>
		  			<th scope = "row">
		  				성명
		  				<img src="/Semi/images/ico_required_blue.gif" alt="필수" />
		  			</th>
		  			
		  			<td>
		  				<input type = "text" id="receiver" name="receiver" style = "width : 180px;"/>
		  			</td>
		  		</tr>
		  		
		  		<tr>
		  			<th scope = "row" style = "vertical-align: top;">
		  				주소
		  				<img src="/Semi/images/ico_required_blue.gif" alt="필수" />
		  			</th>
		  			
		  			<td>
					 	<input type="text" name="post" id="sample6_postcode" style = "width : 70px;" >
					 	<button id = "addrBtn" type="button" style="cursor: pointer;" onclick="sample6_execDaumPostcode()" >우편번호</button><br/>
						<input type="text" name="addr1" id="sample6_address" style="margin: 5px 0px 5px 0px; width : 450px;" ></input><span style = "margin-left: 5px;">기본주소</span><br/> 
						<input type="text" name="addr2" id="sample6_detailAddress"  style = "width : 450px;"><span style = "margin-left: 5px;"> 나머지주소(선택입력가능)</span>
						<input type="text" id="sample6_extraAddress" placeholder="&nbsp;참고항목" style = "display : none;">
		  			</td>
		  		</tr>
		  		
		  		<tr>
		  			<th scope = "row">
		  				일반전화
		  			</th>
		  			
		  			<td>
			  			<select disabled="disabled" id="Gephone_1">
			  				<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="070">070</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
			  			</select>
			  			-
		  				<input type = "text" maxlength="4" value="${sessionScope.loginUser.tp2}" readonly style = "width : 70px;"/>
		  				-
		  				<input type = "text" maxlength="4" value="${sessionScope.loginUser.tp3}" readonly style = "width : 70px;"/>
		  			</td>
		  		
		  		</tr>
		  		
		  		<tr>
		  			<th scope = "row">
		  				휴대전화
		  				<img src="/Semi/images/ico_required_blue.gif" alt="필수" />
		  			</th>
		  			
		  			<td>
		  				<select disabled="disabled" id="phone_1">
		  					<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
		  				</select>
		  				-
		  				<input type = "text" value="${sessionScope.loginUser.hp2}" readonly maxlength="4" style = "width : 70px;"/>
		  				-
		  				<input type = "text" value="${sessionScope.loginUser.hp3}" readonly maxlength="4" style = "width : 70px;"/>
		  			</td>
		  		</tr>
		  		
		  		<tr>
		  			<td colspan = "2" align="right" id = "checkSave">
		  				<input name="addrBase" type = "checkbox" value="1"/>
		  				<span>기본배송지로 저장</span>
		  			</td>
		  		</tr>
		  		
		  	</table>
		  	
		  	<div id = "addrSubBtn" style = "text-align: right; width : 96%; margin : 0 auto; padding-top: 10px;">
		  	
		  		<button id = "submitBtn" type = "button">등록</button>
		  		<button id = "cancelBtn" type = "button" onclick = "location.href='list.sa'">취소</button>
		  	</div>
		  		
		  </form>
		  
		  <br/><br/>
		  <div id = "addrWarring">
		  	<h3>배송주소록 유의사항</h3>
		  	<div>
		  		<ul style="padding : 0;" >
		  			
		  			<li>
			  			<img src = "/Semi/images/ico_number1.png" class = "ico_number" />
			  			<span>배송 주소록은 최대 10개까지 등록할 수 있습니다.</span>
		  			</li>
		  			
		  			<li>
		  				<img src = "/Semi/images/ico_number2.png" class = "ico_number" />
		  				<span>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</span>
		  			</li>
		  		</ul>
		  	</div>
		  
		  </div> 
		  
		    
		</div>
	 </div>
</body>
</html>


<jsp:include page="../../footer.jsp" />  