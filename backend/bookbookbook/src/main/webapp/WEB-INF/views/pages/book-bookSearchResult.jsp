<%@page contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko" class="translated-ltr"><head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../img/pages/icon.png" type="image/png">
    <title>북북북 | 도서 검색 결과</title>
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
    <!-- Icofont Css -->
    <link rel="stylesheet" href="../vender/icofont/icofont.min.css">
    <!-- AOS Css -->
    <link rel="stylesheet" href="../vender/aos/dist/aos.css">
    <!-- Remix Icons -->
    <link rel="stylesheet" href="../vender/remixicon/remixicon.css">
    <!-- Custom Css -->
   <link rel="stylesheet" href="../css/style.css">
    <!-- Common Css -->
    <link rel="stylesheet" href="../css/common.css">
    <link type="text/css" rel="stylesheet" charset="UTF-8" 
	href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.26tY-h6gH9w.L.W.O/am=GAY/d=0/rs=AN8SPfrev-A3NvrBP0gNq8zXCqKY7IcBLA/m=el_main_css"></head>
  	<!--user-bookSearchResult.CSS-->
    <link rel="stylesheet" href="../css/user-bookSearchResult.css">
	<style>
		/*책 커버 크기 고정*/
	       .fixed-img {
	           width: 150px; 
	           height: 200px; 
	           object-fit: cover; 
		   
		   #word-break {
		       word-break: break-word;
		   }
	   </style>
	
	
<body>

	<div class="bg-elements elements-top-header position-relative">
    <!-- navbar -->
    <div class="elements-nav">
                <!-- bootom nav -->
				<%@ include file="../header.jsp" %>
           
    <!-- header -->
    <div class="py-5">
                <div class="container py-5">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-10 col-12 text-center">
                            <div >
						   <h1 class="text-white fw-bolder display-5 mb-3" id="word-break">
								"<c:out value="${query}" />"에 대한 도서 검색 결과
                                <!-- <p class="-0 text-white-50">Last updated: January 2024</p> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <div class="svg-border-rounded text-light">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144.54 17.34" preserveAspectRatio="none" fill="#ffffff"><path d="M144.54,17.34H0V0H144.54ZM0,0S32.36,17.34,72.27,17.34,144.54,0,144.54,0"></path></svg>
            </div>
