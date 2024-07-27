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
	      <jsp:include page="page-signup-welcome.jsp" />
	</div>
	
	<div>
    <div class="container" id="welcome-container">
        <h1>회원가입을 환영합니다!</h1>
        <p>BOOKBOOKBOOK의 회원이 되신 것을 축하드립니다.</p>
        <div class="buttons">
            <a href="${pageContext.request.contextPath}/pages/login" class="btn">로그인</a>
            <a href="${pageContext.request.contextPath}/" class="btn">메인 페이지</a>
        </div>
    </div>
	
	
	<div class="container" id="member-checkbox">
	    
	    
	    <form action="${pageContext.request.contextPath}/updateUserPreferences" method="post">
	        <h3>선호하는 장르, 관심사, 거주 지역, 취미를 선택해주세요 (중복 선택 가능)</h3>
			
			<br>
			
	        <div class="genre"> 장르 : 
	            <label><input type="checkbox" name="genre" value="추리"> 추리</label>
	            <label><input type="checkbox" name="genre" value="자기계발"> 자기계발</label>
	            <label><input type="checkbox" name="genre" value="역사"> 역사</label>
	            <label><input type="checkbox" name="genre" value="멜로"> 멜로</label>
	            <label><input type="checkbox" name="genre" value="고전"> 고전 </label>
	            <label><input type="checkbox" name="genre" value="에세이"> 에세이 </label>
	            <label><input type="checkbox" name="genre" value="운동"> 운동 </label>
	            <label><input type="checkbox" name="genre" value="만화"> 만화 </label>
	            <label><input type="checkbox" name="genre" value="여행"> 여행 </label>
	            <label><input type="checkbox" name="genre" value="기술"> 기술 </label>
	        </div>
			<div class="interest"> 관심사 : 
			    <label><input type="checkbox" name="interest" value="스포츠"> 스포츠 </label>
				<label><input type="checkbox" name="interest" value="건강"> 건강</label>
			    <label><input type="checkbox" name="interest" value="음악"> 음악 </label>
			    <label><input type="checkbox" name="interest" value="영화"> 영화 </label>
			    <label><input type="checkbox" name="interest" value="TV"> TV </label>
			    <label><input type="checkbox" name="interest" value="보드게임"> 보드게임 </label>
			    <label><input type="checkbox" name="interest" value="미술"> 미술 </label>
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
			<div class="hobby"> 취미 : 
			    <label><input type="checkbox" name="hobby" value="독서"> 독서 </label>
			    <label><input type="checkbox" name="hobby" value="운동"> 운동 </label>
			    <label><input type="checkbox" name="hobby" value="영화"> 영화 감상 </label>
			    <label><input type="checkbox" name="hobby" value="OTT"> OTT 시청 </label>
			    <label><input type="checkbox" name="hobby" value="게임"> 게임 </label>
			    <label><input type="checkbox" name="hobby" value="외국어"> 외국어 공부 </label>
			    <label><input type="checkbox" name="hobby" value="사진"> 사진 촬영 </label>
			    <label><input type="checkbox" name="hobby" value="요리"> 요리 </label>
			    <label><input type="checkbox" name="hobby" value="여행"> 여행 </label>
			    <label><input type="checkbox" name="hobby" value="음악"> 음악 감상 </label>
			</div>
												
			<div class="button-container">
			    <button type="submit" class="btn2">선호도 저장</button>
			</div>
	    </form>

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
            firework.style.setProperty('--x', `${Math.random() * 200 - 100}px`);
            firework.style.setProperty('--initialY', `${Math.random() * 200 - 100}px`);
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
            setInterval(createFirework, 100);
        }

        window.onload = function() {
            startFireworks();
        };
		

    </script>
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
		
		<script>
		const body = document.querySelector("body");

		body.addEventListener("mousemove", (e) => {
		  const spark = document.createElement("div");
		  const random = Math.random() * 365;
		  spark.classList.add("spark");
		  body.appendChild(spark);

		  spark.style.cssText = `
		   transform: translate(${e.clientX - 1}px,${e.clientY - 20}px);
		   filter: hue-rotate(${random}deg);
		   `;

		  for (let i = 0; i < 8; i++) {
		    const span = document.createElement("span");
		    spark.append(span);
		    span.style.transform = `rotate(${i * 45}deg)`;
		  }

		  setTimeout(() => {
		    body.removeChild(spark);
		  }, 1000);
		});
		</script>
</body>
</html>