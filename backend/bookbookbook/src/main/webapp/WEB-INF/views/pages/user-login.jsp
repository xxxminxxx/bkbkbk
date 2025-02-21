<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>북북북 | 로그인</title>
        <style>
            .form-control {
                background-color: #f0f0f0 !important
            }
            #welcome{
                background-image: url('../img/logincover.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
            }
            
            .loginButton img{
                width:140px;
                height:45px;
            }
            
            .txt span {
                position:relative;  
                display: inline-block; 
                color:#F14F00; 
                letter-spacing:-0.8px;
                animation:txtup 1s infinite; 
                -webkit-animation:txtup 1.5s infinite;  
                -ms-animation:txtup 1.5s infinite;   
                -moz-animation: txtup 1.5s infinite; 
            }
            .txt span:nth-of-type(1){animation-delay:0.1s;}
            .txt span:nth-of-type(2){animation-delay:0.2s;}
            .txt span:nth-of-type(3){animation-delay:0.3s;}
            .txt span:nth-of-type(4){animation-delay:0.4s;} 
            .txt span:nth-of-type(5){animation-delay:0.4s;} 
            
            @-webkit-keyframes txtup {
                0%{top:0;}
                20% {top:-0.2rem;}
                40% {top:0;}
                60% {top:0;}
                80% {top:0;}
                100% {top:0}
            }
            @keyframes txtup {
                0% {top:0;}
                20% {top:-0.2rem;}
                40% {top:0}
                60% {top:0}
                80% {top:0}
                100% {top:0}
            }
         
         #google_login_button {
             cursor: pointer;
         }

         #google_login_button:hover {
             cursor: pointer;
         }
         
         
         .d-flex.justify-content-between {
                 width: 100%;
             }
             
             #google_login_button, .naver-login-container {
                 flex: 1;
                 display: flex;
                 justify-content: center;
             }
             
             #naver_id_login {
                 width: 145px !important;
             }
         
        </style>
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
        <div class="hero-section position-relative overflow-hidden vh-100 d-flex align-items-center flex-column px-lg-5" id="welcome">
            <nav class="navbar osahan-main-nav navbar-expand py-lg-4 py-3 gadgets-nav w-100 mb-auto px-lg-5">
                <div class="container px-lg-5">
                    <div class="position-relative d-flex align-items-center gap-2 site-brand">
                        <img src="../img/bookbookbookLogo.png" alt="BOOKBOOKBOOK Logo" href="/">
                        <div class="lh-1">
                            <h5 class="fw-bold m-0 text-black">BOOKBOOKBOOK</h5>
                        </div>
                        <a class="stretched-link" href="/"></a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="d-flex align-items-center gap-4 ms-auto">
                            <p class="small m-0">아직 회원이 아니신가요? <a href="/pages/user-signup" class="text-decoration-none">회원가입</a></p>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="container m-auto px-lg-5">
                <div class="row align-items-center px-lg-5">
                    <div class="col-lg-7 col-12 d-none d-lg-block">
                        <div class="ps-lg-0 pe-lg-0">
                            <div class="ps-lg-0 ms-lg-0">
                                <div class="py-3" style="margin:0 0 150px 0">
                                    <div class="text-muted mb-4 display-6">
                                        북북북 | BOOKBOOKBOOK
                                    </div>
                                    <div class="fw-bold display-4 text-black txt">
                                        독서가 <span>즐</span><span>거</span><span>워</span><span>지</span><span>는</span> 공간
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-3">
                                            <dotlottie-player src="https://lottie.host/080eb3bc-1394-4927-bffb-3af4853d7a07/i5N3NZ8lYo.json" background="transparent" speed="1" style="width: 200px; height: 200px;" loop autoplay></dotlottie-player>                     
                                        </div>
                                        <div class="col-xl-9" style="padding:0 0 0 50px ">
                                            <p class="py-2 lead"></p>
                                            <p class="lead">로그인 후 독서 상황을 기록해보세요.</p>
                                            <p class="lead">보고 싶은 책을 검색한 후 가까운 도서관을 찾아<br/>대출 가능 여부도 확인할 수 있어요.</p>
                                            <p class="lead">나에게 맞는 도서도 추천받고,<br/>관심 있는 책에 대해서 다함께 이야기해보아요!</p>
                                        </div>     
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-12 py-3">
                        <div class="p-5 bg-white rounded-4 shadow">
                            <h5 class="fw-bold mb-4">서비스 이용을 위해 로그인해주세요</h5>
                            <form id="loginForm" method="POST" class="d-grid gap-2 input-group-lg">
                                <div class="mb-3">
                                    <label for="userId" class="form-label small">이메일 입력</label>
                                    <input type="text" name="userId" class="form-control border-0 px-3 py-2" placeholder="아이디 입력" id="userId">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label small">비밀번호 입력</label>
                                    <input type="password" name="password" class="form-control border-0 px-3 py-2" placeholder="비밀번호 입력" id="password">
                                </div>
                                <button type="submit" class="btn btn-purple btn-theme">로그인</button>
                            </form>

                            <div class="d-flex justify-content-center mt-3 mb-4" style="font-size:16px">
                                <a href="${pageContext.request.contextPath}/pages/find-email" class="text-muted small me-3">아이디 찾기</a>
                                <span class="text-muted small">|</span>
                                <a href="${pageContext.request.contextPath}/pages/user-unlockAccount" class="text-muted small mx-3">로그인 잠금 풀기</a>
                                <span class="text-muted small">|</span>
                                <a href="${pageContext.request.contextPath}/pages/find-password" class="text-muted small ms-3">비밀번호 찾기</a>
                            </div>
                            
                            <div class="pt-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <hr class="w-25">
                                    <div class="text-muted small">
                                        다른 방법으로 로그인
                                    </div>
                                    <hr class="w-25">
                                </div>
                        <div class="d-flex justify-content-between align-items-center gap-2 pt-3 mb-0">
                            <div id="google_login_button">
                                <img src="../img/google_login.png" style="width: 145px; height: 45px;">
                            </div>
                            <div class="naver-login-container">
                                <div id="naver_id_login" class="loginButton"></div>
                            </div>
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootsrap Bundle Js -->
        <script src="../vender/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Jquery Js -->
        <script src="../vender/jquery/jquery-3.6.4.min.js"></script>
        <!-- AOS Js -->
        <script src="../vender/aos/dist/aos.js"></script>
        <!-- Custom Js -->
        <script src="../js/script.js"></script>
        <!--sweetalert-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
        <!--Sweetalert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script> 
        
		<!-- 네이버 로그인 스크립트 -->
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		<script type="text/javascript">
		    var naver_id_login = new naver_id_login("CSBdbGmW2oM3R_pAZvGn", "http://localhost:8080/pages/login");
		    var state = naver_id_login.getUniqState();
		    naver_id_login.setButton("white", 2,40);
		    naver_id_login.setDomain("http://localhost:8080");
		    naver_id_login.setState(state);
		    naver_id_login.init_naver_id_login();

		    function naverSignInCallback() {
		        // 네이버 사용자 프로필 조회
		        var email = naver_id_login.getProfileData('email');
		        var nickname = naver_id_login.getProfileData('nickname');
		        var name = naver_id_login.getProfileData('name');
		        var age = naver_id_login.getProfileData('age');
		        var gender = naver_id_login.getProfileData('gender');
		        var birthday = naver_id_login.getProfileData('birthday');
		        var mobile = naver_id_login.getProfileData('mobile');
		        
		        // AJAX 요청으로 이메일 존재 여부 확인
		        $.ajax({
		            type: "POST",
		            contentType: "application/json",
		            url: "/check2-email",
		            data: JSON.stringify({ email: email }),
		            dataType: 'json',
		            success: function(result){
		                if(result.exists){
		                    loginWithNaver(email);
		                } else {
		                    // 이메일이 존재하지 않으면 회원가입으로 유도
		                    var baseUrl = '${pageContext.request.contextPath}/pages/user-signup';
		                    var redirectUrl = baseUrl + '?email=' + encodeURIComponent(email) +
		                        '&nickname=' + encodeURIComponent(nickname) +
		                        '&age=' + encodeURIComponent(age) +
		                        '&gender=' + encodeURIComponent(gender) +
		                        '&birthday=' + encodeURIComponent(birthday) +
		                        '&name=' +encodeURIComponent(name) +
		                        '&mobile=' + encodeURIComponent(mobile);
		                    window.location.href = redirectUrl;
		                }
		            },
		            error: function(xhr, status, error){
		                console.error("이메일 확인 중 오류 발생", xhr.responseText);
		                alert("이메일 확인 중 오류가 발생했습니다. 다시 시도해 주세요.");
		            }
		        });
		    }

		    function loginWithNaver(email) {
		        $.ajax({
		            type: "POST",
		            contentType: "application/json",
		            url: "/login-naver",
		            data: JSON.stringify({ email: email }),
		            dataType: 'json',
		            success: function(user) {
		                if (user && user.userName) {
		                    alert("네이버 로그인 성공! 환영합니다, " + user.userName + "님.");
		                    localStorage.setItem('userName', user.userName);
		                    window.location.href = "/";
		                } else {
							alert(user);
		                    console.error("네이버 로그인 실패: 사용자 정보 없음");
		                    alert("네이버 로그인에 실패했습니다. 사용자 정보를 가져올 수 없습니다.");
		                }
		            },
		            error: function(xhr, status, error) {
		                console.error("네이버 로그인 처리 중 오류 발생", xhr.responseText);
		                if (xhr.status === 404) {
		                    alert("등록되지 않은 사용자입니다. 회원가입을 진행해 주세요.");
		                } else {
		                    alert("네이버 로그인 처리 중 오류가 발생했습니다: " + xhr.responseText);
		                }
		            }
		        });
		    }

		    // 페이지 로드 완료 후 실행
		    window.addEventListener('load', function() {
		        naver_id_login.get_naver_userprofile("naverSignInCallback()");
		    });
		</script>

		<!-- 기존 로그인 및 구글 로그인 스크립트 -->
		<script>
		$(document).ready(function() {
		    $('#loginForm').on('submit', function(e) {
		        e.preventDefault();
		        login();
		    });

		    $("#google_login_button").click(function(e) {
		        e.preventDefault();
		        // 팝업 창 열기
		        window.open('/login/getGoogleAuthUrl', 'Google Login', 'width=600,height=600');
		        
		        // 팝업 창으로부터 메시지를 받는 이벤트 리스너
		        window.addEventListener('message', function(event) {
		            if (event.origin !== window.location.origin) return;
		            
		            if (event.data.type === 'googleLoginResult') {
		                googleLoginWindow.close();
		                handleGoogleLoginResult(event.data.user);
		            }
		        }, false);
		    });
		});

		function login() {
		    $.ajax({
		        url: '/pages/login',
		        method: 'POST',
		        data: JSON.stringify({
		            userId: $('#userId').val(),
		            password: $('#password').val()
		        }),
		        contentType: 'application/json',
		        dataType: 'json',
		        success: function(response) {
		            if (response.blocked) {
		                Swal.fire({
		                    icon: 'warning',
		                    title: '계정 잠김',
		                    text: '계정이 잠겼습니다. 로그인 잠금 풀기를 통해 잠금을 해제해주세요.',
		                    confirmButtonText: '확인'
		                });
		            } else if (response.success) {
		                Swal.fire({
		                    icon: 'success',
		                    title: '로그인 성공',
		                    text: '환영합니다!',
		                    timer: 1500,
		                    showConfirmButton: false
		                }).then(() => {
		                    window.location.href = '/';
		                });
		            } else {
		                let errorMessage = response.message;
		                if (response.remainingAttempts !== undefined && !errorMessage.includes('남은 시도 횟수')) {
		                    errorMessage += ` 남은 시도 횟수: ${response.remainingAttempts}회`;
		                }
		                Swal.fire({
		                    icon: 'error',
		                    title: '로그인 실패',
		                    html: errorMessage,
		                    confirmButtonText: '확인'
		                });
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("Error: ", xhr.responseText);
		            Swal.fire({
		                icon: 'error',
		                title: '오류',
		                text: '서버와의 통신 중 오류가 발생했습니다.',
		                confirmButtonText: '확인'
		            });
		        }
		    });
		}

		function handleGoogleLoginResult(user) {
		    if (user) {
		        Swal.fire({
		            icon: 'success',
		            title: '구글 로그인 성공',
		            text: '환영합니다!',
		            timer: 1500,
		            showConfirmButton: false
		        }).then(() => {
		            localStorage.setItem('userName', user.userName);
		            window.location.href = "/";
		        });
		    } else {
		        Swal.fire({
		            icon: 'error',
		            title: '로그인 실패',
		            text: '로그인에 실패했거나 회원가입이 필요합니다.',
		            confirmButtonText: '확인'
		        });
		    }
		}
		</script>
    </body>
</html>