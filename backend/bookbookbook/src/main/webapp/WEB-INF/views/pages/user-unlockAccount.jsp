<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>북북북 | 계정 잠금 해제</title>
        <style>
            .form-control {
                background-color: #f0f0f0 !important
            }
            #welcome{
                background-image: url('../img/logincover.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                padding: 100px 0;
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
                            <p class="small m-0"><a href="login" class="text-decoration-none">로그인 페이지로 돌아가기</a></p>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="container m-auto px-lg-5">
                <div class="row align-items-center px-lg-5">
                    <div class="col-lg-7 col-12 d-none d-lg-block">
                        <div class="ps-lg-0 pe-lg-0">
                            <div class="ps-lg-0 ms-lg-0">
                                <div class="py-3">
                                    <div class="text-muted mb-4 display-6">
                                        북북북 | BOOKBOOKBOOK
                                    </div>
                                    <div class="fw-bold display-4 text-black txt">
                                        계정 <span>잠</span><span>금</span> <span>해</span><span>제</span>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-12" style="padding:50px 0 0 0">
                                            <p class="lead">아이디와 임시 코드를 입력하여 잠금을 해제해 주세요.</p>
                                            <p class="lead">임시 코드는 등록된 연락처로 전송되었습니다.</p>
                                            <p class="lead">문제가 지속되면 고객센터로 문의해 주세요.</p>
                                        </div>     
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-12 py-3">
                        <div class="p-5 bg-white rounded-4 shadow">
                            <h5 class="fw-bold mb-4">계정 잠금 해제</h5>
                            <form id="unlockForm" class="d-grid gap-2 input-group-lg">
                                <div class="mb-3">
                                    <label for="userId" class="form-label small">아이디 (이메일) 입력</label>
                                    <input type="email" name="userId" class="form-control border-0 px-3 py-2" placeholder="아이디 입력" id="userId">
                                </div>
                                <div class="mb-3">
                                    <label for="tempCode" class="form-label small">임시 코드 입력</label>
                                    <input type="text" name="tempCode" class="form-control border-0 px-3 py-2" placeholder="임시 코드 입력" id="tempCode">
                                </div>
                                <button type="submit" class="btn btn-purple btn-theme">계정 잠금 해제</button>
                            </form>
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

        <script>
        $(document).ready(function() {
            $('#unlockForm').on('submit', function(e) {
                e.preventDefault();
                unlockAccount();
            });
        });

        function unlockAccount() {
			$.ajax({
			        url: '/pages/verify-temp-code',
			        method: 'POST',
			        data: JSON.stringify({
			            userId: $('#userId').val(),
			            tempCode: $('#tempCode').val()
			        }),
			        contentType: 'application/json',
			        dataType: 'json',
			        success: function(response) {
			            if (response.success) {
			                Swal.fire({
			                    icon: 'success',
			                    title: '계정 잠금 해제 성공',
			                    text: '계정 잠금이 해제되었습니다. 로그인 페이지로 이동합니다.',
			                    confirmButtonText: '확인'
			                }).then(() => {
			                    window.location.href = '/pages/login'; // 절대 경로 사용
			                });
			            } else  {
                        Swal.fire({
                            icon: 'error',
                            title: '잘못된 정보',
                            text: '아이디 또는 임시 코드가 올바르지 않습니다.',
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
        </script>
    </body>
</html>