<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Google Login Result</title>
<script>
var loginSuccess = ${loginSuccess};
var googleEmail = decodeURIComponent("${googleEmail}");
var googleName = decodeURIComponent("${googleName}");

if (loginSuccess) {
    window.opener.location.href = '/'; // 메인 페이지 URL로 변경
    window.close();
} else {
    alert("가입된 이메일이 없습니다. 회원가입 후 로그인 부탁드립니다.");
    // 구글 정보를 포함하여 회원가입 페이지로 리다이렉트
    var signupUrl = '/pages/user-signup?googleEmail=' + googleEmail
                  + '&googleName=' + encodeURIComponent(googleName);
    window.opener.location.href = signupUrl;
    window.close();
}
</script>
</head>
<body>
<p>처리 중...</p>
</body>
</html>