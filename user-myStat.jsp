<%@page contentType="text/html; charset=UTF-8"%>
<%-- Core 라이브러리 (태그들이 "c:"로 시작)--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Functions 라이브러리--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- forEach 용 taglib (태그들이 "fn:"으로 시작) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko" class="translated-ltr" data-darkreader-proxy-injected="true"><head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="../img/pages/icon.png" type="image/png">
	<title>나의 통계</title>
	<!-- Bootstrap Css -->
	<link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
	<!-- Icofont Css -->
	<link rel="stylesheet" href="../venduser-myStat2.jsper/icofont/icofont.min.css">
	<!-- AOS Css -->
	<link rel="stylesheet" href="../vender/aos/dist/aos.css">
	<!-- Remix Icons -->
	<link rel="stylesheet" href="../vender/remixicon/remixicon.css">
	<!-- Custom Css -->
	<link rel="stylesheet" href="../css/style2.css">
	<!-- Common Css -->
	<link rel="stylesheet" href="../css/common.css">
	<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.26tY-h6gH9w.L.W.O/am=GAY/d=0/rs=AN8SPfrev-A3NvrBP0gNq8zXCqKY7IcBLA/m=el_main_css"><style>
	.custom-btn {
		font-size: 1.2rem;
		padding: 0.75rem 1.5rem;
		color: white;
		border: none;
		transition: all 0.3s ease;
	}

	.btn-bestseller {
		background-color: #f77808d9;
	}

	.btn-recommend {
		background-color: #D35400; /* 짙은 주황색 */
	}

	.btn-register {
		background-color: #F39C12; /* 황금빛 주황색 */
	}

	.btn-bestseller:hover {
		background-color: #e56c07;
		color: white;
	}

	.btn-recommend:hover {
		background-color: #b94b00;
		color: white;
	}

	.btn-register:hover {
		background-color: #d68910;
		color: white;
	}

	.custom-btn:hover {
		opacity: 0.9;
		transform: translateY(-2px);
		box-shadow: 0 4px 6px rgba(0,0,0,0.1);
	}

	.justify-content-center2 {
		justify-content: center !important;
		margin-top: 150px;
	}

	.elements-title.fw-bold.mb-4 {
		text-align: center;
		width: 100%;
		margin: 20px 0;
		margin-left: 300px;
	}
</style>

</head>


<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">


<div class="bg-elements elements-top-header">
	<!-- navbar -->
	<div class="elements-nav">
		<!-- bootom nav -->
		<%@ include file="../header.jsp" %>
	</div>
	<!-- header -->
	<div class="py-5">
		<div class="container pt-5">
			<div class="row justify-content-center">

				<div class="col-xl-6 col-lg-5 col-md-10 col-12">
					<div class="d-flex gap-3 align-items-center">
						<a class="btn btn-outline-light px-5 py-3 rounded-pill" href="/pages/user-myInfo"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">나의 정보</font></font>
						</a>

						<a class="btn btn-outline-light px-5 py-3 rounded-pill" href="/pages/user-myMemo"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">나의 메모</font></font></font></font></a>

						<a class="btn btn-outline-light px-5 py-3 rounded-pill" href="/pages/user-myCalendar"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">나의 달력</font></font></font></font></a><a class="btn btn-outline-light px-5 py-3 rounded-pill" href="/pages/user-myStat"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">나의 통계</font></font></font></font></a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="w-100">
		<img src="../img/pages/hero-wave.svg" alt="" class="img-fluid w-100">
	</div>
