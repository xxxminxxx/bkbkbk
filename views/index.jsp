<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/pages/icon.png" type="image/png">
    <title>즐거운 독서 공간 북북북</title>
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="vender/bootstrap/css/bootstrap.min.css">
    <!-- Remix Icon -->
    <link rel="stylesheet" href="vender/remixicon/remixicon.css">
    <!-- Icofont -->
    <link rel="stylesheet" href="vender/icofont/icofont.min.css">
    <!-- AOS Css -->
    <link rel="stylesheet" href="vender/aos/dist/aos.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="css/style.css">
    <style>
		#moving-text {
	        position: relative;
	        transition: left 0.2s ease-out; /* 좌우로 움직이는 애니메이션 설정 */
	    }
			
		#moving-text h1{
			font-size: 250%;
		}
		
		#home{
			background-image: url('../img/index_cover.png');
			    background-size: cover; /* 화면에 꽉 차도록 배경 이미지 크기 조절 */
			    background-position: center; /* 배경 이미지 중앙 정렬 */
			    background-attachment: fixed; /* 스크롤에 따라 배경 이미지 고정 */
			    padding: 100px 0; /* 내용과 화면 맨 위 간격 조절 */
		}
		
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden; /* 초기에는 스크롤을 숨김 */
        }
		#header{
			background-color: white !important;
		}
        #slide-cover {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999; /* 더 높은 z-index 값 */
            background-color: #D85D47;
            display: flex;
            justify-content: center;
            align-items: center;
        }
		
        .background-shapes {
            position: relative;
            width: 100%;
            display: flex;
            justify-content: space-around;
            margin-top: 50px;
			margin-left: -40px;
        }
        .shape {
            position: relative;
            width: 150px;
            height: 150px;
            background-size: cover;
            background-position: center;
            text-align: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .shape-1 {
            background-image: url('../img/circle.png'); /* 이미지 경로를 정확히 입력하세요 */
			display: inline-block; /* a 태그가 inline이면 block 형태로 변경해야 함 */
			  transition: transform 10s ease; /* 회전 속도와 방향을 조절하는 속성 */
			  animation: rotateSlowly 59s linear infinite; /* 60초 동안 시계방향으로 회전하는 애니메이션 */
        }
        .shape-2 {
            background-image: url('../img/pentagon.png'); /* 이미지 경로를 정확히 입력하세요 */
			display: inline-block; /* a 태그가 inline이면 block 형태로 변경해야 함 */
			  transition: transform 11s ease; /* 회전 속도와 방향을 조절하는 속성 */
			  animation: rotateSlowly 60s linear infinite reverse; /* 60초 동안 시계방향으로 회전하는 애니메이션 */
        }
        .shape-3 {
            background-image: url('../img/triangle.png'); /* 이미지 경로를 정확히 입력하세요 */
			display: inline-block; /* a 태그가 inline이면 block 형태로 변경해야 함 */
			  transition: transform 9s ease; /* 회전 속도와 방향을 조절하는 속성 */
			  animation: rotateSlowly 61s linear infinite; /* 60초 동안 시계방향으로 회전하는 애니메이션 */
        }
		.shape-3 span {
		    transform: none !important; /* span 태그의 회전을 초기화 */
		}
		
		@keyframes rotateSlowly {
		  0% {
		    transform: rotate(0deg);
		  }
		  100% {
		    transform: rotate(360deg);
		  }
		 }
		 
		 .bg-corgi-cover{
			background-image: url('../img/index_cover.png');
		 }
		  
		.full-width-background {
		           width: 100vw;
		         
		       }
		#recommendationBooksSection{
			background-color: #fff5f2;
			margin-top: 150px;
			padding: 50px;
			width: 100%; /* 가로 길이를 100%로 설정 */
			max-width: none; /* Bootstrap 기본 최대 너비 무시 */
			flex-direction: column;
			           justify-content: center;
			           align-items: center;
		}
		.row {
		          display: flex;
		          flex-wrap: wrap; /* 화면 크기에 따라 자동으로 줄바꿈 */
		          justify-content: center;
		      }
		      .book-card {
		          margin: 10px;
		          padding: 20px;
		          border: 1px solid #ddd;
		          border-radius: 5px;
		          width: 23%; /* 네 개의 카드가 가로로 나란히 배치되도록 설정 */
		          box-sizing: border-box; /* padding과 border를 width에 포함 */
		          text-align: center;
		          background-color: #f9f9f9;
		      }
		      .book-img {
		          width: 100%;
		          height: auto;
		      }
		      @media (max-width: 1200px) {
		          .book-card {
		              width: 45%; /* 화면 크기가 작아질 때 두 개씩 배치 */
		          }
		      }
		      @media (max-width: 768px) {
		          .book-card {
		              width: 100%; /* 화면 크기가 더 작아질 때 한 개씩 배치 */
		          }
		      }
        .news-section {
            margin-top: 50px;
        }
        .news-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .news-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 20px;
        }
        .news-item .news-content {
            flex-grow: 1;
        }
        .news-item .news-content h5 {
            margin: 0 0 10px;
        }
        .news-item .news-content p {
            margin: 0;
        }
		
		


		
		#moving-text {
		        position: relative;
		        transition: left 0.2s ease-out; /* 좌우로 움직이는 애니메이션 설정 */
		    }
		      
		   #moving-text h1{
		      font-size: 250%;
		   }
		   
		   #home{
		      background-image: url('../img/index_cover.png');
		          background-size: cover; /* 화면에 꽉 차도록 배경 이미지 크기 조절 */
		          background-position: center; /* 배경 이미지 중앙 정렬 */
		          background-attachment: fixed; /* 스크롤에 따라 배경 이미지 고정 */
		          padding: 100px 0; /* 내용과 화면 맨 위 간격 조절 */
		   }
		   
		     body, html {
		         margin: 0;
		         padding: 0;
		         height: 100%;
		         overflow: hidden; /* 초기에는 스크롤을 숨김 */
		     }
		   #header{
		      background-color: white !important;
		   }
		     #slide-cover {
		         position: fixed;
		         top: 0;
		         left: 0;
		         width: 100%;
		         height: 100%;
		         z-index: 9999; /* 더 높은 z-index 값 */
		         background-color: #D85D47;
		         display: flex;
		         justify-content: center;
		         align-items: center;
		     }
		   
		     .background-shapes {
		         position: relative;
		         width: 100%;
		         display: flex;
		         justify-content: space-around;
		         margin-top: 50px;
		      margin-left: -40px;
		     }
		   .shape {
		       position: relative;
		       width: 150px;
		       height: 150px;
		       background-size: cover;
		       background-position: center;
		       text-align: center;
		       color: white;
		       font-size: 20px;
		       font-weight: bold;
		       display: flex;
		       justify-content: center;
		       align-items: center;
		       /* Ensure text is vertically centered */
		       line-height: 150px; /* Adjust based on the size of the shape */
		   }

		   .shape span {
		       display: inline-block;
		       transform: rotate(0deg);
		       line-height: initial; /* Reset line-height */
		   }

		   .shape-1 {
		       background-image: url('../img/circle.png');
		       display: inline-block;
		       transition: transform 10s ease;
		       animation: rotateSlowly 59s linear infinite;
		   }

		   .shape-2 {
		       background-image: url('../img/pentagon.png');
		       display: inline-block;
		       transition: transform 11s ease;
		       animation: rotateSlowly 60s linear infinite reverse;
		   }

		   .shape-3 {
		       background-image: url('../img/triangle.png');
		       display: inline-block;
		       transition: transform 9s ease;
		       animation: rotateSlowly 61s linear infinite;
		   }
		   @keyframes rotateSlowly {
		     0% {
		       transform: rotate(0deg);
		     }
		     100% {
		       transform: rotate(360deg);
		     }
		    }
		    
		    .bg-corgi-cover{
		      background-image: url('../img/index_cover.png');
		    }
		     
		   .full-width-background {
		              width: 100vw;
		            
		          }
		   #recommendationBooksSection{
		      background-color: #fff5f2;
		      margin-top: 150px;
		      padding: 50px;
		      width: 100%; /* 가로 길이를 100%로 설정 */
		      max-width: none; /* Bootstrap 기본 최대 너비 무시 */
		      flex-direction: column;
		                 justify-content: center;
		                 align-items: center;
		   }
		   .row {
		             display: flex;
		             flex-wrap: wrap; /* 화면 크기에 따라 자동으로 줄바꿈 */
		             justify-content: center;
		         }
		         .book-card {
		             margin: 10px;
		             padding: 20px;
		             border: 1px solid #ddd;
		             border-radius: 5px;
		             width: 23%; /* 네 개의 카드가 가로로 나란히 배치되도록 설정 */
		             box-sizing: border-box; /* padding과 border를 width에 포함 */
		             text-align: center;
		             background-color: #f9f9f9;
		         }
		         .book-img {
		             width: 100%;
		             height: auto;
		         }
		         @media (max-width: 1200px) {
		             .book-card {
		                 width: 45%; /* 화면 크기가 작아질 때 두 개씩 배치 */
		             }
		         }
		         @media (max-width: 768px) {
		             .book-card {
		                 width: 100%; /* 화면 크기가 더 작아질 때 한 개씩 배치 */
		             }
		         }
		     .news-section {
		         margin-top: 50px;
		     }
		     .news-item {
		         display: flex;
		         align-items: center;
		         margin-bottom: 20px;
		         padding: 10px;
		         border: 1px solid #ddd;
		         border-radius: 5px;
		         background-color: #f9f9f9;
		     }
		     .news-item img {
		         width: 100px;
		         height: 100px;
		         object-fit: cover;
		         margin-right: 20px;
		     }
		     .news-item .news-content {
		         flex-grow: 1;
		     }
		     .news-item .news-content h5 {
		         margin: 0 0 10px;
		     }
		     .news-item .news-content p {
		         margin: 0;
		     }
		
		
    </style>
