<%@ page language="java" 
contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/pages/icon.png" type="image/png">
        <title>북북북 | 나의 서재</title>
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
		<!--user-myLibrary CSS-->
		<link rel="stylesheet" href="../css/user-myBookshelf.css">
		
		<!-- ********************JS SECTION************************ -->
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
		<!--user-myLibrary JS-->
<!--		<script src="../js/user-myBookshelf.js"></script>-->
	
    </head>
    <body>
        

		<div class="bg-elements elements-top-header position-relative">
		    <!-- navbar -->
		    <div class="elements-nav">
		        <!-- bootom nav -->
		        <nav id="header" class="navbar navbar-expand bottom-nav bg-black borer-bottom border-opacity-10 border-white py-lg-0 py-3 bg-opacity-25">
		            <div class="container">
		                <div class="position-relative d-flex align-items-center gap-2 site-brand">
		                    <img src="../img/bookbookbookLogo.png" alt="북북북 로고">
		                    <div class="lh-1">
		                        <h5 class="fw-bold m-0">BOOKBOOKBOOK</h5>
		                    </div>
		                    <a class="stretched-link" href="/"></a>
		                </div>
		                <div class="collapse navbar-collapse">
		                    <ul class="navbar-nav m-auto gap-4 m-none">
		                        <li class="nav-item dropdown single-dropdown-nav">
		                            <a class="nav-link " href="#" role="button" aria-expanded="false"> 나의 서재 </a>
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
		                    </ul>
		                    <a href="./page-login.html" class="btn btn-purple rounded-pill d-none d-lg-block btn-theme"> 로그인 </a>
		                    <a href="#" class="link-light d-lg-none ms-auto" data-bs-toggle="offcanvas" data-bs-target="#sidebarnav" aria-controls="sidebarnav">
		                        <i class="ri-menu-3-line ri-lg"></i>
		                    </a>
		                </div>
		            </div>
		        </nav>
		    </div>
			
            <!-- header -->
            
    
		<!-- ############################################## - ->
			    <!-- tab panes -->
			    <div class="py-5 bg-light">
			        <div class="container py-4">
			            <div class="row">
			                <div class="col-12">
			                    <nav>
			                        <div class="nav nav-tabs d-flex justify-content-center gap-2 nav-tabs-osahan" id="nav-tab" role="tablist">
			                            <button class="nav-link active px-lg-4 py-lg-3" id="nav-all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="nav-all" aria-selected="true">전체</button>
			                            <button class="nav-link px-lg-4 py-lg-3" id="nav-read-tab" data-bs-toggle="tab" data-bs-target="#nav-read" type="button" role="tab" aria-controls="nav-read" aria-selected="false">읽은 책</button>
			                            <button class="nav-link px-lg-4 py-lg-3" id="nav-reading-tab" data-bs-toggle="tab" data-bs-target="#nav-reading" type="button" role="tab" aria-controls="nav-reading" aria-selected="false">읽고 있는 책</button>
			                            <button class="nav-link px-lg-4 py-lg-3" id="nav-wishlist-tab" data-bs-toggle="tab" data-bs-target="#nav-wishlist" type="button" role="tab" aria-controls="nav-wishlist" aria-selected="false">읽고 싶은 책</button>
			                        </div>
			                    </nav>
			                    
			                    <div class="tab-content bg-white p-lg-5 p-4 border-end border-bottom border-start" id="nav-tabContent">
			                        <!-- 전체 탭 팬 -->
			                        <div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="nav-all-tab">
			                            <c:choose>
			                                <c:when test="${not empty characterStages}">
			                                    <div id="character-stages">
			                                        <div class="stage-character">
			                                            <div class="stage">${characterStages[0].characterStage}</div>
			                                            <img src="${characterStages[0].characterImage}" alt="Character Image" class="character-image">
			                                            <div class="book-spines">
			                                                <c:forEach var="book" items="${characterStages}">
			                                                    <div class="book-spine">${book.bookTitle}</div>
			                                                </c:forEach>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </c:when>
			                                <c:otherwise>
			                                    <div id="without-data">
			                                        <p>읽은 책이 없습니다!</p>
			                                        <div class="d-flex justify-content-center">
			                                            <a href="#" class="btn btn-primary mx-2">베스트셀러 구경하러 가기</a>
			                                            <a href="#" class="btn btn-secondary mx-2">추천 받기</a>
			                                            <a href="#" class="btn btn-success mx-2">읽은 책 등록하기</a>
			                                        </div>
			                                    </div>
			                                </c:otherwise>
			                            </c:choose>
			                        </div>

			                        <!-- 읽은 책 탭 팬 -->
			                        <div class="tab-pane fade" id="nav-read" role="tabpanel" aria-labelledby="nav-read-tab">
			                            <div id="read-list">
			                                <c:choose>
			                                    <c:when test="${not empty readBooks}">
			                                        <c:forEach var="book" items="${readBooks}">
			                                            <div class="book-item d-flex align-items-start mb-4">
			                                                <img src="${book.bfrealname}" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
			                                                <div class="book-info flex-grow-1">
			                                                    <div class="d-flex justify-content-between align-items-start">
			                                                        <div>
			                                                            <h5 class="book-title">${book.bookTitle}</h5>
			                                                            <p class="book-author mb-1">${book.writer}</p>
																		<div class="book-rating mb-1">
																		    <c:forEach var="i" begin="1" end="5">
																		        <c:choose>
																		            <c:when test="${i <= book.rating}">
																		                <span class="star">★</span>
																		            </c:when>
																		            <c:otherwise>
																		                <span class="star-empty">☆</span>
																		            </c:otherwise>
																		        </c:choose>
																		    </c:forEach>
																		</div>

			                                                            <p class="book-dates">시작일 ${book.startDate} 종료일 ${book.endDate}</p>
			                                                        </div>
			                                                        <button class="btn btn-sm">
			                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 256 256">
			                                                                <path d="M229.66,58.34l-32-32a8,8,0,0,0-11.32,0l-96,96A8,8,0,0,0,88,128v32a8,8,0,0,0,8,8h32a8,8,0,0,0,5.66-2.34l96-96A8,8,0,0,0,229.66,58.34ZM124.69,152H104V131.31l64-64L188.69,88ZM200,76.69,179.31,56,192,43.31,212.69,64ZM224,128v80a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32h80a8,8,0,0,1,0,16H48V208H208V128a8,8,0,0,1,16,0Z">
			                                                                </path>
			                                                            </svg>
			                                                        </button>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                        </c:forEach>
			                                    </c:when>
			                                    <c:otherwise>
			                                        <div id="without-data">
			                                            <p>읽은 책이 없습니다!</p>
			                                            <div class="d-flex justify-content-center">
			                                                <a href="#" class="btn btn-primary mx-2">베스트셀러 구경하러 가기</a>
			                                                <a href="#" class="btn btn-secondary mx-2">추천 받기</a>
			                                                <a href="#" class="btn btn-success mx-2">읽은 책 등록하기</a>
			                                            </div>
			                                        </div>
			                                    </c:otherwise>
			                                </c:choose>
			                            </div>
			                            <div class="text-end mt-3">
			                                <button class="btn btn-sm btn-outline-primary">⇅정렬</button>
			                            </div>
			                        </div>

			                        <!-- 읽고 있는 책 탭 팬 -->
			                        <div class="tab-pane fade" id="nav-reading" role="tabpanel" aria-labelledby="nav-reading-tab" tabindex="0">
			                            <div id="reading-list">
			                                <c:forEach var="book" items="${readingBooks}">
			                                    <div class="book-item d-flex align-items-start mb-4">
			                                        <img src="${book.bfrealname}" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
			                                        <div class="book-info flex-grow-1">
			                                            <div class="d-flex justify-content-between align-items-start">
			                                                <div>
			                                                    <h5 class="book-title">${book.bookTitle}</h5>
			                                                    <p class="book-author mb-1">${book.writer}</p>
			                                                    <p class="book-start-date mb-1">시작일 ${book.startDate}</p>
			                                                </div>
			                                                <button class="btn btn-sm">
			                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 256 256">
			                                                        <path d="M229.66,58.34l-32-32a8,8,0,0,0-11.32,0l-96,96A8,8,0,0,0,88,128v32a8,8,0,0,0,8,8h32a8,8,0,0,0,5.66-2.34l96-96A8,8,0,0,0,229.66,58.34ZM124.69,152H104V131.31l64-64L188.69,88ZM200,76.69,179.31,56,192,43.31,212.69,64ZM224,128v80a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32h80a8,8,0,0,1,0,16H48V208H208V128a8,8,0,0,1,16,0Z">   
			                                                        </path>
			                                                    </svg>
			                                                </button>
			                                            </div>
			                                            <div class="progress mb-2" style="height: 10px;">
			                                                <div class="progress-bar bg-success" role="progressbar" style="width: 64%" aria-valuenow="64" aria-valuemin="0" aria-valuemax="100"></div>
			                                            </div>
			                                            <p class="book-progress mb-0">64% (473/679 페이지)</p>
			                                        </div>
			                                    </div>
			                                </c:forEach>
			                            </div>
			                            <div class="text-end mt-3">
			                                <button class="btn btn-sm btn-outline-primary">⇅정렬</button>
			                            </div>
			                        </div>

			                        <!-- 읽고 싶은 책 탭 팬 -->
			                        <div class="tab-pane fade" id="nav-wishlist" role="tabpanel" aria-labelledby="nav-wishlist-tab" tabindex="0">
			                            <div id="wish-list">
			                                <c:forEach var="book" items="${wishlistBooks}">
			                                    <div class="book-item d-flex align-items-start mb-4">
			                                        <img src="${book.bfrealname}" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
			                                        <div class="book-info flex-grow-1">
			                                            <div class="d-flex justify-content-between align-items-start">
			                                                <div>
			                                                    <h5 class="book-title">${book.bookTitle}</h5>
			                                                    <p class="book-author mb-1">${book.writer}</p>
			                                                    <p class="book-added-date mb-1">추가된 날짜: ${book.addedDate}</p>
			                                                </div>
			                                                <button class="btn btn-sm">
			                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 256 256">
			                                                        <path d="M229.66,58.34l-32-32a8,8,0,0,0-11.32,0l-96,96A8,8,0,0,0,88,128v32a8,8,0,0,0,8,8h32a8,8,0,0,0,5.66-2.34l96-96A8,8,0,0,0,229.66,58.34ZM124.69,152H104V131.31l64-64L188.69,88ZM200,76.69,179.31,56,192,43.31,212.69,64ZM224,128v80a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32h80a8,8,0,0,1,0,16H48V208H208V128a8,8,0,0,1,16,0Z">
			                                                        </path>
			                                                    </svg>
			                                                </button>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </c:forEach>
			                            </div>
			                            <div class="text-end mt-3">
			                                <button class="btn btn-sm btn-outline-primary">⇅정렬</button>
			                            </div>
			                        </div>
			                    </div> <!-- end of tab-content -->
			                </div>
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
			                <i class="ri-slideshow-line fs-2 lh-1 text-white"></i>
			                <div class="lh-1">
			                    <h5 class="fw-bold m-0 text-white">Software</h5>
			                    <small class="text-muted text-white-50">One Page</small>
			                </div>
			                <a class="stretched-link" href="index.html"></a>
			            </div>
			            <ul class="navbar-nav justify-content-end flex-grow-1 mt-4">
			                <li class="nav-item dropdown osahan-mega-menu position-static">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Elements </a>
			                    <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
			                        <li>
			                            <div class="dropdown-mega-content container">
			                                <div class="row g-0">
			                                    <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
			                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Elements 1</h6>
			                                        <ul class="dropdown-mega-sub-nav list-unstyled">
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-accordions-toggles.html">Accordions &amp; Toggles</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-tabs.html">Tabs</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-icons.html">Icons</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-pagination.html">Pagination</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-cards.html">Cards</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-carousels.html">Carousels</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-modals.html">Modals</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-placeholders.html">Placeholders</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-medias.html">Medias</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-maps.html">Maps</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-forms-basic.html">Forms</a></li>
			                                        </ul>
			                                    </div>
			                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
			                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Elements 2</h6>
			                                        <ul class="dropdown-mega-sub-nav list-unstyled">
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-buttons.html">Buttons</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-badges.html">Badges</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-lists.html">Lists</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-offcanvas.html">Offcanvas</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-image-frames.html">Image Frames</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-testimonials.html">Testimonials</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-blockquotes.html">Blockquotes</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-borders.html">Borders</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-process.html">Process</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-countdowns.html">Countdowns</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-spinners.html">Spinners</a></li>
			                                        </ul>
			                                    </div>
			                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
			                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Elements 3</h6>
			                                        <ul class="dropdown-mega-sub-nav list-unstyled">
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-call-to-action.html">Call to Action</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-pricing-tables.html">Pricing Tables</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-tables.html">Tables</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-progress-bars.html">Progress Bars</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-colors.html">Colors</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-dropdowns.html">Dropdowns</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-tooltips-popovers.html">Tooltips &amp; Popovers</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-sticky-elements.html">Sticky Elements</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-typography.html">Typography</a></li>
			                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements/elements-alerts.html">Alerts</a></li>
			                                        </ul>
			                                    </div>
			                                    <div class="col-lg-3 dropdown-mega-sub-content-block d-none d-lg-block bg-light p-5 osahan-dropdown-box border-end border-opacity-10 border-dark">
			                                        <div class="position-relative d-flex align-items-center gap-2 site-brand">
			                                            <i class="ri-slideshow-line fs-2 lh-1 text-black"></i>
			                                            <div class="lh-1">
			                                                <h5 class="fw-bold m-0 text-black">Software</h5>
			                                                <small class="text-muted text-muted">One Page</small>
			                                            </div>
			                                            <a class="stretched-link" href="index.html"></a>
			                                        </div>
			                                        <h5 class="text-dark mt-5 mb-2"> Multi-Purpose</h5>
			                                        <h1 class="text-primary fw-bold">And Powerful Bootstrap based </h1>
			                                        <p class="lead mb-5">
			                                            Template with 180+ Valid Multi-Page & One-Page Layouts
			                                        </p>
			                                        <a class="btn btn-primary px-5 py-3" href="#">GET STARTED</a>
			                                    </div>
			                                </div>
			                            </div>
			                        </li>
			                    </ul>
			                </li>
			                <li class="nav-item dropdown single-dropdown-nav">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Shop </a>
			                    <ul class="dropdown-menu">
			                        <li><a class="dropdown-item" href="shop-product-grid.html">Product Grid</a></li>
			                        <li><a class="dropdown-item" href="shop-product-list.html">Product List</a></li>
			                        <li><a class="dropdown-item" href="shop-product-full-three-coulmn.html">Product Three Coulmns</a></li>
			                        <li><a class="dropdown-item" href="shop-product-full-four-coulmn.html">Product Four Coulmns</a></li>
			                        <li><a class="dropdown-item" href="shop-product-detail.html">Product Detail</a></li>
			                        <li><a class="dropdown-item" href="shop-cart.html">Shop Cart</a></li>
			                        <li><a class="dropdown-item" href="shop-checkout.html">Shop Checkout</a></li>
			                    </ul>
			                </li>
			                <li class="nav-item dropdown osahan-mega-menu position-static">
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
			                </li>
			            </ul>
			            <a href="index.html" class="btn btn-warning rounded-0"> <i class="ri-shopping-cart-line me-2"></i> Purchase Now </a>
			        </div>
			    </div>
			</div>

			<!-- 푸터 포함 -->
			<%@ include file="footer.jsp" %>
    </body>
</html>