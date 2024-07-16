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
		<link rel="stylesheet" href="css/style2.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
		
		<!-- React 관련 -->
		
		<script src="https://unpkg.com/react@17/umd/react.development.js"></script>
		<script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
		<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
		
        <style>
            .first-form {
                display: flex;
                flex-direction: column;
                justify-content: center;
                min-height: 100vh;
            }
            .row {
                width: 100%;
            }
            @media (min-width: 1400px) {
                .container-xxl, .container-xl, .container-lg, .container-md, .container-sm, .container {
                    max-width: 1600px;
                }
            }
        </style>
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
		           
		        </div>
		    </div>
		</nav>
		
        <div class="overflow-hidden vh-100 d-flex align-items-center flex-column">
            
                <div class="row align-items-center ">
                    <div class="col-lg-6 col-12 p-5 mx-auto bg-white">
						<div class="loginFrame">
                        <div class="d-flex align-items-center justify-content-between w-100 mb-5">
                            <div class="position-relative d-flex align-items-center gap-2 site-brand text-center w-100">
                                <img src="../img/booklogo.png" alt="New Logo" class="booklogo fs-2 lh-1 mx-auto">
                                <a class="stretched-link" href="${pageContext.request.contextPath}/main"></a>
                            </div>
                        </div>
                        <div class="m-auto w-100">
                        
							<form id="loginForm" class="d-grid gap-2 input-group-lg">
							    <div class="mb-3">
							        <label for="userId" class="form-label small ">이메일 입력</label>
							        <input type="text" name="userId" class="form-control border-0 px-3 py-2" placeholder="아이디 입력" id="userId">
							    </div>
							    <div class="mb-3">
							        <label for="password" class="form-label small">비밀번호 입력</label>
							        <input type="password" name="password" class="form-control border-0 px-3 py-2" placeholder="비밀번호 입력" id="password">
							    </div>
							    <!-- 기타 form 요소들 -->
							    <button type="submit" class="btn btn-purple btn-theme">로그인</button>
							</form>
							
							<!-- 아이디 찾기, 비밀번호 찾기 링크 추가 -->
							<div class="d-flex justify-content-center mt-3 mb-4">
							    <a href="${pageContext.request.contextPath}/pages/find-email" class="text-muted small me-3">아이디 찾기</a>
							    <span class="text-muted small">|</span>
							    <a href="${pageContext.request.contextPath}/pages/find-password" class="text-muted small ms-3">비밀번호 찾기</a>
							</div>

							<div class="d-flex align-items-center justify-content-between my-3 opacity-50">
							    <hr class="w-100">
							    <span class="text-muted small px-4">Or</span>
							    <hr class="w-100">
							</div>

							<div class="d-grid d-md-flex justify-content-center gap-3 align-items-center">
							    <a href="javascript:kakaoLogin();" class="kakao-button">
							        <img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png" alt="카카오 로그인 버튼">
							    </a>
							    <div class="naver-login-container">
							        <div id="naver_id_login" class="loginButton"></div>
							    </div>
							</div>



                            <div class="d-flex align-items-center justify-content-center mt-3">
                                <p class="mb-0 me-2">아직 회원이 아니신가요?</p>
                                <a href="signup" class="text-decoration-none">Sign Up</a>
                            </div>

                            <p class="m-0 pt-4 small text-muted text-center">
                                © All rights reserved. Made with <span class="text-danger mx-1">❤</span> by <a class="text-black text-decoration-none d-inline fw-normal p-0" href="#" target="_blank" rel="noopener">Website Name</a>
                            </p>
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
		
						<style>
						       .first-form {
						           display: flex;
						           flex-direction: column;
						           justify-content: center;
						           min-height: 100vh;
						       }
						       .row {
						           width: 100%;
						       }
						       @media (min-width: 1400px) {
						           .container-xxl, .container-xl, .container-lg, .container-md, .container-sm, .container {
						               max-width: 1600px;
						           }
						       }
						       .naver-login-container {
						           margin-left: 10px; /* 네이버 로그인 버튼과 카카오 로그인 버튼 사이의 간격 설정 */
						       }
						       .kakao-button, .naver-login-container {
						           width: 100%; /* 버튼 너비 100%로 설정 */
						       }
						       .d-grid {
						           margin: 0 auto; /* 버튼 그리드를 가운데 정렬 */
						       }
							   
							   .loginFrame {
							           border: 1px solid #ddd; /* 테두리 색상과 두께 설정 */
							           padding: 20px; /* 패딩 설정 */
							           border-radius: 5px; /* 모서리 둥글게 설정 */
									   opacity : 20;
							       }
								   
								.form-control{
									background-color: #f0f0f0
								}
								
								.booklogo {
									width: 300px;
									height: 50px;
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
		
		<!-- 카카오 로그인 관련 (아직 토큰 구현은 X), 로그인 후 회원페이지 구현도 X -->
		
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		
		<script>
		    window.Kakao.init("cc6a247b745a3892157546103896c5c9");
		    
		    function kakaoLogin(){
		        window.Kakao.Auth.login({
		            scope:'profile_nickname, profile_image',
		            success: function(authObj){
		                console.log(authObj);
		                window.Kakao.API.request({
		                    url:'/v2/user/me',
		                    success: res => {
		                        const kakao_account = res.kakao_account;
		                        console.log(kakao_account);
		                        // 로그인 성공 후 메인페이지로 리다이렉트
		                        window.location.href = '${pageContext.request.contextPath}/main';
		                    }
		                });
		            }
		        });
		    }
		</script>
		
		
		<!-- 네이버 로그인 -->
		
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		
		<script type="text/javascript">
		  	var naver_id_login = new naver_id_login("BAi6tKwBqYNBrWAe2kJ0", "http://localhost:8080/pages/page-login.html");
		  	var state = naver_id_login.getUniqState();
		  	naver_id_login.setButton("white", 2,40);
		  	naver_id_login.setDomain("http://localhost:8080/pages/page-login.html");
		  	naver_id_login.setState(state);
		  	naver_id_login.setPopup();
		  	naver_id_login.init_naver_id_login();
			
			
			function naverSignInCallback() {
			        // 로그인 성공 후 처리할 작업
			        console.log(naver_id_login.getProfileData('email'));
			        console.log(naver_id_login.getProfileData('nickname'));
			        // 로그인 성공 후 index.html로 리다이렉트
			        window.location.href = '../index.html';
			    }

			    // 페이지 로드 완료 후 실행
			    window.addEventListener('load', function() {
			        naver_id_login.get_naver_userprofile("naverSignInCallback()");
			    });
			
		  </script>
		
		  

		  <script>
			$(document).ready(function() {
			    $("#loginForm").submit(function(e) {
			        e.preventDefault();
			        var formData = {
			            userId: $("#userId").val(),
			            password: $("#password").val()
			        };

			        $.ajax({
			            type: "POST",
			            contentType: "application/json",
			            url: "/pages/login",
			            data: JSON.stringify(formData),
			            dataType: 'json',
			            success: function(result) {
			                if (result.success) {
			                    localStorage.setItem('userName', result.userName);
			                    window.location.href = "/main";
			                } else {
			                    alert(result.message);
			                }
			            },
			            error: function(e) {
			                alert("로그인 오류 발생");
			            }
			        });
			    });
			});
		  </script>
			  
    </body>
</html>