<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="../header.jsp"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>위시 리스트</title>
<style>

	div#wish {
		width: 85%;
		margin: 0 auto;
		text-align: center;
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
		padding-bottom: 15px;
	}
   
	#wishText{
		color : #00a0e2;
		font-weight: 900;
		font-size: 20px;
		margin: 50px 0;
	}
	
	#wishText::after {
	
		margin : 0 46.75%;
	    position: absolute;
	    left: 0;
	    right: 0;
	    top:200px;
	    width : 103px;
	    height: 3px;
	    content: '';
	    background-color: #00a0e2;
	    
	}
	
    .cartTabContents {
    	margin: 40px 0px;
    }
    
    table#cartKorTable  {
    	text-align: center;
    	font-weight: bold;
    	border: solid 2px black;
    }
    
    table#cartKorTable > tr {
    	border: solid 2px black;
    }
    
    table#cartKorTable > tbody > tr {
    	height: 220px;
    }
    
    tr.cartKorROW > td > a {
    	cursor: pointer;
    }
    
    tr.cartKorROW > td > a > img {
    	margin: 5px 0;
    }
    
    #wishBtn{
    	padding: 15px;
    	height: 60px;
    }
     
    #wish_left {
    	float:left;
    }
    
     #wish_right {
    	float: right;
    	height: 40px;
    }
    
    .btnDel {
    	width: 81.5px; 
    	height: 24px;  
    	color: white;
    	background-color: #84868B;
    	border: solid 1px #84868B; 
    	font-size: 12px;
    	padding:2px 8px;
    	display: inline-block;
    }

	.btnCart {
		width: 93.5px; 
    	height: 25px;  
		color: black;
		font-size: 12px;
		padding: 2px 8px;
		border: solid 1px #ccc; 
		display: inline-block;
	}
	
	.btnDel:hover{
		text-decoration: none;
		color: white; 
		background-color: gray;
	}
			
	.btnCart:hover{ 
		text-decoration: none;
		color: black; 
		background-color: #eee;
	} 
	
	.btnright{
		display: inline-block;
		width: 120px;
		height: 40px;
	}

	.btnOrder{
    	background-color: #4A5164; 
    	color: white;
    	font-size: 12px;
    	padding: 10px 8px;
	}

	.btnAllDel{
    	background-color: #84868B;
    	color: white;
    	font-size: 12px;
    	padding: 10px 8px;
	}
	
	.btnOrder:hover {
		text-decoration: none;
		color: white; 
	}
	
	.btnAllDel:hover {
		text-decoration: none;
		color: white; 
		background-color: gray;
	}
	
 	#wish_btn {
 		text-align: center;
 	}
 	
	/* =================================================== */
 	#wish .prodImg{
 		width: 180px;
 		height: 180px;
 		margin-right: 15px;
 	}
	
	.prodOption{
		padding-top: 65px;
	}
	
	#wish ul li {
		list-style-type: none;
		text-align: left;
	}
	  
	.listTitle {
	
		font-size: 11pt;
	}
	
	/* ====== page Bar ====== */
	
	.pageNumber {
		font-size:16px; 
		font-weight:bold;
	}
	
	.pagination {
	  display: block;
	}
	
	.pagination a {
	  color: black;
	  padding: 3px 10px;
	  text-decoration: none;
	  cursor : pointer;
	  margin : 0 10px;
	}
 	
	.pagination span.active {
	 	border : solid 2px black;
	 	color: black;
		padding: 3px 10px;
		text-decoration: none;
		cursor : pointer;
		margin : 0 10px;
		font-size: 16px; 
		font-weight: bold;  
	}
 	
	.pagination a:hover, .pagination span:hover {
	   text-decoration: underline;
	}
	
	
</style>

</head>

