<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 찾기 - BOOKBOOKBOOK</title>
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
            <h2 class="text-center mb-4">이메일 찾기</h2>
            <form id="findEmailForm" class="d-grid gap-3">
                <div class="form-group">
                    <input type="text" class="form-control" id="findEmailName" name="userName" placeholder="이름 입력" required>
                </div>
                <div class="form-group">
                    <input type="tel" class="form-control" id="findEmailTel" name="userTel" placeholder="연락처 입력" required>
                </div>
                <button type="submit" id="findEmailButton" class="btn btn-custom btn-lg btn-block">이메일 찾기</button>
            </form>
            <p class="text-center mt-3">
                <a href="/pages/login" class="text-decoration-none">로그인 페이지로 돌아가기</a>
            </p>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        $("#findEmailForm").submit(function(e) {
            e.preventDefault();
            var userName = $("#findEmailName").val().trim();
            var userTel = $("#findEmailTel").val().trim();
            
            if (!userName || !userTel) {
                alert("이름과 연락처를 모두 입력해주세요.");
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
                        alert("찾은 이메일: " + result.email);
                    } else {
                        alert("정보에 맞는 회원이 없습니다.");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("AJAX 오류:", textStatus, errorThrown);
                    alert("이메일 찾기 중 오류가 발생했습니다.");
                },
                complete: function() {
                    $("#findEmailButton").prop("disabled", false).text("이메일 찾기");
                }
            });
        });
    });
    </script>
</body>
</html>