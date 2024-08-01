<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/pages/icon.png" type="image/png">
    <title>즐거운 독서 공간 북북북</title>
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="vender/bootstrap/css/bootstrap.min.css">
    <!-- Remix Icon -->
    <link rel="stylesheet" href="vender/remixicon/remixicon.css">
    <!-- Icofont -->
    <link rel="stylesheet" href="vender/icofont/icofont.min.css">
    <!-- AOS Css -->
    <link rel="stylesheet" href="vender/aos/dist/aos.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="css/style.css">
    <style>
      #moving-text {
           position: relative;
           transition: left 0.2s ease-out; /* 좌우로 움직이는 애니메이션 설정 */
       }
         
      #moving-text h1{
         font-size: 250%;
      }
      
      #home{
         background-image: url('../img/index_cover.png');
             background-size: cover; /* 화면에 꽉 차도록 배경 이미지 크기 조절 */
             background-position: center; /* 배경 이미지 중앙 정렬 */
             background-attachment: fixed; /* 스크롤에 따라 배경 이미지 고정 */
             padding: 100px 0; /* 내용과 화면 맨 위 간격 조절 */
      }
      
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden; /* 초기에는 스크롤을 숨김 */
        }
      #header{
         background-color: white !important;
      }
        #slide-cover {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999; /* 더 높은 z-index 값 */
            background-color: #D85D47;
            display: flex;
            justify-content: center;
            align-items: center;
        }
      
        .background-shapes {
            position: relative;
            width: 100%;
            display: flex;
            justify-content: space-around;
            margin-top: 50px;
         margin-left: -40px;
        }
        .shape {
            position: relative;
            width: 150px;
            height: 150px;
            background-size: cover;
            background-position: center;
            text-align: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .shape-1 {
            background-image: url('../img/circle.png'); /* 이미지 경로를 정확히 입력하세요 */
         display: inline-block; /* a 태그가 inline이면 block 형태로 변경해야 함 */
           transition: transform 10s ease; /* 회전 속도와 방향을 조절하는 속성 */
           animation: rotateSlowly 59s linear infinite; /* 60초 동안 시계방향으로 회전하는 애니메이션 */
        }
        .shape-2 {
            background-image: url('../img/pentagon.png'); /* 이미지 경로를 정확히 입력하세요 */
         display: inline-block; /* a 태그가 inline이면 block 형태로 변경해야 함 */
           transition: transform 11s ease; /* 회전 속도와 방향을 조절하는 속성 */
           animation: rotateSlowly 60s linear infinite reverse; /* 60초 동안 시계방향으로 회전하는 애니메이션 */
        }
        .shape-3 {
            background-image: url('../img/triangle.png'); /* 이미지 경로를 정확히 입력하세요 */
         display: inline-block; /* a 태그가 inline이면 block 형태로 변경해야 함 */
           transition: transform 9s ease; /* 회전 속도와 방향을 조절하는 속성 */
           animation: rotateSlowly 61s linear infinite; /* 60초 동안 시계방향으로 회전하는 애니메이션 */
        }
      .shape-3 span {
          transform: none !important; /* span 태그의 회전을 초기화 */
      }
      
      @keyframes rotateSlowly {
        0% {
          transform: rotate(0deg);
        }
        100% {
          transform: rotate(360deg);
        }
       }
       
       .bg-corgi-cover{
         background-image: url('../img/index_cover.png');
       }
        
      .full-width-background {
                 width: 100vw;
               
             }
      #recommendationBooksSection{
         background-color: #fff5f2;
         margin-top: 150px;
         padding: 50px;
         width: 100%; /* 가로 길이를 100%로 설정 */
         max-width: none; /* Bootstrap 기본 최대 너비 무시 */
         flex-direction: column;
                    justify-content: center;
                    align-items: center;
      }
      .row {
                display: flex;
                flex-wrap: wrap; /* 화면 크기에 따라 자동으로 줄바꿈 */
                justify-content: center;
            }
           
      .book-card {
                margin: 10px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                width: 23%; /* 네 개의 카드가 가로로 나란히 배치되도록 설정 */
                box-sizing: border-box; /* padding과 border를 width에 포함 */
                text-align: center;
                background-color: #f9f9f9;
      }
           
      .col-md-3 {
          display: flex;
          flex-direction: column;
          align-items: center;
          padding: 15px;
      }

      .book-card2 {
          width: 100%;
          height: 100%;
          display: flex;
          flex-direction: column;
          align-items: center;
          background-color:transparent;
          border-radius: 10px;
          box-shadow: 0 4px 8px rgba(0,0,0,0.1);
          padding: 15px;
      }

      .book-img-container {
          width: 100%;
          height: 200px;
          display: flex;
          align-items: center;
          justify-content: center;
          overflow: hidden;
          margin-bottom: 15px;
      }

      .book-img {
          max-width: 100%;
          max-height: 100%;
          object-fit: contain;
      }

      .book-info {
          width: 100%;
          text-align: center;
      }

      .book-category {
          font-size: 0.8em;
          color: #666;
          margin-bottom: 5px;
      }

      .book-title {
          font-size: 1em;
          font-weight: bold;
          margin-bottom: 10px;
          /* 긴 제목을 위한 처리 */
          overflow: hidden;
          text-overflow: ellipsis;
          display: -webkit-box;
          -webkit-line-clamp: 2; /* 최대 2줄 */
          -webkit-box-orient: vertical;
      }

      .book-author {
          font-size: 0.9em;
          color: #333;
      }

      @media (max-width: 768px) {
          .col-md-3 {
              width: 50%;
          }
      }

      @media (max-width: 576px) {
          .col-md-3 {
              width: 100%;
          }
      }
      
      
           
        .news-section {
            margin-top: 50px;
        }
        .news-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .news-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 20px;
        }
        .news-item .news-content {
            flex-grow: 1;
        }
        .news-item .news-content h5 {
            margin: 0 0 10px;
        }
        .news-item .news-content p {
            margin: 0;
        }
      
      


      
      #moving-text {
              position: relative;
              transition: left 0.2s ease-out; /* 좌우로 움직이는 애니메이션 설정 */
          }
            
         #moving-text h1{
            font-size: 250%;
         }
         
         #home{
            background-image: url('../img/index_cover.png');
                background-size: cover; /* 화면에 꽉 차도록 배경 이미지 크기 조절 */
                background-position: center; /* 배경 이미지 중앙 정렬 */
                background-attachment: fixed; /* 스크롤에 따라 배경 이미지 고정 */
                padding: 100px 0; /* 내용과 화면 맨 위 간격 조절 */
         }
         
           body, html {
               margin: 0;
               padding: 0;
               height: 100%;
               overflow: hidden; /* 초기에는 스크롤을 숨김 */
           }
         #header{
            background-color: white !important;
         }
           #slide-cover {
               position: fixed;
               top: 0;
               left: 0;
               width: 100%;
               height: 100%;
               z-index: 9999; /* 더 높은 z-index 값 */
               background-color: #D85D47;
               display: flex;
               justify-content: center;
               align-items: center;
           }
         
           .background-shapes {
               position: relative;
               width: 100%;
               display: flex;
               justify-content: space-around;
               margin-top: 50px;
            margin-left: -40px;
           }
         .shape {
             position: relative;
             width: 150px;
             height: 150px;
             background-size: cover;
             background-position: center;
             text-align: center;
             color: white;
             font-size: 20px;
             font-weight: bold;
             display: flex;
             justify-content: center;
             align-items: center;
             /* Ensure text is vertically centered */
             line-height: 150px; /* Adjust based on the size of the shape */
         }

         .shape span {
             display: inline-block;
             transform: rotate(0deg);
             line-height: initial; /* Reset line-height */
         }

         .shape-1 {
             background-image: url('../img/circle.png');
             display: inline-block;
             transition: transform 10s ease;
             animation: rotateSlowly 59s linear infinite;
         }

         .shape-2 {
             background-image: url('../img/pentagon.png');
             display: inline-block;
             transition: transform 11s ease;
             animation: rotateSlowly 60s linear infinite reverse;
         }

         .shape-3 {
             background-image: url('../img/triangle.png');
             display: inline-block;
             transition: transform 9s ease;
             animation: rotateSlowly 61s linear infinite;
         }
         @keyframes rotateSlowly {
           0% {
             transform: rotate(0deg);
           }
           100% {
             transform: rotate(360deg);
           }
          }
          
          .bg-corgi-cover{
            background-image: url('../img/index_cover.png');
          }
           
         .full-width-background {
                    width: 100vw;
                  
                }
         #recommendationBooksSection{
            background-color: #fff5f2;
            margin-top: 150px;
            padding: 50px;
            width: 100%; /* 가로 길이를 100%로 설정 */
            max-width: none; /* Bootstrap 기본 최대 너비 무시 */
            flex-direction: column;
                       justify-content: center;
                       align-items: center;
         }
         .row {
                   display: flex;
                   flex-wrap: wrap; /* 화면 크기에 따라 자동으로 줄바꿈 */
                   justify-content: center;
               }
               .book-card {
                   margin: 10px;
                   padding: 20px;
                   border: 1px solid #ddd;
                   border-radius: 5px;
                   width: 23%; /* 네 개의 카드가 가로로 나란히 배치되도록 설정 */
                   box-sizing: border-box; /* padding과 border를 width에 포함 */
                   text-align: center;
                   background-color: #f9f9f9;
               }
               .book-img {
                   width: 100%;
                   height: auto;
               }
               @media (max-width: 1200px) {
                   .book-card {
                       width: 45%; /* 화면 크기가 작아질 때 두 개씩 배치 */
                   }
               }
               @media (max-width: 768px) {
                   .book-card {
                       width: 100%; /* 화면 크기가 더 작아질 때 한 개씩 배치 */
                   }
               }
           .news-section {
               margin-top: 50px;
           }
           .news-item {
               display: flex;
               align-items: center;
               margin-bottom: 20px;
               padding: 10px;
               border: 1px solid #ddd;
               border-radius: 5px;
               background-color: #f9f9f9;
           }
           .news-item img {
               width: 100px;
               height: 100px;
               object-fit: cover;
               margin-right: 20px;
           }
           .news-item .news-content {
               flex-grow: 1;
           }
           .news-item .news-content h5 {
               margin: 0 0 10px;
           }
           .news-item .news-content p {
               margin: 0;
           }
      
          
          /* 인기도서 carousel 관련 */
          #popularBooksSection {
			margin-left:1px;
              padding: 50px 0;
          }
          
          .book-card {
              background-color: white;
              border-radius: 10px;
              box-shadow: 0 4px 8px rgba(0,0,0,0.1);
              padding: 15px;
              margin-bottom: 20px;
              height: 500px;
              display: flex;
              flex-direction: column;
          }

          .book-info {
              flex-grow: 1;
              display: flex;
              flex-direction: column;
              justify-content: flex-start;
          }

          .book-img-container {
              width: 100%;
              height: 300px; /* 또는 원하는 높이 */
              display: flex;
              align-items: center;
              justify-content: center;
              overflow: hidden;
          }

          .book-img {
              max-width: 100%;
              max-height: 100%;
              object-fit: contain;
          }

          .book-category {
              font-size: 0.8em;
              color: #666;
              margin-bottom: 5px;
          }

          .book-title {
              font-size: 1em;
              font-weight: bold;
              margin-bottom: 10px;
          }

          .book-author {
              font-size: 0.9em;
              color: #333;
          }

          .carousel-control-prev,
          .carousel-control-next {
              width: 5%;
              opacity: 0.8;
          }

          .carousel-control-prev-icon,
          .carousel-control-next-icon {
              background-color: rgba(0,0,0,0.5);
              border-radius: 50%;
              padding: 15px;
          }

          #popularBooksCarousel .carousel-item {
              padding: 0 50px;
		
          }
		  
		  .seoulData{
			display: flex;
			align-items: center;
			justify-content: center;
			margin-top:50px;
		  }
		  
		  #more{
			color: #D85D47!important;
		  }
		  
		  .book-img{
			height:300px;
			width:450px;
			
		  }
		  
		  
		  /* 출석체크 바로가기 */
		  #cute-icon-container {
		    position: fixed;
		    left: 20px;
		    bottom: 10px;
		    z-index: 1000;
		    cursor: pointer;
		    transition: transform 0.3s ease, opacity 0.3s ease;
		    opacity: 0; /* 초기에는 숨김 */
		    pointer-events: none; /* 초기에는 클릭 불가능 */
		  }

		  #cute-icon-container.visible {
		    opacity: 1;
		    pointer-events: auto; /* 클릭 가능하게 함 */
		  }

		  #cute-icon-container:hover {
		    transform: scale(1.1);
		  }

		  #daycheck-image {
		    width: 55px;
		    height: 55px;
		  }

		  /* 말풍선 스타일 */
		  .tooltip {
		    visibility: hidden;
		    width: 150px;
		    background-color: #D2B48C; /* 연한 갈색 */
		    color: #fff;
		    text-align: center;
		    border-radius: 6px;
		    padding: 10px;
		    position: absolute;
		    z-index: 1001;
		    top: -10px; /* 상단에서 약간 아래로 이동 */
		    left: calc(100% + 10px); /* 아이콘의 오른쪽에 10px 간격을 두고 위치 */
		    opacity: 0;
		    transition: opacity 0.3s, visibility 0.3s;
		    font-size: 12px;
		    font-weight: bold;
		    white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 설정 */
		  }

		  .tooltip::after {
		    content: "";
		    position: absolute;
		    top: 15px; /* 화살표 위치 조정 */
		    right: 100%; /* 말풍선의 왼쪽에 화살표 위치 */
		    border-width: 5px;
		    border-style: solid;
		    border-color: transparent #D2B48C transparent transparent; /* 연한 갈색으로 변경 */
		  }

		  #cute-icon-container:hover .tooltip {
		    visibility: visible;
		    opacity: 1;
		  }

		  /* 화면 왼쪽 끝에서 잘리지 않도록 조정 */
		  @media (max-width: 200px) { /* 적절한 너비로 조정하세요 */
		    #cute-icon-container {
		      left: 0;
		    }
		    
		    .tooltip {
		      left: 0;
		      top: auto; /* 자동으로 설정 */
		      bottom: 100%; /* 아이콘 위로 이동 */
		      transform: translateX(0);
		      margin-left: 60px; /* 아이콘의 너비에 따라 조정 */
		      margin-bottom: 10px; /* 아이콘과의 간격 */
		    }
		    
		    .tooltip::after {
		      left: 10px;
		      right: auto;
		      top: 100%;
		      border-color: #D2B48C transparent transparent transparent;
		    }
		  }
		  
		  
		  
		  
    </style>
