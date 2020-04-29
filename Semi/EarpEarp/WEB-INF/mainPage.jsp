<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="header.jsp" />  
    
<style>


/* ======= Carousel css ======= */
  
	.carousel {
	    border: solid 2px black;
	    margin-bottom: 50px;
	    width: 85%;
	    margin : 43px auto 50px auto;
	}
   
   .carousel-inner img {
		width: 100%; /* Set width to 100% */
		height: auto;
		margin: auto;
		min-height:200px;
    }
    
	/* ul tag*/
	.carousel-indicators {
	 	  bottom:-75px;
	 }
 
	.carousel-indicators li {
		width: 30px;				/* active가 아닌 li 가로 크기 */
		height: 30px;				/* active가 아닌 li 세로 크기 */
		margin: 0px 10px 7px 10px;
		border-radius: 100%;
	 }
	 
	 
	 .carousel-indicators li.pacman1{
		width:43px;				/* active인 li 가로 크기(팩맨) */
		height:43px;			/* active인 li 세로 크기(팩맨) */
		margin:0px 10px 0px 10px;
		background-image: url("./images/pacman1.png");
		background-size:100%;
	}  
	
	.carousel-indicators li.active{
		width:45px;				/* active인 li 가로 크기(팩맨) */
		height:45px;			/* active인 li 세로 크기(팩맨) */
		margin:0px 10px 0px 10px;
		background-image: url("./images/pacman2.png");
		background-size:100%;
		
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
   

</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

	$( document ).ready( function() {
		
	});
	  
</script>
    
</head>
<body>

<!-- ================================Carousel====================================== -->
	
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
	    <li data-target="#myCarousel" data-slide-to="0" class="active pacman1"></li>
	    <li data-target="#myCarousel" data-slide-to="1" class="active pacman1"></li>
	    <li data-target="#myCarousel" data-slide-to="2" class="active pacman1"></li>
	    <li data-target="#myCarousel" data-slide-to="3" class="active pacman1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    	<div class="item active">
        	<img src="images/visual1.jpg" alt="Image">
      	</div>

	    <div class="item">
	        <img src="images/visual2.jpg" alt="Image">
	    </div>
	      
	    <div class="item">
	        <img src="images/visual3.jpg" alt="Image">
	    </div>
	      
	    <div class="item">
	        <img src="images/visual4.jpg" alt="Image">
        </div>
    </div>
</div>

<!-- =========================================Contents================================ -->

<div id="contents"> 
<div class="container text-center">    
  <img src="http://earpearp.com/img/title_hardbest.png" class="img-responsive bestBar"/>
  <div class="row">
  	<div class="col-sm-4">
  	  <a href="/Semi/product/detail.sa?cateno=1&prodcode=123-005">
  	  <img src="http://earpearp.com/web/product/big/201910/af42ad55f65d299104a9252c86973a5a.jpg" class="prodImg" style="width:100%"/>
      </a>
      <div class="price">
      	<ul>
      		<li><a href="/Semi/prodcut/detail.sa?cateno=1&prodcode=123-005" class="listTitle">Eyes bear-yellow</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>19,000WON</del></span></li>
      		<li><span class="discPrice">9,800WON</span></li>
      	</ul>
      </div>
    </div>
    <div class="col-sm-4"> 
      <a href="/Semi/product/detail.sa?cateno=1&prodcode=123-049">
      <img src="http://earpearp.com/web/product/big/201910/092b6b07f4f73afbc62826fc248978ef.jpg" class="prodImg" style="width:100%"/>
      </a>
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=1&prodcode=123-049" class="listTitle">dancing bear-blue</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>19,000WON</del></span></li>
      		<li><span class="discPrice">9,800WON</span></li>
      	</ul>
      </div>  
    </div>
    <div class="col-sm-4">
      <a href="/Semi/product/detail.sa?cateno=1&prodcode=123-003">
      <img src="http://earpearp.com/web/product/big/201910/96f38ad3ba951551baae73bcb6aca75d.jpg" class="prodImg" style="width:100%"/>
      </a>
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=1&prodcode=123-003" class="listTitle">True luv-pink</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>19,000WON</del></span></li>
      		<li><span class="discPrice">9,800WON</span></li>
      	</ul>
      </div>
    </div>
    <br/>
    <div class="col-sm-4">
      <a href="/Semi/product/detail.sa?cateno=1&prodcode=123-032">
      <img src="http://localhost:9090/Semi/imgProd/32_hard_Bear%20flower%20garden-purple.jpg" class="prodImg" style="width:100%"/>
      </a>  
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=1&prodcode=123-032" class="listTitle">Bear flower garden-purple</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>19,000WON</del></span></li>
      		<li><span class="discPrice">9,800WON</span></li>
      	</ul>
      </div>
    </div>
    <div class="col-sm-4"> 
      <a href="/Semi/product/detail.sa?cateno=1&prodcode=123-028">
      <img src="http://earpearp.com/web/product/big/201910/0ad4092920be23c8ef05527cee088f25.jpg" class="prodImg" style="width:100%"/>
      </a>  
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=1&prodcode=123-028" class="listTitle">Animal friends-navy</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>19,000WON</del></span></li>
      		<li><span class="discPrice">9,800WON</span></li>
      	</ul>
      </div>  
    </div>
    <div class="col-sm-4">
      <a href="/Semi/product/detail.sa?cateno=1&prodcode=123-035">
      <img src="http://earpearp.com/web/product/big/201910/05eb30958d451353262b78bbbd31ef5e.jpg" class="prodImg" style="width:100%"/>
      </a>  
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=1&prodcode=123-035" class="listTitle">Squirrel Acorns-yellow</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>19,000WON</del></span></li>
      		<li><span class="discPrice">9,800WON</span></li>
      	</ul>
      </div>
    </div>
  </div>
</div><br>

<div class="container text-center">    
  <img src="http://earpearp.com/img/title_jellybest.png" class="img-responsive bestBar"/>
    <div class="row">
  	<div class="col-sm-4">
  	  <a href="/Semi/product/detail.sa?cateno=3&prodcode=123-115">
      <img src="http://earpearp.com/web/product/big/201910/4256c65ed5255141a20c268576e90b88.jpg" class="prodImg" style="width:100%"/>
      </a> 
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=3&prodcode=123-115" class="listTitle">Picnic bear(젤리)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>17,000WON</del></span></li>
      		<li><span class="discPrice">7,900WON</span></li>
      	</ul>
      </div>
    </div>
    <div class="col-sm-4"> 
      <a href="/Semi/product/detail.sa?cateno=3&prodcode=123-110">
      <img src="http://earpearp.com/web/product/big/201910/2a065c3b442bebef2ae4e8249fb7555a.jpg" class="prodImg" style="width:100%"/>
      </a> 
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=3&prodcode=123-110" class="listTitle">dancing bear(젤리)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>17,000WON</del></span></li>
      		<li><span class="discPrice">7,900WON</span></li>
      	</ul>
      </div>  
    </div>
    <div class="col-sm-4">
      <a href="/Semi/product/detail.sa?cateno=3&prodcode=123-117">
      <img src="http://earpearp.com/web/product/big/201910/aa72669896a78d28977cf823894ed2b7.jpg" class="prodImg" style="width:100%"/>
      </a>  
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=3&prodcode=123-117" class="listTitle">Bear friends(젤리)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>17,000WON</del></span></li>
      		<li><span class="discPrice">7,900WON</span></li>
      	</ul>
      </div>
    </div>
    <div class="col-sm-4">
      <a href="/Semi/product/detail.sa?cateno=3&prodcode=123-130">
      <img src="http://earpearp.com/web/product/big/201910/994e6dc302d2911784fc00226f399001.jpg" class="prodImg" style="width:100%"/>
      </a>  
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=3&prodcode=123-130" class="listTitle">Dot cherry big bear(젤리) </a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>17,000WON</del></span></li>
      		<li><span class="discPrice">7,900WON</span></li>
      	</ul>
      </div>
    </div>
    <div class="col-sm-4"> 
      <a href="/Semi/product/detail.sa?cateno=3&prodcode=123-022">
      <img src="http://earpearp.com/web/product/big/201910/205947c6192776a03cc205e5813d736b.jpg" class="prodImg" style="width:100%"/>
      </a>  
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=3&prodcode=123-022" class="listTitle">Rose squirrel(젤리)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>17,000WON</del></span></li>
      		<li><span class="discPrice">7,900WON</span></li>
      	</ul>
      </div> 
    </div>
    <div class="col-sm-4">
      <a href="/Semi/product/detail.sa?cateno=3&prodcode=123-103">
      <img src="http://earpearp.com/web/product/big/201910/fe2b64d120f14941a68b58f7b4593d7e.jpg" class="prodImg" style="width:100%"/>
      </a>  
      <div class="price">
      	<ul>
      		<li><a href="/Semi/product/detail.sa?cateno=3&prodcode=123-103" class="listTitle">Eyes bear(젤리)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>17,000WON</del></span></li>
      		<li><span class="discPrice">7,900WON</span></li>
      	</ul>
      </div>
    </div>
  </div>
</div><br>


<div class="container text-center">    
  <img src="/Semi/images/title_comingsoon.png" class="img-responsive bestBar" />
    <div class="row">
  	<div class="col-sm-4">
  	
      <img src="http://earpearp.com/web/product/big/201911/bb6f79e7ac9263e3a167bc477852b11c.jpg" class="prodImg" style="width:100%" alt="hard_CheeryBigBearYellow"/>
     
      <div class="price">
      	<ul>
      		<li><a class="listTitle">Dancing bear-white(떡메모지)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>3,500WON</del></span></li>
      		<li><span class="discPrice">2,100WON</span></li>
      	</ul>
      </div>
    </div>
    <div class="col-sm-4"> 
    
      <img src="http://earpearp.com/web/product/big/201911/73b08d2310fd091aeec981ad3b877d60.jpg" class="prodImg" style="width:100%" alt="hard_CheeryBigBearYellow"/>
    
      <div class="price">
      	<ul>
      		<li><a class="listTitle">Dancing bear-purple(떡메모지)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>3,500WON</del></span></li>
      		<li><span class="discPrice">2,100WON</span></li>
      	</ul>
      </div>  
    </div>
    <div class="col-sm-4">
    
      <img src="http://earpearp.com/web/product/big/201911/e6865ac766811c4dcd005b29fb9a99a6.jpg" class="prodImg" style="width:100%" alt="hard_CheeryBigBearYellow"/>
      
      <div class="price">
      	<ul>
      		<li><a class="listTitle">Rose squirrel(떡메모지)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>3,500WON</del></span></li>
      		<li><span class="discPrice">2,100WON</span></li>
      	</ul>
      </div>
    </div>
    <br/>
    <div class="col-sm-4">
    
      <img src="http://earpearp.com/web/product/big/201911/10766813e4f5dc52f9b024fb5f34d951.jpg" class="prodImg" style="width:100%" alt="hard_CheeryBigBearYellow"/>
      
      <div class="price">
      	<ul>
      		<li><a class="listTitle">Cherry big bear(떡메모지)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>3,500WON</del></span></li>
      		<li><span class="discPrice">2,100WON</span></li>
      	</ul>
      </div>
    </div>
    <div class="col-sm-4"> 
    
      <img src="http://earpearp.com/web/product/big/201911/459244113d40effdb8d716662a4db558.jpg" class="prodImg" style="width:100%" alt="hard_CheeryBigBearYellow"/>
     
      <div class="price">
      	<ul>
      		<li><a class="listTitle">True luv(떡메모지)</a></li>
      		<li><span>기간한정세일 11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>3,500WON</del></span></li>
      		<li><span class="discPrice">2,100WON</span></li>
      	</ul>
      </div>
    </div>
    <div class="col-sm-4">
    
      <img src="http://earpearp.com/web/product/big/201911/3a19013c656ae48f52537c68f9adb720.jpg" class="prodImg" style="width:100%" alt="hard_CheeryBigBearYellow"/>
    
      <div class="price">
      	<ul>
      		<li><a class="listTitle">Grid kids bear-orange(떡메모지)</a></li>
      		<li><span>기간한정세일11.15-12.31</span></li>
      		<li><span class="currentPrice"><del>3,500WON</del></span></li>
      		<li><span class="discPrice">2,100WON</span></li>
      	</ul>
      </div>
    </div>
  </div>
</div>
</div>

<jsp:include page="footer.jsp" />  
