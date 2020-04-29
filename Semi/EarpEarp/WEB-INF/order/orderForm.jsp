<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>
<style type="text/css">
	body {   
      font-family: 'Open Sans', NanumGothic,'Malgun Gothic', Dotum, sans-serif;
    }

	#wrap_view_form {
		margin: 100px 0 100px 0;
	}

	#wrap_view_form #container {
		margin: 0 auto;
	}
	
	#wrap_view_form .title_area {
		margin: 53px 0 50px;
		text-align: center;
	}
	
	#wrap_view_form .title_area h2 {
		display: inline-block;
	    letter-spacing: .3px;
	    padding: 0 2px;
	    position: relative;
	    color: #00a0e2;
	    font-weight: 900;
	    font-size: 30px;
	    border-bottom: solid 3px #00a0e2;
	}
	
	#wrap_view_form .order_area {
		margin: 0 auto;
		width: 85%;
	}
	
	#wrap_view_form .order_area .step2_img {
		width: 70%;
	}
	
	#wrap_view_form .order_area .order_info_point {
		width: 100%;
		font-size: 10pt;
		border: solid 2px #000000;
		height: 80px;
		margin: 25px 0 25px 0;
	}

	#wrap_view_form .order_area .order_info_point a.mileCss_A {
		text-decoration: none;
		color: #000000;
	}

	#wrap_view_form .order_area .order_info_point tr {
		border-bottom: solid 1px #e6e6e6;
	}

	#wrap_view_form .order_area .order_info_point tr td {
		border-right: solid 1px #e6e6e6;
		padding-left: 10px;
	}
	
	#wrap_view_form .order_area .order_info_point tr:first-child td:first-child {
		width: 10%;
		text-align: center;
		font-weight: bold;
		padding-left: 0;
	}
	
	 #wrap_view_form .order_area .order_list {
	 	 width: 100%; 
	 	 margin: 30px 0 30px 0; 
	 	 border: solid 1px #e6e6e6;
	 	 font-size: 10pt;
	 }
	 
	 #wrap_view_form .order_area .order_list tr {
	 	height: 45px;
	 }
	 
	 #wrap_view_form .order_area .order_list tr th, td:first-child {
		padding-left: 10px;
	}
	
	#wrap_view_form .order_area .order_list tbody td {
		text-align: center;
		border:solid 1px #e6e6e6;
		padding: 5px 0 5px 0;
	}
	
	#wrap_view_form .order_area .order_list tbody tr td a.orderProduct_A {
		text-decoration: none;
		font-weight: bold;
		font-size: 12pt;
		color: #000000;
		line-height: 200%;
	}
	
	#wrap_view_form .order_area .order_list tbody tr td a.orderProduct_A:hover {
		text-decoration: underline;
	}
	
	#wrap_view_form .order_area .order_list  tfoot tr:last-child td button:hover {
		background-color: #e6e6e6;
	}
	
	#wrap_view_form .order_area .order_list  tfoot tr:first-child td:first-child {
		border-bottom: solid 1px #e6e6e6; 
		background-color: #fbfbfb;
	}
	
	#wrap_view_form .order_area .order_list  tfoot tr:first-child td:first-child .order_deli { 
		 display: inline-block; 
		 float: left;
	}
	
	#wrap_view_form .order_area .order_list  tfoot tr:first-child td:first-child .order_calc { 
		 display: inline-block; 
		 float: right;
	}

	#wrap_view_form .order_area .order_list  tfoot .order_warning {
		background-color: #fff8f7; 
		color: red; 
		border-left: solid 1px white; 
		border-right: solid 1px white; 
		font-size: 9pt;
		border-bottom: solid 1px #e6e6e6;
		padding-left: 20px;
	}
	
	#wrap_view_form .order_area .order_list  tfoot tr:last-child td {
		border-bottom: solid 1px #000000; 
		border-left: solid 1px white; 
		border-right: solid 1px white; 
		padding: 10px 0 50px 10px;
	}
	
	#wrap_view_form .order_area .order_list tfoot .order_calc span.order_totalPrice {
		color: #00a0e2;
		font-size: 15pt;
		font-weight: bold;
		margin-left: 10px; 
		display: inline-block;
	}
	
	#wrap_view_form .order_area span.star {
		color: red;
	}
	
	#wrap_view_form .order_area .delivery_area form {
		width: 100%;
		margin: 10px 0 50px 0;
	}
	
	#wrap_view_form .order_area .delivery_area form table {
		width: 100%;
	}
	
	#wrap_view_form .order_area .delivery_area form label { 
		font-weight: normal;
	}
	
	#wrap_view_form .order_area .delivery_area form table tr td {
		padding: 10px;
		border: solid 1px #e6e6e6;
	}
	
	#wrap_view_form .order_area .delivery_area form table tr td:first-child { 
		width: 150px;
		background-color: #fbfbfb;
	}
	
	#wrap_view_form .order_area .delivery_area form table button {
		border: solid 1px #e6e6e6;
		background-color: white;
	}
	
	#wrap_view_form .order_area .delivery_area form table button:hover {
		background-color: #e6e6e6;
	}
	
	#wrap_view_form .order_area .order_pay_calc {
		margin: 0 0 50px 0;
	}
	
	#wrap_view_form .order_area .order_pay_calc table {
		margin: 10px 0 0 0;
		border: solid 1px #e6e6e6;
		width: 100%;
	}
	
	#wrap_view_form .order_area .order_pay_calc table tr td {
		border: solid 1px #e6e6e6;
	}
	
	#wrap_view_form .order_area .order_pay_calc table tr:first-child {
		 background-color: #fbfbfb;
		 font-size: 10pt;
	}

	#wrap_view_form .order_area .order_pay_calc table .tr_style {
		height: 70px;
		text-align: center;
		font-weight: bold;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style td {
		width: 33.3%;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style2 {
		height: 40px;
		font-size: 10pt;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style2 td {
		background-color: #fbfbfb;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style2 td:first-child {
		width: 150px;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style2 td:last-child {
		padding-left: 10px;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style2:last-child td:last-child {
		background-color: white;
		padding: 10px;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style2:last-child td:last-child ul {
		list-style-type: none;
		padding: 20px 0 0 0;
		line-height: 150%;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style_css td {
		font-weight: bold;
		font-size: 15pt;
		height: 90px;
	}
	
	#wrap_view_form .order_area .order_pay_calc table .tr_style_css td:last-child {
		color: #00a0e2;
	}
	
	#wrap_view_form .order_area .order_howtopay .sp_css {
		 font-weight: normal; 
		 color: #00a0e2; 
		 font-size: 10pt; 
		 margin-left: 10px;
	}
	
	#wrap_view_form .order_area .order_howtopay {
		width: 100%;

	}
	
	#wrap_view_form .order_area .order_howtopay .3way { 
		width: 100%;
	}
	
	#wrap_view_form .order_area .order_howtopay .order_final {
		border: solid 1px black;
		border-left: none;
		width: 30%; 
		float: right; 
		height: 320px;
		background-color: #fbfbfb;
	}
	
	#wrap_view_form .order_area .order_howtopay .order_final table {
		width: 100%;
	}
	
	#wrap_view_form .order_area .order_howtopay .order_final table button {
		width: 90%;
		height: 40px;
		border: none;
		background-color: gray;
		color: white;
	}
	
	#wrap_view_form .order_area .order_howtopay .order_final table button:hover { 
		background-color: #737373;
	}

	#wrap_view_form .order_area .order_howtopay .order_final tr {
		height: 50px;
	}
	
	#wrap_view_form .order_area .order_howtopay .order_final tr td {
		padding: 10px;
	}
	
	#wrap_view_form .order_area .order_howtopay .order_final tr td span.span_css {
		display: inline-block;
		width: 50%;
		text-align: right;
	}
	
	#wrap_view_form .order_area .order_howtopay .order_final tr td ul {
		list-style-type: none;
		padding-left: 0;
		line-height: 200%;
	}
	
	#wrap_view_form .order_area .order_howtopay .order_final tr td span.span_css2 {
		display: inline-block;
		width: 50%;
		text-align: right;
	}

	#wrap_view_form .order_area .help {
		border: solid 1px #e6e6e6;
		margin: 40px 0 20px 0;
		display: inline-block; 
		width: 100%;
	}
	
	#wrap_view_form .order_area .help table {
		width: 100%;
	}
	
	#wrap_view_form .order_area .help tr:first-child td {
		background-color: #fbfbfb;
		font-weight: bold;
		font-size: 10pt;
		padding: 10px;
		border-bottom: solid 1px #e6e6e6;
	}
	
	#wrap_view_form .order_area .help tr:last-child td ol {
		margin: 20px;
		padding: 0;
	}
	
	#wrap_view_form .order_area .help2 {
		border: solid 1px #e6e6e6;
		margin: 20px 0 100px 0;
	}
	
	#wrap_view_form .order_area .help2 table {
		width: 100%;
	}
	
	#wrap_view_form .order_area .help2 tr:first-child td {
		background-color: #fbfbfb;
		font-weight: bold;
		font-size: 10pt;
		padding: 10px;
		border-bottom: solid 1px #e6e6e6;
	}
	
	#wrap_view_form .order_area .help2 tr td {
		font-size: 10pt;
		padding: 10px;
	}
	
	#wrap_view_form .order_area .help2 tr:last-child td {
		padding-bottom: 20px;
	}
	
	#wrap_view_form .order_area .help2 tr td ol {
		margin: 0;
		padding: 0 0 0 20px;
	}
	
	#wrap_view_form button.whiteBtn {
		border: solid 1px #e6e6e6; 
		background-color: white; 
		color: #000000; 
		float: right;
	}
	
	#wrap_view_form .order_area .help ol li ,#wrap_view_form .order_area .help2 ol li {
		list-style-type: none;
		padding: 0 0 0 22px;
	}
	
	#wrap_view_form .order_area .item1 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -484px 0;
	}
	
	#wrap_view_form .order_area .item2 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -434px -100px;
	}
	
	#wrap_view_form .order_area .item3 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -384px -200px;
	}
	
	#wrap_view_form .order_area .item4 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -334px -300px;
	}
	
	#wrap_view_form .order_area .item5 {
		background: url('//img.echosting.cafe24.com/skin/base/common/ico_number.png') no-repeat;
		background-position: -284px -400px;
	}
	
	#wrap_view_form .whitebtn {
		border: solid 1px #e6e6e6; 
		background-color: white; 
		color: #000000; 
		margin-left: 10px;
	}
	
	#wrap_view_form .layer {	
		width: 300px;
		position: absolute;
	}

	#wrap_view_form .layer > div.header {
		border: solid 1px #707070;
		border-bottom: none;
		background-color: #495164;
		height: 40px;
		padding: 8px 10px 8px 10px;
		text-align: left;
	}
 
	#wrap_view_form span#title {
		font-size: 12pt;
		font-weight: bold;
	}
	
	#wrap_view_form a.close {
		float: right;
	}
	
	#wrap_view_form a.close:hover {
		cursor: pointer;
	}
	
	#wrap_view_form .layer > div.contents {
		border: solid 1px #707070;
		min-height: 90px;
		padding: 10px 20px 10px 20px;
		background: white;
	}
 
 	#wrap_view_form ul.detail {
 		clear: both;
 		font-size: 10pt;
 		color: #707070;
 		padding-left: 10px;
 	}
 	
 	#wrap_view_form .term {
 		font-weight: normal;
 	}
 	
 	#wrap_view_form .price {
 		float: right;
 	}
 	
 	#wrap_view_form .DeliList {
 		display: inline-block;
 		margin-left: 25px;
 	}
	
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <%-- 꼭 추가해주세요 ! 우편번호 스크립트입니다 !! --%>

