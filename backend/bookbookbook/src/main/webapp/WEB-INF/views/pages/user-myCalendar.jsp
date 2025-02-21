<%@page contentType="text/html; charset=UTF-8"%>
<!-- forEach 용 taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" class="translated-ltr" data-darkreader-proxy-injected="true">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../img/pages/icon.png" type="image/png">
    <title>북북북 | 나의 달력</title>
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
    <!-- Icofont Css -->
    <link rel="stylesheet" href="../vender/icofont/icofont.min.css">
    <!-- AOS Css -->
    <link rel="stylesheet" href="../vender/aos/dist/aos.css">
    <!-- Remix Icons -->
    <link rel="stylesheet" href="../vender/remixicon/remixicon.css">
   <!-- Custom Css -->
   <link rel="stylesheet" href="../css/style2.css">
    <!-- Common Css -->
    <link rel="stylesheet" href="../css/common.css">
    <link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.26tY-h6gH9w.L.W.O/am=GAY/d=0/rs=AN8SPfrev-A3NvrBP0gNq8zXCqKY7IcBLA/m=el_main_css">
	<!--sweetalert-->
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
	<!-- User-myCalendar Css -->
	<link rel="stylesheet" href="../css/user-myCalendar.css">
	<!-- fullCalendar Css -->
	<!-- FullCalendar 스크립트와 CSS 파일 -->
	<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css' rel='stylesheet' />
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>
	<style id="__web-inspector-hide-shortcut-style__">
.__web-inspector-hide-shortcut__, .__web-inspector-hide-shortcut__ *, .__web-inspector-hidebefore-shortcut__::before, .__web-inspector-hideafter-shortcut__::after
	{
    	visibility: hidden !important;
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
	<div class="row justify-content-center">
		<div class="col-xl-6 col-lg-5 col-md-10 col-12">
			<div class="d-flex gap-3 align-items-center">
			</div>
		</div>
	</div>
	</div>
	<div class="top-header">
		<div class="w-100">
	        <img src="../img/pages/hero-wave.svg" alt="" class="img-fluid w-100">
	    </div>
	</div>
<!-- Elements Components -->
<!--<div class="calendar-background">-->
<div class="py-5 ${empty sessionScope.userId ? 'no-login-background' : 'calendar-background'}" id="elements">
    <div class="container">
        <h1 class="text-center mb-4">&#x1F4C5; 나의 달력 &#x1F4C5;</h1>
		<div style="display: flex; justify-content: center; margin-bottom: 4rem;">
			<h6>출석 체크 및 책에 대해 남긴 메모를 날짜별로 확인할 수 있어요.
			</h6>
		</div>
        <div class="text-center">
			<c:choose>
            	<c:when test="${not empty sessionScope.userId}">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="calendar-wrapper">
                                <div class="row justify-content-start mb-3 no-gutters">
                                    <div class="col-auto">
                                        <select id="year-select" class="form-control"></select>
                                    </div>
                                    <div class="col-auto">
                                        <select id="month-select" class="form-control"></select>
                                    </div>
                                </div>
                                <div id="calendar"></div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div id="event-sidebar">
                                <h3 id="selected-date"></h3>
                                <div id="event-details">
                                    <div class="event-item">
                                        <a href="#" class="event-item-link">이벤트 제목</a>
                                        <span class="event-tooltip">메모 상세보기</span>
                                    </div>
                                </div>
                                <button id="attendance-check">출석<br>체크</button>
                            </div>
                        </div>
                    </div> <!-- end of calendar-wrapper -->
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
        </div>
    </div>
</div>
</div>
<!--</div>-->
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
<script src="../js/script.js"></script><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="위로 이동" style="display: block;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">맨 위</font></font></button><div id="goog-gt-tt" class="VIpgJd-yAWNEb-L7lbkb skiptranslate" style="border-radius: 12px; margin: 0 0 0 -23px; padding: 0; font-family: 'Google Sans', Arial, sans-serif;" data-id=""><div id="goog-gt-vt" class="VIpgJd-yAWNEb-hvhgNd"><div class=" VIpgJd-yAWNEb-hvhgNd-l4eHX-i3jM8c"><img src="https://fonts.gstatic.com/s/i/productlogos/translate/v14/24px.svg" width="24" height="24" alt=""></div><div class=" VIpgJd-yAWNEb-hvhgNd-k77Iif-i3jM8c"><div class="VIpgJd-yAWNEb-hvhgNd-IuizWc" dir="ltr">원본 텍스트</div><div id="goog-gt-original-text" class="VIpgJd-yAWNEb-nVMfcd-fmcmS VIpgJd-yAWNEb-hvhgNd-axAV1"></div></div><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid ltr"><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od ltr" dir="ltr"><div class="VIpgJd-yAWNEb-hvhgNd-UTujCb">번역 평가</div><div class="VIpgJd-yAWNEb-hvhgNd-eO9mKe">보내주신 의견은 Google 번역을 개선하는 데 사용됩니다.</div></div><div class="VIpgJd-yAWNEb-hvhgNd-xgov5 ltr"><button id="goog-gt-thumbUpButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋음" aria-label="번역 품질 좋음" aria-pressed="false"><span id="goog-gt-thumbUpIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7l-3 7H9V8l4.34-4.34L12 9h9v2z"></path></svg></span><span id="goog-gt-thumbUpIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7v13h11c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM5 7H1v13h4V7z"></path></svg></span></button><button id="goog-gt-thumbDownButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋지 않음" aria-label="번역 품질 좋지 않음" aria-pressed="false"><span id="goog-gt-thumbDownIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z"></path></svg></span><span id="goog-gt-thumbDownIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zm16 0h4V4h-4v13z"></path></svg></span></button></div></div><div id="goog-gt-votingHiddenPane" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><form id="goog-gt-votingForm" action="//translate.googleapis.com/translate_voting?client=te_lib" method="post" target="votingFrame" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><input type="text" name="sl" id="goog-gt-votingInputSrcLang"><input type="text" name="tl" id="goog-gt-votingInputTrgLang"><input type="text" name="query" id="goog-gt-votingInputSrcText"><input type="text" name="gtrans" id="goog-gt-votingInputTrgText"><input type="text" name="vote" id="goog-gt-votingInputVote"></form><iframe name="votingFrame" frameborder="0"></iframe></div></div></div>
<!-- user-myCalendar Js -->
<script src="../js/user-myCalendar.js"></script>
<!--Sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- FullCalendar Js-->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
	<script>
		var memoList = ${memoListJson};
	</script>
</body>
</html>