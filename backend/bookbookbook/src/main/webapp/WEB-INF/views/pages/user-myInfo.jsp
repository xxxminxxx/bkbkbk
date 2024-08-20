<%@page contentType="text/html; charset=UTF-8"%>
<!-- forEach 용 taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko" class="translated-ltr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../img/pages/icon.png" type="image/png">
    <title>북북북 | 나의 정보</title>
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
    <link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.26tY-h6gH9w.L.W.O/am=GAY/d=0/rs=AN8SPfrev-A3NvrBP0gNq8zXCqKY7IcBLA/m=el_main_css">
    <style>
        .btn-primary {
            background-color: #f77808d9;
            border-color: #f77808d9;
            color: white;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
		.row{
			justify-content: normal !important;
		}
		
		/* [0808 수정] */
			/* nav 컬러 변경 + 물결 변경 */
			.bg-black {
			    background-color: #8fbc8f !important;
			}
			.hero-wave {
			    width: 100%;
			    display: block;
			    margin-bottom: -200px;
			}

			.top-header {
			    background-color: #abd1ab;
			    padding-top: 100px; /* 상단 여백 조정 */
			    padding-bottom: 0;
			}
		/* [0809 추가] */
		body {
	        min-height: 100vh;
	        display: flex;
	        flex-direction: column;
	    }

	    #elements {
	        flex: 1;
	    }

	    footer {
	        margin-top: auto;
	    }
    </style>
</head>



<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

	<div class="bg-elements elements-top-header">
	   <!-- navbar -->
	   <div class="elements-nav">
	      <!-- bootom nav -->
	      <%@ include file="../header.jsp" %>
	   </div>
	   <!-- header -->
	   <div class="row justify-content-center">
	      <div class="col-xl-6 col-lg-5 col-md-10 col-12">
	         <div class="d-flex gap-3 align-items-center">
	         </div>
	      </div>
	   </div>
	   </div>
	   <div class="top-header">
	      <div class="w-100">
	           <img src="../img/pages/hero-wave.svg" alt="" class="img-fluid w-100">
	       </div>
	   </div>
<!-- Elements Components -->
<div class="py-5" id="elements">
    <div class="container">
        <h1 class="text-center mb-4">🔒 나의 정보 수정 🔒</h1>
		<div style="display: flex; justify-content: center; margin-bottom: 4rem;">
			<h6>이메일을 제외한 나의 정보를 수정할 수 있어요.
			</h6>
		</div>
        <c:choose>
            <c:when test="${not empty sessionScope.userId}">
                <div class="container" style="padding:100">
                    <div class="row g-5 p">
                        <form class="d-grid gap-2 input-group-lg row gap-5 m-" id="frmMyInfo">
                            <div class="mb-3">
                                <label class="form-label small">이메일</label>
                                <input type="email" class="form-control bg-light border-0 px-3 py-2" placeholder="이메일을 입력하세요" id="userId" name="userId" readonly
                                       value="${userId}">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label small">비밀번호</label>
                                <input type="password" class="form-control bg-light border-0 px-3 py-2" placeholder="비밀번호를 입력하세요" id="password" aria-describedby="emailHelp" name="password">
                            </div>
                            <div class="mb-3">
                                <label for="password2" class="form-label small">비밀번호 확인</label>
                                <input type="password" class="form-control bg-light border-0 px-3 py-2" placeholder="비밀번호를 입력하세요" id="password2" aria-describedby="emailHelp" name="password2">
                            </div>
                            <div class="mb-3">
                                <label for="userName" class="form-label small">이름</label>
                                <input type="text" class="form-control bg-light border-0 px-3 py-2" placeholder="이름을 입력하세요" id="userName" name="userName"
                                       value="${userName}">
                            </div>
                            <div class="mb-3">
                                <label for="userTel" class="form-label small">전화번호</label>
                                <input type="tel" class="form-control bg-light border-0 px-3 py-2" placeholder="전화번호를 입력하세요" id="userTel" name="userTel"
                                       value="${userTel}">
                            </div>

                            <button type="submit" class="btn btn-purple btn-theme">수정하기</button>
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center py-5">
                    <h3 class="text-muted">로그인 후 이용하실 수 있습니다.</h3>
                </div>
                <div id="without-data">
                    <div class="container text-center mt-4">
                        <a href="/pages/login" class="btn btn-primary btn-lg">로그인 하러 가기</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>
</div>
</div>

<!-- Nav Sidebar -->
<%@ include file="../navSidebar.jsp" %>

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
<!-- user-myInfo Js -->
<script src="../js/user-myInfo.js"></script>
<!--sweetalert-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
<!--Sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
    <!--alert 메시지-->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var message = "${message}";
        if(message) {
            Swal.fire({
                title: '알림',
                text: message,
                icon: 'success',
                confirmButtonText: '확인'
            });
        }
    });
</script>
</body>
</html>
