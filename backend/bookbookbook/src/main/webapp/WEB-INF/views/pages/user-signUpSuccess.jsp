<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
	<!--sweetalert-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
			
    <title>북북북 | 회원가입 완료</title>
	<style>
		/* 폰트 설정 */
		@font-face {
		    font-family: 'DungGeunMo';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}

		/* 기본 body 스타일 */
		body {
		    font-family: 'DungGeunMo';
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		    margin: 0;
		    background-color: #f0f0f0;
		    overflow: hidden;
		    /* #[0809수정] 배경 이미지 설정 */
		    background-image: url('${pageContext.request.contextPath}/img/signupcorgi.jpg');
		    background-size: cover;
			background-position: 70% center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		}

		/* #[0809수정] 배경 이미지 오버레이 */
		body::before {
			content: "";
			   position: absolute;
			   top: 0;
			   left: 0;
			   right: 0;
			   bottom: 0;
			   background-color: rgba(255, 255, 255, 0.7); /* 흰색 오버레이, 0.7은 투명도 */
			   z-index: -1;
		}

		/* 컨테이너 스타일 */
		.container {
		    text-align: center;
		    background-color: rgba(255, 255, 255, 0.7);
		    padding: 2rem;
		    border-radius: 10px;
		    box-shadow: 0 0 10px rgba(0,0,0,0.1);
		    z-index: 1;
		    position: relative;
		    width: 300px; /* 너비를 고정값으로 설정 */
		    max-height: 80vh; /* 최대 높이를 뷰포트 높이의 80%로 제한 */
		    overflow-y: auto; /* 내용이 넘칠 경우 스크롤 적용 */
		    margin: 2rem auto; /* 상하 여백을 주고 좌우 중앙 정렬 */
		    display: flex;
		    flex-direction: column; /* 내부 요소들을 세로로 배치 */
		    justify-content: flex-start; /* 내용을 위에서부터 배치 */
		    align-items: center; /* 가로 방향 중앙 정렬 */
		    backdrop-filter: blur(5px);
			margin-left: 20%;
		}

		/* 버튼 컨테이너 위치 조정 */
		.button-container {
		    position: sticky; /* absolute 대신 sticky 사용 */
		    bottom: 20px;
		    left: 0;
		    right: 0;
		    text-align: center;
		    padding-top: 20px; /* 상단 여백 추가 */
		  
		}

		/* 제목 스타일 */
		h1 {
		    color: #4a4a4a;
		}

		/* 버튼 컨테이너 스타일 */
		.buttons {
		    margin-top: 2rem;
		}

		/* 기본 버튼 스타일 */
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

		/* 메인 컨테이너 스타일 */
		.main-container {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center;
		    min-height: 100vh;
		    padding: 2rem;
		}

		/* 체크박스 컨테이너 스타일 */
		#member-checkbox {
		    text-align: left;
		}

		/* 체크박스 제목 스타일 */
		#member-checkbox h3 {
		    text-align: center;
		}

		/* 관심사 및 주소 컨테이너 스타일 */
		.interest-container, .address-container {
		    text-align: left;
		    margin-bottom: 20px;
		}

		/* 관심사 및 주소 옵션 스타일 */
		.interest-options, .address-options {
		    display: flex;
		    flex-wrap: wrap;
		    gap: 10px;
		}

		/* 관심사 및 주소 레이블 스타일 */
		.interest-options label, .address-options label {
		    display: flex;
		    align-items: center;
		    background-color: #f0f0f0;
		    padding: 5px 10px;
		    border-radius: 20px;
		    cursor: pointer;
		}

		/* 체크박스 및 라디오 버튼 스타일 */
		.interest-options input[type="checkbox"], .address-options input[type="radio"] {
		    margin-right: 5px;
		}

		/* 소제목 스타일 */
		h4 {
		    margin-bottom: 10px;
		}

		/* 선호도 저장 버튼 스타일 */
		.btn2 {
		    font-family: 'DungGeunMo';
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

		/* #[0809수정] 버튼 컨테이너 위치 조정 
		.button-container {
		    position: absolute;
		    bottom: 20px;
		    left: 0;
		    right: 0;
		    text-align: center;
		}
		*/

		/* 컨텐츠 z-index 설정 */
		.content {
		    position: relative;
		    z-index: 1;
		}
	    </style>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	                <h3>맞춤 도서 추천을 위해 <br/>
						관심사/취미를
						 선택해주세요</h3>
	                <br>
	              
					<div class="interest-container">
					    <h4>관심사/취미:</h4>
					    <div class="interest-options">
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
					</div>
					<!--<div class="address-container">
					    <h4>거주 지역:</h4>
					    <div class="address-options">
					        <label><input type="radio" name="address" value="서울"> 서울</label>
					        <label><input type="radio" name="address" value="경기도"> 경기도 </label>
					        <label><input type="radio" name="address" value="강원도"> 강원도 </label>
					        <label><input type="radio" name="address" value="충청도"> 충청도 </label>
					        <label><input type="radio" name="address" value="경상도"> 경상도 </label>
					        <label><input type="radio" name="address" value="전라도"> 전라도</label>
					        <label><input type="radio" name="address" value="제주도"> 제주도</label>
					    </div>-->
						 <div class="button-container">
	                    <input type="hidden" name="userId" value="${sessionScope.user.userId}">
	                    <button type="submit" class="btn2">선호도 저장</button>
	                </div>
						
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
		    
		    const form = document.querySelector('form');
		    const checkboxes = document.querySelectorAll('input[type="checkbox"][name="interest"]');
		    const submitButton = document.querySelector('.btn2');

		    // 폼 제출 시 체크 여부 확인
		    form.addEventListener('submit', function(event) {
		        if (!isAnyCheckboxChecked()) {
		            event.preventDefault();
		            Swal.fire({
		                title: '잠시만요!',
		                text: '관심사/취미를 선택해주세요!',
		                icon: 'warning',
		                confirmButtonText: '확인'
		            });
		        }
		    });

		    function isAnyCheckboxChecked() {
		        return Array.from(checkboxes).some(checkbox => checkbox.checked);
		    }
		};
		</script>
	</body>
	</html>