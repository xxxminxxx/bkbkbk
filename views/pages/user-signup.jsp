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
        <link rel="stylesheet" href="../css/style.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
    </head>
    <body>

        <!-- nav bar 영역 -->
        <nav class="navbar osahan-main-nav navbar-expand-lg app-nav py-3 py-lg-0 sticky-top bg-white" id="mainNav">
            <div class="container">
                <div class="position-relative d-flex align-items-center gap-2 site-brand">
					<div class="position-relative d-flex align-items-center gap-2 site-brand">
						<img src="../../../resources/img/booklogo.png" class="booklogo" alt="Book Logo">
						<a class="stretched-link" href="../"></a>
					</div>
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
                    <a href="login" class="btn btn-primary px-3 ms-2 transition-3d-hover rounded-pill"> 로그인 </a>
                </div>
            </div>
        </nav>
        
        <div class="hero-section position-relative overflow-hidden vh-100 d-flex align-items-center flex-column px-lg-5" id="welcome">
            
            <div class="container m-auto px-lg-5">
                <div class="row align-items-center px-lg-5">
                    
                    <div class="col-lg-10 col-12 py-3">
                        <div class="p-5 bg-white rounded-4 shadow">
                            <h2 class="fw-bold mb-4" style="text-align: center;">회원가입</h2>
							
							

							<form action="/register" method="post" id="formSignin" class="d-grid gap-3 input-group-lg">
							    <div class="row align-items-center">
							        <div class="col-3 text-end">
							            <label for="signupEmail" class="my-auto">이메일:</label>
							        </div>
							        <div class="col-9">
							            <input type="email" name="userId" class="form-control bg-dark bg-opacity-50 border-0 px-3 py-2" id="signupEmail" aria-describedby="emailHelp" placeholder="이메일">
							            <small id="emailFeedback" class="form-text"></small>
							        </div>
							    </div>

							    <div class="row align-items-center">
							        <div class="col-3 text-end">
							            <label for="signupPassword" class="my-auto">비밀번호:</label>
							        </div>
							        <div class="col-9">
							            <input type="password" name="password" class="form-control bg-grey border-0 px-3 py-2" id="signupPassword" placeholder="비밀번호">
							        </div>
							    </div>

							    <div class="row align-items-center">
							        <div class="col-3 text-end">
							            <label for="signupPasswordCheck" class="my-auto">비밀번호 확인:</label>
							        </div>
							        <div class="col-9">
							            <input type="password" class="form-control bg-dark border-0 px-3 py-2" id="signupPasswordCheck" placeholder="비밀번호 확인">
							            <small id="passwordFeedback" class="form-text"></small>
							        </div>
							    </div>

							    <div class="row align-items-center">
							        <div class="col-3 text-end">
							            <label for="signupName" class="my-auto">이름:</label>
							        </div>
							        <div class="col-9">
							            <input type="text" name="userName" class="form-control bg-dark border-0 px-3 py-2" id="signupName" aria-describedby="nameHelp" placeholder="이름">
							        </div>
							    </div>

							    <div class="row align-items-center">
							        <div class="col-3 text-end">
							            <label for="signupTel" class="my-auto">연락처:</label>
							        </div>
							        <div class="col-9">
							            <input type="tel" name="userTel" class="form-control bg-dark border-0 px-3 py-2" 
										id="signupTel" aria-describedby="nameHelp" placeholder="(-)빼고 숫자만 입력해주세요">
							        </div>
							    </div>

							    <div class="row align-items-center">
							        <div class="col-3 text-end">
							            <label class="my-auto">성별:</label>
							        </div>
							        <div class="col-9">
							            <div class="d-flex gap-4">
							                <div class="form-check">
							                    <input class="form-check-input" type="radio" name="gender" id="genderMale" value="M">
							                    <label class="form-check-label" for="genderMale">남자</label>
							                </div>
							                <div class="form-check">
							                    <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="F">
							                    <label class="form-check-label" for="genderFemale">여자</label>
							                </div>
							            </div>
							        </div>
							    </div>

							    <div class="row align-items-center">
							        <div class="col-3 text-end">
							            <label for="signupBirthdate" class="my-auto">생년월일:</label>
							        </div>
							        <div class="col-9">
							            <input type="date" name="birthDate" class="form-control bg-light border-0 px-3 py-2" id="signupBirthdate" aria-describedby="birthdateHelp" placeholder="생년월일">
							        </div>
							    </div>

								<div class="row align-items-center">
								        <div class="col-3 text-end">
								            <label class="my-auto">이용약관:</label>
								        </div>
								        <div class="col-9">
								            <div class="form-check">
								                <input type="checkbox" class="form-check-input" id="exampleCheck1" disabled required>
								                <label class="form-check-label small" for="exampleCheck1">서비스 이용약관에 동의합니다.</label>
								                <a href="#" onclick="openTerms(); return false;" class="terms-link">
								                    &nbsp;&nbsp;&nbsp;이용약관 바로가기
								                </a>
								            </div>
								        </div>
								    </div>

							    <button type="submit" class="btn btn-purple btn-theme w-100" id="btnSubmit">회원가입</button>
							</form>
							
                            <div class="pt-3">
                                <!-- or line pending -->
                                <div class="d-flex align-items-center justify-content-between">
                                    <hr class="w-25">
                                    <div class="text-muted small">BOOKBOOKBOOK</div>
                                    <hr class="w-25">
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- 푸터 -->
		<%@ include file="../footer.jsp" %>
		
						
		<style>
						.form-control.bg-dark {
						background-color: #f0f0f0 !important;
						}
						.form-control.bg-grey {
						background-color: #f0f0f0 !important;
						}
						.form-control.bg-light {
						background-color: #f0f0f0 !important;
						}
						
						.booklogo {
							
							width: 300px;
							height: 50px;
							
						}
						
						
						.terms-link {
						    color: #6c757d; 
						    text-decoration: none;
						    transition: color 0.3s ease; 
						}

						.terms-link:hover {
						    color: #0056b3; 
						    
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
		
		<!-- 이용약관 -->
		<script>
		function openTerms() {
		    window.open('user-signupTerms', 'termsWindow', 'width=600,height=700,resizable=yes,scrollbars=yes');
		}
		</script>
		
		<!-- 회원가입 -->
		<script>
			
			$(document).ready(function() {
				
			    $('#formSignin').on('submit', function(e) {
			        e.preventDefault(); // 기본 제출 동작을 막습니다.
			        
			        // 기존의 클라이언트 측 유효성 검사
			        if($('#signupEmail').val() == '' || $('#signupPassword').val() == '' || 
			           $('#signupPasswordCheck').val() == '' || $('#signupName').val() == '' || 
			           $('#signupTel').val() == '' || $('#signupBirthdate').val() == '') {
			            alert('모두 입력해주세요');
			            return false;
			        }
			        if($('#signupPassword').val() != $('#signupPasswordCheck').val()) {
			            alert('비밀번호와 비밀번호 확인이 서로 일치하지 않습니다.');
			            return false;
			        }
					if(!$('#exampleCheck1').is(':checked')){
						alert('[필수] BOOKBOOKBOOK 이용약관에 동의해 주세요.');
						return false;
					}
			        
			        // AJAX를 사용한 폼 제출
					 $.ajax({
					        url: $(this).attr('action'),
					        type: 'POST',
					        data: JSON.stringify($(this).serializeArray().reduce((obj, item) => (obj[item.name] = item.value, obj), {})),
					        contentType: 'application/json',
					        success: function(response) {
					            if (response.success) {
					                window.location.href = '/pages/user-signup-success';
					            } else {
					                alert(response.message);
					            }
					        },
					        error: function(xhr) {
					            var errorMessage = '회원가입 중 오류가 발생했습니다.';
					            if (xhr.responseJSON && xhr.responseJSON.message) {
					                errorMessage = xhr.responseJSON.message;
					            }
					            alert(errorMessage);
					        }
					    });
					});
			});
			
			
			// 이메일 실시간 중복 판별
			$('#signupEmail').on('blur', function() {
			    var email = $(this).val();
			    if(email) {
			        $.ajax({
			            url: '/check-email',
			            type: 'POST',
			            data: { email: email },
			            success: function(response) {
			                if(response === 'duplicate') {
			                    $('#emailFeedback').text('중복된 이메일입니다.').css('color', 'red');
			                } else {
			                    $('#emailFeedback').text('사용 가능한 이메일입니다.').css('color', 'green');
			                }
			            },
			            error: function() {
			                $('#emailFeedback').text('이메일 확인 중 오류가 발생했습니다.').css('color', 'red');
			            }
			        });
			    }
			});
			
			// 비밀번호 / 비밀번호 확인 실시간 판별
			$(document).ready(function() {
			    function checkPasswordMatch() {
			        var password = $('#signupPassword').val();
			        var confirmPassword = $('#signupPasswordCheck').val();
			        
			        if (password != confirmPassword) {
			            $('#passwordFeedback').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
			        } else {
			            $('#passwordFeedback').text('비밀번호가 일치합니다.').css('color', 'green');
			        }
			    }

			    $('#signupPassword, #signupPasswordCheck').on('keyup', checkPasswordMatch);

			});
		
		</script>
		
		
    </body>
</html>