</div>
<!-- Elements Components -->
<div class="py-5" id="elements">
	<div class="container">
		<h1 class="text-center mb-4">나의 통계</h1>
		<div class="text-center">

			<c:choose>

			<%--사용자가 로그인헸고, 읽은 책이 없을때의 (userStatVO가 비어있다면) 화면--%>
			<c:when test="${not empty sessionScope.userId}">
			<c:if test="${empty userStatVO}">

			<div class="container">
				<div class="col-lg-6">
					<h4 class="elements-title fw-bold mb-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">아직 읽은 책이 없습니다</font>
					</font></h4>

				</div></div>
			<p>
			</p><div id="without-data">
			<div class="d-flex justify-content-center2">
				<a href="#" class="btn custom-btn btn-bestseller mx-2">베스트셀러 구경하러 가기</a>
				<a href="#" class="btn custom-btn btn-recommend mx-2">추천 받기</a>
				<a href="#" class="btn custom-btn btn-register mx-2">읽은 책 등록하기</a>
			</div>
			</c:if>

			<%--읽은 책이 있을때의 화면--%>
			<c:if test="${not empty userStatVO}">
			<div class="container">
				<p/><p/>
				<div class="row g-5">
					<div class="col-lg-6">

						<h5 class="elements-title fw-bold mb-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">월별 독서량</font></font></h5><h4 class="elements-title fw-bold mb-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">권수별</font></font></h4>

						<div>
							<canvas id="myChart1"></canvas>
						</div>

						<h4 class="elements-title fw-bold mb-4 mt-5"></h4>

						<h4 class="elements-title fw-bold mb-4 mt-5"></h4>

					</div>
					<div class="col-lg-6">
						<h5 class="elements-title fw-bold mb-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">월별 독서량</font></font></h5>
						<h4 class="elements-title fw-bold mb-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">페이지별</font></font></h4>

						<div>
							<canvas id="myChart2"></canvas>
						</div>

						<h4 class="elements-title fw-bold mb-4 mt-5"></h4>

						<h4 class="elements-title fw-bold mb-4 mt-5"></h4>

					</div>
				</div>
			</div>
		</div>
			</c:if>

		</div>
	</div>

	</c:when>

	<%--사용자가 로그인하지 않았을 경우의 화면--%>
	<c:otherwise>
		<div class="text-center py-5">
			<h3 class="text-muted">로그인 후 이용하실 수 있습니다.</h3>
		</div>
		<div id="without-data">
			<div class="container text-center mt-4">
				<a href="${pageContext.request.contextPath}/pages/login" class="btn btn-primary btn-lg">로그인 하러 가기</a>
			</div>
		</div>
	</c:otherwise>

	</c:choose>
</div>
</div>
</div>
<!-- Elements Section-->

<!-- Support Section-->

<!-- footer -->

