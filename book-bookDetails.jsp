<%@ page language="java" 
contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>북북북 | 도서 상세 페이지</title>
        <!-- Bootstrap Css -->
        <link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
        <!-- Icofont Css -->
        <link rel="stylesheet" href="../vender/icofont/icofont.min.css">
        <!-- AOS Css -->
        <link rel="stylesheet" href="../vender/aos/dist/aos.css">
        <!-- Remix Icons -->
        <link rel="stylesheet" href="../vender/remixicon/remixicon.css">
        <!-- Custom Css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<!--user-bookDetails CSS-->
		<link rel="stylesheet" href="../css/user-bookDetails.css">
		
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
    </head>
    <body>
        
        <div class="bg-white white-top-header position-relative">
            <!-- navbar -->
            <div class="elements-nav">
                <!-- bootom nav -->
				<%@ include file="../header.jsp" %>
            </div>
        </div>
       <!--  내용  -->
	   <div class="container mt-5">
	       <div class="row justify-content-center">
	           <div class="col-lg-8">
	               <div class="row">
	                   <!-- Book Image -->
	                   <div class="col-md-4">
	                       <img src="${bookDetails.bname}" alt="Book Image" class="img-fluid">
	                   </div>
	                   <!-- Book Details -->
	                   <div class="col-md-8">
	                       <h2>${bookDetails.bookTitle}</h2>
	                       <table class="table table-borderless">
	                           <tr>
	                               <td>저자</td>
	                               <td>${bookDetails.writer}</td>
	                           </tr>
	                           <tr>
	                               <td>출판사</td>
	                               <td>${bookDetails.publisher}</td>
	                           </tr>
	                           <c:if test="${not empty book.bookPreview}">
	                               <tr>
	                                   <td>책소개</td>
	                                   <td>${bookDetails.bookPreview}</td>
	                               </tr>
	                           </c:if>
	                           <tr>
	                               <td>출판연월일</td>
	                               <td>${bookDetails.publicationDate}</td>
	                           </tr>
	                           <tr>
	                               <td>ISBN</td>
	                               <td>${bookDetails.isbn}</td>
	                           </tr>
	                           <tr>
	                               <td>페이지수</td>
	                               <td>${bookDetails.bookPage} 페이지</td>
	                           </tr>
	                       </table>
	                   </div>
	               </div>
	               <button class="btn d-flex align-items-center mt-4" id="wish-book-btn">
	                   <img src="../img/wishbook.png" alt="Heart Icon" style="width: 30px; height: 30px; margin-right: 5px;">읽고 싶은 책
	               </button>

	               <!-- 읽은 책, 읽고 있는 책 저장 부분 -->
	               <nav>
	                   <div class="nav nav-tabs justify-content-center mt-4" id="nav-tab" role="tablist">
	                       <button class="nav-link active" id="nav-read-tab" data-bs-toggle="tab" data-bs-target="#nav-read" type="button" role="tab" aria-controls="nav-read" aria-selected="true">읽은 책</button>
	                       <button class="nav-link" id="nav-reading-tab" data-bs-toggle="tab" data-bs-target="#nav-reading" type="button" role="tab" aria-controls="nav-reading" aria-selected="false">읽고 있는 책</button>
	                   </div>
	               </nav>
	               <div class="tab-content" id="nav-tabContent">
	                   <div class="tab-pane fade show active" id="nav-read" role="tabpanel" aria-labelledby="nav-read-tab">
	                       <!-- 읽은 책 폼 -->
	                       <form class="mt-3">
	                           <div class="mb-3">
	                               <label for="startDate" class="form-label">시작일</label>
	                               <input type="date" class="form-control" id="startDate" value="2024-06-20">
	                           </div>
	                           <div class="mb-3">
	                               <!-- 추후 종료일이 시작일보다 빠를 수 없게 하기 -->
	                               <label for="endDate" class="form-label">종료일</label>
	                               <input type="date" class="form-control" id="endDate" value="2024-06-25">
	                           </div>
	                           <div class="mb-3">
	                               <label for="user-rating" class="form-label">평점을 남겨주세요!</label>
	                               <div class="rating">
	                                   <input type="radio" name="user-rating" id="user-star5"><label for="user-star5">&#9733;</label>
	                                   <input type="radio" name="user-rating" id="user-star4"><label for="user-star4">&#9733;</label>
	                                   <input type="radio" name="user-rating" id="user-star3"><label for="user-star3">&#9733;</label>
	                                   <input type="radio" name="user-rating" id="user-star2"><label for="user-star2">&#9733;</label>
	                                   <input type="radio" name="user-rating" id="user-star1"><label for="user-star1">&#9733;</label>
	                               </div>
	                           </div>
	                           <div class="d-flex justify-content-center">
	                               <button type="submit" class="btn" id="save-btn">저장하기</button>
	                           </div>
	                       </form>
	                   </div>
	                   <div class="tab-pane fade" id="nav-reading" role="tabpanel" aria-labelledby="nav-reading-tab">
	                       <!-- 읽고 있는 책 폼 -->
	                       <form action="updateReadingBook" method="post" class="mt-3">
	                           <div class="mb-3">
	                               <label for="read-pages" class="form-label">읽은 페이지</label>
	                               <input type="text" id="read-pages" class="form-control" name="read-pages">
	                           </div>
	                           <div class="mb-3">
	                               <label for="startDate" class="form-label">시작일</label>
	                               <input type="date" class="form-control" id="startDate" name="startDate">
	                           </div>
	                           <div class="d-flex justify-content-center">
	                               <button type="submit" class="btn" id="save-as-reading-book-btn">읽고 있는 책으로 저장하기</button>
	                               <button type="submit" class="btn ms-2" id="update-btn">수정하기</button>
	                           </div>
	                       </form>
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
	
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
		
		<!--user-bookDetails.js-->
		<script src="../js/user-bookDetails.js"></script>
		
		

    </body>
</html>
