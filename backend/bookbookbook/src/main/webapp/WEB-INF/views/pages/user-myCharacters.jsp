<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" data-darkreader-proxy-injected="true" data-darkreader-mode="dynamic" data-darkreader-scheme="dark">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../img/pages/icon.png" type="image/png">
    <title>북북북 | 나의 캐릭터</title>
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
    <link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.26tY-h6gH9w.L.W.O/am=GAY/d=0/rs=AN8SPfrev-A3NvrBP0gNq8zXCqKY7IcBLA/m=el_main_css"></head>
	<!-- user-myCharacters Css -->
	<link rel="stylesheet" href="../css/user-myCharacters.css">
	<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.26tY-h6gH9w.L.W.O/am=GAY/d=0/rs=AN8SPfrev-A3NvrBP0gNq8zXCqKY7IcBLA/m=el_main_css"><style id="__web-inspector-hide-shortcut-style__">
	.__web-inspector-hide-shortcut__, .__web-inspector-hide-shortcut__ *, .__web-inspector-hidebefore-shortcut__::before, .__web-inspector-hideafter-shortcut__::after
	{
	    visibility: hidden !important;
	}
	</style>
</head>
	

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

<div class="bg-elements elements-top-header position-relative">
	<div class="bg-elements elements-top-header">
	    <!-- navbar -->
	    <div class="elements-nav">
	        <!-- bootom nav -->
	        <%@ include file="../header.jsp" %>
	    </div>
	    <!-- header -->
	    <div class="py-5 top-header">
	        <div class="container py-5">
	            <div class="row align-items-center justify-content-center">
	                <div class="col-xl-6 col-lg-5 col-md-10 col-12 text-center">
	                    <div class="text-white">
	                        <h1 class="fw-bolder display-5 mb-3" id="title-character">&#x1F436; 나의 캐릭터 &#x1F436;</h1>
	                        <!-- <p class="-0 text-white-50">Last updated: January 2024</p> -->
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="svg-border-rounded text-light">
	        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144.54 17.34" preserveAspectRatio="none" fill="#fff5f2 " data-darkreader-inline-fill="" style="--darkreader-inline-fill: #181a1b;"><path d="M144.54,17.34H0V0H144.54ZM0,0S32.36,17.34,72.27,17.34,144.54,0,144.54,0"></path></svg>
	    </div>
	</div>
</div>
<!-- Elements Components -->
<div class="py-5 bg-light">
  <div class="container py-5">
    <div class="row justify-content-center g-5">
      <div class="col-lg-10">
        <div class="bg-white rounded-4 shadow p-4">
			<c:choose>
				<c:when test="${not empty sessionScope.userId}">
          <div class="p-7">
			<div class="current-character text-center mb-5">
				<c:forEach items="${characters}" var="character">
				    <c:if test="${character.characterNum == userLevel}">
						<div class="character-flex">
						
		                    <dotlottie-player class="small-lottie" src="https://lottie.host/0aa9ab43-56fe-405b-a19f-9e02022853c9/53sb2f5hiz.json" background="transparent" speed="0.8" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
		                    
		                    <!-- 이미지 -->
		                    <img src="../img/코기${character.characterNum}.png" alt="Current Character" class="rounded-circle mb-3" id="currentCharacterImg">
		                    
		                    <!-- 두 번째 Lottie -->
		                    <dotlottie-player class="flipped" src="https://lottie.host/0aa9ab43-56fe-405b-a19f-9e02022853c9/53sb2f5hiz.json" background="transparent" speed="0.8" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
		                </div>
		                
		                <!-- 캐릭터 정보 -->
		                <h2 id="currentCharacterName">${character.characterName}</h2>
		                <h4 id="currentCharacterStage">${character.characterNum}단계</h4>
		                <p id="currentCharacterStroy">
		                    <a href="/pages/user-myCharactersDetail?stage=${character.characterNum}" id="characterStoryLink">캐릭터 스토리 보러가기</a>
		                </p>
				    </c:if>
				</c:forEach>
			</div>
			<div class="character-grid">
				<c:forEach items="${characters}" var="character">
				    <c:set var="isVisible" value="${character.characterNum <= userLevel}" />
				    <div class="character-item" data-height="${character.characterStage}권"
				         data-visible="${isVisible}" data-stage="${character.characterNum}">
				        <p class="character-rank">${character.characterNum}단계</p>
				        <c:choose>
				            <c:when test="${isVisible}">
				                <img src="${character.cfrealname}" alt="${character.characterName}">
				                <p class="character-name">${character.characterName}</p>
				                <div class="character-length">${character.characterStage}권</div>
				            </c:when>
				            <c:otherwise>
							    <dotlottie-player class="questionmark" src="https://lottie.host/7207c719-1703-41dd-853e-73de1a43f9f4/p5QiWkIb5b.json" background="transparent" speed="0.5" style="width: 90px; height: 90px;" loop autoplay></dotlottie-player>
				                <p class="character-name">???</p>
				                <div class="character-length">???</div>
				            </c:otherwise>
				        </c:choose>
				    </div>
				</c:forEach>
				</div><!-- end of character-grid -->
	        </div><!-- end of p-7 -->
			</c:when>
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
	      </div><!-- end of bg-white rounded-4 shadow p-4 -->
	    </div>
	  </div>
	</div>
</div>
<!-- Elements Section-->

<!-- Support Section-->

<!-- footer -->

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
<script src="../js/script.js"></script><button id="back-to-top" title="Go to top" style="display: block;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: block;">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button>
<!-- user-myCharacters Js -->
<script src="../js/user-myCharacters.js"></script>
<!-- lottie Js -->
<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script> 
<img src="chrome-extension://lplhclpeegjedapdliokcacmphgcnlnd/img/error_128.png" title="Some errors occurred on this page. Click to see details." style="opacity: 1; position: fixed !important; bottom: 10px !important; right: 10px !important; cursor: pointer !important; z-index: 2147483647 !important; width: 38px !important; height: 38px !important; min-height: 38px !important; min-width: 38px !important; max-height: 38px !important; max-width: 38px !important;"><img src="chrome-extension://lplhclpeegjedapdliokcacmphgcnlnd/img/error_128.png" title="Some errors occurred on this page. Click to see details." style="opacity: 1; position: fixed !important; bottom: 10px !important; right: 10px !important; cursor: pointer !important; z-index: 2147483647 !important; width: 38px !important; height: 38px !important; min-height: 38px !important; min-width: 38px !important; max-height: 38px !important; max-width: 38px !important;"><img src="chrome-extension://lplhclpeegjedapdliokcacmphgcnlnd/img/error_128.png" title="Some errors occurred on this page. Click to see details." style="opacity: 1; position: fixed !important; bottom: 10px !important; right: 10px !important; cursor: pointer !important; z-index: 2147483647 !important; width: 38px !important; height: 38px !important; min-height: 38px !important; min-width: 38px !important; max-height: 38px !important; max-width: 38px !important;"></body></html>