<!-- Nav Sidebar -->
<div class="offcanvas offcanvas-top bg-purple text-white border-0 h-100" tabindex="-1" id="sidebarnav" aria-labelledby="sidebarnavLabel">
	<div class="offcanvas-header d-flex justify-content-end">
		<a href="#" class="link-light" data-bs-dismiss="offcanvas" aria-label="닫다"><i class="ri-close-line ri-lg"></i></a>
	</div>
	<div class="offcanvas-body">
		<div class="sidebar-nav text-center">
			<div class="position-relative d-flex align-items-center gap-2 site-brand">
				<i class="ri-slideshow-line fs-2 lh-1 text-white"></i>
				<div class="lh-1">
					<h5 class="fw-bold m-0 text-white"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">소프트웨어</font></font></h5>
					<small class="text-muted text-white-50"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">한 페이지</font></font></small>
				</div>
				<a class="stretched-link" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/index.html"></a>
			</div>
			<ul class="navbar-nav justify-content-end flex-grow-1 mt-4">
				<li class="nav-item">
					<a class="nav-link active" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/index.html"><i class="ri-apps-2-line"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">집</font></font></a>
				</li>

				<li class="nav-item dropdown osahan-mega-menu position-static">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">강요</font></font></a>
					<ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
						<li>
							<div class="dropdown-mega-content container">
								<div class="row g-0">
									<div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">요소 1</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-accordions-toggles.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">아코디언 및 토글</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-tabs.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">탭</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-icons.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">아이콘</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-pagination.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">쪽수 매기기</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-cards.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">카드</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-carousels.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회전목마</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-modals.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">모달</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-placeholders.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자리 표시자</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-medias.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">미디어</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-maps.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지도</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-forms-basic.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">양식</font></font></a></li>
										</ul>
									</div>
									<div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">요소 2</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-buttons.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">버튼</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-badges.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">배지</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-lists.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">기울기</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-offcanvas.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오프캔버스</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-image-frames.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이미지 프레임</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-testimonials.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">추천사</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-blockquotes.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">인용구</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-borders.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">국경</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-process.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">프로세스</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-countdowns.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">카운트다운</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-spinners.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">스피너</font></font></a></li>
										</ul>
									</div>
									<div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">요소 3</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-call-to-action.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">행동을 요구하다</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-pricing-tables.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가격표</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-tables.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">테이블</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-progress-bars.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">진행률 표시줄</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-colors.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">그림 물감</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-dropdowns.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">드롭다운</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-tooltips-popovers.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">툴팁 및 팝오버</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-sticky-elements.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">스티키 엘리먼트</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-typography.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">타이포그래피</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="elements-alerts.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">알림</font></font></a></li>
										</ul>
									</div>
									<div class="col-lg-3 dropdown-mega-sub-content-block d-none d-lg-block bg-light p-5 osahan-dropdown-box border-end border-opacity-10 border-dark">
										<div class="position-relative d-flex align-items-center gap-2 site-brand">
											<i class="ri-slideshow-line fs-2 lh-1 text-black"></i>
											<div class="lh-1">
												<h5 class="fw-bold m-0 text-black"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">소프트웨어</font></font></h5>
												<small class="text-muted text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">한 페이지</font></font></small>
											</div>
											<a class="stretched-link" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/index.html"></a>
										</div>
										<h5 class="text-dark mt-5 mb-2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">다목적</font></font></h5>
										<h1 class="text-primary fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">강력한 Bootstrap 기반</font></font></h1>
										<p class="lead mb-5"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
											180개 이상의 유효한 다중 페이지 및 단일 페이지 레이아웃이 있는 템플릿

										</font></font></p>
										<a class="btn btn-primary px-5 py-3" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">시작하다</font></font></a>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</li>
				<li class="nav-item dropdown single-dropdown-nav">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가게</font></font></a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-grid.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 그리드</font></font></a></li>
						<li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-list.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품 목록</font></font></a></li>
						<li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-full-three-coulmn.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 3개 컬럼</font></font></a></li>
						<li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-full-four-coulmn.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 4가지 컬럼</font></font></a></li>
						<li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-detail.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 상세 정보</font></font></a></li>
						<li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-cart.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">쇼핑 카트</font></font></a></li>
						<li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-checkout.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">쇼핑 체크아웃</font></font></a></li>
					</ul>
				</li>
				<li class="nav-item dropdown osahan-mega-menu position-static">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">추가 페이지</font></font></a>
					<ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
						<li>
							<div class="dropdown-mega-content container">
								<div class="row g-0">
									<div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">포트폴리오</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/portfolio-full-width.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">포트폴리오 전체 폭</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/portfolio-boxed.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">포트폴리오 박스형</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/portfolio-classic.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">포트폴리오 클래식</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/portfolio-masonry.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">포트폴리오 메이슨리</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/single-project.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">단일 프로젝트</font></font></a></li>
										</ul>
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">돕다</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-help-center.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지원 센터</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-help-center-categories.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">도움말 센터: 카테고리</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-help-center-article.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">도움말 센터: 기사</font></font></a></li>
										</ul>
									</div>
									<div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-grid.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그 그리드</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-grid-classic.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그 그리드 클래식</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-grid-sidebar.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그 그리드 사이드바</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-list.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그 목록</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-list-sidebar.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그 목록 오른쪽 사이드바</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-left-sidebar.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그 목록 왼쪽 사이드바</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-full-width.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그 전체 폭</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-post.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">블로그 게시물</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-author-profile.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작가 프로필</font></font></a></li>
										</ul>
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자주하는 질문</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/faq.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자주 묻는 질문 v.1</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/faq-2.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자주 묻는 질문 v.2</font></font></a></li>
										</ul>
									</div>
									<div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회사</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-hire-us.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">우리를 고용하세요</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-careers.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">경력</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-careers-role-overview.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">경력: 역할 개요</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-careers-apply.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">경력: 지원하세요</font></font></a></li>
										</ul>
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">추가 페이지</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-coming-soon.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">곧 출시 예정</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-coming-soon-simple.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">곧 출시: Simple</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-error-404.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">유지</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-error-404.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오류 404</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-terms.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이용약관</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-privacy.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">개인 정보 정책</font></font></a></li>
										</ul>
									</div>
									<div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
										<h6 class="dropdown-mega-sub-title mb-3 fw-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">내 계정</font></font></h6>
										<ul class="dropdown-mega-sub-nav list-unstyled">
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-login.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">로그인 v.1</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-login-2.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">로그인 v.2</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-signup.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가입하기 v.1</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-signup-2.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가입하기 v.2</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-reset-password.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">비밀번호를 잊으 셨나요</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/account-orders.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">명령</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/account-settings.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">설정</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/account-address.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주소</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/my-wallet.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">내 지갑</font></font></a></li>
											<li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/account-notification.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">공고</font></font></a></li>
										</ul>
									</div>
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
			<a href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/index.html" class="btn btn-warning rounded-0"> <i class="ri-shopping-cart-line me-2"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지금 구입</font></font></a>
		</div>
	</div>
