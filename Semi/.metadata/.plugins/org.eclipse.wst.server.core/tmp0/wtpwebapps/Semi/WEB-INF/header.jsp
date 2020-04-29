<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>나이거사조</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

/* ======= Header css ======= */
	header {
 		margin : 0 auto;
 		margin-bottom : 40px;
	}
	
	body {
	
		font-family: 'Open Sans',NanumGothic,'Malgun Gothic',Dotum,sans-serif;
	
	}
	
  	#headtable, .headth, .headtd {
		border : solid 2px black;
		border-collapse: collapse;
	
	}

	#headtable {
		width : 85%;
		border-bottom: solid 6px black;
	}

	img#headerimg {
		width : 118px;
		height : 118px;
	}
	
	#copy, #navbar {
		margin : 10px 0;
		font-weight: 700;
	}
	
	
	.headtd {
		text-align: left;
		padding-left : 12px;
		width : 20%;
	}
	
	#copy {
		float: left;
		margin-left : 10px; 
		vertical-align: middle;
		position: relative;
		top: 2.1px;
	}

	#navbar {
		display: inline;
		float: right;
		margin-right : 5px;
		color : black; 
	}
	
	 #navbar :hover {
	 	text-decoration: underline;
	 }
	 
	 #navbar a {
	 	text-decoration: none;
	 	color : black; 
	 }	
	 
	 .nav {
	 	display: inline-block;
	 	margin-right : 15px; 
	 }
	 
	 #menu {
	
		font-weight: bold;
	}
	 
	 #menu :hover {
	 	background-color: #0099e6;
	 	cursor: pointer;
	 }

	 .dropbtn {
		  border: none;
	 }

	/* .dropdown {
	  position: relative;
	  display: inline-block;
	} */

	.dropdown-content {
	  display: none;
	  position: absolute;
	  top : 54.3px;
	  right : -2px;
	  width : 101.55%;
	  /* width : 279.5px; */
	  background-color: white; 
	  z-index: 1;
	}
	
	.dropdown-content a {
	  border : solid 2px black;
	  border-top : none;
	  color : #0099e6;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	  
	}

	.dropdown:hover .dropdown-content {
		display: block;
	}
  
	.dropdown-content {
  		background-color: white !important;
  	} 
  
	.dropdown-content a:hover {
  		color : white;
    }
  
	i {
  		position : relative;
  		top : 2px;
  		right : 2px;
  	}
 
 	.prodLink {
 		color: black;
 	}
 	
 	.prodLink:hover {
 		text-decoration: none;
 		color: black;
 	}
/* ======= SideBar css ======= */
   
	.sidenavLeft {  
		position: fixed;
	    z-index: 1;
	    top: 280px;
	    left: 15px;
	    overflow-x: hidden;
	    padding: 8px;
	}
       
   .sidenavRight {
		position: fixed;
		z-index: 1;
		top: 320px;
		right: 20px;
		overflow-x: hidden;
		padding: 10px;
	}

   .sidenav a {
		padding: 6px;
		text-decoration: none;
		font-size: 25px;
		display: block;
	}
	
	.scroll {
	 	writing-mode:tb-rl;
	}

	.sidemenu {
		 height: 100%;
		 width: 100%;
		 position: fixed;
		 z-index: 1;
		 top: 0;
		 left: 0;
		 background-color: #111;
		 overflow-x: hidden;
		 padding-top: 60px;
		 opacity: 0.9;
		 font-size: 14px;
		 min-width: 10px;
	}

	.sideicon{
		width: 20%;
		margin: 0 auto;	
	}
	
	.sidemenumain {
		text-align: center;
		font-size: 16px;
		color: white;
		display: block;
		font-weight: bold;
		padding-bottom: 5px;
		line-height: 250%;
	}
	
	.submenu {
		text-align: center;
		font-size: 14px;
		color: white;
		display: block;
		padding-bottom: 5px;
		line-height: 1.2;
		height: 25px;
	}
	
	.information_area{
		text-align: center;
		font-size: 12px;
		color: white;
		display: block;
		padding-bottom: 5px;
		line-height: 1.5;
		height: 25px;
	}

	#sidemenu a:hover{
		color: orange;
		text-decoration:none;
	}

	.innerlogo{
		 text-align: center; 
		 display: block;
		 padding: 50px 60px 60px 50px;
		 height: 25px;
	}

	 .closebtn {  /* 사이드메뉴닫기 X */
		position: absolute;
		top: 0;
		right: 25px;
		font-size: 36px;
		margin-left: 50px;
		color: white;
	}

	.searchbutton{
		 border: none;
		 background: none;
		 outline: none;
		 float:left;
	}
  
	#searchbutton2{
		 border: none;
		 background: none;
		 padding: 0px 0px 1px 0px;
		 outline: none;
		 float:left;
	}
  
	.search-container{
		 display:inline-block;
		 position: fixed;
	}
	
	.icon_area{
		 text-align: center;
	}

	@media screen and (max-height: 450px) {
		.sidemenu {padding-top: 15px;}
		.sidemenu a {font-size: 18px;}
	}
	
	.searchbtn{
		border: solid 2px black;
		float:left;
	}

 
