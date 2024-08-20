<%@page contentType="text/html; charset=UTF-8"%>
<%-- Core 라이브러리 (태그들이 "c:"로 시작)--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Functions 라이브러리--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko" class="translated-ltr" data-darkreader-proxy-injected="true"><head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../img/pages/icon.png" type="image/png">
    <title>나의 통계</title>
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
        background-color: #D35400;
    }

    .btn-register {
        background-color: #F39C12;
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
    .bg-black {
        background-color: #8fbc8f !important;
    }
    .hero-wave {
        width: 100%;
        display: block;
        margin-bottom: -200px;
    }

    .top-header {
        background-color: #abd1ab;
        padding-top: 100px;
        padding-bottom: 0;
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
            <div class="d-flex gap-3 align-items-center"></div>
        </div>
    </div>
</div>
<div class="top-header">
    <div class="w-100">
        <img src="../img/pages/hero-wave.svg" alt="" class="img-fluid w-100">
    </div>
</div>
<!-- Elements Components -->
<div class="py-5" id="elements">
    <div class="container">
        <h1 class="text-center mb-4 my-stats-title stats-main-title custom-margin">나의 통계</h1>
        <h4 class="elements-title fw-bold mb-4 text-center chart-title">월별 독서량</h4>
        <div class="chart-spacer"></div>
        <div class="text-center">
        </div>
    </div>
    <c:choose>
        <%--사용자가 로그인했고, 읽은 책이 없을때의 화면--%>
        <c:when test="${not empty sessionScope.userId}">
            <c:if test="${empty userStatVO}">
                <div class="container">
                    <div class="col-lg-6">
                        <h4 class="elements-title fw-bold mb-4">
                            <div style="height: 100px;"></div>
                            <div style="text-align: center; width: 200%;">
                                <h3 style="display: inline-block;">읽은 책이 없습니다!</h3>
                            </div>
                        </h4>
                    </div>
                </div>
                <div id="without-data">
                   <div class="d-flex justify-content-center2">
                        <a href="/" class="btn custom-btn btn-bestseller mx-2">추천도서 구경하러 가기</a>
                        <a href="/pages/book-categorySearch" class="btn custom-btn btn-recommend mx-2">카테고리별 책 구경하기</a>
                        <a href="/pages/book-bookSearchResult" class="btn custom-btn btn-register mx-2">읽은 싶은 책 등록하기</a>
                    </div>
                </div>
                <div style="height: 100px;"></div>
            </c:if>

            <%--읽은 책이 있을때의 화면--%>
            <c:if test="${not empty userStatVO}">
                <div class="container">
                    <div class="row g-5">
                        <!-- 권수별 통계 -->
                        <div class="col-lg-6">
                            <div class="chart-container">
                                <div style="height: 150px;"></div>
                                <canvas id="myChart1"></canvas>
                            </div>
                            <div style="height: 100px;"></div>
                            <h4 class="elements-title fw-bold mb-4 mt-3 text-center chart-title">권수별 통계</h4>
                        </div>
                        <!-- 페이지별 통계 및 검색 폼 -->
                        <div class="col-lg-6">
                            <div style="height: 30px;"></div>
                            <!-- 연도 및 월 선택 폼 -->
                            <form id="pageStatsForm" class="row g-3 justify-content-center align-items-end mb-3">
                                    <div class="col-auto me-4">
                                    <select id="yearSelect" name="bookYear" class="form-select" style="display: inline; width: auto;">
                                        <option value="" disabled selected style="font-size: 0.7em;">선택</option>
                                        <option value="2024" > 2024</option>
                                        <option value="2021" > 2021</option>
                                        <option value="2022" > 2022</option>
                                        <option value="2023" > 2023</option>
                                    </select>
                                    <label for="yearSelect" class="form-label">년도</label>
                                </div>
                                    <div class="col-auto me-4">
                                    <select id="monthSelect" name="bookMonth" class="form-select" style="display: inline; width: auto;">
                                        <option value="" disabled selected style="font-size: 0.7em;">선택</option>
                                        <option value="01" >01</option>
                                        <option value="02" >02</option>
                                        <option value="03" >03</option>
                                        <option value="04" >04</option>
                                        <option value="05" >05</option>
                                        <option value="06" >06</option>
                                        <option value="07" >07</option>
                                        <option value="08" >08</option>
                                        <option value="09" >09</option>
                                        <option value="10" >10</option>
                                        <option value="11" >11</option>
                                        <option value="12" >12</option>
                                    </select>
                                    <label for="monthSelect" class="form-label">월</label>
                                </div>
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary">검색</button>
                                </div>
                            </form>
                            <!-- 페이지별 통계 -->
                            <div class="chart-container">
                                <div style="height: 70px;"></div>
                                <canvas id="myChart2"></canvas>
                            </div>
                            <h4 class="elements-title fw-bold mb-4 mt-3 text-center chart-title">페이지별 통계</h4>
                        </div>
                    </div>
                </div>
            </c:if>
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
    .chart-container {
        position: relative;
        margin: auto;
        height: 400px;
        width: 100%;
    }

    .chart-title {
        margin-top: 20px;
        text-align: center;
    }

    .custom-margin {
        margin-bottom: 4rem !important;
    }

    .chart-title {
        margin-bottom: 2rem;
    }

    .chart-spacer {
        height: 3rem;
    }


    .form-select {
        min-width: 120px;
    }


    select option[value=""][disabled] {
        color: #999;
    }


    select option {
        color: #000;
        font-size: 1em;
    }

</style>
<style class="darkreader darkreader--sync" media="screen"></style>

<!-- Bootsrap Bundle Js -->
<script src="../vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Jquery Js -->
<script src="../vender/jquery/jquery-3.6.4.min.js"></script>
<!-- AOS Js -->
<script src="../vender/aos/dist/aos.js"></script>
<!-- Custom Js -->
<script src="../js/script.js"></script><button id="back-to-top" title="Go to top">Top</button><div id="goog-gt-tt" class="VIpgJd-yAWNEb-L7lbkb skiptranslate" style="border-radius: 12px; margin: 0 0 0 -23px; padding: 0; font-family: 'Google Sans', Arial, sans-serif;" data-id=""><div id="goog-gt-vt" class="VIpgJd-yAWNEb-hvhgNd"><div class=" VIpgJd-yAWNEb-hvhgNd-l4eHX-i3jM8c"><img src="https://fonts.gstatic.com/s/i/productlogos/translate/v14/24px.svg" width="24" height="24" alt=""></div><div class=" VIpgJd-yAWNEb-hvhgNd-k77Iif-i3jM8c"><div class="VIpgJd-yAWNEb-hvhgNd-IuizWc" dir="ltr">원본 텍스트</div><div id="goog-gt-original-text" class="VIpgJd-yAWNEb-nVMfcd-fmcmS VIpgJd-yAWNEb-hvhgNd-axAV1"></div></div><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid ltr"><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od ltr" dir="ltr"><div class="VIpgJd-yAWNEb-hvhgNd-UTujCb">번역 평가</div><div class="VIpgJd-yAWNEb-hvhgNd-eO9mKe">보내주신 의견은 Google 번역을 개선하는 데 사용됩니다.</div></div><div class="VIpgJd-yAWNEb-hvhgNd-xgov5 ltr"><button id="goog-gt-thumbUpButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋음" aria-label="번역 품질 좋음" aria-pressed="false"><span id="goog-gt-thumbUpIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7l-3 7H9V8l4.34-4.34L12 9h9v2z"></path></svg></span><span id="goog-gt-thumbUpIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7v13h11c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM5 7H1v13h4V7z"></path></svg></span></button><button id="goog-gt-thumbDownButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋지 않음" aria-label="번역 품질 좋지 않음" aria-pressed="false"><span id="goog-gt-thumbDownIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z"></path></svg></span><span id="goog-gt-thumbDownIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zm16 0h4V4h-4v13z"></path></svg></span></button></div></div><div id="goog-gt-votingHiddenPane" class="VIpgJd-yAWNEb-hvhgNd-aXYTce">\<form id="goog-gt-votingForm" action="//translate.googleapis.com/translate_voting?client=te_lib" method="post" target="votingFrame" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><input type="text" name="sl" id="goog-gt-votingInputSrcLang"><input type="text" name="tl" id="goog-gt-votingInputTrgLang"><input type="text" name="query" id="goog-gt-votingInputSrcText"><input type="text" name="gtrans" id="goog-gt-votingInputTrgText"><input type="text" name="vote" id="goog-gt-votingInputVote"></form><iframe name="votingFrame" frameborder="0"></iframe></div></div></div>


</body></html>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- 차트 생성 스크립트 -->
<script>
    // 월별 권수 차트 데이터 설정 및 생성
    let datax = [];
    let monthx = [];
    <c:forEach items="${userStatVO2}" var="vo">
    datax.push(${vo.bookCount});
    monthx.push(${vo.bookMonth}+'월');
    </c:forEach>

    // 권수별 통계 차트 생성
    const ctx = document.getElementById('myChart1');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: monthx,
            datasets: [{
                label: '읽은 책 권수(권)',
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


    // 월별 페이지수 차트 데이터 설정 및 생성
    let datax2= [];
    let monthx2 = [];
    <c:forEach items="${userStatVO}" var="vo">
    datax2.push(${vo.percent});
    monthx2.push('${vo.titleLengthStr}');
    </c:forEach>

    const ctx2 = document.getElementById('myChart2');
    new Chart(ctx2, {
        type: 'line',
        data: {
            labels: monthx2,
            datasets: [{
                label: '읽은 페이지 비율(%)',
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

    // URL 파라미터에서 년도와 월 정보 가져오기
    const query = window.location.search;
    const param = new URLSearchParams(query);
    const bookYear = param.get('bookYear');
    const bookMonth = param.get('bookMonth');

    // 선택된 년도와 월을 드롭다운에 반영
    $('#yearSelect').val(bookYear).prop("selected",true);
    $('#monthSelect').val(bookMonth).prop("selected",true);

</script>