</head>
<body id="page-top">
    <div id="slide-cover">
        <jsp:include page="index-slidecover.jsp" />
    </div>
    <!-- Page loading spinner -->
    <div class="page-loading active" id="main-content">
        <div class="page-loading-inner">
            <div class="page-spinner"></div>
            <span>Loading...</span>
        </div>
    </div>
	<div class="bg-elements elements-top-header">
	    <!-- navbar -->
	    <div class="elements-nav">
	        <!-- bootom nav -->
	        <nav id="header" class="navbar navbar-expand bottom-nav bg-black borer-bottom border-opacity-10 border-white py-lg-0 py-3 bg-opacity-25">
	                    <div class="container">
	                        <div class="position-relative d-flex align-items-center gap-2 site-brand">
	                            <img src="../img/bookbookbookLogo.png" alt="북북북 로고">
								<div class="lh-1">
								      <h5 class="fw-bold m-0">BOOKBOOKBOOK</h5>
								            <!-- <small class="text-muted text-white-50">One Page</small> -->
								 </div>
								<a class="stretched-link" href="${pageContext.request.contextPath}/main"></a>
									           </div>
									           <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
									               <span class="navbar-toggler-icon"></span>
									           </button>
									           <div class="collapse navbar-collapse justify-content-between" id="navbarContent">
									               <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
													
													
									                   <li class="nav-item dropdown">
									                       <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">나의 서재</a>
									                       <ul class="dropdown-menu">
									                           <li><a class="dropdown-item" href="/pages/user-myBookshelf">읽은 책</a></li>
									                           <li><a class="dropdown-item" href="/pages/user-myBookshelf">읽고 있는 책</a></li>
									                           <li><a class="dropdown-item" href="/pages/user-myBookshelf">읽고 싶은 책</a></li>
									                       </ul>
									                   </li>
									                   <li class="nav-item">
									                       <a class="nav-link" href="/pages/user-myCharacter" role="button">나의 캐릭터</a>
									                   </li>
									                   <li class="nav-item dropdown">
									                       <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">나의 정보</a>
									                       <ul class="dropdown-menu">
									                           <li><a class="dropdown-item" href="/pages/user-myInfo">나의 정보</a></li>
									                           <li><a class="dropdown-item" href="/pages/user-myCalendar">나의 달력</a></li>
									                           <li><a class="dropdown-item" href="/pages/user-myMemo">나의 메모</a></li>
									                           <li><a class="dropdown-item" href="/pages/user-myStat">나의 통계</a></li>
									                       </ul>
									                   </li>
									               </ul>
												   <form action="/pages/book-bookSearchResult" class="d-flex justify-content-center">
												                             <div class="input-group border border-2 border-dark rounded-pill overflow-hidden bg-white p-1" style="max-width: 600px;">
												                                 <input type="text" class="form-control border-0 py-3 px-4" placeholder="궁금한 책을 검색해 보세요!" aria-label="Enter your email" aria-describedby="app">
												                                 <button class="btn btn-primary fw-semibold rounded-pill py-3 px-5" type="submit" id="app">검색하기</button>
												                             </div>
												                         </form>
																		 <div><span class="text-white">...</span></div>
									               <div class="d-flex align-items-center">
									                   <c:choose>
									                       <c:when test="${not empty sessionScope.userId}">
									                           <span class="me-3 text-purple">${sessionScope.userName}님 환영합니다!</span>
									                           <a href="/logout" class="btn btn-purple rounded-pill btn-theme">로그아웃</a>
									                       </c:when>
									                       <c:otherwise>
									                           <a href="/pages/login" class="btn btn-purple rounded-pill btn-theme">로그인</a>
									                       </c:otherwise>
									                   </c:choose>
									               </div>
									           </div>
									       </div>
									   </nav>

    <!-- hero-header -->
    <div id="home" class="bg-white">
        <div class="container py-5">
            <div class="row align-items-center g-4 py-5">
                <div class="col-lg-12 col-12 text-center" data-aos="fade-right" data-aos-duration="1000">
                    <div class="mb-5">
                        <div class="display-3 pb-4 text-muted">
							<div id="moving-text">
								<h1>
								<p >B<img src="img/7.png"/>OK BOOK BOOK</p>
								</h1>
							</div>
                            <br>
                            <span class="gradient-text fw-bold"> 혼자 그리고 함께 읽는 공간</span>
                        </div>
                    </div>
                </div>
				<div class="background-shapes mb-5">
				    <a href="/pages/book-categorySearch" class="shape shape-1 col-mb-4">맞춤도서</a>
				    <a href="/pages/user-myLeague" class="shape shape-2 col-mb-4">리그</a>
				    <a href="/pages/chat-entrance" class="shape shape-3 col-mb-4">오픈책팅</a>
				</div>
				
				
				
				<div class="full-width-background">
								<div class="container mt-5" id="recommendationBooksSection" style="width: 100%;">
									<div class="text-center mb-4">
									    <c:choose>
									        <c:when test="${not empty sessionScope.userId}">
									            <h5>${sessionScope.userName}님이 좋아하실 만한 도서입니다.</h5>
									        </c:when>
									        <c:otherwise>
									            <h5>인기 도서 추천</h5>
									        </c:otherwise>
									    </c:choose>
									</div>

								        <div class="row justify-content-center">
								            <div class="book-card">
								                <img src="https://via.placeholder.com/300x450" class="book-img" alt="Book 1">
								                <div class="text-center">
								                    <p>소설</p>
								                    <h5>당신이 누군가를 죽였다</h5>
								                    <p>히가시노 게이고 · 북다</p>
								                </div>
								            </div>

								            <div class="book-card">
								                <img src="https://via.placeholder.com/300x450" class="book-img" alt="Book 2">
								                <div class="text-center">
								                    <p>경제/경영</p>
								                    <h5>덕후가 브랜드에게</h5>
								                    <p>편은지 · 두레빗</p>
								                </div>
								            </div>

								            <div class="book-card">
								                <img src="https://via.placeholder.com/300x450" class="book-img" alt="Book 3">
								                <div class="text-center">
								                    <p>역사/문화</p>
								                    <h5>세계를 움직인 열 가지 프레임</h5>
								                    <p>수바드라 다스 · 북하우스</p>
								                </div>
								            </div>
								            <div class="book-card">
								                <img src="https://via.placeholder.com/300x450" class="book-img" alt="Book 4">
								                <div class="text-center">
								                    <p>청소년</p>
								                    <h5>죽이고 싶은 아이 2</h5>
								                    <p>이꽃님 · 우리학교</p>
								                </div>
								            </div>
								        </div>
								    </div>
								   </div>
				

								   <div class="full-width-background">
								       <div class="container mt-5" id="popularBooksSection" style="width: 100%;">
								           <div class="text-center mb-4">
								               <h5>인기 대출 도서</h5>
								           </div>
								           <div class="row justify-content-center">
								               <c:forEach items="${popularBooks}" var="book" begin="0" end="3">
								                   <div class="book-card">
								                       <img src="${book.bestfname}" class="book-img" alt="${book.bestTitle}">
								                       <div class="text-center">
								                           <p>${book.cateNum}</p>
								                           <h5>${book.bestTitle}</h5>
								                           <p>${book.bestWriter} · ${book.bestPublisher}</p>
								                       </div>
								                   </div>
								               </c:forEach>
								           </div>
								       </div>
								   </div>
								   				
	
	            <!-- News Section -->
				<div class="news-section mt-5">
				    <h3 class="text-center mb-4">도서 관련 뉴스</h3>
				    <c:forEach items="${newsList}" var="news">
				        <div class="news-item">
				            <div class="news-content">
				                <h5>${news.title}</h5>
				                <p>${news.description}</p>
								<a href="${news.originallink}" class="newsLink" target="_blank">더보기</a>
				            </div>
				        </div>
				    </c:forEach>
				</div>
	        </div>
	    </div>
	</div>
    <!-- Nav Sidebar -->
   <%@ include file="navSidebar.jsp" %>
    <!-- 푸터 포함 -->
    <%@ include file="footer.jsp" %>
    <!-- Bootsrap Bundle Js -->
    <script src="vender/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Jquery Js -->
    <script src="vender/jquery/jquery-3.6.4.min.js"></script>
    <!-- AOS Js -->
    <script src="vender/aos/dist/aos.js"></script>
    <!-- Core theme JS -->
    <script src="js/demo.js"></script>
    <!-- Core theme JS -->
    <script src="js/script.js"></script>'
	<!--Popper JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script>
        window.onload = function() {
            setTimeout(() => {
                const slideCover = document.getElementById('slide-cover');
                if (slideCover) {
                    slideCover.style.opacity = '0';
                    slideCover.style.transition = 'opacity 0.7s ease-out';
                    setTimeout(() => {
                        slideCover.style.display = 'none';
                        document.body.style.overflow = 'auto'; // 스크롤을 다시 활성화
                    }, 700);
                }
            }, 2000);
        };
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const shapes = document.querySelectorAll('.shape-1, .shape-2, .shape-3');
            shapes.forEach(shape => {
                shape.style.transform = `translate(${Math.random() * 100}px, ${Math.random() * 100}px)`;
            });
        });
    </script>
    <script>
        window.embeddedChatbotConfig = {
            chatbotId: "CLzwRLQ2gS5uqCukGQfdB",
            domain: "www.chatbase.co"
        }
		
		document.addEventListener('mousemove', function(e) {
				        // 마우스 커서의 x 좌표를 가져오기
				        let mouseX = e.pageX;
				        
				        // 텍스트 요소 가져오기
				        let textElement = document.getElementById('moving-text');
				        
				        // 텍스트 요소의 가로 폭 가져오기
				        let textWidth = textElement.offsetWidth;
				        
				        // 페이지 가로 폭 가져오기
				        let pageWidth = window.innerWidth;
				        
				        // 텍스트가 움직일 수 있는 최대 범위 계산
				        let maxMove = pageWidth - textWidth;
				        
				        // 텍스트를 움직일 위치 계산
				        // mouseX 값이 0일 때는 왼쪽 끝, pageWidth 값일 때는 오른쪽 끝
				        let textLeft = (mouseX / pageWidth * maxMove);
				        
				        // 텍스트 위치 설정
				        textElement.style.left = -550+textLeft + 'px';
				    });
					
    </script>
    <script src="https://www.chatbase.co/embed.min.js" chatbotId="CLzwRLQ2gS5uqCukGQfdB" domain="www.chatbase.co" defer></script>
</body>
</html>
