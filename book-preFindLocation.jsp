<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko" class="translated-ltr">
<head>
	<!-- 메타 태그 설정 -->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- 파비콘 설정 -->
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
	<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.26tY-h6gH9w.L.W.O/am=GAY/d=0/rs=AN8SPfrev-A3NvrBP0gNq8zXCqKY7IcBLA/m=el_main_css"><link rel="stylesheet" href="../css/user-bookSearchResult.css">
</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
<div class="bg-elements elements-top-header position-relative">

	<!-- navbar -->
	<div class="elements-nav">
		<!-- bootom nav -->
		<style>
			.custom-select {
				width: auto; 
			}
			.search-button {
				width: 40px;
				height: 40px; 
				padding: 0; 
				margin-top: 8px;
				margin-right: 5px;
			}
		</style>

		<nav class="navbar navbar-expand bottom-nav bg-black borer-bottom border-opacity-10 border-white py-lg-0 py-3 bg-opacity-25">
			<div class="container">
				<div class="position-relative d-flex align-items-center gap-2 site-brand">
					<img src="../img/bookbookbookLogo.png" alt="북북북 로고">
					<div class="lh-1">
						<h5 class="fw-bold m-0 text-white">BOOKBOOKBOOK</h5>
					</div>
					<a class="stretched-link" href="/"></a>
				</div>


				<div class="collapse navbar-collapse">
					<ul class="navbar-nav m-auto gap-4 m-none">
						<li class="nav-item dropdown single-dropdown-nav">
							<a class="nav-link" href="/pages/user-myBookshelf" role="button" aria-expanded="false"> 나의 서재 </a>

						</li>
						<li>
							<a class="nav-link" href="/pages/user-myCharacters" role="button" aria-expanded="false"> 나의 캐릭터 </a>
						</li>
						<li class="nav-item dropdown single-dropdown-nav">
							<a class="nav-link dropdown-toggle" href="/pages/user-myInfo" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 정보 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/pages/user-myInfo">나의 정보</a></li>
								<li><a class="dropdown-item" href="/pages/user-myCalendar">나의 달력</a></li>
								<li><a class="dropdown-item" href="/pages/user-myMemo">나의 메모</a></li>
								<li><a class="dropdown-item" href="/pages/user-myStat">나의 통계</a></li>
							</ul>
						</li>
					</ul>
					<!--검색 폼-->
					<form class="d-flex justify-content-center" action="/bookSearchResult" method="get">
						<div class="input-group border border-2 border-dark rounded-pill overflow-hidden bg-white p-1" style="max-width: 800px;">
							<select name="type" class="form-select form-select-xs custom-select" style="border-radius: 50px;">
								<option value="title">제목</option>
								<option value="writer">작가</option>
								<option value="publisher">출판사</option>
								<option value="bookPreview">소개글</option>
							</select>
							<input type="text" class="form-control border-0 py-3 px-4" placeholder="책을 검색해 보세요!" aria-label="Enter your query" name="query" required="">
							<input type="image" src="../img/searchIcon.png" class="search-button" alt="검색하기" id="app">
						</div>
					</form>


					<div class="d-flex align-items-center">



						<a href="/pages/login" class="btn btn-purple rounded-pill btn-theme">로그인</a>


					</div>
				</div>
			</div>
		</nav>

		<!-- header -->
		<div class="svg-border-rounded text-light">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144.54 17.34" preserveAspectRatio="none" fill="#ffffff"><path d="M144.54,17.34H0V0H144.54ZM0,0S32.36,17.34,72.27,17.34,144.54,0,144.54,0"></path></svg>
		</div>
	</div>
	<!-- 메인 컨텐츠 영역 -->
	<div class="py-5">
		<div class="container py-4 ">
			<div class="py-5">
				<div class="container mt-5 text-center" style="max-width: 900px;">
					<h1 id="list" class="mb-4">도서 보유 도서관 목록</h1><p></p>
					<div style="height: 30px;"></div>
					
					<!-- 도서관 검색 폼 -->
					<form action="/findLibraries" method="get" class="mb-4">
						<input type="hidden" name="isbn" value="${param.isbn}">
						<input type="hidden" name="bookTitle" value="${param.bookTitle}">
						<div class="row mb-3">
							<div class="col-md-4">
								<select class="form-control doSelect" name="doName">
									<option value="" selected="" disabled="">시/도 선택</option>
									<c:forEach var="region" items="${regions}">
										<option value="${region}">${region}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-4">
								<select class="form-control gugunSelect" name="localCode">
									<option value="" selected="" disabled="">구/군 선택</option>
								</select>
							</div>
							<div class="col-md-4">
								<button type="submit" class="btn btn-primary btn-block">검색하기</button>
							</div>
						</div>
					</form>
					<p>

						<!-- 검색 결과가 없을 경우 메시지 표시 -->
						<c:if test="${empty libraries}">
					<p class="alert alert-warning">해당 도서를 보유한 도서관이 없습니다.</p>
					</c:if>
					</p>

					<!-- 검색 결과 표시 -->
					<c:choose>
						<c:when test="${not empty libraries}">
							<!-- 도서관 목록 테이블 -->
							<div class="table-responsive" style="height: 25em;">
								<table class="table table-striped">
									<thead>
									<tr>
										<th>도서관 이름</th>
										<th>주소</th>
										<th>전화번호</th>
										<th>웹사이트</th>
										<th>위치찾기</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${libraries}" var="library">
										<tr>
											<td>${library.libraryName}</td>
											<td>${library.address}</td>
											<td>${library.libraryTel}</td>
											<td><a href="${library.url}" target="_blank">${library.url}</a></td>
											<td style="display:none;">${library.latitude}</td>
											<td style="display:none;">${library.longitude}</td>
											<td style="display:none;">${library.localCode}</td>
											<td style="display:none;">${library.libraryCode}</td>
											<td><button class="btn btn-secondary btn-sm" value="위치찾기">위치찾기</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>

						</c:when>
						<c:otherwise>
							<!-- 결과가 없을 경우 빈 공간 -->
							<div style="height: 20em;"></div>
						</c:otherwise>
					</c:choose>

					<style>
						#list {
							color: #eee !important;
						}

						.table-striped>tbody>tr:nth-of-type(odd)>* {
							color: #eee !important;
						}

						.table{
							color: #eee !important;
						}

						.btn {
							background-color: #F14F00 !important;
						}

						.container {
						    padding-top: 20px;
						    padding-bottom: 20px;
						}

						.table-responsive {
						    margin-bottom: -50px; /* 필요에 따라 값 조정 */
						}
						
					</style>

					<!-- 지도를 표시할 div -->
					<div id="map" style="width:100%;height:400px;display:none;margin-top:20px;"></div>
				</div>
			</div>
		</div>
	</div>


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
						<h5 class="fw-bold m-0 text-white">북북북</h5>
					</div>
					<a class="stretched-link" href="../index.html"></a>
				</div>
				<ul class="navbar-nav justify-content-end flex-grow-1 mt-4">
					<li class="nav-item">
						<a class="nav-link" href="#"><font style="vertical-align: inherit;">나의 서재</font></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#"><font style="vertical-align: inherit;">나의 캐릭터</font></a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font style="vertical-align: inherit;">나의 정보</font></a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="../pages/page-help-center.html"><font style="vertical-align: inherit;">나의 정보</font></a></li>
							<li><a class="dropdown-item" href="../pages/page-help-center.html"><font style="vertical-align: inherit;">나의 달력</font></a></li>
							<li><a class="dropdown-item" href="../pages/page-help-center.html"><font style="vertical-align: inherit;">나의 메모</font></a></li>
							<li><a class="dropdown-item" href="../pages/page-help-center-categories.html"><font style="vertical-align: inherit;">나의 통계</font></a></li>
						</ul>
					</li>
				</ul>
				<a href="/pages/user-login" class="btn btn-purple rounded-pill d-none d-lg-block btn-theme"> 로그인 </a>
			</div>
		</div>
	</div>