/* ======= Container css ======= */
   
   #contents {
   		padding-top: 40px;	
   }
   
   .container {
    	margin-bottom: 50px;
    	width: 90.45%;
    	height: auto;
   }
   
   .prodImg {
   		width: auto;
   }
   
    div.price li {
 		list-style-type: none;
    }
  
	div.price ul {
	 	padding: 10px;
	 }
	  
	 a.listTitle {
	  	font-size: 20px;
	  	font-weight: bold;
	  	color: black;
	  }
  
	.listTitle{
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		display: block;
	}
  
	span.currentPrice {
		font-weight: bold;
	}
  
	span.discPrice {
		font-weight: bold;
		font-size: 18px;
	}

	img.bestBar {
		margin-bottom: 30px;
		width: 95.8%;
		position: relative;
		left: 2%;
	}
	
 
	@media (min-width: 768px) {
 
 		.col-sm-4{
		  	border: solid 2px black; 
		  	border-top: solid 6px black;
		  	padding: 0px;
		  	margin: 1%;
		  	width: 30%;
		  	text-align: left;
		    position: relative;
		  	left: 2%; 
 		 }
 	}
 
 
	@media (max-width: 768px) {
   
    	.col-sm-4{
	    	border: solid 2px black; 
		  	border-top: solid 4px black;
		  	padding: 0px;
		  	margin: 1%;
		  	text-align: left;
    	}
  	}
   
/* ======= Footer css ======= */
    
   	footer {
		margin:0 auto;
	}  
  
 	#footer {
		background-color: #00a2e8;
		font-family: 'Open Sans', NanumGothic,'Malgun Gothic', Dotum,sans-serif;
		font-weight: bold;
		color: #000;
	}
	
	#footer .footer_inner {
		margin: 0 auto;
		width: 85%;
		padding: 40px 0 80px 0;
	}
	
	#footer .footer_inner .layout {
		display: table !important;
	    width: 100% !important;
	    table-layout: fixed !important;
	}
	
	#footer .footer_info {
		font-size: 12px;
   		border: 2px solid #000;
    	border-top-width: 6px;
    	box-sizing: border-box;
    	height: 95px;
	}
	
	#footer .footer_info .logo_area {
		display: table-cell;
		vertical-align: middle;
		width: 20%;
	    border-right: 2px solid #000;
	    box-sizing: border-box;
	}
	
	#footer .footer_info .info_area > div {
		min-height: 43px;
    	line-height: 1.2;
    	box-sizing: border-box;
    	padding-left: 18px;
    	font-size: 18pt;
	}
	
	#footer .footer_info .info_area .work_time {
		font-size: 11pt;
		border-top: 2px solid #000;
	}
	
	#footer .css_middle {
		display: table-cell;
		vertical-align: middle;
	}
	
	#footer .footer_line {
		display: block;
		height: 30px;
	}

	#footer .footer_menu {
		float: left;
		width: 40%;
		border-right: 2px solid #000;
		box-sizing: border-box;
	}
	
	#footer .footer_menu ul:first-child {
		border-right: 2px solid #000;
		box-sizing: border-box;
	}
	
	#footer ul {
		margin: 0;
		padding: 0;
	}
	
	#footer .footer_menu > ul {
		float: left;
   		width: 50%;
	}
	
	#footer .footer_menu > ul > li + li {
    	border-top: 2px solid #000;
	}
	
	#footer li {
		list-style-type: none;
		display: list-item;
		text-align: -webkit-match-parent;
	}
	
	#footer .footer_menu > ul > li > a {
		color: #000;
	    line-height: 45px;
	    padding: 0 15px;
	    font-weight: bold;
	    text-decoration: none;
    }
	
	#footer .company_info {
		display: table;
		height: 100%;
		width: 60%;
	}
	
	#footer .company_info .top_info {
		padding: 13px;
		font-weight: normal;
	}
	
	#footer .company_info .bottom_info {
		border-top: 2px solid #000;
    	padding: 12px 13px;
	}
	
	#footer .company_info .bottom_info > a {
		float: right;
		margin-left: 10px;
	}
	
	@media (max-width: 1000px) {
    	
    	#footer {
    		position: absolute;
    	}
    	
    	#footer .footer_inner {
    		width: 80%;
    	}
    	
    	#footer .footer_info .logo_area {
    		width: 40%;
    	}
    	
	    #footer .middle div {
	    	display: inline-block;
	    	width: 100%;
	    }
	    
	    #footer .footer_menu {
	    	border-right: 0;
	    }
    
    	#footer .top_info {
    		border-top: 2px solid #000;
    	}
  	}
  
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

	$( document ).ready( function() {
		
		$( window ).scroll( function() {
 		 } );
		
		$("#sidemenu").css('display','none');
		
  		$( '.top' ).click( function() {
    		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
    		return false;
  		} );
  		
  		$(".searchbutton").click(function(){
			$(".search-container").toggle();
			$(this).toggleClass("searchbtn");
		 });
  		
  		$("#searchbutton2").click(function(){
  			
  			event.preventDefault();
  			
  			if($("#search").val() == "") {
				alert("검색어를 입력하세요!");
			} 
  			
  			else {
  				var frm = document.searchFrm;
  	  			
  	  			frm.method = "GET";
  	  			frm.action = "/Semi/product/search.sa"; 
  	  			frm.submit();
  			}

		 });
  		
  		
  		
		$(".icon").hover(function() {
		  	
	  		$(this).find("i").removeClass("fa-angle-down");
	  		$(this).find("i").addClass("fa-angle-up");
	  		
	  	}, function() {
	  		
	  		$(this).find("i").removeClass("fa-angle-up");
	  		$(this).find("i").addClass("fa-angle-down");
	  		
	  	});
  		
	});
      
	function openMenu() {
		$("#sidemenu").css('display','');
		$(".carousel-indicators").css("z-index", "-1");
		$(".sidenavRight").css("z-index", "-1");
    }

   	function closeMenu() {
		$("#sidemenu").css('display','none');
		$(".carousel-indicators").css("z-index", "1");
		$(".sidenavRight").css("z-index", "1");
    }
    	
	  
