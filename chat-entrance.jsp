<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>오픈책팅방</title>
        <!-- Bootstrap Css -->
        <link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
        <!-- Icofont Css -->
        <link rel="stylesheet" href="../vender/icofont/icofont.min.css">
        <!-- AOS Css -->
        <link rel="stylesheet" href="../vender/aos/dist/aos.css">
        <!-- Remix Icons -->
        <link rel="stylesheet" href="../vender/remixicon/remixicon.css">
        <!-- Custom Css -->
        <link rel="stylesheet" href="../css/style.css">
		<link rel="stylesheet" href="../css/style2.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
    </head>
    <body>
        
        <div class="bg-elements elements-top-header position-relative">
            <!-- navbar -->
            <div class="elements-nav">
                <!-- top nav -->
                <!-- <div class="top-nav d-none d-lg-block py-2 bg-black bg-opacity-50">
                    <div class="container">
                        <div class="row align-items-center justify-content-between g-4">
                            <div class="col-auto">
                                <small class="link-secondary"><i class="ri-map-pin-line"></i> Rammurthy nagar, Bangalore-560016</small>
                            </div>
                            <div class="col-auto">
                                <div class="d-flex align-items-center gap-3">
                                    <a href="#" class="link-secondary"><i class="ri-facebook-circle-fill"></i></a> <a href="#" class="link-secondary"><i class="ri-twitter-fill"></i></a>
                                    <a href="#" class="link-secondary"><i class="ri-instagram-fill"></i></a> <a href="#" class="link-secondary"><i class="ri-linkedin-box-fill"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
                <!-- bootom nav -->
                <nav class="navbar navbar-expand bottom-nav bg-black borer-bottom border-opacity-10 border-white py-lg-0 py-3 bg-opacity-25">
                    <div class="container">
                        <div class="position-relative d-flex align-items-center gap-2 site-brand">
                            <img src="../img/bookbookbookLogo.png" alt="북북북 로고"/>
                            <div class="lh-1">
                               <h5 class="fw-bold m-0 text-white">BOOKBOOKBOOK</h5>
                               <!-- <small class="text-muted text-white-50">One Page</small> -->
                            </div>
                            <a class="stretched-link" href="/"></a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav m-auto gap-4 m-none">
                                <!-- <li class="nav-item">
                                    <a class="nav-link active" href="../index.html"><i class="ri-apps-2-line"></i> Home</a>
                                </li> -->
                                
                                <li class="nav-item dropdown single-dropdown-nav">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 서재 </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="shop-product-grid.html">읽은 책</a></li>
                                        <li><a class="dropdown-item" href="shop-product-list.html">읽고 있는 책</a></li>
                                        <li><a class="dropdown-item" href="shop-product-full-three-coulmn.html">읽고 싶은 책</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a class="nav-link" href="#" role="button" aria-expanded="false"> 나의 캐릭터 </a>
                                </li>
                                <li class="nav-item dropdown single-dropdown-nav">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 정보 </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="shop-product-grid.html">나의 정보</a></li>
                                        <li><a class="dropdown-item" href="shop-product-list.html">나의 달력</a></li>
                                        <li><a class="dropdown-item" href="shop-product-full-three-coulmn.html">나의 메모</a></li>
                                        <li><a class="dropdown-item" href="shop-product-full-four-coulmn.html">나의 통계</a></li>
                                    </ul>
                                </li>
                                <!-- <li class="nav-item dropdown osahan-mega-menu position-static">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Extra Pages </a>
                                    <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                                        <li>
                                            <div class="dropdown-mega-content container">
                                                <div class="row g-0">
                                                    <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Portfolio</h6>
                                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-full-width.html">Portfolio Full Width</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-boxed.html">Portfolio Boxed</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-classic.html">Portfolio Classic</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-masonry.html">Portfolio Masonry</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="single-project.html">Single Project</a></li>
                                                        </ul>
                                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Help</h6>
                                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-help-center.html">Help Center</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-help-center-categories.html">Help Center: Categories</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-help-center-article.html">Help Center: Article</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Blog</h6>
                                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-grid.html">Blog Grid</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-grid-classic.html">Blog Grid Classic</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-grid-sidebar.html">Blog Grid Sidebar</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-list.html">Blog List</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-list-sidebar.html">Blog List Right Sidebar</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-left-sidebar.html">Blog List Left Sidebar</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-full-width.html">Blog Full Width</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-post.html">Blog Post</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="blog-author-profile.html">Author Profile</a></li>
                                                        </ul>
                                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">FAQ</h6>
                                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="faq.html">FAQ v.1</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="faq-2.html">FAQ v.2</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Company</h6>
                                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-hire-us.html">Hire Us</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-careers.html">Careers</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-careers-role-overview.html">Careers: Role Overview</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-careers-apply.html">Careers: Apply</a></li>
                                                        </ul>
                                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Additional Pages</h6>
                                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-coming-soon.html">Coming Soon</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-coming-soon-simple.html">Coming Soon: Simple</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-error-404.html">Maintenance</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-error-404.html">Error 404</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-terms.html">Terms &amp; Conditions</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-privacy.html">Privacy &amp; Policy</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">My Account</h6>
                                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-login.html">Log In v.1</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-login-2.html">Log In v.2</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-signup.html">Sign Up v.1</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-signup-2.html">Sign Up v.2</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="page-reset-password.html">Forgot Password</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="account-orders.html">Orders</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="account-settings.html">Settings</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="account-address.html">Address</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="my-wallet.html">My Wallet</a></li>
                                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="account-notification.html">Notification</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li> -->
                            </ul>
                            <a href="./page-login.html" class="btn btn-purple rounded-pill d-none d-lg-block btn-theme"> 로그인 </a>
                            <a href="#" class="link-light d-lg-none ms-auto" data-bs-toggle="offcanvas" data-bs-target="#sidebarnav" aria-controls="sidebarnav"><i class="ri-menu-3-line ri-lg"></i></a>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- header -->
            <div class="py-5">
                <div class="container py-5">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-8 col-lg-8 col-md-10 col-12">
                            <div class="text-white py-5 text-center">
                                <span class="d-block text-white mb-3">책에 대한 이야기를 나눠보세요 
                                <h1 class="display-4 text-white fw-bold">오픈책팅방</h1>
                                <span class=""> 원하는 방이 없다면 </span>
								<button id="createNewChatroom" class="btn btn-purple rounded-pill ms-1 "data-bs-toggle="modal" data-bs-target="#exampleModal">새 방 만들기</button></span>
	                        <!-- Modal -->
		                        <div class=" text-black align-items-center text-center modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		                            <div class="modal-dialog">
		                                <div class="modal-content">
		                                    <div class="modal-header">
		                                        <h1 class="modal-title fs-5" id="exampleModalLabel">새 채팅방 만들기</h1>
		                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                                    </div>
											<form id="createChatroom" name="createChatroom">
		                                    <div class="modal-body">
		                                        채팅방 이름<input type="text" name="chatroonName"><br/>
												인원수 제한<input type="number" name="chatUserLimit"><br/>
												주제 도서<input type="text" name="bookTitle"><br/>
		                                    </div>
		                                    <div class="modal-footer">
		                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		                                        <button type="submit" class="btn btn-primary">만들기</button>
		                                    </div>
											</form>
		                                </div>
		                            </div>
		                        </div>	
								
								<p class="lead text-white-50 m-0"></p>
                            </div>
                            <div class="row">
                                
                                <input class="col-md-10" placeholder="채팅방을 검색해보세요.">
                                <button class="col-md-2 btn btn-purple d-none d-lg-block btn-theme" type="submit">검색</button>
                               
                            </div>
                            <div><br/></div>
                            <div class="row g-4">
                                <div class="col-lg-6 col-12 mb-4">
                                    <div class="shadow bg-white rounded-0 border-light-subtle hover:bg-warning rounded-4 p-4">
                                        <span class="badge bg-success small text-success bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">참여가능</span>
                                        <h5 class="fw-bold mt-2 mb-0 text-black d-flex align-items-center">[불편한 편의점]독서토론방</h5>
                                        <div class="fs-7 d-flex small align-items-center gap-3 w-100 justify-content-between my-3">
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-user-line"></i>
                                                <div>
                                                    <small class="text-muted">참여자 수</small>
                                                    <p class="m-0">15명/50명</p>
                                                </div>
                                            </div>
                                            <!-- <div class="d-flex align-items-center gap-2">
                                                <i class="ri-award-line"></i>
                                                <div>
                                                    <small class="text-muted">Experience</small>
                                                    <p class="m-0">2 - 3 Years</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-calendar-line"></i>
                                                <div>
                                                    <small class="text-muted">Deadline</small>
                                                    <p class="m-0">Oct 12, 2024</p>
                                                </div>
                                            </div> -->
                                        </div>
                                        <a href="page-careers-apply.html" class="btn btn-outline-purple w-100 mt-2">참여하기</a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12 mb-4">
                                    <div class="shadow bg-white rounded-0 border-light-subtle hover:bg-warning rounded-4 p-4">
                                        <span class="badge bg-success small text-success bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">참여가능</span>
                                        <h5 class="fw-bold mt-2 mb-0 text-black d-flex align-items-center">[해독 혁명] 오픈채팅방입니다.</h5>
                                        <div class="fs-7 d-flex small align-items-center gap-3 w-100 justify-content-between my-3">
                                            <div class="d-flex align-items-center gap-2">
                                                 <i class="ri-user-line"></i>
                                                <div>
                                                    <small class="text-muted">참여자 수</small>
                                                    <p class="m-0">10명/50명</p>
                                                </div>
                                            </div>
                                            <!-- <div class="d-flex align-items-center gap-2">
                                                <i class="ri-award-line"></i>
                                                <div>
                                                    <small class="text-muted">Experience</small>
                                                    <p class="m-0">1 - 7 Years</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-calendar-line"></i>
                                                <div>
                                                    <small class="text-muted">Deadline</small>
                                                    <p class="m-0">Oct 22, 2024</p>
                                                </div>
                                            </div> -->
                                        </div>
                                        <a href="page-careers-apply.html" class="btn btn-outline-purple w-100 mt-2">입장하기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-4">
                                <div class="col-lg-6 col-12 mb-4">
                                    <div class="shadow bg-white rounded-0 border-light-subtle hover:bg-warning rounded-4 p-4">
                                        <span class="badge bg-success small text-success bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">Open</span>
                                        <h5 class="fw-bold mt-2 mb-0 text-black d-flex align-items-center">Technical Support Engineer</h5>
                                        <div class="fs-7 d-flex small align-items-center gap-3 w-100 justify-content-between my-3">
                                            <div class="d-flex align-items-center gap-2">
                                                 <i class="ri-user-line"></i>
                                                <div>
                                                    <small class="text-muted">참여자 수</small>
                                                    <p class="m-0">50명/50명</p>
                                                </div>
                                            </div>
                                            <!-- <div class="d-flex align-items-center gap-2">
                                                <i class="ri-award-line"></i>
                                                <div>
                                                    <small class="text-muted">Experience</small>
                                                    <p class="m-0">5 - 7 Years</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-calendar-line"></i>
                                                <div>
                                                    <small class="text-muted">Deadline</small>
                                                    <p class="m-0">Oct 31, 2021</p>
                                                </div>
                                            </div> -->
                                        </div>
                                        <a href="page-careers-apply.html" class="btn btn-outline-purple w-100 mt-2">APPLY NOW</a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12 mb-4">
                                    <div class="shadow bg-white rounded-0 border-light-subtle hover:bg-warning rounded-4 p-4">
                                        <span class="badge bg-success small text-success bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">Open</span>
                                        <h5 class="fw-bold mt-2 mb-0 text-black d-flex align-items-center">React Lead Developer</h5>
                                        <div class="fs-7 d-flex small align-items-center gap-3 w-100 justify-content-between my-3">
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-briefcase-line"></i>
                                                <div>
                                                    <small class="text-muted">Job Type</small>
                                                    <p class="m-0">Permanent</p>
                                                </div>
                                            </div>
                                            <!-- <div class="d-flex align-items-center gap-2">
                                                <i class="ri-award-line"></i>
                                                <div>
                                                    <small class="text-muted">Experience</small>
                                                    <p class="m-0">1 - 7 Years</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-calendar-line"></i>
                                                <div>
                                                    <small class="text-muted">Deadline</small>
                                                    <p class="m-0">Oct 22, 2024</p>
                                                </div>
                                            </div> -->
                                        </div>
                                        <a href="page-careers-apply.html" class="btn btn-outline-purple w-100 mt-2">APPLY NOW</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-4">
                                <div class="col-lg-6 col-12 mb-4">
                                    <div class="shadow bg-white rounded-0 border-light-subtle hover:bg-warning rounded-4 p-4">
                                        <span class="badge bg-danger small text-danger bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">참여불가</span>
                                        <h5 class="fw-bold mt-2 mb-0 text-black d-flex align-items-center">[그의 운명에 대한 아주 개인적인 생각]</h5>
                                        <div class="fs-7 d-flex small align-items-center gap-3 w-100 justify-content-between my-3">
                                            <div class="d-flex align-items-center gap-2">
                                                 <i class="ri-user-line"></i>
                                                <div>
                                                    <small class="text-muted">참여자 수</small>
                                                    <p class="m-0">15명/50명</p>
                                                </div>
                                            </div>
                                            <!-- <div class="d-flex align-items-center gap-2">
                                                <i class="ri-award-line"></i>
                                                <div>
                                                    <small class="text-muted">Experience</small>
                                                    <p class="m-0">5 - 7 Years</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-calendar-line"></i>
                                                <div>
                                                    <small class="text-muted">Deadline</small>
                                                    <p class="m-0">Oct 31, 2021</p>
                                                </div>
                                            </div> -->
                                        </div>
                                        <a href="page-careers-apply.html" class="btn btn-outline-purple w-100 mt-2">APPLY NOW</a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12 mb-4">
                                    <div class="shadow bg-white rounded-0 border-light-subtle hover:bg-warning rounded-4 p-4">
                                        <span class="badge bg-success small text-success bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">Open</span>
                                        <h5 class="fw-bold mt-2 mb-0 text-black d-flex align-items-center">Category Manager</h5>
                                        <div class="fs-7 d-flex small align-items-center gap-3 w-100 justify-content-between my-3">
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-briefcase-line"></i>
                                                <div>
                                                    <small class="text-muted">Job Type</small>
                                                    <p class="m-0">Permanent</p>
                                                </div>
                                            </div>
                                            <!-- <div class="d-flex align-items-center gap-2">
                                                <i class="ri-award-line"></i>
                                                <div>
                                                    <small class="text-muted">Experience</small>
                                                    <p class="m-0">1 - 7 Years</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center gap-2">
                                                <i class="ri-calendar-line"></i>
                                                <div>
                                                    <small class="text-muted">Deadline</small>
                                                    <p class="m-0">Oct 22, 2024</p>
                                                </div>
                                            </div> -->
                                        </div>
                                        <a href="page-careers-apply.html" class="btn btn-outline-purple w-100 mt-2">APPLY NOW</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination align-items-center justify-content-center" margin-left="3rem">
                                <li class="page-item">
                                    <a class="page-link text-purple" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link text-purple" href="#">1</a></li>
                                <li class="page-item"><a class="page-link text-purple" href="#">2</a></li>
                                <li class="page-item"><a class="page-link text-purple" href="#">3</a></li>
                                <li class="page-item"><a class="page-link text-purple" href="#">4</a></li>
                                <li class="page-item"><a class="page-link text-purple" href="#">5</a></li>
                                <li class="page-item">
                                    <a class="page-link text-purple" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                     </div>
                </div>
            </div>
        </div>
        
		<!-- Nav Sidebar -->
		        <div class="offcanvas offcanvas-top bg-purple text-white border-0 h-100" tabindex="-1" id="sidebarnav" aria-labelledby="sidebarnavLabel">
		            <div class="offcanvas-header d-flex justify-content-end">
		                <a href="#" class="link-light" data-bs-dismiss="offcanvas" aria-label="Close"><i class="ri-close-line ri-lg"></i></a>
		            </div>
		            <div class="offcanvas-body">
		                <div class="sidebar-nav text-center">
		                    <div class="position-relative d-flex align-items-center gap-2 site-brand">
		                            <!--<i class="ri-slideshow-line fs-2 lh-1 text-white"></i>-->
		                            <div class="lh-1">
		                               <h5 class="fw-bold m-0 text-white">BOOKBOOKBOOK</h5>
		                            </div>
		                            <a class="stretched-link" href="../index.html"></a>
		                        </div>
		                    <ul class="navbar-nav justify-content-end flex-grow-1 mt-4">
		                        <li class="nav-item dropdown osahan-mega-menu position-static">
		                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 서재  </a>
		                            <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
		                                <li>
		                                    <div class="dropdown-mega-content container">
		                                        <div class="row g-0">
		                                            <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
		                                                <!--<h6 class="dropdown-mega-sub-title mb-3 fw-bold">Elements 1</h6>-->
		                                                <ul class="dropdown-mega-sub-nav list-unstyled">
		                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../elements/elements-accordions-toggles.html">읽은 책</a></li>
		                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../elements/elements-tabs.html">읽고 있는 책</a></li>
		                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../elements/elements-icons.html">읽고 싶은 책</a></li>
		                                                    </ul>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </li>
		                            </ul>
		                        </li>
		                        <li class="nav-item dropdown single-dropdown-nav">
		                            <a class="nav-link " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 캐릭터 </a>
		                          
		                        </li>
		                        <li class="nav-item dropdown osahan-mega-menu position-static">
		                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 정보 </a>
		                            <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
		                                <li>
		                                    <div class="dropdown-mega-content container">
		                                        <div class="row g-0">
		                                            <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
		                                               <!-- <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Portfolio</h6>-->
		                                                <ul class="dropdown-mega-sub-nav list-unstyled">
		                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-full-width.html">나의 정보 수정</a></li>
		                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-boxed.html">나의 달력</a></li>
		                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-classic.html">나의 메모</a></li>
		                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-masonry.html">나의 통계</a></li>
		                                                </ul>
		                                        </div>
		                                    </div>
		                                </li>
		                            </ul>
		                        </li>
		                    </ul>
		                    <div class="d-flex align-items-center justify-content-center gap-3 my-4">
		                        <a href="#" class="link-light"><i class="ri-facebook-circle-fill"></i></a> <a href="#" class="link-light"><i class="ri-twitter-fill"></i></a> <a href="#" class="link-light"><i class="ri-instagram-fill"></i></a>
		                        <a href="#" class="link-light"><i class="ri-linkedin-box-fill"></i></a>
		                    </div>
		                    <a href="../index.html" class="btn btn-warning rounded-0"> <i class="ri-door-line me-2"></i> 로그아웃 </a>
		                </div>
		            </div>
		        </div>
				
				<!-- 푸터 포함 -->
						<%@ include file="../footer.jsp" %>
								
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
