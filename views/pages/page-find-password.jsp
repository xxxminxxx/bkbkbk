<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 - BOOKBOOKBOOK</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo img {
			width: 240px;
			height: 40px;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="logo">
                <img src="../../../resources/img/booklogo.png" alt="BOOKBOOKBOOK Logo">
            </div>
            <h2 class="text-center mb-4">비밀번호 찾기</h2>
            <form id="findPasswordForm" class="d-grid gap-3">
                <div class="form-group">
                    <input type="text" class="form-control" id="findPasswordName" name="userName" placeholder="이름 입력" required>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" id="findPasswordEmail" name="userId" placeholder="이메일 입력" required>
                </div>
                <div class="form-group">
                    <input type="tel" class="form-control" id="findPasswordTel" name="userTel" placeholder="연락처 입력" required>
                </div>
                <button type="submit" class="btn btn-custom btn-lg btn-block">비밀번호 찾기</button>
            </form>
            <p class="text-center mt-3">
                <a href="/pages/login" class="text-decoration-none">로그인 페이지로 돌아가기</a>
            </p>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        $("#findPasswordForm").submit(function(event) {
            event.preventDefault();
            var formData = {
                userName: $("#findPasswordName").val(),
                userId: $("#findPasswordEmail").val(),
                userTel: $("#findPasswordTel").val()
            };
            $.ajax({
                type: "POST",
                url: "/find-password",
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function(response) {
                    console.log("Server response:", response);
                    if (response.success) {
                        alert(response.message);
                        window.location.href = "/login";  // 로그인 페이지로 리다이렉트
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX error:", status, error);
                    alert("서버 오류가 발생했습니다. 나중에 다시 시도해주세요.");
                }
            });
        });
    });
    </script>
</body>
</html>