<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>Pages</title>
        <!-- Bootstrap Css -->
        <link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
        <!-- Icofont Css -->
        <link rel="stylesheet" href="../vender/icofont/icofont.min.css">
        <!-- AOS Css -->
        <link rel="stylesheet" href="../vender/aos/dist/aos.css">
        <!-- Remix Icons -->
        <link rel="stylesheet" href="../vender/remixicon/remixicon.css">
        <!-- Custom Css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
		<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@400;700&display=swap" rel="stylesheet">
    </head>
    <body>

        <!-- nav bar 영역 -->
        <nav class="navbar osahan-main-nav navbar-expand-lg app-nav py-3 py-lg-0 sticky-top bg-white" id="mainNav">
            <div class="container">
                <div class="position-relative d-flex align-items-center gap-2 site-brand">
                    <i class="ri-slideshow-line fs-2 lh-1 text-black"></i>
                    <div class="lh-1">
                       <h5 class="fw-bold m-0 text-black">BOOKBOOKBOOK</h5>
                    </div>
                    <a class="stretched-link" href="../index.html"></a>
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
                            <a class="nav-link py-4" href="#" role="button" aria-expanded="false"> 나의 캐릭터</a>

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
                    <a href="pages/page-login.html" class="btn btn-primary px-3 ms-2 transition-3d-hover rounded-pill"> 로그인 </a>
                </div>
            </div>
        </nav>
        
        <br> <br> <br> <br> 
		
		<!-- 캐릭터 창 -->
		
		
		<div class="characterTitle">
			<h3 class="characterPageTitle"> 나의 캐릭터 </h3>
		</div>
		
		
		
		
		
		<div class="py-5">
		            <div class="container py-5">
		                <div class="row g-5">
							<div class="col-lg-4 col-md-6 col-12">
							    <div class="card bg-white rounded-2 border-0 shadow h-100 overflow-hidden">
							        <img src="../img/pages/news/1.jpg" class="card-img-top" alt="news-1">
							        
									<div class="card-footer bg-transparent border-0 px-4 pb-4 text-center">
									    <span class="cuteText">1단계 애기코기</span>
									</div>
							    </div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
							    <div class="card bg-white rounded-2 border-0 shadow h-100 overflow-hidden">
							        <img src="../img/pages/news/1.jpg" class="card-img-top" alt="news-1">
							        
									<div class="card-footer bg-transparent border-0 px-4 pb-4 text-center">
									    <span class="cuteText">와구와구 애기코기</span>
									</div>
							    </div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
							    <div class="card bg-white rounded-2 border-0 shadow h-100 overflow-hidden">
							        <img src="../img/pages/news/1.jpg" class="card-img-top" alt="news-1">
							        
									<div class="card-footer bg-transparent border-0 px-4 pb-4 text-center">
									    <span class="cuteText">멋을 낸 애기코기</span>
									</div>
							    </div>
							</div>
							
							<hr/>
							
		                    <div class="col-lg-4 col-md-6 col-12">
		                        <div class="card bg-white rounded-4 border-0 shadow h-100 overflow-hidden">
		                            <a href="blog-post.html"> <img src="../img/pages/news/4.jpg" class="card-img-top" alt="news-4"> </a>
		                            <div class="card-body p-4">
		                                <a href="team-work.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TEAM WORK</a> <a href="blog-post.html"> <h4 class="card-title fw-bold pb-2 text-black">Convallis posuere morbi leo urna molestie</h4> </a>
		                            </div>
		                            <div class="card-footer bg-transparent border-0 px-4 pb-4">
		                                <small class="d-flex align-items-center gap-1">
		                                    <a href="admin.html" class="d-flex align-items-center gap-2">
		                                        <div class="bg-primary rounded-circle admin-icon">
		                                            <img src="../img/pages/team/member-1.jpg" alt="customer" class="img-fluid rounded-circle">
		                                        </div>
		                                        ADMIN
		                                    </a>
		                                    <span class="mx-1">/</span>MAY 19, 2025
		                                </small>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-4 col-md-6 col-12">
		                        <div class="card bg-white rounded-4 border-0 shadow h-100 overflow-hidden">
		                            <a href="blog-post.html"> <img src="../img/pages/news/5.jpg" class="card-img-top" alt="news-5"> </a>
		                            <div class="card-body p-4">
		                                <a href="apps.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">APPS</a> <a href="blog-post.html"> <h4 class="card-title fw-bold pb-2 text-black">Feugiat scelerisque varius nunc faucibus</h4> </a>
		                            </div>
		                            <div class="card-footer bg-transparent border-0 px-4 pb-4">
		                                <small class="d-flex align-items-center gap-1">
		                                    <a href="admin.html" class="d-flex align-items-center gap-2">
		                                        <div class="bg-primary rounded-circle admin-icon">
		                                            <img src="../img/pages/team/member-1.jpg" alt="customer" class="img-fluid rounded-circle">
		                                        </div>
		                                        ADMIN
		                                    </a>
		                                    <span class="mx-1">/</span>MAY 19, 2025
		                                </small>
		                            </div>
		                        </div>
		                    </div>
							
		                    <div class="col-lg-4 col-md-6 col-12">
		                        <div class="card bg-white rounded-4 border-0 shadow h-100 overflow-hidden">
		                            <a href="blog-post.html"> <img src="../img/pages/news/7.jpg" class="card-img-top" alt="news-6"> </a>
		                            <div class="card-body p-4">
		                                <div class="d-flex aling-items-center gap-2">
		                                    <a href="technology.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TECHNOLOGY</a> <a href="blog-grid.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TRENDS</a>
		                                </div>
		                                <a href="blog-post.html"> <h4 class="card-title fw-bold pb-2 text-black">Dolor purus non enim praesent elementum facilisis</h4> </a>
		                            </div>
		                            <div class="card-footer bg-transparent border-0 px-4 pb-4">
		                                <small class="d-flex align-items-center gap-1">
		                                    <a href="admin.html" class="d-flex align-items-center gap-2">
		                                        <div class="bg-primary rounded-circle admin-icon">
		                                            <img src="../img/pages/team/member-1.jpg" alt="customer" class="img-fluid rounded-circle">
		                                        </div>
		                                        ADMIN
		                                    </a>
		                                    <span class="mx-1">/</span>MAY 19, 2025
		                                </small>
		                            </div>
		                        </div>
		                    </div>
							
							<hr/>
							
							<div class="col-lg-4 col-md-6 col-12">
							    <div class="card bg-white rounded-4 border-0 shadow h-100 overflow-hidden">
							        <a href="blog-post.html"> <img src="../img/pages/news/7.jpg" class="card-img-top" alt="news-6"> </a>
							        <div class="card-body p-4">
							            <div class="d-flex aling-items-center gap-2">
							                <a href="technology.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TECHNOLOGY</a> <a href="blog-grid.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TRENDS</a>
							            </div>
							            <a href="blog-post.html"> <h4 class="card-title fw-bold pb-2 text-black">Dolor purus non enim praesent elementum facilisis</h4> </a>
							        </div>
							        <div class="card-footer bg-transparent border-0 px-4 pb-4">
							            <small class="d-flex align-items-center gap-1">
							                <a href="admin.html" class="d-flex align-items-center gap-2">
							                    <div class="bg-primary rounded-circle admin-icon">
							                        <img src="../img/pages/team/member-1.jpg" alt="customer" class="img-fluid rounded-circle">
							                    </div>
							                    ADMIN
							                </a>
							                <span class="mx-1">/</span>MAY 19, 2025
							            </small>
							        </div>
							    </div>
							</div>
							
							<div class="col-lg-4 col-md-6 col-12">
							    <div class="card bg-white rounded-4 border-0 shadow h-100 overflow-hidden">
							        <a href="blog-post.html"> <img src="../img/pages/news/7.jpg" class="card-img-top" alt="news-6"> </a>
							        <div class="card-body p-4">
							            <div class="d-flex aling-items-center gap-2">
							                <a href="technology.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TECHNOLOGY</a> <a href="blog-grid.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TRENDS</a>
							            </div>
							            <a href="blog-post.html"> <h4 class="card-title fw-bold pb-2 text-black">Dolor purus non enim praesent elementum facilisis</h4> </a>
							        </div>
							        <div class="card-footer bg-transparent border-0 px-4 pb-4">
							            <small class="d-flex align-items-center gap-1">
							                <a href="admin.html" class="d-flex align-items-center gap-2">
							                    <div class="bg-primary rounded-circle admin-icon">
							                        <img src="../img/pages/team/member-1.jpg" alt="customer" class="img-fluid rounded-circle">
							                    </div>
							                    ADMIN
							                </a>
							                <span class="mx-1">/</span>MAY 19, 2025
							            </small>
							        </div>
							    </div>
							</div>

							<div class="col-lg-4 col-md-6 col-12">
							    <div class="card bg-white rounded-4 border-0 shadow h-100 overflow-hidden">
							        <a href="blog-post.html"> <img src="../img/pages/news/7.jpg" class="card-img-top" alt="news-6"> </a>
							        <div class="card-body p-4">
							            <div class="d-flex aling-items-center gap-2">
							                <a href="technology.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TECHNOLOGY</a> <a href="blog-grid.html" class="px-3 py-2 rounded-pill bg-opacity-purple text-purple badge mb-2">TRENDS</a>
							            </div>
							            <a href="blog-post.html"> <h4 class="card-title fw-bold pb-2 text-black">Dolor purus non enim praesent elementum facilisis</h4> </a>
							        </div>
							        <div class="card-footer bg-transparent border-0 px-4 pb-4">
							            <small class="d-flex align-items-center gap-1">
							                <a href="admin.html" class="d-flex align-items-center gap-2">
							                    <div class="bg-primary rounded-circle admin-icon">
							                        <img src="../img/pages/team/member-1.jpg" alt="customer" class="img-fluid rounded-circle">
							                    </div>
							                    ADMIN
							                </a>
							                <span class="mx-1">/</span>MAY 19, 2025
							            </small>
							        </div>
							    </div>
							</div>
		                    
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
		
		
        <!-- Bootsrap Bundle Js -->
        <script src="../vender/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Jquery Js -->
        <script src="../vender/jquery/jquery-3.6.4.min.js"></script>
        <!-- AOS Js -->
        <script src="../vender/aos/dist/aos.js"></script>
        <!-- Custom Js -->
        <script src="../js/script.js"></script>
    </body>
</html>
