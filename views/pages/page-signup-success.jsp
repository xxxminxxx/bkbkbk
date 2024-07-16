<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 성공!</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
            overflow: hidden;
        }
        .container {
            text-align: center;
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            z-index: 1;
            position: relative;
        }
        h1 {
            color: #4a4a4a;
        }
        .buttons {
            margin-top: 2rem;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .firework {
            position: fixed;
            top: 50%;
            left: 50%;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            animation: firework 3s ease-out infinite;
            z-index: 0;
        }

        @keyframes firework {
            0% { transform: translate(var(--x), var(--initialY)); width: 10px; opacity: 1; }
            50% { width: 10px; opacity: 1; }
            100% { width: 30px; opacity: 0; transform: translate(var(--x), calc(var(--finalY) - var(--initialY))); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원가입을 환영합니다!</h1>
        <p>BOOKBOOKBOOK의 회원이 되신 것을 축하드립니다.</p>
        <div class="buttons">
            <a href="${pageContext.request.contextPath}/login" class="btn">로그인</a>
            <a href="${pageContext.request.contextPath}/main" class="btn">메인 페이지</a>
        </div>
    </div>

    <script>
        function createFirework() {
            const firework = document.createElement('div');
            firework.className = 'firework';
            
            const x = Math.random() * window.innerWidth;
            const initialY = window.innerHeight;
            const finalY = Math.random() * window.innerHeight / 2;
            
            firework.style.left = `${x}px`;
            firework.style.top = `${initialY}px`;
            firework.style.setProperty('--x', `0px`);
            firework.style.setProperty('--initialY', `0px`);
            firework.style.setProperty('--finalY', `${-initialY + finalY}px`);
            
            const hue = Math.random() * 360;
            firework.style.backgroundColor = `hsl(${hue}, 100%, 50%)`;
            firework.style.boxShadow = `0 0 ${hue % 30 + 5}px ${hue % 3 + 1}px hsl(${hue}, 100%, 50%)`;
            
            document.body.appendChild(firework);
            
            firework.addEventListener('animationend', () => {
                firework.remove();
            });
        }

        function startFireworks() {
            setInterval(createFirework, 300);
        }

        // 페이지 로드 완료 후 폭죽 효과 시작
        window.addEventListener('load', startFireworks);
    </script>
</body>
</html>