<!-- 푸터 포함 -->
<%@ include file="../footer.jsp" %>

<style>
	.footer-container {
		background-color: #e74c3c;
		width: 100%; /* 추가 */
		position: relative;
		left: 0;
		right:100;
		bottom: 0;
	}

	@font-face {
		font-family: 'DungGeunMo';
		src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	footer {
		font-family: 'DungGeunMo';
	}
	a {
		color: white;
	}
	h1, h2, h3 {
		color: #333;
	}
	p, ul {
		margin-bottom: 20px;
	}
	ul {
		list-style-type: disc;
		padding-left: 20px;
	}

	.article {
		margin-bottom: 40px;
	}
	.content-wrapper {
	    padding-bottom: 60px; /* 푸터의 높이만큼 여백 추가 */
	}
</style>

<!--Bootsrap Bundle Js -->
<script src="../vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<!--Jquery Js -->
<script src="../vender/jquery/jquery-3.6.4.min.js"></script>
<!--AOS Js -->
<script src="../vender/aos/dist/aos.js"></script>
<!--Custom Js -->
<script src="../js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--Kakao 지도 API 스크립트 로드 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c34ef6f56c1983ad614130aef064a5"></script>
<script charset="UTF-8" src="http://t1.daumcdn.net/mapjsapi/js/main/4.4.19/kakao.js"></script>
<!--jQuery 라이브러리 로드 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--user-myInfo Js -->
<script src="../js/book-preFindLocation.js"></script>
</body</html>
