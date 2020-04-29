<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%-- 결제 시스템이 jQuery기반으로 작동하므로 아래 library 적용 필수!! --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	//	여기 링크를 꼭 참고하세용 http://www.iamport.kr/getstarted
   var IMP = window.IMP;     // 생략가능
   IMP.init('');  // 중요!!  아임포트에 가입시 부여받은 "가맹점 식별코드". 
	
   // 결제요청하기
   IMP.request_pay({
       pg : 'html5_inicis', // 결제방식 PG사 구분
       pay_method :  'kakao',	// 결제 수단
       merchant_uid : 'merchant_' + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호
       name : 'SemiProject',	 // 코인충전 또는 order 테이블에 들어갈 주문명 혹은 주문 번호. (선택항목)원활한 결제정보 확인을 위해 입력 권장(PG사 마다 차이가 있지만) 16자 이내로 작성하기를 권장
       amount : 100,	  // '${totalPayment}'   
       buyer_email : '${email}',  // 구매자 email ~ 이 경우 email 정보를 가져오지 않았으므로 제외
       buyer_name : '${name}',	  // 구매자 이름 
       buyer_tel : '${hp}',    // 구매자 전화번호 (필수항목)
       buyer_addr : '${address}',  
       buyer_postcode : '${post}',
       m_redirect_url : '192.168.50.59:9090/Semi/order/orderResult.sa?userid=${userid}&totalPayment=${totalPayment}'  // 휴대폰 사용시 결제 완료 후 action : 컨트롤러로 보내서 자체 db에 입력시킬것!

   }, function(rsp) {

		if ( rsp.success ) { // PC 데스크탑용
		/*  iform이 권장하는 코드
			~~ 결제가 성공했다면 메세지와 함께 결제 정보를 보여주고, 실패했다면 실패했다는 메세제를 띄운다.
			~~ 이 경우 상위 창으로 이동해서 코인 충전 후 성공 메세지를 보여준다.
			
			if ( rsp.success ) {
			   var msg = '결제가 완료되었습니다.';
			   msg += '고유ID : ' + rsp.imp_uid;
			   msg += '상점 거래ID : ' + rsp.merchant_uid;
			   msg += '결제 금액 : ' + rsp.paid_amount;
			   msg += '카드 승인번호 : ' + rsp.apply_num;
		   } else {
			   var msg = '결제에 실패하였습니다.';
			   msg += '에러내용 : ' + rsp.error_msg;
		   }
		   alert(msg);
	   */
	   
			window.opener.goInsertOrder("${howtopay}", "${totalPayment}");
			//  상위창(orderForm.jsp)의 goInsertOrder 함수로 결제금액을 넘기고 창을 닫는다.
			self.close();
			
        } else {
        	 alert("결제에 실패하였습니다.");
             self.close();
       }

   }); // end of IMP.request_pay()----------------------------

}); // end of $(document).ready()-----------------------------

</script>
</head>	

<body>
</body>
</html>