<script type="text/javascript">

	$(document).ready(function(){		

		// 전체선택, 해제 체크박스
		 $("input:checkbox[id=allCheck]").click(function(){

				var bool = $(this).prop("checked"); 
				
				$("input:checkbox[name=orderProduct]").prop("checked", bool);
		  });
	  
		// 하나라도 체크가 풀리면 혹은 전체가 다 체크되면 그에 따라 전체선택, 해제 체크박스
		 $("input:checkbox[name=orderProduct]").click(function(){
			 
			 var flag = false;
			 
			 $("input:checkbox[name=orderProduct]").each(function() {
				 
				 var bool = $(this).prop("checked"); 
				 
				 if(!bool) {
					 $("input:checkbox[id=allCheck]").prop("checked", false); 
					 flag = true;
					 return false;
				 }
			 });
			 
			 if(!flag)
				 $("input:checkbox[id=allCheck]").prop("checked", true);
			 
		 }); // end of $("input:checkbox[name=orderProduct]").click -------
		
		 
		 // 새로운 배송지 클릭 했을 시 이메일을 제외한 나머지 form을 비웁니다.
		 $("#newInfo").click(function(){
			
			 $(".emptyforNew").val("");
			 
		 }); // end of $("#newInfo").click -----------
		 
		// 결제 방법에 따라 결제하기 버튼 위 텍스트도 같이 변경
		$("input:radio[name=howtopay]").click(function(){
			
			$("#howtopay").text($(this).val());
			
		}); // end of $("input:radio[name=howtopay]").click -----
		
		
		// select로 이메일을 설정했을 경우 site명이 자동 입력되도록 하기
		$("#choiceEmail").click(function(){
			
			$("#emailSite").val($("#choiceEmail").val());
			
		});
		
		
		// 결제하기를 클릭했을 때 배송지에 잘 적었는지 검사
		$("#finalPay").click(function(){

			var hp2 = $("#hp2").val().trim();
			var hp3 = $("#hp3").val().trim();
			
			if( $("#name").val().trim() == "" ){
				alert("수취자 성명 항목은 필수 입력입니다.");
				$("#name").focus();
				return;
			}
			
			else if( $("#addr1").val().trim() == "" ){
				alert("수취자 우편번호 항목은 필수 입력입니다.");
				$("#searchPost").focus();
				return;
			}
			
			else {
				if( "" == (hp2 && hp3) ){
			
					alert("수취자 휴대전화 번호는 필수 입력사항입니다.");
					$("#hp1").focus();
					return;
				} 
			
				else {
					
					var regExp1 = /^[0-9]{3,4}$/;
					var regExp2 = /^[0-9]{4}$/;
					
					var bool1 = regExp1.test(hp2);
					var bool2 = regExp2.test(hp3);
					
					if(!bool1){
						alert("수취자 휴대전화 가운데 번호는 숫자 3~4자리로만 입력해주세요.");
						$("#hp2").focus();
						return;
					}
				
					if(!bool2){
						alert("수취자 휴대전화 마지막 번호는 숫자 4자리로만 입력해주세요.");
						$("#hp3").focus();
						return;
					}
				}
			
				if( $("#emailId").val().trim() == "" ){
					alert("수취자 이메일 항목은 필수 입력입니다.");
					$("#emailId").focus();
					return;
				}
			
				else {
					$("input:radio[name=howtopay]").each(function(){
						
			 			if($(this).prop("checked")){
			 				 var howtopay = $(this).attr('id');  //payCard 또는 payKakao
			 				
			 				var usePoint = $("#usePoint").val()*1;
			 				var totalPayment = "${price.totalPrice+price.shippingfee}"*1-usePoint;
			 				 
			 				// 아임포트 결제 팝업창 띄우기
		 					var url="/Semi/order/finalPayment.sa?howtopay="+howtopay+"&totalPayment="+totalPayment;
		 					
		 					window.open(url, "finalPayment",
		 							    "left=350px, top=100px, width=820px, height=600px");
			 			}
					}); // end of $("button#finalPay").click()---------------------------------------------------
				}
			}
		});
		
		
		// 결제 ===================================================================================
		$(".3wayPayDetail_Kakao").hide(); // 처음 화면이 로딩되면 card 관련 설명만 보이게 한다.
			
		$("#payKakao").click(function(){
			$(".3wayPayDetail_card").hide();
			$(".3wayPayDetail_Kakao").show();
		});
		
		$("#payCard").click(function(){
			$(".3wayPayDetail_card").show();
			$(".3wayPayDetail_Kakao").hide();
		});
				
		
		// 적립금 사용 ============================================================================
		$("#mileage").hide();
		// 적립금은 결제금액이 4만원 이상일때만 화면에 보인다 ===============================================
		var totalPayment = "${price.totalPrice+price.shippingfee}"*1; // String type에 *1을 해서 int로 바꾼다.
		
		if(totalPayment >= 40000){
			$("#mileage").show();
		}
		
		// 사용할 적립금을 입력하고 enter 또는 화면 이동
		$("#usePoint").keydown(function(){
			if(event.keyCode == 13){
				goUsePoint($("#usePoint").val());
			}
		});
		
		$("#usePoint").focusout(function(){
			goUsePoint($("#usePoint").val());
		});
				
		
		// 배송지 입력 ============================================================================
		// 로딩하자마자 session.loginUser에 저장된 휴대폰 번호, 이메일을 불러와서 input에 넣는다.
		
		$("#name").val("${sessionScope.loginUser.name}");
		$("#hp2").val("${sessionScope.loginUser.hp2}");
		$("#hp3").val("${sessionScope.loginUser.hp3}");
		
		var email = "${sessionScope.loginUser.email}";
		var emailIndex = email.indexOf("@");
		
		var emailId = email.substring(0, emailIndex);
		var emailSite = email.substring(emailIndex+1);
		
		$("#emailId").val(emailId);
		$("#emailSite").val(emailSite);
		
		// 회원정보와 동일 을 클릭했을때================================================================
		$("#sameUserInfo").click(function(){
			
			  $("input[name=name]").val("${sessionScope.loginUser.name}");
			  $("input[name=postnum]").val("${sessionScope.loginUser.post}");
			  $("input[name=addr1]").val("${sessionScope.loginUser.addr1}");
			  $("input[name=addr2]").val("${sessionScope.loginUser.addr2}");
				 
		});	
		
		// 새로운 배송지를 선택했을 때 ======================================================================
		$("#newInfo").click(function(){
			
			// 기본 배송지 정보를 지우고 hp1만 기본(010)으로 만든다.
			$("tbody tr td input").val("");
			$("#hp1").val("010");
			
		});
		
		// 배송지 팝업창에서 선택한 배송지 입력하기 =============================================================
		if("${address}"!= null){
			
			$("#name").val("${address.receiver}");
			$("#postnum").val("${address.post}");
			$("#addr1").val("${address.addr1}");
			$("#addr2").val("${address.addr2}");
			$("#hp2").val("${address.hp2}");
			$("#hp3").val("${address.hp3}");
		}
		
		
	}); // end of document ready ====================================================================

		
	function goInsertOrder(howtopay, totalPayment){
	    
		//deliveryFrm 에 주문 관련 정보를 저장해서 한번에 전송한다.
		 $("#deliveryFrm input[name=howtopay]").val(howtopay);
		 $("#deliveryFrm input[name=totalPayment]").val(totalPayment);
		 $("#deliveryFrm input[name=totalOriginalPrice]").val("${price.totalOriginalPrice}");
		 $("#deliveryFrm input[name=totalSalePrice]").val("${price.totalSalePrice}");
		 
		 var shippingMsg =  $("#shippingMsg").val();
		 $("#deliveryFrm input[name=shippingMsg]").val(shippingMsg);

		 // 주문하기를 누른시점에서 주문 페이지에 남아있는 상품들의 cartno Array
		 var cartnoArr = new Array();
			$("input:checkbox[name=orderProduct]").each(function(){
				var cartno = $(this).val();
				cartnoArr.push(cartno);
				$("#deliveryFrm input[name=cartnoArr]").val(cartnoArr);
			});
		 var usedMileage = $("#deliveryFrm input[name=usedMileage]").val();
		 if(usedMileage==""){
			 usedMileage == 0;
		 }
		 $("#deliveryFrm input[name=mileageToSave]").val("${price.totalPrice*0.03}");

		 var frm = document.deliveryFrm;
		 frm.method = "POST";
		 frm.action = "/Semi/order/orderResult.sa";
		 frm.submit();

	} // end of goInsertOrder(userid,totalPayment)----------------------------------------------------
	
	
	function goUsePoint(usePoint){
		
		var ableMileage = "${ableMileage}";
		if(ableMileage >= 1000 && usePoint <= ableMileage){
				
			var totalSalePrice = "${price.totalSalePrice}"*1;
			var totalPayment = "${price.totalPrice+price.shippingfee}"*1;
			
			var final_TotalSalePrice = numberWithCommas(totalSalePrice+usePoint*1);
			var final_TotalPayment = numberWithCommas(totalPayment-usePoint*1);
			
			$("#final_TotalSalePrice").html(final_TotalSalePrice);
			$(".final_TotalPayment").html(final_TotalPayment);
			
			$("#deliveryFrm input[name=usedMileage]").val(usePoint);
			
		} else if(usePoint > ableMileage && usePoint >= 1000){
			alert("사용 가능 적립금 보다 많습니다. 적립금 사용 금액을 다시 입력해주세요.");
			$("#usePoint").val("");
			return;
			
		} else if(usePoint < 1000) {
			alert("적립금은 1000원부터 사용 가능합니다. 적립금 사용 금액을 다시 입력해주세요.");
			$("#usePoint").val("");
			return;
		}

	} // end of goUsePoint---------------------------------------------------------------

	
	// 세자리마다 "," 찍어주는 함수
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 각각의 input-radio 배송지를 선택하면 해당 주소지를 view단의 input으로 입력하는 함수
	function inputAddr(post,addr1,addr2,receiver){
		
		  $("input[name=name]").val(receiver);
		  $("input[name=postnum]").val(post);
		  $("input[name=addr1]").val(addr1);
		  $("input[name=addr2]").val(addr2);
			 		
	} // end of inputAddr------------------------------------------------------------------------
	
	// 카트에 담은 선택상품 삭제하기
	function goDeleteCart(){
		
		var flag = false;
		var cartnoArr = new Array();
		$("input:checkbox[name=orderProduct]").each(function(){
			
			var checked = $(this).prop("checked");
			
			if(checked){
				flag = true;
			} else {
				// 삭제하는 상품을 제외한 상품의 상품 코드, 수량을 배열에 저장한다.
				var cartno = $(this).val();
				cartnoArr.push(cartno);
			}
		});
		
		if(!flag){
			alert("선택하신 상품이 없습니다.");
		}
		else {
		
			if(confirm("선택하신 상품을 삭제하시겠습니까?")) {
				
				window.location.href="/Semi/order/orderForm.sa?cartnoArr="+cartnoArr;

			}
		} 
		
	} // end of function goDeleteCart() --------
	
	
	// 주소록보기 버튼을 클릭했을때 해당 함수를 호출합니다.
	function goDeliList(){
		window.open("/Semi/addrPopup/list.sa", "Popup", "left=100px, top=100px, width=800px, min-height=490px");
	
	}
	
	// 우편번호찾기 
	function openPOST(){

		new daum.Postcode({
			oncomplete: function(data) {
			    $("#postnum").val(data.postcode1+data.postcode2);
			    $("#addr1").val(data.address);
			    $("#addr2").focus();
			}
		}).open();

	}
	
	// == 총 주문 내역보기 클릭 == // 
   	function ViewLayerO(){
   	  document.getElementById("layerO").style.display='inline';
   	}
	
 	// == 총 할인 내역보기 클릭 == //
   	function ViewLayerD(){
      document.getElementById("layerD").style.display='inline';
    }

   	// == 총 주문 내역보기 닫기 버튼 == // 
   	function myCloseO() {
   	  document.getElementById("layerO").style.display = "none";    
	}
   	
	// == 총 할인 내역보기 닫기 버튼 == // 
   	function myCloseD() {
      document.getElementById("layerD").style.display = "none";    
  	}