<body>
	<div id="wish">
	<h3 id="wishText">WISH LIST</h3>
	
	<div id="cartKorea" class="cartTabContents" style="min-height: 150px;">
	<form name="cartKorOrder" id="cartKorOrder" >
		<table id="cartKorTable" style="table-layout:fixed; width: 100%;">
			<colgroup>
				<col style="width: 60px;">
				<col style="width: auto;">
				<col style="width: 160px;">
				<col style="width: 120px;">
				<col style="width: 120px;">
				<col style="width: 120px;">
				<col style="width: 160px;">
				<col style="width: 170px;">
			</colgroup>
			<thead style="font-size: 11pt;">
			<tr class="cartKorROW" style="height: 60px; border-top: solid 5px black; border-bottom: solid 2px black;">
				<th style="text-align: center;"><input type="checkbox" id="allCheck"/></th>
				<th style="text-align: left;" scope="col">ITEM &nbsp; </th>
				<th style="text-align: center;" scope="col">PRICE</th>
				<th style="text-align: center;" scope="col">POINT</th>
				<th style="text-align: center;" scope="col">배송구분</th>
				<th style="text-align: center;" scope="col">DELIVERY</th>
				<th style="text-align: center;" scope="col">TOTAL</th>
				<th style="text-align: center;" scope="col"></th>
			</tr>
			</thead>
			
			<tbody id="cartTbody" style="text-align: center;">
			 <c:if test="${wishList == null || empty wishList}">
			   <tr>
			   	  <td colspan="8" align="center">
			   	    <span style="font-weight: bold;">
			   	    	위시리스트에 담긴 상품이 없습니다.
			   	    </span>
			   	  </td>	
			   </tr>
			   </c:if>	
			
			<c:if test="${wishList != null && not empty wishList}">
			
			<c:forEach var="wish" items="${wishList}" varStatus="status"> 
				<tr class="cartKorROW" id="cartKorROW${status.index}" style="font-size: 11pt;">
					<td style="text-align: center;"><input type="checkbox" name="orderCheck"/></td>
					<td>
						<div style="float: left;">
							<a href="/Semi/product/detail.sa">
							<img class="prodImg" src="/Semi/imgProd/${wish.prodimg}"/>
							</a>
						</div>
						<div class="prodOption">	
							<ul>
								<li><a style="font-size: 11pt;" href="/Semi/product/detail.sa" class="listTitle">${wish.prodname}</a></li>
								<li style="font-size: 8pt;">[옵션: ${wish.model}] </li>
							</ul>
						</div>
						
					</td>
					<td style="text-align: center;">
						<span style="font-weight: normal; display:block;"><del><span class="OriginPrice"><fmt:formatNumber value="${wish.price}" pattern="###,###" /></span>WON</del></span>
	      				<span class="discPrice" style="font-size: 11pt;"><fmt:formatNumber value="${wish.saleprice}" pattern="###,###" /></span>WON
					</td>	
					
					<td style="text-align: center;">-</td>
					<td style="text-align: center;">기본배송</td>
					<td style="text-align: center;"><span>2,500WON</span> <br/> 조건</td>
					<td style="text-align: center;"><span class="discPrice"><fmt:formatNumber value="${wish.saleprice}" pattern="###,###" /></span>WON</td>
					
					<td style="text-align: center;" class="del">
						<a class="cartOne"><img src="http://earpearp.com/img/btn_cart_order.gif" /></a> <br/> 
					    <a class="deleteOne"><img src="http://earpearp.com/img/btn_cart_del.gif" /></a>
					    <input type="hidden" class="wishno" name="wishno" value="${wish.wishno}"/>
					</td>	
				</tr>		

			</c:forEach>
		</c:if>
		</tbody>
		
		
		</table>
				
	</form>	
	
		<div id="wishBtn">
			<span id="wish_left">
					<strong class="text" style="font-size: 12px;">선택상품을&nbsp;</strong>
					<a class="btnDel" style="color: white; text-decoration: none; cursor: pointer;"> × 삭제하기</a>
					<a class="btnCart" style="color: black; text-decoration: none; cursor: pointer;">장바구니 담기</a>
			</span>
			
			<span id="wish_right">
					<a class="btnright btnOrder" style="color: white; text-decoration: none; cursor: pointer;"> 전체상품주문</a>
					<a class="btnright btnAllDel" style="color: white; text-decoration: none; cursor: pointer;">관심상품 비우기</a>
			</span>
			<input type="hidden" id="totalCount" value="${totalCountWish}"/>
			<input type="hidden" id="wishnoArr" value="${wishnoArr}"/>
		</div>

	</div>
	
	<div class="pagination" style="padding-bottom: 60px;">
	
		${requestScope.pageBar}
	
  </div>
	
</div>	

