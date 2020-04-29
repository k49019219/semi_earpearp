<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">

<style type="text/css">
	#popupRegi {
		width: 100%;
		position: relative;
		margin: 0 auto;
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
	}
	
	#popupRegi .header {
		background-color: #495164; 
		color: white; 
		font-size: 9pt; 
		width: 100%; 
		padding: 5px 0 5px 20px;
	}
	
	#popupRegi .tableStyle1 {
		width: 95%;
		margin: 20px auto;
		border-collapse: collapse;
		font-size: 9pt;
	}
	
	#popupRegi .tableStyle1 tr:first-child {
		background-color: #fbfafa;
		height: 30px;
	}
	
	#popupRegi .tableStyle1 tr td {
		border: solid 1px #e6e6e6;
	}

	#popupRegi .classforlist ul {
		padding: 15px 10px 15px 10px;
		margin: 0px;
	}

	#popupRegi .classforlist ul li {
		list-style-type: none;
		color: gray;
		line-height: 150%;	
	}
	
	#popupRegi .tableStyle2 {
		width: 95%;
		margin: 20px auto;
		border-collapse: collapse;
		font-size: 9pt;
	}
	
	#popupRegi .tableStyle2 tr td {
		border: solid 1px #e6e6e6;
	}
	
	#popupRegi .tableStyle2 tr td:first-child {
		background-color: #fbfafa;
		padding: 10px;
		width: 100px;
	}
	
	#popupRegi .tableStyle2 tr td {
		padding: 5px 10px 4px;
	}
	
	#popupRegi .tableStyle2 tr td input {
		border: solid 1px #e6e6e6;
		padding: 2px 4px;
	}
	
	#popupRegi .tableStyle2 tr td select {
		width: 60px;
	}
	
	#popupRegi table button {
		display: block;
	}
	
	#popupRegi .navyBtn {
		background-color: #495164; 
		padding: 5px 10px;
		color: white;
		border: solid 1px #e6e6e6;
		border-radius: 3px;
		margin: 5px auto;
	}
	
	#popupRegi .whiteBtn {
		background-color: white; 
		padding: 5px 10px;
		color: #000000;
		border: solid 1px #e6e6e6;
		border-radius: 3px;
		margin: 5px auto;
	}
	
	#popupRegi .footer {
		background-color: #fbfafa;
		font-size: 9pt; 
		width: 100%; 
		padding: 5px 0 5px 10px;
		border-top: solid 1px #e6e6e6;
		text-align: center;
	}

	#popupRegi button {
		cursor: pointer;
	}
	
	#popupRegi .star {
		color: blue;
		font-weight: bold;
	}

</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#upNewDeli").click(function(){
			
			if( $("#destination").val().trim() == "" ){
				alert("배송지명은 필수 입력사항입니다.");
				$("#destination").focus();
				return;
			}
			
			if( $("#receiver").val().trim() == "" ){
				alert("성명은 필수 입력사항입니다.");
				$("#receiver").focus();
				return;
			}
			
			if( $("#post").val().trim() == "" ){
				alert("주소는 필수 입력사항입니다.");
				$("#post").focus();
				return;
			}
			
			var hp2 = $("#hp2").val().trim();
			var hp3 = $("#hp3").val().trim();
			
			if( "" == (hp2 && hp3) ){
				alert("휴대전화 번호는 필수 입력사항입니다.");
				$("#hp1").focus();

			} else {
				
				var regExp1 = /^[0-9]{3,4}$/;
				var regExp2 = /^[0-9]{4}$/;
				
				var bool1 = regExp1.test(hp2);
				var bool2 = regExp2.test(hp3);
				
				if(!bool1){
					alert("휴대전화 가운데 번호는 숫자 3~4자리로만 입력해주세요.");
					$("#hp2").focus();
					return;
				}
				
				else if(!bool2){
					alert("휴대전화 마지막 번호는 숫자 4자리로만 입력해주세요.");
					$("#hp3").focus();
					return;
				}
				
				else { 
					// 기본 배송지 여부 체크 0,1로 지정
					if($("#addrbase").prop("checked")){
						$("#addrbase").val("1");
					} else {
						$("#addrbase").val("0");
					}
					
					// 모든 값이 제대로 들어간 경우
					// 주소지 수정인 경우 addrno가 null이 아니다.
					var addrno = "${addrno}";

					var frm = document.popupDeliFrm;
					frm.method = "POST";
					
					if(addrno== ""){
						 frm.action = "/Semi/addrPopup/addrAdd.sa";
					} else {
						frm.action = "/Semi/addrPopup/addrUpdate.sa";
					}
					
					frm.submit();
				}
			}
			
			
		});
	
	});
	
	// 우편번호찾기 
	function openPOST(){

		new daum.Postcode({
			oncomplete: function(data) {
			    $("#post").val(data.postcode1+data.postcode2);
			    $("#addr1").val(data.address);
			    $("#addr2").focus();
			}
		}).open();

	}

