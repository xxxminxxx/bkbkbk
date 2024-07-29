<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
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
			text-align: center;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .firework {
            position: fixed;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            animation: firework 5s ease-out;
            z-index: 2;
        }

        @keyframes firework {
            0% { transform: translate(var(--x), var(--initialY)); width: 20px; opacity: 1; }
            50% { width: 20px; opacity: 1; }
            100% { width: 60px; opacity: 0; transform: translate(var(--x), calc(var(--finalY) - var(--initialY))); }
        }
		
		
		.main-container {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center;
		    min-height: 100vh;
		    padding: 2rem;
		}

		.container {
			font-family: "Gamja Flower", sans-serif;
			font-weight: 600;
			font-style: normal;	
		    width: 100%;
		    max-width: 800px;
		    margin-bottom: 2rem;
		}

		#welcome-container {
		    margin-bottom: 2rem;
		}

		#member-checkbox {
		    text-align: left;
		}

		.genre, .interest, .address, .hobby {
		    margin-bottom: 1rem;
		}

		.genre label, .interest label, .address label, .hobby label {
		    display: inline-block;
		    margin-right: 1rem;
		    margin-bottom: 0.5rem;
		}
		
		.btn2 {
			
			font-family: "Gamja Flower", sans-serif;
			font-weight: 600;
			font-style: normal;	
			
			display: inline-block;
			padding: 10px 20px;
			margin: 0 10px;
			border: none;
			border-radius: 5px;
			background-color: orange;
			color: white;
			text-decoration: none;
			font-size: 1rem;
			transition: background-color 0.3s;
			text-align: center;
		}
		
		.btn2:hover {
			
			background-color: #FC6A03;  
					
		}
		
		
		
		#member-checkbox h3 {
		    text-align: center;
		}

		.button-container {
		    text-align: center;
		    margin-top: 1rem;
		}
		
    </style>
</head>
<body>
	<div id="slide-cover">
	           <jsp:include page="user-signupWelcome.jsp" />
	       </div>
	       <div class="main-container" id="main-content">
	         <!--  <div class="container" id="welcome-container">
	               <h1>회원가입을 환영합니다!</h1>
	               <p>BOOKBOOKBOOK의 회원이 되신 것을 축하드립니다.</p>
	               <div class="buttons">
	                   <a href="${pageContext.request.contextPath}/pages/login" class="btn">로그인</a>
	                   <a href="${pageContext.request.contextPath}/" class="btn">메인 페이지</a>
	               </div>-->
	           </div>
	           <div class="container" id="member-checkbox">
	               <form action="${pageContext.request.contextPath}/updateUserPreferences" method="post">
	                   <h3>관심사/취미 및 거주 지역을 선택해주세요</h3>
	                   <br>
	                 
	                   <div class="interest"> 관심사/취미: 
	                       <label><input type="checkbox" name="interest" value="스포츠"> 운동 </label>
	                       <label><input type="checkbox" name="interest" value="건강"> 건강</label>
	                       <label><input type="checkbox" name="interest" value="음악"> 음악 </label>
	                       <label><input type="checkbox" name="interest" value="영화"> 영화 </label>
	                       <label><input type="checkbox" name="interest" value="TV"> TV/OTT</label>
	                       <label><input type="checkbox" name="interest" value="게임"> 게임 </label>
	                  <label><input type="checkbox" name="interest" value="자기계발"> 자기계발 </label>
	                       <label><input type="checkbox" name="interest" value="여행"> 여행 </label>
	                       <label><input type="checkbox" name="interest" value="패션"> 패션 </label>
	                       <label><input type="checkbox" name="interest" value="요리"> 요리</label>
	                   </div>
	                   <div class="address"> 거주 지역 :
	                       <label><input type="radio" name="address" value="서울"> 서울</label>
	                       <label><input type="radio" name="address" value="경기도"> 경기도 </label>
	                       <label><input type="radio" name="address" value="강원도"> 강원도 </label>
	                       <label><input type="radio" name="address" value="충청도"> 충청도 </label>
	                       <label><input type="radio" name="address" value="경상도"> 경상도 </label>
	                       <label><input type="radio" name="address" value="전라도"> 전라도</label>
	                       <label><input type="radio" name="address" value="제주도"> 제주도</label>
	                   </div>
	                
	                   <div class="button-container">
	                       <input type="hidden" name="userId" value="${sessionScope.user.userId}">
	                       <button type="submit" class="btn2">선호도 저장</button>
	                   </div>
	               </form>
	           </div>
	       </div>

	       <script>
	         window.onload = function() {

	               setTimeout(() => {
	                   const slideCover = document.getElementById('slide-cover');
	                   if (slideCover) {
	                       slideCover.style.opacity = '0';
	                       slideCover.style.transition = 'opacity 0.7s ease-out';
	                       setTimeout(() => {
	                           slideCover.style.display = 'none';
	                           document.body.style.overflow = 'auto'; // 스크롤을 다시 활성화
	                       }, 700);
	                   }
	               }, 2000);
	           };
	       </script>

</body>
</html>