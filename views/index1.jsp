
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
		
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/pages/icon.png" type="image/png">
        <title>BOOKBOOKBOOK</title>
        <!-- Bootstrap Css -->
        <link rel="stylesheet" href="vender/bootstrap/css/bootstrap.min.css">
        <!-- Remix Icon -->
        <link rel="stylesheet" href="vender/remixicon/remixicon.css">
        <!-- Remix Icon -->
        <link rel="stylesheet" href="vender/icofont/icofont.min.css">
        <!-- AOS Css -->
        <link rel="stylesheet" href="vender/aos/dist/aos.css">
        <!-- Custom Css -->
        <link rel="stylesheet" href="css/style.css">
		
		<!-- React 관련 -->
		<script src="https://unpkg.com/react@17/umd/react.development.js"></script>
		<script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
		<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
		
    </head>
	
	
    <body id="page-top">
        <!-- Page loading spinner -->
        <div class="page-loading active">
            <div class="page-loading-inner">
                <div class="page-spinner"></div>
                <span>Loading...</span>
            </div>
        </div>
		
        <!-- Navbar -->
        <nav class="navbar osahan-main-nav navbar-expand-lg app-nav py-3 py-lg-0 sticky-top bg-white" id="mainNav">
            <div class="container">
                <div class="position-relative d-flex align-items-center gap-2 site-brand">
                    <img src="./img/booklogo.png" class="booklogo"></img>
                    <a class="stretched-link" href="${pageContext.request.contextPath}/main"></a>
                </div>

                <button class="navbar-toggler border-0 shadow-none p-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar"><i class="ri-menu-3-line ri-lg"></i></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto gap-4">
                        
                        <li class="nav-item dropdown osahan-mega-menu position-static">
                            <a class="nav-link dropdown-toggle py-4" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 카테고리 </a>
                            <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                                <li>
                                    <div class="dropdown-mega-content container">
                                        <div class="row g-0">
                                            <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Portfolio</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-full-width.html">Portfolio Full Width</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-boxed.html">Portfolio Boxed</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-classic.html">Portfolio Classic</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-masonry.html">Portfolio Masonry</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/single-project.html">Single Project</a></li>
                                                </ul>
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Additional Pages</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-coming-soon.html">Coming Soon</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-coming-soon-simple.html">Coming Soon: Simple</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-error-404.html">Maintenance</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-error-404.html">Error 404</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-terms.html">Terms &amp; Conditions</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-privacy.html">Privacy &amp; Policy</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Blog</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-grid.html">Blog Grid</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-grid-classic.html">Blog Grid Classic</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-grid-sidebar.html">Blog Grid Sidebar</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-list.html">Blog List</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-list-sidebar.html">Blog List Right Sidebar</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-left-sidebar.html">Blog List Left Sidebar</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-full-width.html">Blog Full Width</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-post.html">Blog Post</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-author-profile.html">Author Profile</a></li>
                                                </ul>
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Help</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-help-center.html">Help Center</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-help-center-categories.html">Help Center: Categories</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-help-center-article.html">Help Center: Article</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Shop</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-grid.html">Product Grid</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-list.html">Product List</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-full-three-coulmn.html">Product Three Coulmns</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-full-four-coulmn.html">Product Four Coulmns</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-detail.html">Product Detail</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-cart.html">Shop Cart</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-checkout.html">Shop Checkout</a></li>
                                                </ul>
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Company</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-hire-us.html">Hire Us</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-careers.html">Careers</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-careers-role-overview.html">Careers: Role Overview</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-careers-apply.html">Careers: Apply</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold">My Account</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-login.html">Log In v.1</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-login-2.html">Log In v.2</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-signup.html">Sign Up v.1</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-signup-2.html">Sign Up v.2</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-reset-password.html">Forgot Password</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/account-orders.html">Orders</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/account-settings.html">Settings</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/account-address.html">Address</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/my-wallet.html">My Wallet</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/account-notification.html">Notification</a></li>
                                                </ul>
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">FAQ</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/faq.html">FAQ v.1</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/faq-2.html">FAQ v.2</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <a class="nav-link dropdown-toggle py-4" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 서재 </a>
                            <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                                <li>
                                    <div class="dropdown-mega-content container">
                                        <div class="row g-0">
                                            <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-full-width.html">읽은 책</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-boxed.html">읽고 있는 책</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-classic.html">읽고 싶은 책</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <a class="nav-link py-4" href="${pageContext.request.contextPath}/pages/my-character" role="button" aria-expanded="false"> 나의 캐릭터</a>

                            <a class="nav-link dropdown-toggle py-4" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 정보 </a>
                            <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                                <li>
                                    <div class="dropdown-mega-content container">
                                        <div class="row g-0">
                                            <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-full-width.html">나의 정보</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-boxed.html">나의 달력</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-classic.html">나의 메모</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-classic.html">나의 통계</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <input class="border-0 py-3 px-4" placeholder="도서를 검색해보세요">
                    </ul>
					<c:choose>
					  <c:when test="${not empty sessionScope.userId}">
					    <span>${sessionScope.userName}님 환영합니다!</span>
					    <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary px-3 ms-2 transition-3d-hover rounded-pill">로그아웃</a>
					  </c:when>
					  <c:otherwise>
					    <a href="${pageContext.request.contextPath}/pages/login" class="btn btn-primary px-3 ms-2 transition-3d-hover rounded-pill">로그인</a>
					  </c:otherwise>
					</c:choose>
                </div>
				<div id="loginComponent"></div>
            </div>
			
        </nav>
		
		<!-- BOOKBOOKBOOK 3개의 주요기능 -->
		<div id="menuFirstRow" class="container">
		    <div class="row g-4 justify-content-center">
		        <div class="col-md-3">
		            <div class="indexRowMenuWrapper border p-3 text-center" style="height: 350px;">
		                <a href="pages/bookrec.html">
		                    <img src="./img/pages/index/bookrec.png" class="indexRowMenu img-fluid" style="width: 100%; height: 80%; object-fit: cover;">
		                </a>
		                <div class="mt-3">
		                    <h5 class="mb-0">BOOKBOOKBOOK 추천도서</h5>
		               
		                </div>
		            </div>
		        </div>
		        <div class="col-md-3">
		            <div class="indexRowMenuWrapper border p-3 text-center" style="height: 350px;">
		                <a href="pages/ranking.html">
		                    <img src="./img/pages/index/ranking.png" class="indexRowMenu img-fluid" style="width: 100%; height: 80%; object-fit: cover;">
		                </a>
		                <div class="mt-3">
		                    <h5 class="mb-0">함께하는 독서리그</h5>
		                    
		                </div>
		            </div>
		        </div>
		        <div class="col-md-3">
		            <div class="indexRowMenuWrapper border p-3 text-center" style="height: 350px;">
		                <a href="pages/openchat.html">
		                    <img src="./img/pages/index/openchat.png" class="indexRowMenu img-fluid" style="width: 100%; height: 80%; object-fit: cover;">
		                </a>
		                <div class="mt-3">
		                    <h5 class="mb-0">BOOK CHAT</h5>
		                   
		                </div>
		            </div>
		        </div>
		    </div>
		</div>




		
		<div class="firstCarouselTitle" style="padding-top: 50px; padding-bottom: 5px;">
		  <h4 class="carouselSubtitle" style="text-align: center;">${sessionScope.userName} 님이 좋아할만한 책입니다!</h4>
		</div>
		
		<br> <br> 
		
        <!-- carousel - books - css style 참조, 이미지, 이름은 DB에서 가져와서 넣는걸로 바꿔야됨 -->
		<div class="carouselContainer">
		  <div id="bookCarousel" class="carousel slide" data-bs-ride="carousel">
		    <div class="carousel-inner">
		      <div class="carousel-item active">
		        <div class="row justify-content-center">
		          <div class="col-md-3 col-sm-4 col-6">
		            <img src="./img/carousel/python1.png" class="d-block w-100 carouselmg" alt="Python Book 1">
		          </div>
		          <div class="col-md-3 col-sm-4 col-6">
		            <img src="./img/carousel/python2.png" class="d-block w-100 carouselmg" alt="Python Book 2">
		          </div>
		          <div class="col-md-3 col-sm-4 col-6">
		            <img src="./img/carousel/python3.png" class="d-block w-100 carouselmg" alt="Python Book 3">
		          </div>
		        </div>
		      </div>
		      <div class="carousel-item">
		        <div class="row justify-content-center">
		          <div class="col-md-3 col-sm-4 col-6">
		            <img src="./img/carousel/react1.png" class="d-block w-100 carouselmg" alt="React Book 1">
		          </div>
		          <div class="col-md-3 col-sm-4 col-6">
		            <img src="./img/carousel/react2.png" class="d-block w-100 carouselmg" alt="React Book 2">
		          </div>
		          <div class="col-md-3 col-sm-4 col-6">
		            <img src="./img/carousel/react3.png" class="d-block w-100 carouselmg" alt="React Book 3">
		          </div>
		        </div>
		      </div>
		    </div>
		    <button class="carousel-control-prev" type="button" data-bs-target="#bookCarousel" data-bs-slide="prev">
		      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		      <span class="visually-hidden">이전</span>
		    </button>
		    <button class="carousel-control-next" type="button" data-bs-target="#bookCarousel" data-bs-slide="next">
		      <span class="carousel-control-next-icon" aria-hidden="true"></span>
		      <span class="visually-hidden">다음</span>
		    </button>
		  </div>
		</div>


        <!-- About section-->
        <div id="about">
            <div class="bg-white">
                <!-- Navbar -->
                <!-- some points -->
                <div class="py-5 bg-light">
                    <div class="container py-5">
                        <div class="row g-4">
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="text-center" data-aos="fade-up" data-aos-duration="1000">
                                    <h1 class="fw-bold text-primary pb-2 display-1">30</h1>
                                    <h6 class="fw-bold">Awards Received</h6>
                                    <p class="text-secondary-emphasis">Malesuada fames ac turpis egestas convallis tempus urna duis tellus id interdum velit laoreet.</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="text-center" data-aos="fade-up" data-aos-duration="1000">
                                    <h1 class="fw-bold text-primary pb-2 display-1">45</h1>
                                    <h6 class="fw-bold">Projects Completed</h6>
                                    <p class="text-secondary-emphasis">Malesuada fames ac turpis egestas convallis tempus urna duis tellus id interdum velit laoreet.</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="text-center" data-aos="fade-up" data-aos-duration="1000">
                                    <h1 class="fw-bold text-primary pb-2 display-1">89</h1>
                                    <h6 class="fw-bold">Happy Clients</h6>
                                    <p class="text-secondary-emphasis">Malesuada fames ac turpis egestas convallis tempus urna duis tellus id interdum velit laoreet.</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="text-center" data-aos="fade-up" data-aos-duration="1000">
                                    <h1 class="fw-bold text-primary pb-2 display-1">1,500</h1>
                                    <h6 class="fw-bold">Cups of Coffee</h6>
                                    <p class="text-secondary-emphasis">Malesuada fames ac turpis egestas convallis tempus urna duis tellus id interdum velit laoreet.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- our team -->
                <div class="py-5">
                    <div class="container py-5">
                        <div class="row align-items-center g-md-5 g-4">
                            <div class="col-lg-6 col-12">
                                <img src="img/homepage-2.png" alt="some-points" class="img-fluid" data-aos="fade-right" data-aos-duration="1000">
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="mb-5" data-aos="fade-left" data-aos-duration="1000">
                                    <h6 class="text-primary">About Us</h6>
                                    <h2 class="pb-2 display-4 text-muted">
                                        Quisvarius Velmart <br>
                                        <span class="gradient-text fw-bold">Buam Muisque Ideum</span>
                                    </h2>
                                    <p class="text-muted lead">It is a long established fact that a reader will be of a page when established fact looking at its layout.</p>
                                </div>
                                <div class="animate" data-aos="fade-left" data-aos-duration="1000">
                                    <div class="d-flex align-items-center gap-4 mb-4 pb-3">
                                        <div class="bg-primary rounded-circle flex-shrink-0 icon"><i class="ri-image-fill ri-2x text-white"></i></div>
                                        <div>
                                            <h6 class="fw-bold">Elementum sagittis vitae</h6>
                                            <p class="text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center gap-4 mb-4 pb-3">
                                        <div class="bg-primary rounded-circle flex-shrink-0 icon"><i class="ri-store-2-fill ri-2x text-white"></i></div>
                                        <div>
                                            <h6 class="fw-bold">Commodo elitat imperdiet</h6>
                                            <p class="text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center gap-4">
                                        <div class="bg-primary rounded-circle flex-shrink-0 icon"><i class="ri-truck-fill ri-2x text-white"></i></div>
                                        <div>
                                            <h6 class="fw-bold">Quis veleros donecac</h6>
                                            <p class="text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Services section-->
        <div class="bg-light" id="services">
            <div class="py-5">
                <div class="container py-5">
                    <div class="row justify-content-center mb-5">
                        <div class="col-xl-5 col-lg-7 col-md-8 col-sm-10 col-12">
                            <div class="text-center">
                                <h6 class="text-primary">Lorem ipsum</h6>
                                <h2 class="pb-2 display-4 text-muted">Our <span class="gradient-text fw-bold">Services</span></h2>
                                <p class="text-muted lead">It is a long established fact that a reader will be of a page when established fact looking at its layout.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5 text-center">
                        <div class="col-lg-4 col-md-6 col-12">
                            <div data-aos="fade-up" data-aos-duration="500" class="text-center px-lg-4">
                                <i class="ri-computer-line text-primary display-6"></i>
                                <div class="pt-2">
                                    <h5 class="fw-bold py-2">Web Design</h5>
                                    <p class="mb-3">Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt labore dolore.</p>
                                    <a href="#" class="text-decoration-none">View More <i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div data-aos="fade-up" data-aos-duration="500" class="text-center px-lg-4">
                                <i class="ri-brush-line text-primary display-6"></i>
                                <div class="pt-2">
                                    <h5 class="fw-bold py-2">Graphic Design</h5>
                                    <p class="mb-3">Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt labore dolore.</p>
                                    <a href="#" class="text-decoration-none">View More <i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div data-aos="fade-up" data-aos-duration="500" class="text-center px-lg-4">
                                <i class="ri-code-s-slash-line text-primary display-6"></i>
                                <div class="pt-2">
                                    <h5 class="fw-bold py-2">Web Development</h5>
                                    <p class="mb-3">Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt labore dolore.</p>
                                    <a href="#" class="text-decoration-none">View More <i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div data-aos="fade-up" data-aos-duration="500" class="text-center px-lg-4">
                                <i class="ri-dashboard-line text-primary display-6"></i>
                                <div class="pt-2">
                                    <h5 class="fw-bold py-2">Social Media</h5>
                                    <p class="mb-3">Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt labore dolore.</p>
                                    <a href="#" class="text-decoration-none">View More <i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div data-aos="fade-up" data-aos-duration="500" class="text-center px-lg-4">
                                <i class="ri-line-chart-line text-primary display-6"></i>
                                <div class="pt-2">
                                    <h5 class="fw-bold py-2">Reliable Results</h5>
                                    <p class="mb-3">Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt labore dolore.</p>
                                    <a href="#" class="text-decoration-none">View More <i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div data-aos="fade-up" data-aos-duration="500" class="text-center px-lg-4">
                                <i class="ri-search-line text-primary display-6"></i>
                                <div class="pt-2">
                                    <h5 class="fw-bold py-2">Seo</h5>
                                    <p class="mb-3">Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt labore dolore.</p>
                                    <a href="#" class="text-decoration-none">View More <i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-white" id="portfolio">
            <div class="py-5">
                <div class="container py-5">
                    <div class="row justify-content-center mb-5">
                        <div class="col-xl-5 col-lg-7 col-md-8 col-sm-10 col-12">
                            <div class="text-center">
                                <h6 class="text-primary">Lorem ipsum</h6>
                                <h2 class="pb-2 display-4 text-muted">Our <span class="gradient-text fw-bold">Portfolio</span></h2>
                                <p class="text-muted lead">It is a long established fact that a reader will be of a page when established fact looking at its layout.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5">
                        <div class="col-lg-6 col-12">
                            <div class="card text-bg-dark border-0 rounded-5 overflow-hidden transition-3d-hover mb-5" data-aos="zoom-in" data-aos-duration="1000">
                                <img src="img/projects/project-image-2.jpg" class="card-img rounded-0" alt="projects">
                                <div class="card-img-overlay d-flex align-items-end p-4">
                                    <div class="bg-black bg-opacity-75 rounded-4 px-4 py-3">
                                        <h4 class="card-title fw-bold mb-1">Lorem ipsum dolor amet</h4>
                                        <small class="mb-0"><i class="ri-link me-2"></i> Web / Multipage Design</small>
                                    </div>
                                </div>
                            </div>
                            <div class="card text-bg-dark border-0 rounded-5 overflow-hidden transition-3d-hover" data-aos="zoom-in" data-aos-duration="1000">
                                <img src="img/projects/project-image-4.jpg" class="card-img rounded-0" alt="projects">
                                <div class="card-img-overlay d-flex align-items-end p-4">
                                    <div class="bg-black bg-opacity-75 rounded-4 px-4 py-3">
                                        <h4 class="card-title fw-bold mb-1">Vehicula ipsum arcu cursus</h4>
                                        <small class="mb-0"><i class="ri-link me-2"></i> Web / Multipage Design</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-12">
                            <div class="card text-bg-dark border-0 rounded-5 overflow-hidden transition-3d-hover mb-5" data-aos="zoom-in" data-aos-duration="1000">
                                <img src="img/projects/project-image-1.jpg" class="card-img rounded-0" alt="projects">
                                <div class="card-img-overlay d-flex align-items-end p-4">
                                    <div class="bg-black bg-opacity-75 rounded-4 px-4 py-3">
                                        <h4 class="card-title fw-bold mb-1">Placerat Vestibulum Lectus</h4>
                                        <small class="mb-0"><i class="ri-link me-2"></i> Web / Multipage Design</small>
                                    </div>
                                </div>
                            </div>
                            <div class="card text-bg-dark border-0 rounded-5 overflow-hidden transition-3d-hover" data-aos="zoom-in" data-aos-duration="1000">
                                <img src="img/projects/project-image-3.jpg" class="card-img rounded-0" alt="projects">
                                <div class="card-img-overlay d-flex align-items-end p-4">
                                    <div class="bg-black bg-opacity-75 rounded-4 px-4 py-3">
                                        <h4 class="card-title fw-bold mb-1">Placerat Vestibulum Lectus</h4>
                                        <small class="mb-0"><i class="ri-link me-2"></i> Web / Multipage Design</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-white" id="pricing">
            <!-- Price -->
            <div class="py-5 bg-light">
                <div class="container py-5">
                    <div class="row justify-content-center mb-5">
                        <div class="col-xl-5 col-lg-7 col-md-8 col-sm-10 col-12">
                            <div class="text-center">
                                <h6 class="text-primary">Lorem ipsum</h6>
                                <h2 class="pb-2 display-4 text-muted">Our <span class="gradient-text fw-bold">Pricing</span></h2>
                                <p class="text-muted lead">It is a long established fact that a reader will be of a page when established fact looking at its layout.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center g-5">
                        <div class="col-lg-4 col-md-5 col-sm-6 col-12">
                            <div class="bg-white rounded-5 shadow-sm text-center p-5" data-aos="flip-left" data-aos-duration="1000">
                                <h2 class="fw-bold">Starter</h2>
                                <div><span class="align-top fs-5">$</span><span class="fw-bold display-1">9</span><span>/ month</span></div>
                                <ul class="list-unstyled d-grid gap-3 text-center mt-4 mb-5">
                                    <li>10GB Storage</li>
                                    <li>Limited Bandwidth</li>
                                    <li>5 Email Accounts</li>
                                    <li>1 Databases</li>
                                    <li>Backup & Restore</li>
                                </ul>
                                <a href="#" class="btn btn-primary w-100 rounded-pill py-3 px-5 transition-3d-hover">Get Started</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-6 col-12">
                            <div class="bg-primary text-white rounded-5 shadow-sm text-center p-5" data-aos="flip-right" data-aos-duration="1000">
                                <h1 class="fw-bold">Advanced</h1>
                                <div><span class="align-top fs-5">$</span><span class="fw-bold display-1">30</span><span>/ month</span></div>
                                <ul class="list-unstyled d-grid gap-3 text-center mt-4 mb-5">
                                    <li>500GB Storage</li>
                                    <li>Unlimited Bandwidth</li>
                                    <li>50 Email Accounts</li>
                                    <li>15 Databases</li>
                                    <li>Backup & Restore</li>
                                </ul>
                                <a href="#" class="btn btn-light w-100 rounded-pill py-3 px-5 transition-3d-hover">Get Started</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-6 col-12">
                            <div class="bg-white rounded-5 shadow-sm text-center p-5" data-aos="flip-left" data-aos-duration="1000">
                                <h2 class="fw-bold">Professional</h2>
                                <div><span class="align-top fs-5">$</span><span class="fw-bold display-1">60</span><span>/ month</span></div>
                                <ul class="list-unstyled d-grid gap-3 text-center mt-4 mb-5">
                                    <li>10GB Storage</li>
                                    <li>Limited Bandwidth</li>
                                    <li>5 Email Accounts</li>
                                    <li>1 Databases</li>
                                    <li>Backup & Restore</li>
                                </ul>
                                <a href="#" class="btn btn-primary w-100 rounded-pill py-3 px-5 transition-3d-hover">Get Started</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <!-- Company -->
            <div class="bg-body-secondary bg-opacity-50 py-5">
                <div class="container py-5">
                    <div class="row justify-content-center mb-5">
                        <div class="col-xl-6 col-lg-7 col-md-9 col-sm-10 col-12">
                            <div class="text-center">
                                <h1 class="fw-bold">Our Partners</h1>
                                <p class="lead">Reiciendis et rerum ut voluptate. Omnis molestiae nemo est. Ut quis enim rerum quia assumenda.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5">
                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="img/company/client-logo-1.svg" alt="#" class="img-fluid px-lg-4 opacity-50">
                        </div>
                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="img/company/client-logo-2.svg" alt="#" class="img-fluid px-lg-4 opacity-50">
                        </div>
                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="img/company/client-logo-3.svg" alt="#" class="img-fluid px-lg-4 opacity-50">
                        </div>
                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="img/company/client-logo-4.svg" alt="#" class="img-fluid px-lg-4 opacity-50">
                        </div>
                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="img/company/client-logo-5.svg" alt="#" class="img-fluid px-lg-4 opacity-50">
                        </div>
                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="img/company/client-logo-6.svg" alt="#" class="img-fluid px-lg-4 opacity-50">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        

        <!-- Nav Sidebar -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="sidebar">
            <div class="offcanvas-header d-flex align-items-center justify-content-between">
                <div class="position-relative d-flex align-items-center gap-2 site-brand">
                    <i class="ri-funds-line fs-2 lh-1 text-primary"></i>
                    <div class="lh-1">
                        <h5 class="fw-bold m-0">Application</h5>
                    </div>
                    <a class="stretched-link" href="${pageContext.request.contextPath}/main"></a>
                </div>
                <a href="#" class="link-light" data-bs-dismiss="offcanvas" aria-label="Close"><i class="ri-close-line ri-lg"></i></a>
            </div>
            <div class="offcanvas-body">
                <div class="sidebar-nav">
                    <ul class="navbar-nav mb-3">
                        <li class="nav-item">
                            <a class="nav-link active py-4" href="main"><i class="ri-apps-2-line"></i> Home</a>
                        </li>
                        <li class="nav-item"><a class="nav-link py-4" href="#home">Home</a></li>
                        <li class="nav-item"><a class="nav-link py-4" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link py-4" href="#services">Services</a></li>
                        <li class="nav-item"><a class="nav-link py-4" href="#portfolio">Portfolio</a></li>
                        <li class="nav-item"><a class="nav-link py-4" href="#pricing">Pricing</a></li>
                        <li class="nav-item"><a class="nav-link py-4" href="#contact">Contact</a></li>
                        <li class="nav-item dropdown osahan-mega-menu position-static">
                            <a class="nav-link dropdown-toggle py-4" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Extra Pages </a>
                            <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                                <li>
                                    <div class="dropdown-mega-content container">
                                        <div class="row g-0">
                                            <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Portfolio</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-full-width.html">Portfolio Full Width</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-boxed.html">Portfolio Boxed</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-classic.html">Portfolio Classic</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/portfolio-masonry.html">Portfolio Masonry</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/single-project.html">Single Project</a></li>
                                                </ul>
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Additional Pages</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-coming-soon.html">Coming Soon</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-coming-soon-simple.html">Coming Soon: Simple</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-error-404.html">Maintenance</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-error-404.html">Error 404</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-terms.html">Terms &amp; Conditions</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-privacy.html">Privacy &amp; Policy</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Blog</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-grid.html">Blog Grid</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-grid-classic.html">Blog Grid Classic</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-grid-sidebar.html">Blog Grid Sidebar</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-list.html">Blog List</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-list-sidebar.html">Blog List Right Sidebar</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-left-sidebar.html">Blog List Left Sidebar</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-full-width.html">Blog Full Width</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-post.html">Blog Post</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/blog-author-profile.html">Author Profile</a></li>
                                                </ul>
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Help</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-help-center.html">Help Center</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-help-center-categories.html">Help Center: Categories</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-help-center-article.html">Help Center: Article</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Shop</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-grid.html">Product Grid</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-list.html">Product List</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-full-three-coulmn.html">Product Three Coulmns</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-full-four-coulmn.html">Product Four Coulmns</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-product-detail.html">Product Detail</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-cart.html">Shop Cart</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/shop-checkout.html">Shop Checkout</a></li>
                                                </ul>
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Company</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-hire-us.html">Hire Us</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-careers.html">Careers</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-careers-role-overview.html">Careers: Role Overview</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-careers-apply.html">Careers: Apply</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold">My Account</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-login.html">Log In v.1</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-login-2.html">Log In v.2</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-signup.html">Sign Up v.1</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-signup-2.html">Sign Up v.2</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/page-reset-password.html">Forgot Password</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/account-orders.html">Orders</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/account-settings.html">Settings</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/account-address.html">Address</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/my-wallet.html">My Wallet</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/account-notification.html">Notification</a></li>
                                                </ul>
                                                <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">FAQ</h6>
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/faq.html">FAQ v.1</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="pages/faq-2.html">FAQ v.2</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <a href="#" class="btn btn-primary w-100 btn-lg mt-3">Get The App</a>
                </div>
            </div>
        </div>
		
		<footer class="footer-container text-white py-3">
						    <div class="container">
						        <div class="row">
						            <div class="col-md-6 mb-2 mb-md-0">
						                <p class="mb-0">
						                    <small>
						                        위치: 서울 마포구 백범로 23<br>
						                        연락처: 02-739-7235 | 이메일: hi@bookbookbook.com<br>
												이용약관 | 개인정보처리방침
						                    </small>
						                </p>
						            </div>
						        </div>
						    </div>
						</footer>

						<style>
						.footer-container{
							background-color: #e74c3c;
						}

						@font-face {
							     font-family: 'DungGeunMo';
							     src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
							     font-weight: normal;
							     font-style: normal;
						}

						footer{
							font-family: 'DungGeunMo';
						}


						</style>
		
       	<style>
			
			.carouselSubtitle {
			  text-align: center;
			  font-size: 1.5em; /* 폰트 크기 조정 */
			  font-weight: bold; /* 폰트 굵기 조정 */
			  color: #4a4a4a; /* 텍스트 색상 */
			  margin-bottom: 20px; /* 아래 여백 추가 */
			  background-color: #f8f9fa; /* 배경 색상 */
			  padding: 10px 20px; /* 패딩 추가 */
			  border-radius: 10px; /* 둥근 테두리 */
			  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
			}

			.carouselContainer {
			  padding: 20px;
			  background-color: #ffffff; /* 카루셀 배경 색상 */
			  border-radius: 10px; /* 둥근 테두리 */
			  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
			}

			.carouselImg {
			  border-radius: 10px; /* 이미지 둥근 테두리 */
			  transition: transform 0.2s ease; /* 이미지 전환 효과 */
			}

			.carouselImg:hover {
			  transform: scale(1.05); /* 호버 시 확대 효과 */
			}
			
			
		</style>
						
						
						
        <!-- Bootsrap Bundle Js -->
        <script src="vender/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Jquery Js -->
        <script src="vender/jquery/jquery-3.6.4.min.js"></script>
        <!-- AOS Js -->
        <script src="vender/aos/dist/aos.js"></script>
        <!-- Core theme JS-->
        <script src="js/demo.js"></script>
        <!-- Core theme JS-->
        <script src="js/script.js"></script>
		
		
		<script>
		  document.addEventListener('DOMContentLoaded', function() {
		    var myCarousel = document.querySelector('#bookCarousel')
		    var carousel = new bootstrap.Carousel(myCarousel, {
		      interval: 4000, 
		      wrap: true // 마지막 아이템에서 첫 번째 아이템으로 순환
		    })
		  })
		</script>
		
    </body>
</html>