</script>
    
</head>
<body>

<!-- ==============================Header================================== -->
<header>
	<table id = "headtable" style = "margin : 0 auto; height : 125px;">
		<tr class = "headtr">
			<th class = "headth" rowspan = "2" style = "padding:0; cursor : pointer;">
				<img id="headerimg" src="http://earpearp.com/img/logo.gif" onclick="location.href = '/Semi/mainPage.sa'" style = "margin : 0 auto; display : block;">
			</th>
			<th class = "headth" colspan = "5">
				<span id = "copy">COPYRIGHT BY &copy;EARPEARP ALL RIGHTS RESERVED.</span>
				<div id = "navbar">
					<c:if test="${sessionScope.loginUser == null}">
					<a href= "/Semi/member/login.sa" class="nav">LOGIN</a>
					</c:if>
					<c:if test="${sessionScope.loginUser != null}">
					<a href= "/Semi/member/logout.sa" class="nav">LOGOUT</a>
					</c:if>
					<c:if test="${sessionScope.loginUser == null}">
					<a href= "/Semi/member/join.sa" class="nav">JOIN</a>
					</c:if>
					<c:if test="${sessionScope.loginUser != null}">
					<a href= "/Semi/member/modify.sa" class="nav">MODIFY</a>
					</c:if>
					<c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.status == 4}">
					<a href= "/Semi/admin/admin.sa" class="nav">ADMIN</a>
					</c:if>
					<c:if test="${sessionScope.loginUser.status != 4}">
					<a href= "/Semi/myshop/myPageIndex.sa" class="nav">MYPAGE</a>
					</c:if>
					<a href= "/Semi/order/basket.sa" class="nav" style = "color : red;">
					<img id = "cart" src = "/Semi/images/cart.png" style = "width: 22px; height: 22px; margin-right: 4px; vertical-align: text-bottom;" />CART(${ sessionScope.cartCount })</a>
				</div>		
			</th>
		</tr>
		
		<tr id = "menu" class = "headtr">
			<td class="headtd" onclick = "location.href='/Semi/product/list.sa?cateno=1'"><a class="prodLink">HARD CASE</a></td>
			<td class="headtd" onclick = "location.href='/Semi/product/list.sa?cateno=2'"><a class="prodLink">TOUCH/SLIDE CASE</a></td>
			
			<td class="dropdown headtd">
				<div class="dropbtn">
					<div class = "icon" style="padding-bottom: 5px;"  onclick = "location.href='/Semi/product/list.sa?cateno=3'" ><a class="prodLink">JELLY CASE&nbsp; <i class='fa fa-angle-up' style='font-size:22px'></i></a></div>
					 	<div class="dropdown-content">
					    <a href="/Semi/product/list.sa?cateno=3" class="prodLink">CLEAR JELLY CASE</a>
					    <a href="/Semi/product/list.sa?cateno=4" class="prodLink">COLOR JELLY CASE</a>
					</div>
				</div>
			</td>
			
			<td class = "headtd"  onclick = "location.href='/Semi/product/list.sa?cateno=5'"><a class="prodLink">LIMITED CASE</a></td>
			
			<td class="dropdown headtd">
				<div class="dropbtn">
					<div class = "icon" style="padding-bottom: 5px;" onclick = "location.href='/Semi/board/product/list.sa?boardNo=2'" ><a class="prodLink">COMMUNITY&nbsp; <i class='fa fa-angle-up' style='font-size:22px'></i></a></div>
				  	<div class="dropdown-content" >
				    	<a href="/Semi/board/free/list.sa?boardNo=1">NOTICE</a>
				    	<a href="/Semi/board/product/list.sa?boardNo=2">Q & A</a>
				    	<a href="/Semi/board/product/list.sa?boardNo=3">REVIEW</a>
				   </div>
				</div>
			</td>
		</tr>
	</table>
