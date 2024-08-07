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

		<!-- header -->
		<%@ include file="../header.jsp" %>

		<!-- 메인 컨텐츠 영역 -->
		<div class="py-5">
			<div class="container py-4 ">
				<div class="py-5">
					<div class="container mt-5 text-center" style="max-width: 900px;">
						<h1 id="list" class="mb-4">도서 보유 도서관 목록</h1><p></p>
						<div style="height: 30px;"></div>

						<!-- 도서관 검색 폼 -->
						<form action="/findLibraries" method="get" class="mb-4">
							<!-- 숨겨진 입력 필드: ISBN과 도서 제목 -->
							<input type="hidden" name="isbn" value="${param.isbn}">
							<input type="hidden" name="bookTitle" value="${param.bookTitle}">
							<div class="row mb-3">
								<!-- 시/도 선택 드롭다운 -->
								<div class="col-md-5">
									<select class="form-control doSelect" name="doName" id="doName">
										<option value="" selected="" disabled="">시/도 선택</option>
										<c:forEach var="region" items="${regions}">
											<option value="${region}">${region}</option>
										</c:forEach>
									</select>
								</div>
								<!-- 구/군 선택 드롭다운 -->
								<div class="col-md-5">
									<select class="form-control gugunSelect" name="localCode" id="localCode">
										<option value="" selected="" disabled="">구/군 선택</option>
									</select>
								</div>
								<!-- 검색 버튼 -->
								<div class="col-md-2">
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

						<!-- 검색 결과 표시 시작 -->
						<c:choose>
							<c:when test="${not empty libraries}">
								<!-- 도서관 목록 테이블 시작-->
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
										<!-- 각 도서관 정보를 행으로 표시 -->
										<c:forEach items="${libraries}" var="library">
											<tr>
												<td>${library.libraryName}</td>
												<td>${library.address}</td>
												<td>${library.libraryTel}</td>
												<td><a href="${library.url}" target="_blank">${library.url}</a></td>
												<!-- 숨겨진 위도, 경도, 지역코드, 도서관코드 -->
												<td style="display:none;">${library.latitude}</td>
												<td style="display:none;">${library.longitude}</td>
												<td style="display:none;">${library.localCode}</td>
												<td style="display:none;">${library.libraryCode}</td>
												<!-- 위치찾기 버튼 -->
												<td><button class="btn btn-secondary btn-sm" value="위치찾기">위치찾기</button></td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- 도서관 목록 테이블 끝 -->
							</c:when>
							<c:otherwise>
								<!-- 결과가 없을 경우 빈 공간 -->
								<div style="height: 20em;"></div>
							</c:otherwise>
						</c:choose>
						<!-- 검색 결과 표시 끝 -->

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
</html>