</script>


<div id="wrap_view_form">
	<div id="container">
		<div class="title_area">
			<h2>주문서 작성</h2>
		</div>
			
			<div class="order_area">
			
				<div align="left">
				<img class="step2_img" src="/Semi/images/img_order_step2.gif" alt="주문 2단계">
				</div>
				
				<table class="order_info_point">
					<tr>
						<td rowspan="2" class="">혜택정보</td>
						<td>${sessionScope.loginUser.name}님</td>
					</tr>
					<tr>
						<td><a href="/Semi/myshop/mileage/historyList.sa" class="mileCss_A">
						가용적립금 : <span style="color:#00a0e2; font-weight: bold;">
						<fmt:formatNumber value="${ableMileage}" pattern="###,###" />원</span></a>
						</td>
					</tr>
				</table>
				
				<table class="order_list">
					<thead>
						<th colspan="9">배송상품 주문내역</th>
					</thead>
					
					<tbody>
						<tr class="tbody_th" style="background-color: #fbfbfb">
							<td>
								<input type="checkbox" id="allCheck">
							</td>
							<td style="width: 10%;">이미지</td>
							<td>상품정보</td>
							<td>판매가</td>
							<td>수량</td>
							<td>적립금</td>
							<td>배송구분</td>
							<td>배송비</td>
							<td>합계</td>
						</tr>
						
					<c:if test="${productList != null}">
						<c:forEach var="product" items="${productList}" varStatus="status">
							<tr>
								<td>
									<input type="checkbox" id="orderProduct" name="orderProduct" value="${product.cartno}">
								</td>
								<td><a href="/Semi/product/detail.sa?prodcode=${product.prodcode}&cateno=${product.cateno}"><img src="/Semi/imgProd/${product.prodimg}" style="width:100px" alt="주문할상품이미지"></a></td>
								<td><a href="/Semi/product/detail.sa?prodcode=${product.prodcode}&cateno=${product.cateno}" class="orderProduct${status.count}">${product.prodname}</a>
									<div class="orderOption">[옵션: <span class="thisModel">${product.model}</span>]</div>
								</td>
								<td><span style="text-decoration: line-through; font-weight:normal !important;"><fmt:formatNumber value="${product.price}" pattern="###,###" /><span>WON</span></span><br/>
									<span style="font-weight:bold;"><fmt:formatNumber value="${product.saleprice}" pattern="###,###" /><span>WON</span></span>
								</td>
								<td class="qty">${product.qty}</td>
								<td>-</td>
								<td>기본배송</td>
								<td>[조건]</td>
								<td><span style="font-weight: bold;"><fmt:formatNumber value="${product.saleprice*product.qty}" pattern="###,###" /> WON</span></td>
							</tr>
						</c:forEach>
					</c:if>
	
					</tbody>
					
					<tfoot>
						<tr>
							<td colspan="9">
								<div class="order_deli">[기본배송]</div>
								<div class="order_calc" style="display: inline-block; float: right; padding-right: 10px;">
									상품구매금액 <span class="order_original_price" style="font-weight: bold;"><fmt:formatNumber value="${price.totalOriginalPrice}" pattern="###,###" /> WON</span>
									+ 배송비 <span><fmt:formatNumber value="${price.shippingfee}" pattern="###,###" /></span> 
									- 상품할인금액 <span id="totalDiscount"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> WON</span> = 합계: 
									<span class="order_totalPrice" id="order_totalPrice"><fmt:formatNumber value="${price.totalPrice+price.shippingfee}" pattern="###,###" /> WON</span>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="9" class="order_warning">
								<img src="//img.echosting.cafe24.com/skin/base/common/ico_info.gif">&nbsp;상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.
							</td>
						</tr>
						<tr>
							<td  colspan="9" >
								<b>선택상품을</b>
								<button type="button" class="deleteBtn" style="border: solid 1px #e6e6e6; background-color: gray; color: white;" onclick="goDeleteCart()">x 삭제하기</button>
								<button type="button" class="whiteBtn" onclick="javascript:history.back();">이전페이지</button>
							</td>
						</tr>
					</tfoot>
				</table>
				
				<div class="delivery_area" style="font-size: 10pt;">
					<b>배송 정보</b><span style="float: right;"><span class="star">*</span>필수입력사항</span>
					<form name="deliveryFrm" id="deliveryFrm">
						<table style="font-size: 10pt; border: solid 1px #e6e6e6;">
							<tbody>
								<tr>
									<td>배송지 선택</td>
									<td>
										<input type="radio" id="sameUserInfo" name="choiceDeil">
										<label for="sameUserInfo">회원정보와 동일</label>&nbsp;
										<input type="radio" id="newInfo" name="choiceDeil">
										<label for="newInfo">새로운배송지</label>&nbsp;
										
								<%-- 등록된 주소록이 없으면 주소록보기 버튼만 보이고,
									등록된 주소록이 있다면 하나씩 라디오 버튼이 생성되며 클릭 시 해당 정보를 자동 입력시킵니다. (최대10개) --%>
										<div class="DeliList" id="DeliList">
										
											<button type="button" onclick="goDeliList()">주소록 보기</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>받으시는 분&nbsp;<span class="star">*</span></td>
									<td><input type="text" id="name" name="name" class="emptyforNew" required></td>
								</tr>
								<tr>
									<td>주소&nbsp;<span class="star">*</span></td>
									<td>
										<input type="text" id="postnum" name="postnum" class="emptyforNew" size="10" maxlength="5" readonly required/>
										<button type="button" id="searchPost" onClick="openPOST();">우편번호</button><br/>
										 <input type="text" id="addr1" name="addr1" class="emptyforNew" size="50" readonly style="margin: 5px 0 5px 0" placeholder="우편번호 서비스를 이용해주세요." required/> <span style="color: #999999">기본주소</span><br/>
						    			 <input type="text" id="addr2" name="addr2" class="emptyforNew" size="50" required/> <span style="color: #999999">나머지주소(선택입력가능)</span>
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
						    			<input type="text" id="hp2" name="hp2" class="emptyforNew" size="5" maxlength="4" required/>&nbsp;-&nbsp;
						    			<input type="text" id="hp3" name="hp3" class="emptyforNew" size="5" maxlength="4" required/>
									</td>
								</tr>
								<tr>
									<td>이메일&nbsp;<span class="star">*</span></td>
									<td>
										<input type="text" id="emailId" name="emailId" required>&nbsp;@&nbsp; 
										<input type="text" id="emailSite" name="emailSite" required>
										<select id="choiceEmail">
											<optgroup label="이메일 선택">- 이메일 선택 -</optgroup>
											<option>naver.com</option>
											<option>daum.net</option>
											<option>nate.com</option>
											<option>hotmail.com</option>
											<option>yahoo.com</option>
											<option>empas.com</option>
											<option>korea.com</option>
											<option>dreamwiz.com</option>
											<option>gmail.com</option>
											<option value="">직접입력</option>
										</select>
										<br/>
										<span style="color: #999999">
										이메일을 통해 주문처리과정을 보내드립니다.<br/>
										이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해주세요.
										</span>
									</td>
								</tr>
								<tr>
									<td>배송메시지</td>
									<td><textarea id="shippingMsg" style="width:100%; height: 50px;"></textarea></td>
								</tr>
							</tbody>
						</table>

						<input type="hidden" name="howtopay" value="" />
						<input type="hidden" name="cartnoArr" value=""/>
						<input type="hidden" name="usedMileage" value=""/>
						<input type="hidden" name="totalPayment" value=""/>
						<input type="hidden" name="totalSalePrice" value=""/>
						<input type="hidden" name="totalOriginalPrice" value=""/>
						<input type="hidden" name="cartnoArr" value=""/>
						<input type="hidden" name="shippingMsg" value=""/>
						<input type="hidden" name="shippingfee" value="${price.shippingfee}"/>
						<input type="hidden" name="mileageToSave" value=""/>
					</form>
				</div>
				
				<div class="order_pay_calc">
					<b>결제 예정 금액</b>
					<table style="border: solid 2px #000000;">
						<tr class="tr_style">
							<td>총 주문 금액
								<button type="button" class="whitebtn" onclick="javascript:ViewLayerO();" style="font-weight: normal;">내역보기</button>
									<div id="layerO" class="layer" style="display: none; z-index: 9999;">
										<div class="header">
											<span id="title" style="color: white; ">총 주문금액 상세내역</span>
											<a class="close" onclick="myCloseO();">
												<img src="http://img.echosting.cafe24.com/skin/base/common/btn_close.gif"/>
											</a>
										</div>
											
										<div class="contents">
											<p>
												<strong class="price" style="color: #008BCC; font-size: 16px;"><fmt:formatNumber value="${price.totalOriginalPrice +price.shippingfee}" pattern="###,###" />WON</strong>
											</p>
											<br/>
											<hr style="border: none; border-top: 1px dotted #707070; margin: 0px 0 5px 0;"/>
											
											<ul class="detail">
												<li>
													<strong class="detail term" style="float: left;">상품금액</strong> 
													<span class="price discount"><fmt:formatNumber value="${price.totalOriginalPrice}" pattern="###,###" />WON</span>
												</li>
												<li>
													<strong class="detail term" style="float: left;">배송비</strong> 
													<span class="price discount"><fmt:formatNumber value="${price.shippingfee}" pattern="###,###" />WON</span>
												</li>
												<li>
													<strong class="detail term" style="float: left;">지역별 배송비</strong> 
													<span class="price discount">0 WON</span>
												</li>
											</ul>
										</div>	
									</div>
							</td>
							
							<td>총 할인 + 부가결제 금액</td>
							<td>총 결제예정 금액</td>
						</tr>
						<tr class="tr_style tr_style_css">
							<td><fmt:formatNumber value="${price.totalOriginalPrice+price.shippingfee}" pattern="###,###" /> WON</td>
							<td>-<span id="final_TotalSalePrice"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###"/></span> WON</td>
							<td><span class="final_TotalPayment"><fmt:formatNumber value="${price.totalPrice+price.shippingfee}" pattern="###,###" /></span>WON</td>
						</tr>
					</table>
					
					<table>
						<tr class="tr_style2" style="font-weight: bold; font-size: 12pt;">
							<td>총 할인금액</td>
							<td colspan="2"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> WON</td>
						</tr>
						<tr class="tr_style2">
							<td>추가할인금액</td>
							<td colspan="2" style="background-color: white;"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" />WON
								<button type="button" class="whitebtn" onclick="javascript:ViewLayerD();" style="font-weight: normal;">내역보기</button>
									<div id="layerD" class="layer" style="display: none; z-index: 9999;">
										<div class="header">
											<span id="title" style="color: white; ">총 할인금액 상세내역</span>
											<a class="close" onclick="myCloseD();">
												<img src="http://img.echosting.cafe24.com/skin/base/common/btn_close.gif"/>
											</a>
										</div>
											
										<div class="contents">
											<p>
												<strong class="price" style="color: #008BCC; font-size: 16px;"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> WON</strong>
											</p>
											<br/>
											<hr style="border: none; border-top: 1px dotted #707070; margin: 0px 0 5px 0;"/>
											
											<ul class="detail">
												<li>
													<strong class="detail term" style="float: left;">기간할인</strong> 
													<span class="price discount"><fmt:formatNumber value="${price.totalSalePrice}" pattern="###,###" /> WON</span>
												</li>
											</ul>
										</div>	
									</div>
							</td>
						</tr>
						<tr class="tr_style2" style="font-weight: bold; font-size: 12pt;">
							<td>총 부가결제금액</td>
							<td colspan="2">0 WON</td>
						</tr>
						
						<%-- 적립금은 결제금액 4만원이상일 때만 화면에 보여집니다. --%>
						<tr class="tr_style2" id="mileage">
							<td>적립금</td>
							<td colspan="2">
								<input type="text" id="usePoint" name="usePoint"/>&nbsp;원 (총 사용가능 적립금 : 
								<span id="myPoint" style="color: red; font-weight: bold;"><fmt:formatNumber value="${ableMileage}" pattern="###,###" /></span>원)	
								<ul>
									<li>- 적립금은 최소 1,000 이상일 때 결제가 가능합니다.</li>
									<li>- 최대 사용금액은 제한이 없습니다.</li>
									<li>- 1회 구매시 적립금 최대 사용금액은 1,000입니다.</li>
									<li>- 적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</li>
								</ul>
							</td>
						</tr>
						
					</table>
				</div>

				<div class="order_howtopay">
				
					<b style="margin-right: 20px;">결제수단</b><input type="checkbox" id="rememberOrderInfo" name="rememberOrderInfo"><label for="rememberOrderInfo" class="sp_css">결제수단과 입력정보를 다음에도 사용</label>
					
					<div class="3way" style="margin-top: 10px;">
					
						<div class="3way_area" style="border: solid 1px #000000; width: 70%; float: left; height: 320px;">
							<div class="3wayPay" style="height: 50px; padding: 15px; border-bottom: solid 1px #e6e6e6;">
								<input type="radio" id="payCard" name="howtopay" checked="checked" value="카드 결제" checked style="margin-left: 10px;">
								<label for="payCard" style="margin-right: 20px;">카드 결제</label>
								<input type="radio" id="payKakao" name="howtopay" value="카카오페이">
								<label for="payKakao">카카오페이</label>
							</div>
							
							<div class="3wayPayDetail_card" style="padding: 30px 0 0 100px;">
								<img src="//img.echosting.cafe24.com/skin/base/common/ico_info.gif">&nbsp;최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.
								<br/>
								<img src="//img.echosting.cafe24.com/skin/base/common/ico_info.gif">&nbsp;소액결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.
							</div>
							
							
							<%-- 카카오페이 클릭시 위의 3wayPayDetail_card 대신  해당 div로 변경됩니다.--%>
							<div class="3wayPayDetail_Kakao" style="width: 90%; height: 38px; margin: 20px; border: solid 1px #e6e6e6;">
								<div style="display: block; margin: 10px 30px;">
								<img src="//img.echosting.cafe24.com/skin/base/common/ico_info.gif">&nbsp;소액결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.
								</div>
							</div>
							
						</div>
					
						<div class="order_final">
							<table>
								<tbody>
									<tr>
										<td style="text-align: right;"><span id="howtopay" style="font-weight: bold;">카드 결제</span>&nbsp;최종결제 금액</td>
									</tr>
									<tr>
										<td style="text-align: right; color: #00a0e2; font-size: 20pt; font-weight: bold;" >
										<span class="final_TotalPayment">
											<fmt:formatNumber value="${price.totalPrice+price.shippingfee}" pattern="###,###" />
										</span> WON</td>
									</tr>
									<tr style="border-bottom: solid 1px #e6e6e6;">
										<td style="text-align: center;"><button type="button" id="finalPay">결제하기</button></td>
									</tr>
									<tr style="border-bottom: solid 1px #e6e6e6;">
										<td>
											<span class="span_css" style="font-weight: bold;">
											총 적립예정금액</span><span class="span_css2" style="color: red;"><span id="mileageToSave" >
											<fmt:parseNumber integerOnly="true" value="${price.totalPrice*0.03}"/></span>원</span>
										</td>
									</tr> 
									<tr class="tr_forSpan">
										<td>
											<ul>
										 		<li>
										 			<span class="span_css">상품별 적립금</span><span class="span_css2">0원</span>
										 		</li>
										 		<li>
										 			<span class="span_css">회원 적립금</span><span class="span_css2">0원</span>
										 		</li>
										 		<li>
										 			<span class="span_css">쿠폰 적립금</span><span class="span_css2">0원</span>
										 		</li>
										 	</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					
					</div>
					
				</div>
				
				<div class="help">
					<table>
						<tbody>
							<tr>
								<td>
								무이자 할부 이용안내
								</td>
							</tr>
							<tr>
								<td>
									<ol>
										<li class="item1">무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.</li>
					                	<li class="item2">무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</li>
					            	</ol>
								</td>
							</tr>
						</tbody>
					</table>
			    </div>
			    
				<div class="help2">
					<table>
						<tbody>
							<tr>
								<td>
								이용안내
								</td>
							</tr>
							<tr>
								<td>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</td>
							</tr>
							<tr>
								<td>
									 <ol>
										<li class="item1"><a href="javascript:;" onClick="window.open('https://service-api.echosting.cafe24.com/shop/notice_XP_ActiveX.html','','width=795,height=500,scrollbars=yes',resizable=1);">안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</a></li>
			                			<li class="item2"><a href="http://www.microsoft.com/korea/windowsxp/sp2/default.asp" target="_blank">Service Pack 2에 대한 Microsoft사의 상세안내 </a></li>
			            			</ol>
								</td>
							</tr>
						
							<tr>
								<td>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</td>
							</tr>
							<tr>
								<td>
									<ol>
										<li class="item1"><strong>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</strong></li>
					                    <li class="item2">결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br/>(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
					                    <li class="item3">최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.<br/>(무통장, 휴대폰결제 포함)</li>
			                		</ol>
								</td>
							</tr>
							
							<tr>
								<td>세금계산서 발행 안내</td>
							</tr>
							<tr>
								<td>
									 <ol>
										<li class="item1">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
						                <li class="item2">세금계산서는 사업자만 신청하실 수 있습니다.</li>
						                <li class="item3">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
						                <li class="item4">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
						                <li class="item5">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
						            </ol>
								</td>
							</tr>
							
							<tr>
								<td>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</td>
							</tr>
							<tr>
								<td>
								  	<ol>
										<li class="item1">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</li>
						                <li class="item2">신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
						                <li class="item3">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
						            </ol>
								</td>
							</tr>
							
							<tr>
								<td>현금영수증 이용안내</td>
							</tr>
							<tr>
								<td>
								    <ol>
										<li class="item1">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</li>
						                <li class="item2">현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
						                <li class="item3">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
						                <li class="item4">현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
						                <li class="item5">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
						          	</ol>
								</td>
							</tr>
						
						</tbody>
					</table>
				</div>
			
		</div>
	</div>		
</div>



<jsp:include page="../footer.jsp"/>