</div>
<!-- Video Modal -->
<div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="videoModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content bg-transparent border-0 rounded-0">
			<div class="modal-header d-flex justify-content-end border-0 py-0">
				<a href="#" class="link-light" data-bs-dismiss="modal" aria-label="닫다"><i class="ri-close-fill ri-2x"></i></a>
			</div>
			<div class="modal-body px-5">
				<div class="ratio ratio-16x9">
					<iframe src="https://www.youtube.com/embed/gu-HhgJ7vfM?si=egwKhEDMVeXg3IuJ" title="유튜브 비디오 플레이어" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 푸터 포함 -->


<footer class="footer-container text-white py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-6 mb-2 mb-md-0">
				<p class="mb-0">
					<small>
						위치: 서울 마포구 백범로 23<br>
						연락처: 02-739-7235 | 이메일: hi@bookbookbook.com<br>
						이용약관 | 개인정보처리방침
					</small>
				</p>
			</div>
		</div>
	</div>
</footer>

<style>
	.footer-container{
		background-color: #e74c3c;
	}

	@font-face {
		font-family: 'DungGeunMo';
		src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	footer{
		font-family: 'DungGeunMo';
	}


</style><style class="darkreader darkreader--sync" media="screen"></style>

<!-- Bootsrap Bundle Js -->
<script src="../vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Jquery Js -->
<script src="../vender/jquery/jquery-3.6.4.min.js"></script>
<!-- AOS Js -->
<script src="../vender/aos/dist/aos.js"></script>
<!-- Custom Js -->
<script src="../js/script.js"></script><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top" style="display: block;">Top</button><button id="back-to-top" title="Go to top" style="display: block;">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="위로 이동" style="display: block;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">맨 위</font></font></button><div id="goog-gt-tt" class="VIpgJd-yAWNEb-L7lbkb skiptranslate" style="border-radius: 12px; margin: 0 0 0 -23px; padding: 0; font-family: 'Google Sans', Arial, sans-serif;" data-id=""><div id="goog-gt-vt" class="VIpgJd-yAWNEb-hvhgNd"><div class=" VIpgJd-yAWNEb-hvhgNd-l4eHX-i3jM8c"><img src="https://fonts.gstatic.com/s/i/productlogos/translate/v14/24px.svg" width="24" height="24" alt=""></div><div class=" VIpgJd-yAWNEb-hvhgNd-k77Iif-i3jM8c"><div class="VIpgJd-yAWNEb-hvhgNd-IuizWc" dir="ltr">원본 텍스트</div><div id="goog-gt-original-text" class="VIpgJd-yAWNEb-nVMfcd-fmcmS VIpgJd-yAWNEb-hvhgNd-axAV1"></div></div><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid ltr"><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od ltr" dir="ltr"><div class="VIpgJd-yAWNEb-hvhgNd-UTujCb">번역 평가</div><div class="VIpgJd-yAWNEb-hvhgNd-eO9mKe">보내주신 의견은 Google 번역을 개선하는 데 사용됩니다.</div></div><div class="VIpgJd-yAWNEb-hvhgNd-xgov5 ltr"><button id="goog-gt-thumbUpButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋음" aria-label="번역 품질 좋음" aria-pressed="false"><span id="goog-gt-thumbUpIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7l-3 7H9V8l4.34-4.34L12 9h9v2z"></path></svg></span><span id="goog-gt-thumbUpIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7v13h11c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM5 7H1v13h4V7z"></path></svg></span></button><button id="goog-gt-thumbDownButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋지 않음" aria-label="번역 품질 좋지 않음" aria-pressed="false"><span id="goog-gt-thumbDownIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z"></path></svg></span><span id="goog-gt-thumbDownIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zm16 0h4V4h-4v13z"></path></svg></span></button></div></div><div id="goog-gt-votingHiddenPane" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><form id="goog-gt-votingForm" action="//translate.googleapis.com/translate_voting?client=te_lib" method="post" target="votingFrame" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><input type="text" name="sl" id="goog-gt-votingInputSrcLang"><input type="text" name="tl" id="goog-gt-votingInputTrgLang"><input type="text" name="query" id="goog-gt-votingInputSrcText"><input type="text" name="gtrans" id="goog-gt-votingInputTrgText"><input type="text" name="vote" id="goog-gt-votingInputVote"></form><iframe name="votingFrame" frameborder="0"></iframe></div></div></div>


</body></html>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!--월별 권수 차트-->
<script>
	// 데이터와 월 정보를 저장할 배열 초기화
	let datax = [];
	let monthx = [];
	// JSP의 JSTL을 사용하여 서버에서 전달받은 데이터를 JavaScript 배열에 추가
	<c:forEach items="${userStatVO2}" var="vo">
	datax.push(${vo.bookCount}); // 각 월의 책 수를 datax 배열에 추가
	monthx.push(${vo.bookMonth}+'월'); // 월 정보를 monthx 배열에 추가
	</c:forEach>
</script>

<script>
	// 'myChart1' ID를 가진 캔버스 요소를 가져옴
	const ctx = document.getElementById('myChart1');
	// Chart.js를 사용하여 새로운 차트 생성
	new Chart(ctx, {
		type: 'bar',
		data: {
			labels: monthx,
			datasets: [{
				label: '권수별 읽은 책',
				data: datax,
				borderWidth: 1,
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(255, 205, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(201, 203, 207, 0.2)',
					'rgba(255, 138, 101, 0.2)',
					'rgba(100, 181, 246, 0.2)',
					'rgba(165, 214, 167, 0.2)',
					'rgba(240, 98, 146, 0.2)',
					'rgba(187, 143, 206, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(255, 205, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(201, 203, 207, 0.2)',
					'rgba(255, 138, 101, 0.2)',
					'rgba(100, 181, 246, 0.2)',
					'rgba(165, 214, 167, 0.2)',
					'rgba(240, 98, 146, 0.2)',
					'rgba(187, 143, 206, 0.2)'
				],
			}]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			}
		}
	});