</head>
<body id="page-top">
	
	<c:if test="${not empty sessionScope.userId}">
	  <a href="/pages/user-myCalendar" id="cute-icon-link">
	    <div id="cute-icon-container">
	      <img
	        src="/img/출석완료이미지.png"
	        alt="출석 완료"
	        id="daycheck-image"
	      >
	      <span class="tooltip">출석체크 고고씽</span>
	    </div>
	  </a>
	</c:if>
	
    <div id="slide-cover">
        <jsp:include page="index-slidecover.jsp" />
    </div>
    <!-- Page loading spinner -->
    <div class="page-loading active" id="main-content">
        <div class="page-loading-inner">
            <div class="page-spinner"></div>
            <span>Loading...</span>
        </div>
    </div>
   <div class="bg-elements elements-top-header">
       <!-- navbar -->
       <div class="elements-nav">
           <!-- bootom nav -->
        <%@ include file="header.jsp" %>

    <!-- hero-header -->
    <div id="home" class="bg-white">
        <div class="container py-5">
            <div class="row align-items-center g-4 py-5">
                <div class="col-lg-12 col-12 text-center" data-aos="fade-right" data-aos-duration="1000">
                    <div class="mb-5">
                        <div class="display-3 pb-4 text-muted">
                     <div id="moving-text">
                        <h1>
                        <p >B<img src="img/7.png"/>OK BOOK BOOK</p>
                        </h1>
                     </div>
                            <br>
                            <span class="gradient-text fw-bold"> 혼자 그리고 함께 읽는 공간</span>
                        </div>
                    </div>
                </div>
				<div class="background-shapes mb-5">
				                <div class=" col-mb-4">
				                  <a href="/pages/book-categorySearch">
				                  <dotlottie-player src="https://lottie.host/451f2e7a-21c0-41c2-ab20-a49fb8080cce/HiqEOXQLxo.json" background="transparent" speed="1" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
				                    <span class="gradient-text fw-bold" style="font-size:30px; padding:40px">카테고리별 도서</span></a>
				                </div>
				                <div class=" col-mb-4">
				                    <a href="/pages/user-myLeague">
				                     <dotlottie-player src="https://lottie.host/36a51d93-7e5b-4ed6-aa17-0f2aa2abc70b/LRQp0QxdqF.json" background="transparent" speed="0.5" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
				                     <span class="gradient-text fw-bold" style="font-size:30px; padding:120px">리그</span></a>
				                </div>
				                <div class="col-mb-4">
				                    <a href="/pages/chat-entrance">
				                     <dotlottie-player src="https://lottie.host/05c60355-5bcc-4349-902c-507efe0dae0d/U1u6m8ca65.json" background="transparent" speed="1" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
				                     <span class="gradient-text fw-bold" style="font-size:30px; padding:100px">오픈책팅</span></a>
				                </div>
				            </div>
            
            
            
            <div class="full-width-background">
                        <div class="container mt-5" id="recommendationBooksSection" style="width: 100%;">
                           <div class="text-center mb-4">
                               <c:choose>
                                   <c:when test="${not empty sessionScope.userId}">
									<h3>${sessionScope.userName}님이 좋아하실 만한 도서입니다.</h3>
									           <ul>
									               <c:forEach var="category" items="${recommendations}">
									                   <li>${category.interestNum1}, ${category.interestNum2}, ${category.interestNum3}</li>
									               </c:forEach>
									           </ul>
                                   </c:when>
                                   <c:otherwise>
                                       <h3>인기 도서 추천</h3>
                                   </c:otherwise>
                               </c:choose>
                           </div>

                                <div class="row justify-content-center">
                                    <div class="book-card">
                                        <img src="https://via.placeholder.com/300x450" class="book-img" alt="Book 1">
                                        <div class="text-center">
                                            <p>소설</p>
                                            <h5>당신이 누군가를 죽였다</h5>
                                            <p>히가시노 게이고 · 북다</p>
                                        </div>
                                    </div>

                                    <div class="book-card">
                                        <img src="https://via.placeholder.com/300x450" class="book-img" alt="Book 2">
                                        <div class="text-center">
                                            <p>경제/경영</p>
                                            <h5>덕후가 브랜드에게</h5>
                                            <p>편은지 · 두레빗</p>
                                        </div>
                                    </div>

                                    <div class="book-card">
                                        <img src="https://via.placeholder.com/300x450" class="book-img" alt="Book 3">
                                        <div class="text-center">
                                            <p>역사/문화</p>
                                            <h5>세계를 움직인 열 가지 프레임</h5>
                                            <p>수바드라 다스 · 북하우스</p>
                                        </div>
                                    </div>
                                    <div class="book-card">
                                        <img src="https://via.placeholder.com/300x450" class="book-img" alt="Book 4">
                                        <div class="text-center">
                                            <p>청소년</p>
                                            <h5>죽이고 싶은 아이 2</h5>
                                            <p>이꽃님 · 우리학교</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           </div

						   <c:if test="${not empty sessionScope.userId}">
						       <div class="text-center mt-5">
						           <c:choose>
						               <c:when test="${sessionScope.gender == 'F'}">
						                   <h3 class="seoulData">${sessionScope.userName}님을 위한 여성 추천 도서</h3>
						               </c:when>
						               <c:when test="${sessionScope.gender == 'M'}">
						                   <h3 class="seoulData">${sessionScope.userName}님을 위한 남성 추천 도서</h3>
						               </c:when>
						               <c:otherwise>
						                   <h3>${sessionScope.userName}님을 위한 추천 도서</h3>
						               </c:otherwise>
						           </c:choose>
						       </div>
						       <div class="row justify-content-center">
						           <c:forEach var="book" items="${seoulRecommendationBooks}">
						               <div class="book-card">
						                   <img src="${book.bname}" class="book-img" alt="${book.bookTitle}">
						                   <div class="text-center">
						                       <p>${book.bookTitle}</p>
						                       <h5>${book.writer}</h5>
						                       <p>${book.publisher}</p>
						                   </div>
						               </div>
						           </c:forEach>
						       </div>
						   </c:if>

                           <div class="full-width-background">
                               <div class="container mt-5" id="popularBooksSection">
                                   <div class="text-center mb-4">
                                       <h3>인기 대출 도서</h3>
                                   </div>
                                   <div id="popularBooksCarousel" class="carousel slide" data-bs-ride="carousel">
                                       <div class="carousel-inner">
                                           <div class="carousel-item active">
                                               <div class="row">
                                                   <c:forEach items="${popularBooks}" var="book" begin="0" end="3">
                                                       <div class="col-md-3">
                                                           <div class="book-card2">
                                                   <div class="book-img-container">
                                                       <img src="${book.bestfname}" class="book-img" alt="${book.bestTitle}">
                                                   </div>
                                                               <div class="book-info">
                                                                   <p class="book-category">${book.cateNum}</p>
                                                                   <h5 class="book-title">${book.bestTitle}</h5>
                                                                   <p class="book-author">${book.bestWriter}</p>
                                                               </div>
                                                           </div>
                                                       </div>
                                                   </c:forEach>
                                               </div>
                                           </div>
                                           <div class="carousel-item">
                                               <div class="row">
                                                   <c:forEach items="${popularBooks}" var="book" begin="4" end="7">
                                                       <div class="col-md-3">
                                                           <div class="book-card2">
                                                   <div class="book-img-container">
                                                       <img src="${book.bestfname}" class="book-img" alt="${book.bestTitle}">
                                                   </div>
                                                               <div class="book-info">
                                                                   <p class="book-category">${book.cateNum}</p>
                                                                   <h5 class="book-title">${book.bestTitle}</h5>
                                                                   <p class="book-author">${book.bestWriter}</p>
                                                               </div>
                                                           </div>
                                                       </div>
                                                   </c:forEach>
                                               </div>
                                           </div>
                                       </div>
                                       <button class="carousel-control-prev" type="button" data-bs-target="#popularBooksCarousel" data-bs-slide="prev">
                                           <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                           <span class="visually-hidden">Previous</span>
                                       </button>
                                       <button class="carousel-control-next" type="button" data-bs-target="#popularBooksCarousel" data-bs-slide="next">
                                           <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                           <span class="visually-hidden">Next</span>
                                       </button>
                                   </div>
                               </div>
                           </div>
                                       
   
               <!-- News Section -->
            <div class="news-section mt-5">
                <h3 class="text-center mb-4">도서 관련 뉴스</h3>
                <c:forEach items="${newsList}" var="news">
                    <div class="news-item">
                        <div class="news-content text-purple" >
                            <h5>${news.title}</h5>
                            <p>${news.description}</p>
                        <a href="${news.originallink}" class="newsLink" target="_blank" id="more" >더보기</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
           </div>
       </div>
   </div>
    <!-- Nav Sidebar -->
   <%@ include file="navSidebar.jsp" %>
    <!-- 푸터 포함 -->
    <%@ include file="footer.jsp" %>
    <!-- Bootsrap Bundle Js -->
    <script src="vender/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Jquery Js -->
    <script src="vender/jquery/jquery-3.6.4.min.js"></script>
    <!-- AOS Js -->
    <script src="vender/aos/dist/aos.js"></script>
    <!-- Core theme JS -->
    <script src="js/demo.js"></script>
    <!-- Core theme JS -->
    <script src="js/script.js"></script>'
   <!--Popper JS-->
   
   <!-- 출석체크 바로가기 발바닥 -->
   <script>
   document.addEventListener('DOMContentLoaded', function() {
     var iconContainer = document.getElementById('cute-icon-container');
     var isLoggedIn = <%= session.getAttribute("userId") != null %>;
     console.log("로그인 상태 :", isLoggedIn);
     
     if (isLoggedIn && iconContainer) {
       iconContainer.classList.add('visible');
     } else {
       false; 
     }
   });
   </script>
   
   
   <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
   <script>
	<script>
	  document.addEventListener('DOMContentLoaded', function() {
	    var iconContainer = document.getElementById('cute-icon-container');
	    var iconLink = document.getElementById('cute-icon-link');
	    
	    // 로그인 상태 확인 (서버에서 전달받은 값을 사용)
	    var isLoggedIn = <%= session.getAttribute("userId") != null %>;
	    
	    if (isLoggedIn && iconContainer) {
	      iconContainer.classList.add('visible');
	    }

	    if (iconLink) {
	      iconLink.addEventListener('click', function(e) {
	        e.preventDefault();
	        window.location.href = this.getAttribute('href');
	      });
	    }
	  });
   </script>
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
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
        document.addEventListener('DOMContentLoaded', function() {
            const shapes = document.querySelectorAll('.shape-1, .shape-2, .shape-3');
            shapes.forEach(shape => {
                shape.style.transform = `translate(${Math.random() * 100}px, ${Math.random() * 100}px)`;
            });
        });
    </script>
    <script>
        window.embeddedChatbotConfig = {
            chatbotId: "CLzwRLQ2gS5uqCukGQfdB",
            domain: "www.chatbase.co"
        }
      
      document.addEventListener('mousemove', function(e) {
                    // 마우스 커서의 x 좌표를 가져오기
                    let mouseX = e.pageX;
                    
                    // 텍스트 요소 가져오기
                    let textElement = document.getElementById('moving-text');
                    
                    // 텍스트 요소의 가로 폭 가져오기
                    let textWidth = textElement.offsetWidth;
                    
                    // 페이지 가로 폭 가져오기
                    let pageWidth = window.innerWidth;
                    
                    // 텍스트가 움직일 수 있는 최대 범위 계산
                    let maxMove = pageWidth - textWidth;
                    
                    // 텍스트를 움직일 위치 계산
                    // mouseX 값이 0일 때는 왼쪽 끝, pageWidth 값일 때는 오른쪽 끝
                    let textLeft = (mouseX / pageWidth * maxMove);
                    
                    // 텍스트 위치 설정
                    textElement.style.left = 0+textLeft + 'px';
                });
               
    </script>
	<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
    <script src="https://www.chatbase.co/embed.min.js" chatbotId="CLzwRLQ2gS5uqCukGQfdB" domain="www.chatbase.co" defer></script>
</body>
</html>