</header>

<!-- ====================================SideBar=================================== -->
<div class="quick menu">

	<div class="sidenavLeft sidenav" style= position:fixed;>
		<a><span style="cursor:pointer; margin-left:7px;" onclick="openMenu()"><img src="/Semi/images/ico_menu.png"/></span></a>
		<a style="padding-bottom: 0px;"><button class="searchbutton"><img src="/Semi/images/ico_search.png" /></button>
			<div class="search-container" style="display: none;">
				<form name="searchFrm"> <!-- 찾기 기능 -->
				<input type="text" id="search" name="search" style="max-width:200px; outline:none; border:solid 2px black; float:left">
				<input type="hidden" />
				<button id="searchbutton2"><img src="/Semi/images/btn_search.png" style="margin-right: 10px;" /></button>
			    </form>
			</div>
		</a>	  
		<a href="https://www.facebook.com/earpearppp/" ><img src="/Semi/images/ico_facebook.png" style="padding: 20px 0px 1px 2px; margin-left:6px;"/></a>
		<a href="https://www.instagram.com/earp_earp/"><img src="/Semi/images/ico_instagram.png" style="margin-left:6px; " /></a>
	</div>
		
	<div id="sidemenu" class="sidemenu">
	<div class="sideicon">
		<span class="innerlogo"><img src="/Semi/images/total_logo.png"/></span>
		<a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times;</a>
		
		<a href="/Semi/product/list.sa?cateno=1" class="sidemenumain" style="text-decoration:underline; text-underline-position: under;">HARD CASE ∧</a>
		
		<a href="/Semi/product/list.sa?cateno=2" class="sidemenumain" style="text-decoration:underline; text-underline-position: under;">TOUGH/SLIDE CASE ∧</a>
		
		<a href="/Semi/product/list.sa?cateno=3" class="sidemenumain" style="text-decoration:underline; text-underline-position: under;">JELLY CASE ∧</a>
		<a href="/Semi/product/list.sa?cateno=3" class="submenu">CLEAR JELLY CASE</a>
		<a href="/Semi/product/list.sa?cateno=4" class="submenu">COLOR JELLY CASE</a>
		<a href="/Semi/product/list.sa?cateno=5" class="sidemenumain" style="text-decoration:underline; text-underline-position: under;">LIMITED CASE ∧</a>
		
		<a href="/Semi/board/free/list.sa" class="sidemenumain" style="text-decoration:underline; text-underline-position: under;">COMMUNITY ∧</a>
		<a href="/Semi/board/free/list.sa" class="submenu">NOTICE</a>
		<a href="/Semi/board/product/list.sa" class="submenu">Q&A</a>
		<a href="/Semi/board/product/list.sa" class="submenu">REVIEW</a><br/>
	
		<div class="icon_area">
			<a href="https://www.instagram.com/earp_earp/"><img src="/Semi/images/ico_insta_total.png" style="padding-right: 8px;"/></a>
	  		<a href="https://www.facebook.com/earpearppp/"><img src="/Semi/images/ico_facebook_total.png"/></a>
  		</div><br/><br/>
  		
  		<div class="information_area">
			<p>KH 정보교육원 나이거사조<br/>
			MONDAY-FRIDAY 13:00-15:00,<BR/>
			SAT/HOLIDAY OFF,<BR/>BREAKE TIME 12:00-13:00</p>
		</div>
	</div>
	</div>
	
	<div class="sidenavRight sidenav">
	  <a href="#scroll"><span class="top"><img src="/Semi/images/btn_top.png"/></span></a>
	</div>
</div>
