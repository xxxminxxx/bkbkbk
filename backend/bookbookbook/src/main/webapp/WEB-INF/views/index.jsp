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
		body, html {
		    margin: 0;
		    padding: 0;
		    height: 100%;
		    overflow: hidden; /* 초기에는 스크롤을 숨김 */
		}

		#header {
		    background-color: white !important;
		}

		#home {
		    background-image: url('../img/index_cover.png');
		    background-size: cover; /* 화면에 꽉 차도록 배경 이미지 크기 조절 */
		    background-position: center; /* 배경 이미지 중앙 정렬 */
		    background-attachment: fixed; /* 스크롤에 따라 배경 이미지 고정 */
		}

		#moving-text {
		    position: relative;
		    transition: left 0.2s ease-out; /* 좌우로 움직이는 애니메이션 설정 */
		}

		#moving-text h1 {
		    font-size: 250%;
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

		.full-width-background {
		    width: 100vw;
		}

		#recommendationBooksSection {
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
					display: inline-block;
			        transition: transform 0.3s ease; /* 부드러운 확대 효과를 위해 transition 추가 */
					    
				}
				.book-card:hover {
			          transform: scale(1.1); /* 마우스오버 시 1.3배 확대 */
			      }

				.book-card2 {
				    width: 100%;
				    height: 100%;
				    display: flex;
				    flex-direction: column;
				    align-items: center;
				    background-color: transparent;
				    border-radius: 10px;
				    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
				    padding: 15px;
				}

				.book-img-container {
				    width: 100%;
				    height: 200px;
				    display: flex;
				    align-items: center;
				    justify-content: center;
				    overflow: hidden;
				    margin-bottom: 15px;
				}

				.book-img {
				    max-width: 100%;
				    max-height: 100%;
				    object-fit: contain;
				    height: 300px;
				    width: 450px;
				}

				.book-info {
				    width: 100%;
				    text-align: center;
				    flex-grow: 1;
				    display: flex;
				    flex-direction: column;
				    justify-content: flex-start;
				}

				.book-category {
				    font-size: 0.8em;
				    color: #666;
				    margin-bottom: 5px;
				}

				.book-title {
				    font-size: 1em;
				    font-weight: bold;
				    margin-bottom: 10px;
				    overflow: hidden;
				    text-overflow: ellipsis;
				    display: -webkit-box;
				    -webkit-line-clamp: 2; /* 최대 2줄 */
				    -webkit-box-orient: vertical;
				}

				.book-author {
				    font-size: 0.9em;
				    color: #333;
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
				    .col-md-3 {
				        width: 50%;
				    }
				}

				@media (max-width: 576px) {
				    .col-md-3 {
				        width: 100%;
				    }
				}

				.news-section {
				    margin-top: 50px;
				}

				.news-item {
				    display: flex;
				    align-items: center;
				    margin-bottom: 20px;
				    padding: 10px 30px 10px 10px;
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

				#popularBooksSection {
				    margin-left: 1px;
				    padding: 50px 0;
					height:500px;
				}

				.carousel-control-prev,
				.carousel-control-next {
				    width: 5%;
				    opacity: 0.8;
				}

				.carousel-control-prev-icon,
				.carousel-control-next-icon {
				    background-color: rgba(0,0,0,0.5);
				    border-radius: 50%;
				    padding: 15px;
				}

				#popularBooksCarousel .carousel-item {
				    padding: 0 50px;
				}

				.seoulData {
				    display: flex;
				    align-items: center;
				    justify-content: center;
				    margin-top: 50px;
				}

				#more {
				    color: #D85D47!important;
				}

				#cute-icon-container {
				    position: fixed;
				    left: 20px;
				    bottom: 10px;
				    z-index: 1000;
				    cursor: pointer;
				    transition: transform 0.3s ease, opacity 0.3s ease;
				    opacity: 0; /* 초기에는 숨김 */
				    pointer-events: none; /* 초기에는 클릭 불가능 */
				}

				#cute-icon-container.visible {
				    opacity: 1;
				    pointer-events: auto; /* 클릭 가능하게 함 */
				}

				#cute-icon-container:hover {
				    transform: scale(1.1);
				}

				#daycheck-image {
				    width: 55px;
				    height: 55px;
				}

				.tooltip {
				    visibility: hidden;
				    width: 150px;
				    background-color: #D2B48C; 
				    color: #fff;
				    text-align: center;
				    border-radius: 6px;
				    padding: 10px;
				    position: absolute;
				    z-index: 1001;
				    top: -10px; 
				    left: calc(100% + 10px); /* 아이콘의 오른쪽에 10px 간격을 두고 위치 */
				    opacity: 0;
				    transition: opacity 0.3s, visibility 0.3s;
				    font-size: 12px;
				    font-weight: bold;
				    white-space: nowrap; /* 말풍선 내용이 줄바꿈되지 않도록 설정 */
				}

				.tooltip::after {
				    content: "";
				    position: absolute;
				    top: 15px; 
				    right: 100%; 
				    border-width: 5px;
				    border-style: solid;
				    border-color: transparent #D2B48C transparent transparent;
				}

				#cute-icon-container:hover .tooltip {
				    visibility: visible;
				    opacity: 1;
				}

				@media (max-width: 200px) { /* 적절한 너비로 조정하세요 */
				    #cute-icon-container {
				        left: 0;
				    }
				    
				    .tooltip {
				        left: 0;
				        top: auto; /* 자동으로 설정 */
				        bottom: 100%; /* 아이콘 위로 이동 */
				        transform: translateX(0);
				        margin-left: 60px; /* 아이콘의 너비에 따라 조정 */
				        margin-bottom: 10px; /* 아이콘과의 간격 */
				    }
				    
				    .tooltip::after {
				        left: 10px;
				        right: auto;
				        top: 100%;
				        border-color: #D2B48C transparent transparent transparent;
				    }
				}

				#easter-egg {
				    cursor: pointer;
				}

				#dog-container {
				    position: absolute;
				    left: -4050px; /* 강아지가 화면 밖에서 시작하도록 설정 */
				    top: 50px; /* 강아지의 세로 위치 조정 */
				    transition: left 2s; /* 강아지의 이동 속도 조정 */
				}

				#dog {
				    width: 200px; /* 강아지 이미지 크기 조정 */
				}
				
				h5, h6, span {
					word-break: keep-all; /* 단어를 줄바꿈하지 않고 유지 */
		          	overflow-wrap: break-word; /* 긴 단어를 줄바꿈하여 컨테이너의 너비를 초과하지 않도록 */
				}

		    </style>
		</head>
		<body id="page-top">
			
			<!--출석체크 바로가기-->
			<c:if test="${not empty sessionScope.userId}">
				  <a href="/pages/user-myCalendar" id="cute-icon-link">
				    <div id="cute-icon-container">
				      <img
				        src="/img/출석완료이미지.png"
				        alt="출석 완료"
				        id="daycheck-image"
				      >
				      <span class="tooltip">출석체크 바로가기</span>
				    </div>
				  </a>
				</c:if>
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
		        <%@ include file="header.jsp" %>

		    <!-- hero-header -->
		    <div id="home" class="bg-white">
		        <div class="container py-5">
		            <div class="row align-items-center g-4 py-5">
		                <div class="col-lg-12 col-12 text-center" data-aos="fade-right" data-aos-duration="1000">
		                    <div class="mb-5">
		                        <div class="display-3 pb-4 text-muted">
		                     <div id="moving-text">
		                        <h1>
		                        <p >B<img id="easter-egg" src="img/7.png"/>OK BOOK BOOK</p>
								<div id="dog-container">
								      <img id="dog" src="img/3_running_corgi.png" alt="Dog" />
								  </div>
		                        </h1>
		                     </div>
		                            <br>
		                            <span class="gradient-text fw-bold"> 혼자 그리고 함께 읽는 공간</span>
		                        </div>
		                    </div>
		                </div>
						<div class="background-shapes mb-5">
						                <div class=" col-mb-4">
						                  <a href="/pages/book-categorySearch">
						                  <dotlottie-player src="https://lottie.host/451f2e7a-21c0-41c2-ab20-a49fb8080cce/HiqEOXQLxo.json" background="transparent" speed="1" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
						                    <span class="gradient-text fw-bold" style="font-size:30px; padding:40px">카테고리별 도서</span></a>
						                </div>
						                <div class=" col-mb-4">
						                    <a href="/pages/user-myLeague">
						                     <dotlottie-player src="https://lottie.host/36a51d93-7e5b-4ed6-aa17-0f2aa2abc70b/LRQp0QxdqF.json" background="transparent" speed="0.5" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
						                     <span class="gradient-text fw-bold" style="font-size:30px; padding:120px">리그</span></a>
						                </div>
						                <div class="col-mb-4">
						                    <a href="/pages/chat-entrance">
						                     <dotlottie-player src="https://lottie.host/05c60355-5bcc-4349-902c-507efe0dae0d/U1u6m8ca65.json" background="transparent" speed="1" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
						                     <span class="gradient-text fw-bold" style="font-size:30px; padding:100px">오픈책팅</span></a>
						                </div>
						            </div>
		            
		            
		            
		            <div class="full-width-background">
		                   <div class="container mt-5" id="recommendationBooksSection" style="width: 100%;">
		                       <div class="text-center mb-4">
									<c:choose>
								        <c:when test="${not empty sessionScope.userId and not empty recommendedBooks}">
								            <h2 class="fw-bold"> ${sessionScope.userName}님의 독서기록을 기반으로 인공지능이 추천하는 도서입니다.</h2>
								            <div class="row justify-content-center">
												<c:forEach items="${recommendedBooks}" var="book" varStatus="status">
												    <c:if test="${status.index < 4}">
												        <div class="book-card">
															<p class="fw-bold">${book['recommendationType']} 추천</p>
															<a href="bookDetails?bookNum=${book['bookNum']}" class="text-black">
															<c:choose>
																<c:when test="${book['bname'] != null}">
						                                   		 <img src="${book['bname']}" class="book-img" alt="${book['bookTitle']}">
																</c:when>
																<c:otherwise>
																	 <img src="../img/noImage.jpg" class="book-img" alt="${book['bookTitle']}">
																</c:otherwise>
															</c:choose>
												            <div class="text-center" style="padding:10px 0 0 0">
												                <h5>${book['bookTitle']}</h5>
												                <h6>${book['writer']}</h6>
												            </div>
															</a>
												        </div>
												    </c:if>
												</c:forEach>
								            </div>
								        </c:when>
								        <c:otherwise>
								                <h5 class="fw-bold">로그인 시 사용자별 맞춤 도서 추천을 받아보실 수 있습니다</h5>
								        </c:otherwise>
								    </c:choose>
								</div>
			                  </div>
								   <c:if test="${not empty sessionScope.userId}">
								       <div class="text-center mt-5">
								           <h3 class="fw-bold">${sessionScope.userName}님 연령대의, 같은 성별의 분들은 이런 책에도 관심이 있어요.</h3>
								       </div>
								       <div class="row justify-content-center">
								           <c:forEach var="book" items="${seoulRecommendationBooks}">
								               <div class="book-card">
													<a style="color:black" href="/bookDetails?bookNum=${book.bookNum}">
													   <c:choose>
															<c:when test="${book.bname != null}">
					                                   		 <img src="${book.bname}" class="book-img" alt="${book.bookTitle}">
															</c:when>
															<c:otherwise>
																 <img src="../img/noImage.jpg" class="book-img" alt="${book.bookTitle}">
															</c:otherwise>
														</c:choose>
									                   <div class="text-center" style="padding:10px 0 0 0">
									                       <h5>${book.bookTitle}</h5>
									                       <h6>${book.writer}</h6>
									                       <h6>${book.publisher}</h6>
									                   </div>
												   </a>
								               </div>
								           </c:forEach>
								       </div>
									   <span style="padding: 0 0 0 80% ">자료 출처: 서울시 통계자료</span>
								   </c:if>

		                           <div class="full-width-background">
		                               <div class="container mt-5" id="popularBooksSection">
		                                   <div class="text-center mb-4">
		                                       <h3 class="fw-bold">인기 대출 도서</h3>
		                                   </div>
		                                   <div id="popularBooksCarousel" class="carousel slide" data-bs-ride="carousel">
		                                       <div class="carousel-inner">
		                                           <div class="carousel-item active">
		                                               <div class="row">
		                                                   <c:forEach items="${popularBooks}" var="book" begin="0" end="3">
		                                                       <div class="col-md-3">
		                                                           <div class="book-card2">
		                                                   <div class="book-img-container">
		                                                       <img src="${book.bestfname}" class="book-img" alt="${book.bestTitle}">
		                                                   </div>
		                                                               <div class="book-info">
		                                                                   <p class="book-category">${book.cateNum}</p>
		                                                                   <h5 class="book-title">${book.bestTitle}</h5>
		                                                                   <p class="book-author">${book.bestWriter}</p>
		                                                               </div>
		                                                           </div>
		                                                       </div>
		                                                   </c:forEach>
		                                               </div>
		                                           </div>
		                                           <div class="carousel-item">
		                                               <div class="row">
		                                                   <c:forEach items="${popularBooks}" var="book" begin="4" end="7">
		                                                       <div class="col-md-3">
		                                                           <div class="book-card2">
		                                                   <div class="book-img-container">
		                                                       <img src="${book.bestfname}" class="book-img" alt="${book.bestTitle}">
		                                                   </div>
		                                                               <div class="book-info">
		                                                                   <p class="book-category">${book.cateNum}</p>
		                                                                   <h5 class="book-title">${book.bestTitle}</h5>
		                                                                   <p class="book-author">${book.bestWriter}</p>
		                                                               </div>
		                                                           </div>
		                                                       </div>
		                                                   </c:forEach>
		                                               </div>
		                                           </div>
		                                       </div>
		                                       <button class="carousel-control-prev" type="button" data-bs-target="#popularBooksCarousel" data-bs-slide="prev">
		                                           <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		                                           <span class="visually-hidden">Previous</span>
		                                       </button>
		                                       <button class="carousel-control-next" type="button" data-bs-target="#popularBooksCarousel" data-bs-slide="next">
		                                           <span class="carousel-control-next-icon" aria-hidden="true"></span>
		                                           <span class="visually-hidden">Next</span>
		                                       </button>
		                                   </div>
		                               </div>
		                           </div>
								   <span style="padding: 0 0 0 80% ">자료 출처: 도서관 정보나루</span>
		                                       
		   
		               <!-- News Section -->
		            <div class="news-section mt-5">
		                <h3 class="fw-bold text-center mb-4">뉴스</h3>
						<span style="padding: 0 0 0 32%">도서와 관련된 키워드의 뉴스를 확인하실 수 있어요.</span>
		                <c:forEach items="${newsList}" var="news">
							<div class="row">
			                    <div class="news-item">
			                        <div class="news-content row">
										<div class="col-xl-2" style="margin:0 -30px 0 30px">
											<dotlottie-player src="https://lottie.host/21ef3c72-4aa8-4cdd-88ac-949c6dc556c6/8wshtA2rM9.json" background="transparent" speed="1" style="width: 150px; height: 150px;" loop autoplay></dotlottie-player>
			                            </div>
										<div class="col-xl-10" style="margin:10px 0 0 0">
											<h4 class="fw-bold">${news.title}</h4>
				                            <span>${news.description}</span><br/>
											<a href="${news.originallink}" class="newsLink" target="_blank" id="more" >더보기</a>
										</div>
			                        </div>
			                    </div>
							</div>
		                </c:forEach>
		            </div>
					<span style="padding: 0 0 0 83% ">자료 출처: 네이버 뉴스</span>
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
   <!-- 출석체크 바로가기 발바닥 -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
      var iconContainer = document.getElementById('cute-icon-container');
      var isLoggedIn = <%= session.getAttribute("userId") != null %>;
      console.log("로그인 상태 :", isLoggedIn);
      
      if (isLoggedIn && iconContainer) {
        iconContainer.classList.add('visible');
      } else {
        false; 
      }
    });
    </script>
	<script>
	// 페이지가 완전히 로드된 후 실행될 함수
	window.onload = function() {
	    // 세션 스토리지에 'slideCoverShown' 항목이 없는 경우 (첫 방문)
	    if (!sessionStorage.getItem('slideCoverShown')) {
	        // 'slide-cover' ID를 가진 요소를 찾음
	        const slideCover = document.getElementById('slide-cover');
	        if (slideCover) {
	            // 2초(2000ms) 후에 실행
	            setTimeout(() => {
	                // slide-cover의 불투명도를 0으로 설정 (투명하게 만듦)
	                slideCover.style.opacity = '0';
	                // 0.7초 동안 부드럽게 투명해지는 효과 적용
	                slideCover.style.transition = 'opacity 0.7s ease-out';
	                
	                // 추가로 0.7초 후에 실행 (총 2.7초 후)
	                setTimeout(() => {
	                    // slide-cover를 화면에서 완전히 숨김
	                    slideCover.style.display = 'none';
	                    // 스크롤 기능 활성화
	                    enableScroll();
	                }, 700);
	            }, 2000);
	            
	            // 세션 스토리지에 slide-cover를 보여줬다는 정보 저장
	            sessionStorage.setItem('slideCoverShown', 'true');
	        }
	    } else {
	        // 이미 slide-cover를 본 경우 (재방문)
	        const slideCover = document.getElementById('slide-cover');
	        if (slideCover) {
	            // slide-cover를 바로 숨김
	            slideCover.style.display = 'none';
	        }
	        // 스크롤 기능 즉시 활성화
	        enableScroll();
	    }

	    // 2초 후에 무조건 스크롤 활성화 (안전장치)
	    setTimeout(enableScroll, 2000);
	};

	// 스크롤을 활성화하는 함수
	function enableScroll() {
	    // body의 overflow 스타일을 'auto'로 설정하여 스크롤 허용
	    document.body.style.overflow = 'auto';
	}
	</script>
   
    <script>
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
                    textElement.style.left = 0+textLeft + 'px';
                });
               
				let clickCount = 0;
				const maxClicks = 5;

				const eggImage = document.getElementById('easter-egg');
				const dogContainer = document.getElementById('dog-container');

				eggImage.addEventListener('click', () => {
				    clickCount++;
				    
				    if (clickCount === maxClicks) {
				        // 강아지 이미지 나타내기
				        dogContainer.style.left = '0px';
				        
				        // 강아지 이미지 사라지기
				        setTimeout(() => {
				            dogContainer.style.left = '100vw'; // 화면 밖으로 이동
				        }, 2000); // 2초 후 이동 시작 (CSS와 동기화)
				        
				        
				    }
				});
    </script>
	<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
	<script>
	window.embeddedChatbotConfig = {
	chatbotId: "lxJJFtLSlOQHoUy6dqkTP",
	domain: "www.chatbase.co"
	}
	</script>
	<script
	src="https://www.chatbase.co/embed.min.js"
	chatbotId="lxJJFtLSlOQHoUy6dqkTP"
	domain="www.chatbase.co"
	defer>
	</script>
</body>
</html>