<script>

	$( document ).ready( function() {
		
		// == 체크박스 전체선택 / 전체해제 == // 
		 $("input:checkbox[id=allCheck]").click(function(){
	 
				var bool = $(this).prop("checked"); 
				
				$("input:checkbox[name=orderCheck]").prop("checked", bool);
		  });
	  
		 $("input:checkbox[name=orderCheck]").click(function(){
			 
			 var flag = false;
			 
			 $("input:checkbox[name=orderCheck]").each(function() {
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
		 
		
		// delete 버튼 클릭하면 선택상품을 삭제
		 $(".deleteOne").click(function() {
			 if(confirm("정말 삭제하시겠습니까 ?") == true){
				
				 var wishno = $(this).closest("td").children(".wishno").val();
				 location.href = "/Semi/myshop/wishDel.sa?wishno="+wishno;
				 
				 alert("관심상품이 삭제되었습니다.");
			 }
			 else{
			    return ;
			 }
		 });
		 
		 /////// 선택상품 삭제 //////
		 $(".btnDel").click(function(){
			 var flag = false;
			 $("input:checkbox[name=orderCheck]").each(function() {
				 var bool = $(this).prop("checked");
				 if( bool ) {
					 flag = true;
					 return;
				}
			 });
			 
			 if(!flag) { 
				 alert("상품을 선택해 주세요.")
			 }
			 else {
				 var bool = confirm("선택하신 상품을 삭제하시겠습니까?");
				 var wishno = new Array();
				 if( bool ) {
					 $("input:checkbox[name=orderCheck]").each(function() {
						 var bool = $(this).prop("checked");
						 if( bool ) {
							 var temp = $(this).closest("tr").children(".del").children(".wishno").val();
								
							 if(wishno == "") {
								 wishno = wishno + temp;
							 }
							 
							 else {
								 wishno = wishno + "," + temp;
							 }
						}

					 });
					 location.href = "/Semi/myshop/wishDel.sa?wishno="+wishno;
					 
					 alert("관심상품이 삭제되었습니다.");
					 return false;
				 }
			 } 
		 });
		 
		 /////// 모두 삭제 //////
		 $(".btnAllDel").click(function(){
			 var bool = confirm("관심상품을 비우시겠습니까?");
			 if( bool ) {
				 location.href = "/Semi/myshop/wishDel.sa";
				 alert("관심상품이 삭제되었습니다.");
			 }
			 
		 }); 
		 
		 
		 
		// ================== 장바구니로 보내기 ====================== //
		 
		// GoOrder 버튼 클릭하면 선택상품을 장바구니로 보내기
		 $(".cartOne").click(function() {

			 if(confirm("장바구니에 담으시겠습니까?") == true){

				 var wishno = $(this).closest("td").children(".wishno").val();
				 
				 location.href = "/Semi/order/addBasket.sa?wishnoArr="+wishno;
				 
			 }
			 
			 
		 });

		 // 장바구니 담기 클릭하면 체크박스에 선택된 선택상품을 장바구니로 보내기
		 $(".btnCart").click(function(){
			 var flag = false;
			 $("input:checkbox[name=orderCheck]").each(function() {
				 var bool = $(this).prop("checked");
				 if( bool ) {
					 flag = true;
					 return;
				}
			 });
			 
			 if(!flag) { 
				 alert("상품을 선택해 주세요.")
			 }
			 else {
				 var bool = confirm("선택하신 상품을 장바구니에 담으시겠습니까?");
				 var wishno = new Array();
				 var flag = false;
				 
				 if( bool ) {
					 $("input:checkbox[name=orderCheck]").each(function() {
						 var bool = $(this).prop("checked");
						 if( bool ) {
							 
							 var temp = $(this).closest("tr").children(".del").children(".wishno").val();
							
							 if(wishno == "") {
								 wishno = wishno + temp;
							 }
							 
							 else {
								 
								 wishno = wishno + "," + temp;
							 }
						}
					 });
					 location.href = "/Semi/order/addBasket.sa?wishnoArr="+wishno;
					 flag = true;
				 }
			 } 
		 });
		 
		 /////// 모든 상품 장바구니에 담기 //////
		 $(".btnOrder").click(function(){
			 var bool = confirm("모든 상품을 장바구니에 담으시겠습니까?");
			 var flag = false;
			 
			 var totalCountWish = $("#totalCount").val();
			 var wishno = $("#wishnoArr").val().toString();
			 wishno = wishno.substring(1, wishno.length-1).split(",");
			 
			 
			 if( bool ) {
				location.href = "/Semi/order/addBasket.sa?wishnoArr="+wishno;
				flag = true;
			 }
			  
		 }); 
	});
	
</script>

</body>



<jsp:include page="../footer.jsp"/>