</div>

            <!-- content -->
			<!-- 전체 책 목록을 담을 컨테이너 -->
			<div class="container mt-5">
			    <!-- 책 목록을 담을 컨테이너 -->
			    <div id="booksContainer" style="margin: 0 0 50px 0">
			        <div class="row justify-content-center">
			            <c:choose>
			                <c:when test="${not empty books}">
			                    <!-- 책 목록이 있을 경우 -->
			                    <c:forEach var="book" items="${books}" varStatus="status">
			                        <!-- 4개의 책마다 새로운 행 생성 -->
			                        <c:if test="${status.index % 4 == 0 && !status.first}">
			                            </div><div class="row mt-3">
			                        </c:if>
			                        <!-- 개별 책 정보 -->
			                        <div class="col-lg-3 col-md-4 col-sm-6 d-flex">
			                            <div class="card w-100 my-1 shadow rounded-4 overflow-hidden border-0">
			                                <a href="${pageContext.request.contextPath}/bookDetails?bookNum=${book.bookNum}">
												<c:choose>
													<c:when test="${book.bname != null}">
			                                   		 <img src="${book.bname}" class="card-img-top" alt="${book.bookTitle}">
													</c:when>
													<c:otherwise>
														<img src="../img/noImage.jpg" class="card-img-top" alt="${book.bookTitle}">
													</c:otherwise>
												</c:choose>
			                                </a>
			                                <div class="card-body d-flex flex-column p-4">
			                                    <div class="d-flex flex-row mb-2">
			                                        <a href="${pageContext.request.contextPath}/bookDetails?bookNum=${book.bookNum}" class="text-decoration-none text-purple">
			                                            <h4 class="mb-0 me-1 fw-bold">${book.bookTitle}</h4>
			                                        </a>
			                                    </div>
			                                    <p>${book.writer} <br>${book.publisher}</p>
			                                    <div class="osahan-card-footer d-flex align-items-end px-0 pb-0 mt-auto">
			                                        <form action="/pages/book-preFindLocation" method="get">
			                                            <input type="hidden" name="isbn" value="${book.isbn}" />
			                                            <input type="hidden" name="bookTitle" value="${book.bookTitle}" />
			                                            <button type="submit" style="width:260px; font-size:18px" class="btn btn-primary">도서관 위치 찾기</button>
			                                        </form>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </c:forEach>
			                </c:when>
			                <c:otherwise>
			                    <!-- 검색 결과가 없을 경우 -->
			                    <h1 style="text-align:center; color:white; min-height:22em; top:8vh; position:relative">검색 결과가 없습니다.</h1>
			                </c:otherwise>
			            </c:choose>
			        </div>
			    </div>
			    <!-- 더보기 버튼 -->
			    <c:if test="${hasMore}">
			        <div class="col-12 text-center mt-4" style="margin: 0 0 5% 0">
			            <button id="loadMore" class="btn btn-secondary" data-page="1">더보기</button>
			        </div>
			    </c:if>
			</div>


			<!-- 위치 찾기 버튼이 눌리면 모달이 뜨도록 구성 -->
			

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
<script src="../js/script.js">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
	    var currentPage = 1;

	    // 문서 레벨 이벤트 리스너 추가
	    $(document).on('click', '#loadMore', function() {
	        console.log("더보기 버튼 클릭됨 (문서 레벨)");
	        loadMoreBooks();
	    });


	    function loadMoreBooks() {
	        var nextPage = currentPage + 1;
	        console.log("다음 페이지:", nextPage);

	        $.ajax({
	            url: '${pageContext.request.contextPath}/loadMoreBooks',
	            type: 'GET',
	            data: {
	                page: nextPage,
	                query: '${query}',
	                type: '${type}'
	            },
	            success: function(response) {
	                console.log("####서버 응답:", response);
	                console.log(JSON.stringify(response, null, 2));
	                if (response.books && response.books.length > 0) {
	                    var booksHtml = '';
	                    $.each(response.books, function(index, book) {
	                        console.log("처리 중인 책:", book);  // 각 책 정보 출력
	                        if (index % 4 === 0) {
	                            booksHtml += '<div class="row mt-3">';
									console.log("if문 index %4 === 0 에 들어옴, bookHtml 값 : " , booksHtml);
	                        }
	                        console.log("$.each 문 안에 들어옴 , booksHtml 값 : ", booksHtml);
	                        booksHtml += createBookHtml(book);
	                        console.log(">>>booksHtml 누적:", booksHtml);
	                        
	                        if ((index + 1) % 4 === 0 || index === response.books.length - 1) {
	                            booksHtml += '</div>';
	                        }
	                    });
	                    console.log("최종 HTML (삽입 전):", booksHtml);
	                    $('#booksContainer').append(booksHtml);
	                    console.log("HTML 삽입 완료");
	                 

	                    currentPage = nextPage;
	                    console.log("현재 페이지 업데이트:", currentPage);

	                    if (!response.hasMore) {
	                        $("#loadMore").hide();
	                        console.log("더 이상 불러올 책이 없음");
	                    }
	                } else {
	                    console.log("불러올 책이 없음");
	                }

	                // CSS 확인
	                console.log("booksContainer의 CSS display 속성:", $('#booksContainer').css('display'));
	            },
	            error: function(xhr, status, error) {
	                console.error("책 더 불러오기 오류:", error);
	                console.log("상태:", status);
	                console.log("XHR:", xhr);
	            }
	        });
	    }

		function createBookHtml(book) {
		    console.log(">>>>>>>>>>>> Creating HTML for book:", book);
		    var bookNum = book.bookNum || '';
		    var bname = book.bname || '';
		    var bookTitle = book.bookTitle || '';
		    var writer = book.writer || '';
		    var publisher = book.publisher || '';
		    var isbn = book.isbn || '';

		    var html = '<div class="col-lg-3 col-md-4 col-sm-6 d-flex">' +
		        '<div class="card w-100 my-1 shadow rounded-4 overflow-hidden border-0">' +
		        '<a href="/bookDetails?bookNum=' + bookNum + '">' +
		        '<img src="' + bname + '" class="card-img-top" alt="' + bookTitle + '">' +
		        '</a>' +
		        '<div class="card-body d-flex flex-column p-4">' +
		        '<div class="d-flex flex-row mb-2">' +
		        '<a href="/bookDetails?bookNum=' + bookNum + '" class="text-decoration-none text-purple">' +
		        '<h6 class="mb-0 me-1 fw-bold">' + bookTitle + '</h6>' +
		        '</a>' +
		        '</div>' +
		        '<p>' + writer + ' <br>' + publisher + '</p>' +
		        '<div class="osahan-card-footer d-flex align-items-end px-0 pb-0 mt-auto">' +
		        '<form action="/pages/book-preFindLocation" method="get">' +
		        '<input type="hidden" name="isbn" value="' + isbn + '" />' +
		        '<input type="hidden" name="bookTitle" value="' + bookTitle + '" />' +
		        '<button type="submit" style="width:260px;font-size:18px;" class="btn btn-primary">도서관 위치 찾기</button>' +
		        '</form>' +
		        '</div>' +
		        '</div>' +
		        '</div>' +
		        '</div>';
				
		    return html;
		}
	});
</script>
</body>
</html>