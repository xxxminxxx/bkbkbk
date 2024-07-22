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
        <link rel="icon" href="img/pages/icon.png" type="image/png">
        <title>북북북 | 나의 서재</title>
        <!-- Bootstrap Css -->
        <link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
        <!-- Icofont Css -->
        <link rel="stylesheet" href="../vender/icofont/icofont.min.css">
        <!-- AOS Css -->
        <link rel="stylesheet" href="../vender/aos/dist/aos.css">
        <!-- Remix Icons -->
        <link rel="stylesheet" href="../vender/remixicon/remixicon.css">
        <!-- Slick Slider Css -->
        <link rel="stylesheet" href="../vender/slick/slick/slick.css">
        <link rel="stylesheet" href="../vender/slick/slick/slick-theme.css">
        <!-- Custom Css -->
        <link rel="stylesheet" href="../css/style.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
		<!--user-myLibrary CSS-->
		<link rel="stylesheet" href="../css/user-myBookshelf.css">
		
		<!-- ********************JS SECTION************************ -->
		<!-- Bootsrap Bundle Js -->
		<script src="../vender/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Jquery Js -->
		<script src="../vender/jquery/jquery-3.6.4.min.js"></script>
		<!-- AOS Js -->
		<script src="../vender/aos/dist/aos.js"></script>
		<!-- Slick Slider Js -->
		<script src="../vender/slick/slick/slick.min.js"></script>
		<!-- Slick Js -->
		<script src="../js/slick.js"></script>
		<!-- Custom Js -->
		<script src="../js/script.js"></script>
		<!--user-myLibrary JS-->
