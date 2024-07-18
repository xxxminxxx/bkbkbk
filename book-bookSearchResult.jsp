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
	<link rel="stylesheet" href="../css/style2.css">
	
	
<body>

	<div class="bg-elements elements-top-header position-relative">
    <!-- navbar -->
    <div class="elements-nav">
                <!-- bootom nav -->
                <nav class="navbar navbar-expand bottom-nav bg-black borer-bottom border-opacity-10 border-white py-lg-0 py-3 bg-opacity-25">
                    <div class="container">
                        <div class="position-relative d-flex align-items-center gap-2 site-brand">
                            <img src="../img/bookbookbookLogo.png" alt="북북북 로고">
                            <div class="lh-1">
                               <h5 class="fw-bold m-0 text-white">BOOKBOOKBOOK</h5>
                               <!-- <small class="text-muted text-white-50">One Page</small> -->
                            </div>
                            <a class="stretched-link" href="/"></a>
                        </div>
						
						
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav m-auto gap-4 m-none">
                                <li class="nav-item dropdown single-dropdown-nav">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 서재 </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="shop-product-grid.html">읽은 책</a></li>
                                        <li><a class="dropdown-item" href="shop-product-list.html">읽고 있는 책</a></li>
                                        <li><a class="dropdown-item" href="shop-product-full-three-coulmn.html">읽고 싶은 책</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a class="nav-link" href="#" role="button" aria-expanded="false"> 나의 캐릭터 </a>
                                </li>
                                <li class="nav-item dropdown single-dropdown-nav">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 정보 </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="shop-product-grid.html">나의 정보</a></li>
                                        <li><a class="dropdown-item" href="shop-product-list.html">나의 달력</a></li>
                                        <li><a class="dropdown-item" href="shop-product-full-three-coulmn.html">나의 메모</a></li>
                                        <li><a class="dropdown-item" href="shop-product-full-four-coulmn.html">나의 통계</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <a href="./page-login.html" class="btn btn-purple rounded-pill d-none d-lg-block btn-theme"> 로그인 </a>
                            <a href="#" class="link-light d-lg-none ms-auto" data-bs-toggle="offcanvas" data-bs-target="#sidebarnav" aria-controls="sidebarnav"><i class="ri-menu-3-line ri-lg"></i></a>
                        </div>
                    </div>
                </nav>
            </div>
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
                <header class="d-sm-flex align-items-center pb-4">
                    <!--<h4 class="d-block m-0 fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">32개 항목 발견됨</font></font></h4>-->

                </header>
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 col-sm-6 d-flex">
                        <div class="card w-10 my-1 shadow rounded-4 overflow-hidden border-0">
                            <img src="../img/sample.png" class="card-img-top">
                            <div class="card-body d-flex flex-column p-4">
                                <div class="d-flex flex-row mb-2">
                                    <div class="mb-0 me-1 fw-bold">
                                        <font style="vertical-align: inherit;">책 카테고리</font></div>
                                    <br><h5 class="mb-0 me-1 fw-bold">
                                    <font style="vertical-align: inherit;">책제목</font></h5>
                                    <span class="text-danger"><s><font style="vertical-align: inherit;"></font></s></span>
                                </div>
                                <p class=""><font style="vertical-align: inherit;">작가</font>-
                                    <font style="vertical-align: inherit;">출판사</font>
                                </p><p></p><br><p></p>
                                <div class="osahan-card-footer d-flex align-items-end px-0 pb-0 mt-auto">
                                    <a href="#!" class="btn btn-purple shadow-0 me-2 w-100"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">위치찾기</font></font></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 d-flex">
                        <div class="card w-10 my-1 shadow rounded-4 overflow-hidden border-0">
                            <img src="../img/pages/products/product-1.jpg" class="card-img-top">
                            <div class="card-body d-flex flex-column p-4">
                                <div class="d-flex flex-row mb-2">
                                    <div class="mb-0 me-1 fw-bold">
                                        <font style="vertical-align: inherit;">책 카테고리</font></div>
                                    <br><h5 class="mb-0 me-1 fw-bold">
                                    <font style="vertical-align: inherit;">책제목</font></h5>
                                    <span class="text-danger"><s><font style="vertical-align: inherit;"></font></s></span>
                                </div>
                                <p class=""><font style="vertical-align: inherit;">작가</font>-
                                    <font style="vertical-align: inherit;">출판사</font><br></p>
                                <div class="osahan-card-footer d-flex align-items-end px-0 pb-0 mt-auto">
                                    <a href="#!" class="btn btn-purple shadow-0 me-2 w-100"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">위치찾기</font></font></a>
                                </div>
                            </div>
                        </div>
                    </div>
					<!--동적으로 만든 거-->
					<div class="container mt-5">
					      <div class="row">
					          <c:forEach var="book" items="${books}" varStatus="status">
					              <c:if test="${status.index % 3 == 0 && !status.first}">
					                  </div><div class="row mt-3">
					              </c:if>
					              <div class="col-lg-3 col-md-4 col-sm-6 d-flex">
					                  <div class="card w-100 my-1 shadow rounded-4 overflow-hidden border-0">
					                      <img src="${book.imageUrl}" class="card-img-top">
					                      <div class="card-body d-flex flex-column p-4">
					                          <div class="d-flex flex-row mb-2">
					                              <div class="mb-0 me-1 fw-bold">${book.category}</div>
					                              <h5 class="mb-0 me-1 fw-bold">${book.title}</h5>
					                          </div>
					                          <p>${book.author} - ${book.publisher}<br></p>
					                          <div class="osahan-card-footer d-flex align-items-end px-0 pb-0 mt-auto">
					                              <a href="#!" class="btn btn-purple shadow-0 me-2 w-100">위치찾기</a>
					                          </div>
					                      </div>
					                  </div>
					              </div>
                                      <c:if test="${status.index % 3 == 2 || status.last}">
					                  </div><div class="row mt-3">
					              </c:if>
					          </c:forEach>
					      </div>
					  </div>
                </div>
                <!-- Pagination -->
				<nav aria-label="Page navigation example" style="width:100;">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">»</span>
                        </a>
                    </li>
                </ul>
            </nav>                <!-- Pagination -->
            </div>
        </div>
    </div>
</div>
<!-- Build Something Together -->
<div class="pt-0">
    <div class="container">
        <div class="row">
            <div class="col-12">

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