</script>

<body onload="resizeTo(800, 650);" id="popupRegi">
<div class="header"><h3>배송 주소록 관리</h3></div>
	<table class="tableStyle1 classforlist">
		<tr>
			<td style="padding-left: 10px; font-weight: bold;">배송주소록 유의사항</td>
		</tr>
		<tr>
			<td>
				<ul>
					<li>- 배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
					<li>- 자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
					<li>- 기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
				</ul>
			</td>
		</tr>
	</table>
	
	<div class="delivery_area" style="font-size: 10pt;">
		<form name="popupDeliFrm">
			<table class="tableStyle2">
				<tr>
					<td>배송지명&nbsp;<span class="star">*</span></td>
					<td><input type="text" id="destination" name="destination"/></td>
				</tr>
				<tr>
					<td>성명&nbsp;<span class="star">*</span></td>
					<td><input type="text" id="receiver" name="receiver" required></td>
				</tr>
				<tr>
					<td>주소&nbsp;<span class="star">*</span></td>
					<td>
						<input type="text" id="post" name="post" size="10" maxlength="5" readonly required/>
						<button type="button" id="searchPost" onClick="openPOST();" style="display: inline-block;">우편번호</button><br/>
						 <input type="text" id="addr1" name="addr1" size="50" readonly style="margin: 5px 0 5px 0" placeholder="우편번호 서비스를 이용해주세요." required/> <span style="color: #999999">기본주소</span><br/>
		    			 <input type="text" id="addr2" name="addr2" size="50" required/> <span style="color: #999999">나머지주소(선택입력가능)</span>
					</td>
				</tr>
				<tr>
					<td>일반전화</td>
					<td><%-- 넘 많으니까 반의 반만 쓸까요? --%>
						<select id="tp1" name="tp1">
							<option value="02" selected>02</option>
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
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0504">0504</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="070">070</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>									
						&nbsp;-&nbsp;    
		    			<input type="text" id="tp2" name="tp2" size="5" maxlength="4" required/>&nbsp;-&nbsp;
		    			<input type="text" id="tp3" name="tp3" size="5" maxlength="4" required/>
					</td>
				</tr>
				<tr>
					<td>휴대전화&nbsp;<span class="star">*</span></td>
					<td>
						<select id="hp1" name="hp1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>									
						&nbsp;-&nbsp;    
		    			<input type="text" id="hp2" name="hp2" size="5" maxlength="4" required/>&nbsp;-&nbsp;
		    			<input type="text" id="hp3" name="hp3" size="5" maxlength="4" required/>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="background-color: white; text-align: right;">
						<input type="checkbox" id="addrbase" name="addrbase" value="0"/>
						<label for="addrbase">기본 배송지로 저장</label>
					</td>
				</tr>
			</table>
			<input type="hidden" name="addrno" value="${addrno}" />
		</form>
	</div>
	
	<div class="footer">
		<button type="button" id="upNewDeli" class="navyBtn">등록</button>
		<button type="button" class="whiteBtn" onclick="javascript:history.back()">취소</button>
	</div>
</body>