<!--		<script src="../js/user-myBookshelf.js"></script>-->
	
    </head>
    <body>
        

		<div class="bg-elements elements-top-header position-relative">
		    <!-- navbar -->
		    <div class="elements-nav">
		        <!-- bootom nav -->
				<%@ include file="../header.jsp" %>
			
            <!-- header -->
            
    
		<!-- ############################################## - ->
			    <!-- tab panes -->
			    <div class="py-5 bg-light">
			        <div class="container py-4">
			            <div class="row">
			                <div class="col-12">
			                    <nav>
			                        <div class="nav nav-tabs d-flex justify-content-center gap-2 nav-tabs-osahan" id="nav-tab" role="tablist">
			                            <button class="nav-link active px-lg-4 py-lg-3" id="nav-all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="nav-all" aria-selected="true">전체</button>
			                            <button class="nav-link px-lg-4 py-lg-3" id="nav-read-tab" data-bs-toggle="tab" data-bs-target="#nav-read" type="button" role="tab" aria-controls="nav-read" aria-selected="false">읽은 책</button>
			                            <button class="nav-link px-lg-4 py-lg-3" id="nav-reading-tab" data-bs-toggle="tab" data-bs-target="#nav-reading" type="button" role="tab" aria-controls="nav-reading" aria-selected="false">읽고 있는 책</button>
			                            <button class="nav-link px-lg-4 py-lg-3" id="nav-wishlist-tab" data-bs-toggle="tab" data-bs-target="#nav-wishlist" type="button" role="tab" aria-controls="nav-wishlist" aria-selected="false">읽고 싶은 책</button>
			                        </div>
			                    </nav>
			                    
			                    <div class="tab-content bg-white p-lg-5 p-4 border-end border-bottom border-start" id="nav-tabContent">
			                        <!-- 전체 탭 팬 -->
			                        <div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="nav-all-tab">
			                            <c:choose>
			                                <c:when test="${not empty characterStages}">
			                                    <div id="character-stages">
			                                        <div class="stage-character">
			                                            <div class="stage">${characterStages[0].characterStage}</div>
			                                            <img src="${characterStages[0].characterImage}" alt="Character Image" class="character-image">
			                                            <div class="book-spines">
			                                                <c:forEach var="book" items="${characterStages}">
			                                                    <div class="book-spine">																<c:choose>
																                                    <c:when test="${fn:length(book.bookTitle) > 14}">
																                                        ${fn:substring(book.bookTitle, 0, 14)}...
																                                    </c:when>
																                                    <c:otherwise>
																                                        ${book.bookTitle}
																                                    </c:otherwise>
																                                </c:choose>
																							</div>
			                                                </c:forEach>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </c:when>
			                                <c:otherwise>
			                                    <div id="without-data">
			                                        <p>읽은 책이 없습니다!</p>
			                                        <div class="d-flex justify-content-center">
			                                            <a href="#" class="btn btn-primary mx-2">베스트셀러 구경하러 가기</a>
			                                            <a href="#" class="btn btn-secondary mx-2">추천 받기</a>
			                                            <a href="#" class="btn btn-success mx-2">읽은 책 등록하기</a>
			                                        </div>
			                                    </div>
			                                </c:otherwise>
			                            </c:choose>
			                        </div>

			                        <!-- 읽은 책 탭 팬 -->
			                        <div class="tab-pane fade" id="nav-read" role="tabpanel" aria-labelledby="nav-read-tab">
										<div class="text-end mt-3">
												<button class="btn btn-sm btn-outline-primary">⇅정렬
												</button>
										</div>
										<div id="read-list">
			                                <c:choose>
			                                    <c:when test="${not empty readBooks}">
			                                        <c:forEach var="book" items="${readBooks}">
			                                            <div class="book-item d-flex align-items-start mb-4">
			                                                 <img src="${book.bname}" alt="책 표지" class="book-cover" style="width: 100px; height: 150px;">
			                                                <div class="book-info flex-grow-1">
			                                                    <div class="d-flex justify-content-between align-items-start">
			                                                        <div>
			                                                            <h5 class="book-title">${book.bookTitle}</h5>
			                                                            <p class="book-author mb-1">${book.writer}</p>
																		<div class="book-rating mb-1">
																		    <c:forEach var="i" begin="1" end="5">
																		        <c:choose>
																		            <c:when test="${i <= book.rating}">
																		                <span class="star">★</span>
																		            </c:when>
																		            <c:otherwise>
																		                <span class="star-empty">☆</span>
																		            </c:otherwise>
																		        </c:choose>
																		    </c:forEach>
																		</div>

			                                                            <p class="book-dates">시작일 ${book.startDate} 종료일 ${book.endDate}</p>
			                                                        </div>
			                                                        <button class="btn btn-sm">
			                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 256 256">
			                                                                <path d="M229.66,58.34l-32-32a8,8,0,0,0-11.32,0l-96,96A8,8,0,0,0,88,128v32a8,8,0,0,0,8,8h32a8,8,0,0,0,5.66-2.34l96-96A8,8,0,0,0,229.66,58.34ZM124.69,152H104V131.31l64-64L188.69,88ZM200,76.69,179.31,56,192,43.31,212.69,64ZM224,128v80a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32h80a8,8,0,0,1,0,16H48V208H208V128a8,8,0,0,1,16,0Z">
			                                                                </path>
			                                                            </svg>
			                                                        </button>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                        </c:forEach>
			                                    </c:when>
			                                    <c:otherwise>
			                                        <div id="without-data">
			                                            <p>읽은 책이 없습니다!</p>
			                                            <div class="d-flex justify-content-center">
			                                                <a href="#" class="btn btn-primary mx-2">베스트셀러 구경하러 가기</a>
			                                                <a href="#" class="btn btn-secondary mx-2">추천 받기</a>
			                                                <a href="#" class="btn btn-success mx-2">읽은 책 등록하기</a>
			                                            </div>
			                                        </div>
			                                    </c:otherwise>
			                                </c:choose>
			                            </div>
			                         
			                        </div>

									<!-- 읽고 있는 책 탭 팬 -->
									<div class="tab-pane fade" id="nav-reading" role="tabpanel" aria-labelledby="nav-reading-tab" tabindex="0">
										<div class="text-end mt-3">
												<button class="btn btn-sm btn-outline-primary">⇅정렬
												</button>
										</div>
										 <div id="reading-list">
									        <c:choose>
									            <c:when test="${not empty readingBooks}">
									                <c:forEach var="book" items="${readingBooks}">
									                    <div class="book-item d-flex align-items-start mb-4">
									                        <img src="${book.bname}" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
									                        <div class="book-info flex-grow-1">
									                            <div class="d-flex justify-content-between align-items-start">
									                                <div>
									                                    <h5 class="book-title">${book.bookTitle}</h5>
									                                    <p class="book-author mb-1">${book.writer}</p>
									                                    <p class="book-start-date mb-1">시작일 ${book.startDate}</p>
									                                </div>
									                                <button class="btn btn-sm">
									                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 256 256">
									                                        <path d="M229.66,58.34l-32-32a8,8,0,0,0-11.32,0l-96,96A8,8,0,0,0,88,128v32a8,8,0,0,0,8,8h32a8,8,0,0,0,5.66-2.34l96-96A8,8,0,0,0,229.66,58.34ZM124.69,152H104V131.31l64-64L188.69,88ZM200,76.69,179.31,56,192,43.31,212.69,64ZM224,128v80a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32h80a8,8,0,0,1,0,16H48V208H208V128a8,8,0,0,1,16,0Z"></path>
									                                    </svg>
									                                </button>
									                            </div>
									                            <div class="progress mb-2" style="height: 10px;">
									                                <div class="progress-bar bg-success" role="progressbar" style="width: 64%" aria-valuenow="64" aria-valuemin="0" aria-valuemax="100"></div>
									                            </div>
									                            <p class="book-progress mb-0">64% (473/679 페이지)</p>
									                        </div>
									                    </div>
									                </c:forEach>
									            </c:when>
									            <c:otherwise>
									                <div id="without-data">
									                    <p>읽고 있는 책이 없습니다!</p>
									                    <div class="d-flex justify-content-center">
									                        <a href="#" class="btn btn-primary mx-2">베스트셀러 구경하러 가기</a>
									                        <a href="#" class="btn btn-secondary mx-2">추천 받기</a>
									                        <a href="#" class="btn btn-success mx-2">읽은 책 등록하기</a>
									                    </div>
									                </div>
									            </c:otherwise>
									        </c:choose>
									    </div>
									   
									</div>

									<!-- 읽고 싶은 책 탭 팬 -->
									<div class="tab-pane fade" id="nav-wishlist" role="tabpanel" aria-labelledby="nav-wishlist-tab" tabindex="0">
										<div class="text-end mt-3">
											<button class="btn btn-sm btn-outline-primary">⇅정렬
												</button>
										</div>
										<div id="wish-list">
									        <c:choose>
									            <c:when test="${not empty wishlistBooks}">
									                <c:forEach var="book" items="${wishlistBooks}">
									                    <div class="book-item d-flex align-items-start mb-4">
									                        <img src="${book.bname}" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
									                        <div class="book-info flex-grow-1">
									                            <div class="d-flex justify-content-between align-items-start">
									                                <div>
									                                    <h5 class="book-title">${book.bookTitle}</h5>
									                                    <p class="book-author mb-1">${book.writer}</p>
									                                    <p class="book-added-date mb-1">추가된 날짜: ${book.addedDate}</p>
									                                </div>
									                                <button class="btn btn-sm">
									                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 256 256">
									                                        <path d="M229.66,58.34l-32-32a8,8,0,0,0-11.32,0l-96,96A8,8,0,0,0,88,128v32a8,8,0,0,0,8,8h32a8,8,0,0,0,5.66-2.34l96-96A8,8,0,0,0,229.66,58.34ZM124.69,152H104V131.31l64-64L188.69,88ZM200,76.69,179.31,56,192,43.31,212.69,64ZM224,128v80a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32h80a8,8,0,0,1,0,16H48V208H208V128a8,8,0,0,1,16,0Z"></path>
									                                    </svg>
									                                </button>
									                            </div>
									                        </div>
									                    </div>
									                </c:forEach>
									            </c:when>
									            <c:otherwise>
									                <div id="without-data">
									                    <p>읽고 싶은 책이 없습니다!</p>
									                    <div class="d-flex justify-content-center">
									                        <a href="#" class="btn btn-primary mx-2">베스트셀러 구경하러 가기</a>
									                        <a href="#" class="btn btn-secondary mx-2">추천 받기</a>
									                        <a href="#" class="btn btn-success mx-2">읽고 싶은 책 등록하기</a>
									                    </div>
									                </div>
									            </c:otherwise>
									        </c:choose>
									    </div>
									 
									</div>
			                    </div> <!-- end of tab-content -->
			                </div>
			            </div>
			        </div>
			    </div>

			</div>

       
        
                              
			<!-- Nav Sidebar -->
			<%@ include file="../navSidebar.jsp" %>
			<!-- 푸터 포함 -->
			<%@ include file="../footer.jsp" %>
    </body>
</html>
