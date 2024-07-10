<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>도서 추천</title>
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
		<link rel="stylesheet" href="../css/style2.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
    </head>
    <body>
        
        <div class="bg-elements elements-top-header position-relative">
            <!-- navbar -->
            <div class="elements-nav">
                <!-- bootom nav -->
                <nav class="navbar navbar-expand bottom-nav bg-black borer-bottom border-opacity-10 border-white py-lg-0 py-3 bg-opacity-25">
                    <div class="container">
                        <div class="position-relative d-flex align-items-center gap-2 site-brand">
                            <img src="../img/bookbookbookLogo.png" alt="북북북 로고"/>
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
                                <h1 class="fw-bolder display-5 mb-3">카테고리별 도서 추천</h1>
                                <!-- <p class="m-0 text-white-50">Last updated: January 2024</p> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="svg-border-rounded text-light">
                <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 144.54 17.34" preserveaspectratio="none" fill="#ffffff"><path d="M144.54,17.34H0V0H144.54ZM0,0S32.36,17.34,72.27,17.34,144.54,0,144.54,0"></path></svg>
            </div>
        </div>
        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-12">
                        <div class="sticky-sidebar p-3">
                            <div class="mb-4">
                               <!-- <button class="btn btn-outline-purple mb-3 w-100 d-lg-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    Show filter
                                  </button>-->
                                  <div class="collapse d-lg-block mb-5" id="collapseExample">
                                    <div class="accordion osahan-filter">
                                        <div class="accordion-item">
                                          <h2 class="accordion-header">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                카테고리 대분류
                                            </button>
                                          </h2>
                                          <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                <ul class="list-unstyled m-0">
                                                    <li class="mb-1"><a href="#" class="text-dark">건강/취미 </a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">경제경영 </a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">과학</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">대학교재</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">만화</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">사회과학</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">소설/시/희곡</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">어린이</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">에세이</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">여행</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">역사</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">예술/대중문화</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">외국어</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">요리/살림</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">유아</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">인문학</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">자기계발</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">잡지</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">장르소설</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">종교/역학</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">좋은부모</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">청소년</a></li>
                                                    <li class="mb-1"><a href="#" class="text-dark">컴퓨터/모바일</a></li>
                                                </ul>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                  카테고리 중분류
                                              </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                              <div class="accordion-body">
                                                  <ul class="list-unstyled m-0">
                                                      <li class="mb-1"><a href="#" class="text-dark">중분류 카테고리 항목 출력해오기 </a></li>
													  <li class="mb-1"><a href="#" class="text-dark">{category.middle}</a></li>
                                                      <li class="mb-1"><a href="#" class="text-dark">Books, Magazines </a></li>
                                                      <li class="mb-1"><a href="#" class="text-dark"></a></li>
                                                  </ul>
                                              </div>
                                            </div>
                                          </div>
                                          <div class="accordion-item">
                                            <h2 class="accordion-header">
                                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                  카테고리 소분류
                                              </button>
                                            </h2>
                                            <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                              <div class="accordion-body">
                                                  <ul class="list-unstyled m-0">
                                                      <li class="mb-1"><a href="#" class="text-dark">소분류 카테고리 항목 출력해오기 </a></li>
                                                      <li class="mb-1"><a href="#" class="text-dark">Home items </a></li>
                                                      <li class="mb-1"><a href="#" class="text-dark">Books, Magazines </a></li>
                                                      <li class="mb-1"><a href="#" class="text-dark"></a></li>
                                                      
                                                  </ul>
                                              </div>
                                            </div>
                                          </div>
                                          <div class="accordion-item">
                                            <h2 class="accordion-header">
                                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThreew" aria-expanded="false" aria-controls="collapseThreew">
                                                평점
                                              </button>
                                            </h2>
                                            <div id="collapseThreew" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                              <div class="accordion-body">
                                                <!-- Default checkbox -->
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        <i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i>
                                                    </label>
                                                </div>
                                                <!-- Default checkbox -->
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        <i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-secondary"></i>
                                                    </label>
                                                </div>
                                                <!-- Default checkbox -->
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        <i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-secondary"></i><i class="ri-star-fill text-secondary"></i>
                                                    </label>
                                                </div>
                                                <!-- Default checkbox -->
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        <i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-secondary"></i><i class="ri-star-fill text-secondary"></i><i class="ri-star-fill text-secondary"></i>
                                                    </label>
                                                </div>
                                                <!-- Default checkbox -->
                                                <div class="form-check mb-0">
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        <i class="ri-star-fill text-warning"></i><i class="ri-star-fill text-secondary"></i><i class="ri-star-fill text-secondary"></i><i class="ri-star-fill text-secondary"></i><i class="ri-star-fill text-secondary"></i>
                                                    </label>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                      </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-12">
                        <div class="p-3">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <small>선택하신 분야에 맞는 책은 다음과 같습니다.</small>
                                <select class="form-select w-25" aria-label="Default select example">
                                    <option selected>정렬</option>
                                    <option value="1">이름 오름차순 정렬</option>
                                    <option value="2">이름 내림차순 정렬</option>
                                    <option value="3">발매일 순 정렬</option>
                                    <option value="4">평점 순 정렬</option>
                                    <option value="5">페이지 수 많은 순 정렬</option>
                                </select>
                            </div>
                            <div class="row g-4">
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html" class="position-relative">
                                            <span class="badge bg-purple rounded-1 p-2 position-absolute m-3">인기도서</span> <img src="../img/pages/products/product-1.jpg" class="card-img-top rounded" alt="featured-1">
                                        </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i>
                                                <i class="ri-star-fill text-warning"></i>
                                            </div>
                                            <h6 class="card-title lh-base">데이터 가져와서 출력 하기</h6>
                                            <p class="card-text">
                                                $70.00 <span class="text-muted small"><del>$80.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html"> <img src="../img/pages/products/product-2.jpg" class="card-img-top rounded" alt="featured-1"> </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-half-line text-warning"></i>
                                                <i class="ri-star-fill text-body-tertiary"></i>
                                            </div>
                                            <h6 class="card-title lh-base">when an unknown printer took a galley of type.</h6>
                                            <p class="card-text">
                                                $55.00 <span class="text-muted small"><del>$65.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html" class="position-relative">
                                            <span class="badge bg-purple rounded-1 p-2 position-absolute m-3">SALE!</span> <img src="../img/pages/products/product-3.jpg" class="card-img-top rounded" alt="featured-1">
                                        </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-body-tertiary"></i>
                                                <i class="ri-star-fill text-body-tertiary"></i>
                                            </div>
                                            <h6 class="card-title lh-base">Lorem ipsum dolor sit amet consectetur.</h6>
                                            <p class="card-text">
                                                $45.00 <span class="text-muted small"><del>$60.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html" class="position-relative">
                                            <span class="badge bg-purple rounded-1 p-2 position-absolute m-3">SALE!</span> <img src="../img/pages/products/product-4.jpg" class="card-img-top rounded" alt="featured-1">
                                        </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i>
                                                <i class="ri-star-fill text-body-tertiary"></i>
                                            </div>
                                            <h6 class="card-title lh-base">Lorem ipsum dolor sit amet consectetur adipisicing.</h6>
                                            <p class="card-text">
                                                $35.00 <span class="text-muted small"><del>$40.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html" class="position-relative">
                                            <span class="badge bg-purple rounded-1 p-2 position-absolute m-3">SALE!</span> <img src="../img/pages/products/product-5.jpg" class="card-img-top rounded" alt="featured-1">
                                        </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i>
                                                <i class="ri-star-fill text-warning"></i>
                                            </div>
                                            <h6 class="card-title lh-base">Lorem Ipsum is simply dummy text of the printing.</h6>
                                            <p class="card-text">
                                                $70.00 <span class="text-muted small"><del>$80.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html"> <img src="../img/pages/products/product-6.jpg" class="card-img-top rounded" alt="featured-1"> </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-half-line text-warning"></i>
                                                <i class="ri-star-fill text-body-tertiary"></i>
                                            </div>
                                            <h6 class="card-title lh-base">when an unknown printer took a galley of type.</h6>
                                            <p class="card-text">
                                                $55.00 <span class="text-muted small"><del>$65.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html" class="position-relative">
                                            <span class="badge bg-purple rounded-1 p-2 position-absolute m-3">SALE!</span> <img src="../img/pages/products/product-7.jpg" class="card-img-top rounded" alt="featured-1">
                                        </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-body-tertiary"></i>
                                                <i class="ri-star-fill text-body-tertiary"></i>
                                            </div>
                                            <h6 class="card-title lh-base">Lorem ipsum dolor sit amet consectetur.</h6>
                                            <p class="card-text">
                                                $45.00 <span class="text-muted small"><del>$60.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html" class="position-relative">
                                            <span class="badge bg-purple rounded-1 p-2 position-absolute m-3">SALE!</span> <img src="../img/pages/products/product-8.jpg" class="card-img-top rounded" alt="featured-1">
                                        </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i>
                                                <i class="ri-star-fill text-body-tertiary"></i>
                                            </div>
                                            <h6 class="card-title lh-base">Lorem ipsum dolor sit amet consectetur adipisicing.</h6>
                                            <p class="card-text">
                                                $35.00 <span class="text-muted small"><del>$40.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="card bg-transparent border-0 h-100">
                                        <a href="shop-product-detail.html" class="position-relative">
                                            <span class="badge bg-purple rounded-1 p-2 position-absolute m-3">SALE!</span> <img src="../img/pages/products/product-1.jpg" class="card-img-top rounded" alt="featured-1">
                                        </a>
                                        <div class="card-body px-0">
                                            <div class="d-flex align-items-center gap-2 mb-2">
                                                <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-warning"></i> <i class="ri-star-fill text-body-tertiary"></i>
                                                <i class="ri-star-fill text-body-tertiary"></i>
                                            </div>
                                            <h6 class="card-title lh-base">Lorem ipsum dolor sit amet consectetur.</h6>
                                            <p class="card-text">
                                                $45.00 <span class="text-muted small"><del>$60.00</del></span>
                                            </p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="text-center mt-5 mb-5">
                                        <!-- <div class="spinner-border" role="status">
                                          <span class="visually-hidden">Loading...</span>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
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
        <div class="offcanvas offcanvas-top bg-purple text-white border-0 h-100" tabindex="-1" id="sidebarnav" aria-labelledby="sidebarnavLabel">
            <div class="offcanvas-header d-flex justify-content-end">
                <a href="#" class="link-light" data-bs-dismiss="offcanvas" aria-label="Close"><i class="ri-close-line ri-lg"></i></a>
            </div>
            <div class="offcanvas-body">
                <div class="sidebar-nav text-center">
                    <div class="position-relative d-flex align-items-center gap-2 site-brand">
                            <!--<i class="ri-slideshow-line fs-2 lh-1 text-white"></i>-->
                            <div class="lh-1">
                               <h5 class="fw-bold m-0 text-white">BOOKBOOKBOOK</h5>
                            </div>
                            <a class="stretched-link" href="../index.html"></a>
                        </div>
                    <ul class="navbar-nav justify-content-end flex-grow-1 mt-4">
                        <li class="nav-item dropdown osahan-mega-menu position-static">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 서재  </a>
                            <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                                <li>
                                    <div class="dropdown-mega-content container">
                                        <div class="row g-0">
                                            <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                                <!--<h6 class="dropdown-mega-sub-title mb-3 fw-bold">Elements 1</h6>-->
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../elements/elements-accordions-toggles.html">읽은 책</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../elements/elements-tabs.html">읽고 있는 책</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../elements/elements-icons.html">읽고 싶은 책</a></li>
                                                    </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown single-dropdown-nav">
                            <a class="nav-link " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 캐릭터 </a>
                          
                        </li>
                        <li class="nav-item dropdown osahan-mega-menu position-static">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 정보 </a>
                            <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                                <li>
                                    <div class="dropdown-mega-content container">
                                        <div class="row g-0">
                                            <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                               <!-- <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Portfolio</h6>-->
                                                <ul class="dropdown-mega-sub-nav list-unstyled">
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-full-width.html">나의 정보 수정</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-boxed.html">나의 달력</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-classic.html">나의 메모</a></li>
                                                    <li><a class="dropdown-item px-0 py-1 bg-transparent" href="portfolio-masonry.html">나의 통계</a></li>
                                                </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="d-flex align-items-center justify-content-center gap-3 my-4">
                        <a href="#" class="link-light"><i class="ri-facebook-circle-fill"></i></a> <a href="#" class="link-light"><i class="ri-twitter-fill"></i></a> <a href="#" class="link-light"><i class="ri-instagram-fill"></i></a>
                        <a href="#" class="link-light"><i class="ri-linkedin-box-fill"></i></a>
                    </div>
                    <a href="../index.html" class="btn btn-warning rounded-0"> <i class="ri-door-line me-2"></i> 로그아웃 </a>
                </div>
            </div>
        </div>
        
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
    </body>
	
</html>
