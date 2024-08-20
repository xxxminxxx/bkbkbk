<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../img/pages/icon.png" type="image/png">
    <title>죄송합니다</title>
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
    <style>
        @font-face {
            font-family: 'DungGeunMo';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'DungGeunMo';
            font-size: 14px;
        }
        .lottie-player {
            width: 300px;
            height: auto; /* 높이를 자동으로 설정하여 비율 유지 */
        }
    </style>
</head>
<body>
    <div class="container d-flex flex-column">
        <!-- row -->
        <div class="row min-vh-100 justify-content-center align-items-center">
            <!-- col -->
            <div class="mx-auto col-lg-10">
                <div class="row justify-content-center align-items-center">
                    <!-- content -->
                    <div class="col-md-6">
                        <div class="mb-6 mb-lg-0 py-4">
                            <div class="mb-5">
                                <div class="position-relative d-flex align-items-center gap-2 site-brand">
                              
                                    <a class="stretched-link" href="../index.html"></a>
                                </div>
                            </div>
                            <h6 class="mb-3 fw-bolder mt-2 display-4">죄송합니다.</h6>
                            <h1 class="mb-3 fw-bolder mt-2 display-4">해당 페이지를 <br> 찾지 못했습니다.</h1>
                            <p class="mb-5 text-muted lead">
                                주소가 잘못되었거나 <br> 
                                더 이상 제공되지 않는 페이지입니다.
                            </p>
                            <!-- btn -->
                            <a href="/" class="btn btn-outline-purple btn-theme ms-2">메인페이지로 이동</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script> 
                        <dotlottie-player 
                            src="https://lottie.host/7fecb60e-9880-4fc8-9ccc-183e185e5225/ZihNGbyqn9.json" 
                            background="transparent" 
                            speed="1" 
                            loop 
                            autoplay>
                        </dotlottie-player>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap Bundle Js -->
    <script src="../vender/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Jquery Js -->
    <script src="../vender/jquery/jquery-3.6.4.min.js"></script>
    <!-- AOS Js -->
    <script src="../vender/aos/dist/aos.js"></script>
    <!-- Custom Js -->
    <script src="../js/script.js"></script>
    <!-- Lottie -->
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
</body>
</html>