</script>


<!--월별 페이지수-->
<script>
	let datax2= [];
	let monthx2 = [];
	<c:forEach items="${userStatVO}" var="vo">
	datax2.push(${vo.percent});
	monthx2.push('${vo.titleLengthStr}');
	</c:forEach>
</script>

<script>
	const ctx2 = document.getElementById('myChart2');
	new Chart(ctx2, {
		type: 'line',
		data: {
			labels: monthx2,
			datasets: [{
				label: '페이지별',
				data: datax2,
				borderWidth: 1,
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(255, 205, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(201, 203, 207, 0.2)',
					'rgba(255, 138, 101, 0.2)',
					'rgba(100, 181, 246, 0.2)',
					'rgba(165, 214, 167, 0.2)',
					'rgba(240, 98, 146, 0.2)',
					'rgba(187, 143, 206, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(255, 205, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(201, 203, 207, 0.2)',
					'rgba(255, 138, 101, 0.2)',
					'rgba(100, 181, 246, 0.2)',
					'rgba(165, 214, 167, 0.2)',
					'rgba(240, 98, 146, 0.2)',
					'rgba(187, 143, 206, 0.2)'
				],
			}]
		},
		options: { elements: {
				line: {
					borderWidth: 3
				}
			}
		}
	});
</script>
