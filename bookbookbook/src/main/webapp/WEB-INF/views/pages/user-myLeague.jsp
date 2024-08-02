<%@ page language="java" 
contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/pages/icon.png" type="image/png">
        <title>북북북 | 나의 리그</title>
        <!-- Bootstrap Css -->
        <link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
        <!-- Icofont Css -->
        <link rel="stylesheet" href="../vender/icofont/icofont.min.css">
        <!-- AOS Css -->
        <link rel="stylesheet" href="../vender/aos/dist/aos.css">
        <!-- Remix Icons -->
        <link rel="stylesheet" href="../vender/remixicon/remixicon.css">
        <!-- Slick Slider Css -->
        <link rel="stylesheet" href="../vender/slick/slick/slick.css">
        <link rel="stylesheet" href="../vender/slick/slick/slick-theme.css">
        <!-- Custom Css -->
        <link rel="stylesheet" href="../css/style.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.6/lottie.min.js"></script>
		 <style>
		     .lottie-container {
		         width: 500px;
		         height: 500px;
		         margin: 0 auto;
		     }
			
			 .special > .animation {
			   width: 50px;
			   height: 50px;
			   rotate: 33deg;
			   background-color: white;
			   opacity:0.5;
			   position: relative;
			   animation-name: example;
			   animation-duration: 2s;
			   animation-timing-function: linear;
			   animation-iteration-count: 1;
			   animation-fill-mode: forwards;
			   transform-origin: top left; 
			 }

			 @keyframes example {
			   0%   {left:80%; top:-1000px;scale:50; }
			   25%  {left:40%; top:-1000px;scale:50;}
			   50%  {left:20%; top:-1000px;scale:50;}
			   75%  {left:10%; top:-1000px;scale:50;}
			   100% {left:0%; top:-1000px;scale:50;}
			 }
			

		 </style>
		<!--user-myLeague CSS-->
		<link rel="stylesheet" href="../css/user-myLeague.css">
    </head>
    <body>
        
        <div class="bg-elements elements-top-header position-relative">
            <!-- navbar -->
            <div class="elements-nav">
                <!-- bootom nav -->
				<%@ include file="../header.jsp" %>
            </div>
            <!-- header -->
			<div class="w-100">
				
				<!--<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#e74c3c" fill-opacity="1" d="M0,128L48,149.3C96,171,192,213,288,240C384,267,480,277,576,245.3C672,213,768,139,864,96C960,53,1056,43,1152,58.7C1248,75,1344,117,1392,138.7L1440,160L1440,0L1392,0C1344,0,1248,0,1152,0C1056,0,960,0,864,0C768,0,672,0,576,0C480,0,384,0,288,0C192,0,96,0,48,0L0,0Z"></path></svg>-->
			</div>
    
		<!-- ############################################## - ->
			<!-- content -->
			<div class="container">
			<div class="content-container">
				<div class="row">
				        <div class="col-md-4">
				            <div class="lottie-player" id="booksIcon"></div>
				        </div>
				        <div class="col-md-8" style="padding-top:110px">
				            <div class="text-content">
				                <h1 id="competition-title" class="fw-bold"></h1><br/>
				                <h6 id="competition-period"></h6>
				                <h6>읽은 책 수는 실시간으로 랭킹에 반영됩니다.</h6>
				            </div>
				        </div>
				    </div> 
			    <div class="border-orange">
			        <div class="header">
			            
			        </div>
			        <div id="ranking-list">
			            <!-- 랭킹 리스트가 동적으로 추가될 부분 -->
			        </div>
			    </div>
			</div>
			</div>


       
        
                              
        <!-- Nav Sidebar -->
		<%@ include file="../navSidebar.jsp" %>
		<!-- 푸터 포함 -->
		<%@ include file="../footer.jsp" %>
		
        
        <!-- Bootsrap Bundle Js -->
        <script src="../vender/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Jquery Js -->
        <script src="../vender/jquery/jquery-3.6.4.min.js"></script>
        <!-- AOS Js -->
        <script src="../vender/aos/dist/aos.js"></script>
        <!-- Slick Slider Js -->
        <script src="../vender/slick/slick/slick.min.js"></script>
        <!-- Slick Js -->
        <script src="../js/slick.js"></script>
        <!-- Custom Js -->
        <script src="../js/script.js"></script>
		<!-- jQuery CDN -->
		  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!--Lottie-->
		<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
		<!--user-myLeague JS-->
		<script src="../js/user-myLeague.js"></script>
		<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script> 
		
    </body>
</html>
