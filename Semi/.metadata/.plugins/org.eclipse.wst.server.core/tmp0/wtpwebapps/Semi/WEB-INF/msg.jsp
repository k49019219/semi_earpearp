<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	alert("${message}");
	
	javascript:location.href="${loc}"; // loc에 담긴 주소로 페이지 이동 (javascript 는 생략 가능)
	
	self.close(); // 팝업창 닫기
     
	// 부모창 새로고침 (opener : 팝업창을 열게 한 부모창)
	opener.location.reload(true);
	
/*	
	location.href="javascript:history.go(-2);"; // 이전,이전 페이지로 이동, ;(세미콜론) 생략 가능
	location.href="javascript:history.go(-1)";  // 이전 페이지로 이동
	location.href="javascript:history.go(0)";   // 새로고침 (현재 페이지로 이동 / 캐시에서 읽어옴)
	location.href="javascript:history.back(1)"; // 다음 페이지로 이동
		
	location.href="javascript:history.back()";         // 이전 페이지로 이동
	location.href="javascript:location.reload(true)";  // 새로고침 (현재 페이지로 이동 / 서버에 가서 다시 읽어옴)	
	location.href="javascript:history.forward()";      // 다음 페이지로 이동	
*/

</script>    