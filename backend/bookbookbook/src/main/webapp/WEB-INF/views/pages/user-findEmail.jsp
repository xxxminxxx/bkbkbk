<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>북북북 | 이메일 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
		.form-control {
	          background-color: #f0f0f0 !important
	      }
		  
        body {
            background-color: #f8f9fa;
        }
		.logo{
					font-size:18px;
					font-weight:bold;
				}
        .form-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        
        .btn-custom {
            background-color: #ff6b6b;
            border-color: #ff6b6b;
            color: white;
        }
        .btn-custom:hover {
            background-color: #ff5252;
            border-color: #ff5252;
            color: white;
        }
		.bg-video {
				  position: absolute;
				  top: 0;
				  left: 0;
				  height: 100%;
				  width: 100%;
				  z-index: -1;
				  opacity: 0.3;
				}

				.bg-video__content {
				  height: 100%;
				  width: 100%;
				  object-fit: cover;
				} 
				
				
				
				
				.animated-box {
				  position: relative;
				}

				.animated-box:after {
				  content: '';
				  position: absolute;
				  top: 0;
				  left: 0;
				  right: 0;
				  bottom: 0;
				  border-radius: 4px;
				  background: linear-gradient(120deg, #ff3001, #ffffff, #ffd913);
				  background-size: 300% 300%;
				  clip-path: polygon(0% 100%, 3px 100%, 3px 3px, calc(100% - 3px) 3px, calc(100% - 3px) calc(100% - 3px), 3px calc(100% - 3px), 3px 100%, 100% 100%, 100% 0%, 0% 0%);
				}

				.animated-box.in:after {
				  animation: frame-enter 1s forwards ease-in-out reverse, gradient-animation 4s ease-in-out infinite;
				}

				/* motion */
				@keyframes gradient-animation {
				  0% {
				    background-position: 15% 0%;
				  }
				  50% {
				    background-position: 85% 100%;
				  }
				  100% {
				    background-position: 15% 0%;
				  }
				}

				@keyframes frame-enter {
				  0% {
				    clip-path: polygon(0% 100%, 3px 100%, 3px 3px, calc(100% - 3px) 3px, calc(100% - 3px) calc(100% - 3px), 3px calc(100% - 3px), 3px 100%, 100% 100%, 100% 0%, 0% 0%);
				  }
				  25% {
				    clip-path: polygon(0% 100%, 3px 100%, 3px 3px, calc(100% - 3px) 3px, calc(100% - 3px) calc(100% - 3px), calc(100% - 3px) calc(100% - 3px), calc(100% - 3px) 100%, 100% 100%, 100% 0%, 0% 0%);
				  }
				  50% {
				    clip-path: polygon(0% 100%, 3px 100%, 3px 3px, calc(100% - 3px) 3px, calc(100% - 3px) 3px, calc(100% - 3px) 3px, calc(100% - 3px) 3px, calc(100% - 3px) 3px, 100% 0%, 0% 0%);
				  }
				  75% {
				    -webkit-clip-path: polygon(0% 100%, 3px 100%, 3px 3px, 3px 3px, 3px 3px, 3px 3px, 3px 3px, 3px 3px, 3px 0%, 0% 0%);
				  }
				  100% {
				    -webkit-clip-path: polygon(0% 100%, 3px 100%, 3px 100%, 3px 100%, 3px 100%, 3px 100%, 3px 100%, 3px 100%, 3px 100%, 0% 100%);
				  }
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
	   <!--sweetalert-->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
	   	
	   <!-- Custom Css -->
	   <link rel="stylesheet" href="../css/style.css">
	   <link rel="stylesheet" href="../css/style2.css">
	   <!-- Common Css -->
	   <link rel="stylesheet" href="../css/common.css">
</head>
<body>
    <div class="container">
		<div class="bg-video">
				  <video class="bg-video__content" autoplay muted loop>
				    <source src="../img/corgi.mp4" type="video/mp4" />
				  </video>
				</div>
				
        <div class="form-container animated-box in">
            <div class="logo">
                <img src="../img/bookbookbookLogo.png" alt="BOOKBOOKBOOK Logo"> BOOKBOOKBOOK
            </div>
            <h2 class="text-center mb-4 fw-bold">이메일 찾기</h2>
            <form id="findEmailForm" class="d-grid gap-3">
                <div class="form-group">
					<label for="userName" class="form-label small">이름 입력</label>
                    <input type="text" class="form-control" id="findEmailName" name="userName" placeholder="이름 입력" required>
                </div>
                <div class="form-group">
					<label for="userTel" class="form-label small">연락처 입력</label>
                    <input type="tel" class="form-control" id="findEmailTel" name="userTel" placeholder="연락처 입력" required>
                </div>
                <button type="submit" id="findEmailButton" class="btn btn-custom btn-lg btn-block btn-purple btn-theme">이메일 찾기</button>
            </form>
            <p class="text-center mt-3">
                <a href="/pages/login" class="text-decoration-none">로그인 페이지로 돌아가기</a>
            </p>
        </div>
    </div>

	<!--Sweetalert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
    <script>
    $(document).ready(function() {
        $("#findEmailForm").submit(function(e) {
            e.preventDefault();
            var userName = $("#findEmailName").val().trim();
            var userTel = $("#findEmailTel").val().trim();
            
            if (!userName || !userTel) {
				Swal.fire({
                   icon: 'warning',
                   title: '빈 칸이 있습니다.',
                   text: '이름과 연락처를 모두 입력해주세요.',
               });
                return;
            }
            
            var formData = {
                userName: userName,
                userTel: userTel
            };

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/find-email",
                data: JSON.stringify(formData),
                dataType: 'json',
                beforeSend: function() {
                    $("#findEmailButton").prop("disabled", true).text("찾는 중...");
                },
                success: function(result) {
                    if (result.success) {
						Swal.fire({
			                   icon: 'success',
			                   title: '이메일을 찾았습니다!',
			                   text: '찾은 이메일은 '+result.email+' 입니다.',
			               });
                    } else {
						Swal.fire({
			                   icon: 'warning',
			                   title: '정보에 맞는 회원이 없습니다.',
			                   text: '이름 또는 연락처가 맞는지 확인해주세요.',
			               });
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("AJAX 오류:", textStatus, errorThrown);
					Swal.fire({
		                   icon: 'warning',
		                   title: '오류가 발생했습니다.',
		                   text: '이메일을 찾는 중 오류가 발생했습니다.',
		               });
                },
                complete: function() {
                    $("#findEmailButton").prop("disabled", false).text("이메일 찾기");
                }
            });
        });
    });
	
	$('#findEmailTel').on('input', function() {
			            var phone = $(this).val().replace(/[^0-9]/g, '');
			            if (phone.length > 3 && phone.length <= 7) {
			                phone = phone.slice(0, 3) + "-" + phone.slice(3);
			            } else if (phone.length > 7) {
			                phone = phone.slice(0, 3) + "-" + phone.slice(3, 7) + "-" + phone.slice(7, 11);
			            }
			            $(this).val(phone);
			        });
			
			
	    });
    </script>
</body>
</html>