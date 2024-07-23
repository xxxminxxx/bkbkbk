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
	       .fixed-img {
	           width: 150px; /* 원하는 고정 너비 */
	           height: 200px; /* 원하는 고정 높이 */
	           object-fit: cover; /* 이미지가 고정 크기에 맞춰지도록 설정 */
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
                        <div class="col-xl-6 col-lg-5 col-md-10 col-12 text-center">
                            <div class="text-white">
                                <h1 class="fw-bolder display-5 mb-3">도서 검색 결과</h1>
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
<div class="py-5">
    <div class="container py-4 ">
        <div class="row justify-content-center">
            <!-- sidebar -->

            <!-- sidebar -->
            <!-- content -->
			            <div class="col-lg-9 ps-lg-5 row justify-content-center">
			                <header class="d-sm-flex align-items-center pb-4"></header>
			                <div class="container mt-5">
			                    <div class="row justify-content-center">
			                        <c:choose>
			                            <c:when test="${not empty books}">
			                                <c:forEach var="book" items="${books}" varStatus="status">
			                                    <c:if test="${status.index % 4 == 0 && !status.first}">
			                                        </div>
			                                        <div class="row mt-3">
			                                    </c:if>
			                                    <div class="col-lg-3 col-md-4 col-sm-6 d-flex">
			                                        <div class="card w-100 my-1 shadow rounded-4 overflow-hidden border-0">
														<a href="${pageContext.request.contextPath}/bookDetails?bookNum=${book.bookNum}">
														             <img src="${book.bname}" class="card-img-top">
														  </a>
			                                            <div class="card-body d-flex flex-column p-4">
			                                                <div class="d-flex flex-row mb-2">
			                                                 
																<a href="${pageContext.request.contextPath}/bookDetails?bookNum=${book.bookNum}" class="text-decoration-none">
																          <h6 class="mb-0 me-1 fw-bold">${book.bookTitle}</h6>
																 </a>
			                                                </div>
			                                                <p>${book.writer} <br> 
																${book.publisher}</p>
			                                                <div class="osahan-card-footer d-flex align-items-end px-0 pb-0 mt-auto">
			                                                    <a href="#!" class="btn btn-purple shadow-0 me-2 w-100">위치찾기</a>
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <c:if test="${status.index % 4 == 3}">
			                                        </div>
			                                        <div class="row mt-3">
			                                    </c:if>
			                                </c:forEach>
			                                <c:if test="${hasMore}">
			                                    <div class="col-12 text-center mt-4">
			                                        <a href="/bookSearchResult?query=${query}&type=${type}&page=${page + 1}" class="btn btn-secondary">더보기</a>
			                                    </div>
			                                </c:if>
			                            </c:when>
			                            <c:otherwise>
			                                <div class="col-12 text-center">
			                                    <h4 class="mt-5">검색 결과가 없어요😭 <br>
													검색어의 철자가 정확한지 다시 한 번 확인해주세요.</h4>
			                                </div>
			                            </c:otherwise>
			                        </c:choose>
			                    </div>
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
<script src="../js/script.js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
