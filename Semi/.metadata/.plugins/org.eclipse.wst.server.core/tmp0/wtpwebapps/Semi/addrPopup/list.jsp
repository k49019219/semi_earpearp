<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">
<style type="text/css">
	#popupList {
		width: 100%;
		margin: 0 auto;
		position: relative;
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
	}
	
	#popupList .header {
		background-color: #495164; 
		color: white; 
		font-size: 9pt; 
		width: 100%; 
		padding: 5px 0 5px 20px;
	}
	
	#popupList .tableStyle1 {
		width: 95%;
		margin: 20px auto;
		border-collapse: collapse;
		font-size: 9pt;
	}
	
	#popupList .tableStyle1 tr:first-child {
		background-color: #fbfafa;
		height: 30px;
	}
	
	#popupList .tableStyle1 tr td {
		border: solid 1px #e6e6e6;
	}
	
	#popupList .tableStyle2 td {
		border-right: hidden !important;
		text-align: center;
	}

	#popupList .tableStyle2 td:last-child {
		border-right: solid 1px #e6e6e6 !important;
	}

	#popupList .classforlist ul {
		padding: 15px 10px 15px 10px;
		margin: 0px;
	}

	#popupList .classforlist ul li {
		list-style-type: none;
		color: gray;
		line-height: 150%;	
	}
	
	#popupList table button {
		display: block;
	}
	
	#popupList .navyBtn {
		background-color: #495164; 
		padding: 5px 10px;
		color: white;
		border: solid 1px #e6e6e6;
		border-radius: 3px;
		margin: 5px auto;
	}
	
	#popupList .whiteBtn {
		background-color: white; 
		padding: 5px 10px;
		color: #000000;
		border: solid 1px #e6e6e6;
		border-radius: 3px;
		margin: 5px auto;
	}
	
	#popupList .blackBtn {
		background-color: #43495a; 
		padding: 5px 10px;
		color: white;
		border: solid 1px #e6e6e6;
		border-radius: 3px;
		margin: 5px auto;
	}
	
	#popupList .footer {
		background-color: #fbfafa;
		font-size: 9pt; 
		width: 100%; 
		padding: 5px 0 5px 10px;
		border-top: solid 1px #e6e6e6;
		text-align: center;
	}

	#popupList button {
		cursor: pointer;
	}

</style>

	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 배송지 등록 체크박스 전체 선택 및 해제
		$("input:checkbox[id=allCheck]").click(function(){
			
			var bool = $(this).prop("checked");
			
			$("input:checkbox[name=myDeli]").prop("checked", bool);
			
		});
		
		$("input:checkbox[name=myDeli]").click(function(){
			
			var flag = false;
			
			$("input:checkbox[name=myDeli]").each(function(){
								
				var bool = $(this).prop("checked");
				
				if(!bool){
					$("input:checkbox[id=allCheck]").prop("checked", false);
					flag = true;
					return false;
				}
				
				if(!flag)
					$("input:checkbox[id=allCheck]").prop("checked", true);
			});
			
		}); // end of checkbox click ------------------
		
		
		// 배송지 삭제하기 버튼
		$("#deleteMyDeli").click(function(){
			
			var flag = false;
			var addressNoArr = new Array();
			$("input:checkbox[name=myDeli]").each(function(){
				
				var checked = $(this).prop("checked");
				
				if(checked){
					// 삭제한다면 해당 주소지 번호를 저장한다.
					var AddressNo = $(this).val();
					addressNoArr.push(AddressNo);
					flag = true;
				}
			});
			
			if(!flag){
				alert("선택하신 주소가 없습니다.");
			}
			else {
				window.location.href="/Semi/addrPopup/addrDelete.sa?addressNoArr="+addressNoArr;
			} 

		}); 
		
		// 적용 버튼을 누른다면 ==================================================================
		$(".applyBtn").click(function(){
		
			var count = $(this).attr('id');
			var applyAddressFrm = "applyAddressFrm"+count;
			
			var frm = document.getElementById(applyAddressFrm); // jQuery로 잘 안잡혀서 이렇게 잡음
			
			frm.method = "POST";
			
		    frm.action = "/Semi/addrPopup/addrApply.sa";
		    
		    window.opener.name = "parentPage"; // 부모창의 이름 설정
		    frm.target = "parentPage"; // 타켓을 부모창으로 설정
		    
		   	frm.submit();
		    self.close();
		    
		});
		
	}); // end of document ready ---------------

</script>

<body onload="resizeTo(800, 555);" id="popupList">
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
	
	<table id="addressListTable" class="tableStyle1">
		<tr style="text-align: center;">					
			<td>
				<input type="checkbox" id="allCheck"/>
			</td>
			<td>배송지명</td>
			<td>수령인</td>
			<td>일반전화</td>
			<td>휴대전화</td>
			<td style="width: 30%;">주소</td>
			<td>배송지관리</td>
		</tr>
		<c:if test="${addressList != null}">
			<c:forEach var="address" items="${addressList}" varStatus="status">
				<tr class="tableStyle2">
					<td>
						<input type="checkbox" id="myDeli${status.count}" name="myDeli"  value="${address.addrno}"/>
					</td>
					<td>${address.destination}</td>
					<td>${address.receiver}</td>
					<td>02-</td> 
					<td>010-${sessionScope.loginUser.hp2}-${sessionScope.loginUser.hp3}</td> <%-- 주소지에 전화번호 column이 없어서 일단 이렇게.. --%>
					<td>(${address.post})${address.addr1} ${address.addr2}</td>
					<td>
						<button type="button" id="${status.count}" class="navyBtn applyBtn">적용</button>
						<button type="button" id="thisEdit${status.count}" class="whiteBtn" onclick="javascript:location.href='/Semi/addrPopup/register.sa?addrno=${address.addrno}'">수정</button>
						<form name="applyAddressFrm${status.count}" id="applyAddressFrm${status.count}">
							<input type="hidden" name="receiver" value="${address.receiver}"/>
							<input type="hidden" name="post" value="${address.post}" />
							<input type="hidden" name="addr1" value="${address.addr1}" />
							<input type="hidden" name="addr2" value="${address.addr2}" />
							<input type="hidden" name="hp2" value="${sessionScope.loginUser.hp2}" />
							<input type="hidden" name="hp3" value="${sessionScope.loginUser.hp3}" />
						</form>
					</td> 
				</tr>
			</c:forEach>
			
		</c:if>
		
		<c:if test="${addressList == null}">
			<tr class="tableStyle2" style="height:100px;" >
				<td colspan="7">
					등록된 주소가 없습니다.
				</td>
			</tr>			
		</c:if>
	</table>
	
	<div class="footer"> <%-- 선택 주소록 삭제 클릭 시 별도 alert없이  바로 삭제 --%>
		<c:if test="${addressList != null}">
			<button type="button" id="deleteMyDeli" class="navyBtn">선택 주소록 삭제</button>
			<button type="button" class="whiteBtn" onclick="javascript:location.href='/Semi/addrPopup/register.sa'">배송지 등록</button>
		</c:if>
		
		<c:if test="${addressList == null}"> 
			<button type="button" class="blackBtn" onclick="javascript:location.href='/Semi/addrPopup/register.sa'">배송지 등록</button>
		</c:if>
	</div>
</body>