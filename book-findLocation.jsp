<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<html lang="en" data-darkreader-proxy-injected="true" data-darkreader-mode="dynamic" data-darkreader-scheme="dark">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../img/pages/icon.png" type="image/png">
    <title>도서 위치 찾기</title>
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
<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

<div class="bg-white my-account-nav position-relative shadow">
    <!-- navbar -->
    <div class="elements-nav">
        <!-- bootom nav -->

    </div>
</div><!-- header -->


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
                                <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-grid.html">읽은 책</a></li>
                                <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-list.html">읽고 있는 책</a></li>
                                <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-full-three-coulmn.html">읽고 싶은 책</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="nav-link" href="#" role="button" aria-expanded="false"> 나의 캐릭터 </a>
                        </li>
                        <li class="nav-item dropdown single-dropdown-nav">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 나의 정보 </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-grid.html">나의 정보</a></li>
                                <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-list.html">나의 달력</a></li>
                                <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-full-three-coulmn.html">나의 메모</a></li>
                                <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-full-four-coulmn.html">나의 통계</a></li>
                            </ul>
                        </li>
                    </ul>
                    <a href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-login.html" class="btn btn-purple rounded-pill d-none d-lg-block btn-theme"> 로그인 </a>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="svg-border-rounded text-light">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144.54 17.34" preserveAspectRatio="none" fill="#ffffff" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #181a1b;"><path d="M144.54,17.34H0V0H144.54ZM0,0S32.36,17.34,72.27,17.34,144.54,0,144.54,0"></path></svg>
    </div>
</div>

<div class="py-5 bg-light">
    <div class="container py-5">
        <div class="row justify-content-center g-5">

            <!-- End Col -->
            <div class="col-lg-7">
                <div class="bg-white rounded-4 shadow p-4">
                    <div class="p-4">
                        <h5 class="fw-bold mb-4 text-center">위치 찾기</h5>

                        <div class="row g-5">
                            <div id="map" style="width: 100%; height: 400px; position: relative; overflow: hidden; background: url(&quot;http://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png&quot;); --darkreader-inline-bgcolor: initial;" data-darkreader-inline-bgcolor=""><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;http://t1.daumcdn.net/mapjsapi/images/2x/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;http://t1.daumcdn.net/mapjsapi/images/2x/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute;"><div style="position: absolute; z-index: 0;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/215/741.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -62px; top: 223px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
                                <img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/215/742.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 194px; top: 223px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/215/743.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 450px; top: 223px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/215/744.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 706px; top: 223px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/216/741.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -62px; top: -33px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/216/742.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 194px; top: -33px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/216/743.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 450px; top: -33px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/216/744.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 706px; top: -33px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/217/741.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -62px; top: -289px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/217/742.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 194px; top: -289px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/217/743.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 450px; top: -289px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/3/217/744.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 706px; top: -289px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 648px; height: 400px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; width: 3240px; height: 2000px; left: -1296px; top: -800px; --darkreader-inline-stroke: none; --darkreader-inline-fill: none;" viewBox="0 0 3240 2000" data-darkreader-inline-stroke="" data-darkreader-inline-fill=""><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);"><div style="position: absolute; margin: -39px 0px 0px -14px; z-index: 0; left: 324px; top: 200px;"><img draggable="false" src="http://t1.daumcdn.net/mapjsapi/images/2x/marker.png" alt="" role="presentation" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 29px, 42px, 0px); top: 0px; left: 0px; width: 29px; height: 42px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""><img src="http://t1.daumcdn.net/mapjsapi/images/2x/transparent.gif" alt="" role="presentation" draggable="false" usemap="#daum.maps.Marker.Area:1" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 29px; height: 42px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""><map id="daum.maps.Marker.Area:1" name="daum.maps.Marker.Area:1"><area href="javascript:void(0)" alt="" role="presentation" shape="poly" coords="14,39,9,27,4,21,1,16,1,10,4,4,11,0,18,0,25,4,28,10,28,16,25,21,20,27" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="cursor: default; position: absolute; background: rgb(255, 255, 255); border: 1px solid rgb(118, 129, 168); z-index: 0; display: block; width: 213px; height: 94px; left: 218px; top: 58px; --darkreader-inline-bgimage: initial; --darkreader-inline-bgcolor: #181a1b; --darkreader-inline-border-top: #50565a; --darkreader-inline-border-right: #50565a; --darkreader-inline-border-bottom: #50565a; --darkreader-inline-border-left: #50565a;" data-darkreader-inline-bgimage="" data-darkreader-inline-bgcolor="" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""><div style="position: absolute; width: 11px; height: 9px; background: url(&quot;http://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/triangle.png&quot;) 0% 0% / 11px 9px no-repeat; left: 101px; top: 94px; --darkreader-inline-bgcolor: initial;" data-darkreader-inline-bgcolor=""></div><div style="position: absolute; left: 0px; top: 0px;" class=""><div style="padding:5px;">nn도서관 <br> <u>대여가능</u><br>주소: 서울특별시 nn구 nn로 nn <br> TEL 02-123-1234</div></div></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0); --darkreader-inline-color: #e8e6e3;" data-darkreader-inline-color=""><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left; --darkreader-inline-color: #e8e6e3;" data-darkreader-inline-color=""><div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 46px; --darkreader-inline-border-top: #8c8273; --darkreader-inline-border-right: #8c8273; --darkreader-inline-border-bottom: #8c8273; --darkreader-inline-border-left: #8c8273;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0); --darkreader-inline-color: #e8e6e3;" data-darkreader-inline-color="">50m</div></div><div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" style="float: left; width: 32px; height: 10px;"><img src="http://t1.daumcdn.net/mapjsapi/images/2x/m_bi_b.png" alt="Kakao 맵으로 이동(새창열림)" style="float: left; width: 32px; height: 10px; border: none; --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></a><div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;http://t1.daumcdn.net/mapjsapi/images/2x/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;http://t1.daumcdn.net/mapjsapi/images/2x/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute;"><div style="position: absolute; z-index: 0;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/61/27.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -87px; top: 144px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/61/28.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 169px; top: 144px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/61/29.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 425px; top: 144px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/61/30.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 681px; top: 144px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/62/27.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -87px; top: -112px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/62/28.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 169px; top: -112px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/62/29.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 425px; top: -112px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/62/30.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 681px; top: -112px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/63/27.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -87px; top: -368px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/63/28.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 169px; top: -368px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/63/29.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 425px; top: -368px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v31_d3mmy/8/63/30.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 681px; top: -368px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 648px; height: 400px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; width: 3240px; height: 2000px; left: -1296px; top: -800px; --darkreader-inline-stroke: none; --darkreader-inline-fill: none;" viewBox="0 0 3240 2000" data-darkreader-inline-stroke="" data-darkreader-inline-fill=""><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);"><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 291px; top: 191px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립논현도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 364px; top: 267px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립대치도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 297px; top: 292px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립도곡정보문화도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 455px; top: 349px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립못골도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 463px; top: 344px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립못골한옥어린이도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 280px; top: 267px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립역삼도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 276px; top: 263px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립역삼푸른솔도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 421px; top: 306px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립열린도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 415px; top: 314px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립일원라온영어도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 316px; top: 185px;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" alt="" role="presentation" title="강남구립정다운도서관" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px; --darkreader-inline-border-top: 0px; --darkreader-inline-border-right: 0px; --darkreader-inline-border-bottom: 0px; --darkreader-inline-border-left: 0px;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0); --darkreader-inline-color: #e8e6e3;" data-darkreader-inline-color=""><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left; --darkreader-inline-color: #e8e6e3;" data-darkreader-inline-color=""><div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 58px; --darkreader-inline-border-top: #8c8273; --darkreader-inline-border-right: #8c8273; --darkreader-inline-border-bottom: #8c8273; --darkreader-inline-border-left: #8c8273;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></div><div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0); --darkreader-inline-color: #e8e6e3;" data-darkreader-inline-color="">2km</div></div><div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" style="float: left; width: 32px; height: 10px;"><img src="http://t1.daumcdn.net/mapjsapi/images/2x/m_bi_b.png" alt="Kakao 맵으로 이동(새창열림)" style="float: left; width: 32px; height: 10px; border: none; --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;" data-darkreader-inline-border-top="" data-darkreader-inline-border-right="" data-darkreader-inline-border-bottom="" data-darkreader-inline-border-left=""></a><div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div></div>
                            <%-- Kakao 지도 API 스크립트 로드--%>
                            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c34ef6f56c1983ad614130aef064a5"></script><script charset="UTF-8" src="http://t1.daumcdn.net/mapjsapi/js/main/4.4.19/kakao.js"></script>
                            <script>
                                // 지도를 표시할 div와 옵션 설정
                                var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                                var options = { //지도를 생성할 때 필요한 기본 옵션
                                    center: new kakao.maps.LatLng(37.5542685,126.9242273), //지도의 중심좌표.
                                    level: 3 //지도의 레벨(확대, 축소 정도)
                                };

                                //지도 생성 및 객체 리턴
                                var map = new kakao.maps.Map(container, options);

                                // 마커 이미지 설정
                                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                                var imageSize = new kakao.maps.Size(24, 35);
                                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                                // 마커 위치
                                var markerPosition  = new kakao.maps.LatLng(37.5542685,126.9242273);
                                // 마커 생성
                                var marker = new kakao.maps.Marker({
                                    position: markerPosition,
                                    image: markerImage,
                                    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
                                });

                                // 마커를 지도에 표시
                                marker.setMap(map);

                                // 인포윈도우 내용
                                var iwContent = '<div style="padding:5px; width:200px; text-align:left;">' +
                                        '<strong style="font-size:14px; color:darkorange;">서울특별시교육청마포평생학습관</strong><br>' +
                                        '<span style="font-size:12px;">주소: 서울특별시 마포구 홍익로 2길 16</span><br> ' +
                                        '<span style="font-size:13px;">TEL: 02-2137-0000</span>' +
                                        '</div>',
                                    /*  iwRemoveable = true; // 닫을 수 있는 x버튼*/
                                // 인포윈도우 위치
                                iwPosition = new kakao.maps.LatLng(37.5563, 126.9347); //인포윈도우 표시 위치

                                // 인포윈도우 생성
                                var infowindow = new kakao.maps.InfoWindow({
                                    position : iwPosition,
                                    content : iwContent,
                                });

                                // 인포윈도우를 마커 위에 표시
                                infowindow.open(map, marker);

                                // 마커에 클릭 이벤트 등록
                                kakao.maps.event.addListener(marker, 'click', function() {
                                    infowindow.open(map, marker);
                                });

                                // 지도 클릭시 인포윈도우 닫기
                                kakao.maps.event.addListener(map, 'click', function() {
                                    infowindow.close();
                                });
                            </script>
                        </div>

                        <div class="row g-5">
                            <%--지역 선택 드롭다운 메뉴--%>
                            <select class="form-select d-inline-block border" style="width: 40%" id="dosi">
                                <option value="" selected disabled>도 (선택)</option>
                                <option value="37.5665,126.9780">서울</option>
                                <option value="37.4563,126.7052">인천시</option>
                                <option value="35.1796,129.0756">부산시</option>
                                <option value="35.8714,128.6014">대구시</option>
                                <option value="35.1595,126.8526">광주시</option>
                                <option value="36.3504,127.3845">대전시</option>
                                <option value="35.5384,129.3114">울산시</option>
                                <option value="36.5040,127.2695">세종시</option>
                                <option value="37.8228,128.1555">강원</option>
                                <option value="37.2750,127.0094">경기</option>
                                <option value="36.6357,127.4914">충청</option>
                                <option value="35.8202,127.1089">전라</option>
                                <option value="35.2384,128.6919">경상</option>
                                <option value="33.3648,126.5428">제주</option>
                            </select>
                            <select class="form-select d-inline-block  border" style="width: 40%" id="gu">
                                <option value="" selected disabled>구 (선택)</option>


                            </select>

                            <button onclick="moveMap()" class="btn btn-primary fw-semibold rounded-pill py-3 px-5" style="width: 20%" type="button" id="app">검색</button>
                            <h7 class="fw-bold mb-4 text-center">마커를 눌러보세요  (이후 지도를 눌러주세요)</h7>

                        </div>

                    </div>
                </div>
            </div>
            <!-- End Col -->
        </div>
        <!-- End Row -->
    </div>
</div>

<script>
    // 도/시 선택 시 이벤트 처리
    document.getElementById('dosi').addEventListener('change', function() {
        //구 선택을 초기화하고 비활성화
        const guSelect = document.getElementById('gu');
        guSelect.innerHTML = '<option value="" selected disabled>구 (선택)</option>';
        guSelect.disabled = true;

        const selectedDoSi = this.options[this.selectedIndex].text; // 선택된 도/시의 텍스트 값을 가져옴

        //도 값이 존재할 때, 구 목록 가져오기
        if (selectedDoSi) {
            fetch('/getDistricts?region=' + encodeURIComponent(selectedDoSi))
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(districts => {
                    if (Array.isArray(districts)) {
                        // 구 목록 채우기
                        districts.forEach(district => {
                            const option = document.createElement('option');
                            option.value = district.localCode+','+district.latitude+','+district.longitude;
                            option.textContent = district.city;
                            guSelect.appendChild(option);
                        });
                        guSelect.disabled = false;

                    }else {
                        console.error('Unexpected data format:', districts);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    guSelect.disabled = false;
                });
        }
    });

    // 지도 이동 및 도서관 정보 표시 함수
    function moveMap() {

        let libName, libAddr, libLat, libLng, libTel, libHomepage;
        let positions = [];

        // 선택된 구의 좌표 가져오기
        let selectedValue = document.getElementById('gu').value;

        let lat = selectedValue.split(",")[1];
        let lng = selectedValue.split(",")[2];
        let gu = selectedValue.split(",")[0];

        // 지도 중심 이동
        let center = new kakao.maps.LatLng(lat, lng);

        let mapContainer = document.getElementById('map')
        let mapOption = { center: center,  level: 7 };
        let map = new kakao.maps.Map(mapContainer, mapOption);

        // 도서관 API 파라미터 설정
        let params = {
            "authKey" : "74bb8acdd4b8fad5039d6411931ac71c2d861469c1ab7c6534ebbdd008df0181",
            "dtl_region" : gu,
        }

        // 도서관 정보 가져오기
        $.ajax({
            url: 'http://data4library.kr/api/libSrch', // 요청을 보낼 URL
            type: 'GET', // 요청 방식
            dataType: 'xml',
            async: false, //동기화
            data : params,
            success: function(data) {
                let positions = [];
                $(data).find('lib').each(function() {
                    // 각 도서관 정보 추출 및 positions 배열에 추가
                    let $lib = $(this);
                    let libName = $lib.find('libName').text();
                    let libAddr = $lib.find('address').text();
                    let libTel = $lib.find('tel').text();
                    let libLat = $lib.find('latitude').text();
                    let libLng = $lib.find('longitude').text();
                    let libHomepage = $lib.find('homepage').text();

                    positions.push({
                        title: libName,
                        latlng: new kakao.maps.LatLng(libLat, libLng),
                        addr: libAddr,
                        tel: libTel,
                        page: libHomepage
                    });
                });

                // 지도 추가 (positions 배열을 사용하여 마커를 생성하고 지도에 추가)
                // 마커 및 인포윈도우 생성
                for (let i = 0; i < positions.length; i ++) {

                    // 마커 생성
                    let marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[i].latlng,
                        title : positions[i].title,
                        image : markerImage,
                    });

                    // 인포윈도우 내용 동적 생성
                    let iwContent = '<div style="padding:5px; width:200px; text-align:left; word-break:break-all;">' +
                        '<strong style="font-size:14px; color:darkorange;">' + positions[i].title + '</strong><br>' +
                        '<span style="font-size:13px;"><a href="' + positions[i].page + '" target="_blank" style="color:orange; text-decoration: underline orange;">' + positions[i].page + '</a></span><br>' + // target="_blank": 링크가 새 탭에서 열리도록.
                        '<span style="font-size:12px;">주소: ' + positions[i].addr + '</span><br>' +
                        '<span style="font-size:13px;">TEL: ' + positions[i].tel + '</span>' +
                        '</div>';

                    // 인포윈도우 생성 (for문 안에서 각 마커마다)
                    let infowindow = new kakao.maps.InfoWindow({
                        content: iwContent
                    });

                    // 마커에 클릭 이벤트 등록
                    kakao.maps.event.addListener(marker, 'click', function() {
                        infowindow.open(map, marker);
                    });

                    // 지도 클릭시 인포윈도우 닫기
                    kakao.maps.event.addListener(map, 'click', function() {
                        infowindow.close();
                    });
                }
            },
            error: function(xhr, status, error) {
            }
        });


    }

</script>




<!-- Nav Sidebar -->
<div class="offcanvas offcanvas-top bg-purple text-white border-0 h-100" tabindex="-1" id="sidebarnav" aria-labelledby="sidebarnavLabel">
    <div class="offcanvas-header d-flex justify-content-end">
        <a href="#" class="link-light" data-bs-dismiss="offcanvas" aria-label="Close"><i class="ri-close-line ri-lg"></i></a>
    </div>
    <div class="offcanvas-body">
        <div class="sidebar-nav text-center">
            <div class="position-relative d-flex align-items-center gap-2 site-brand">
                <i class="ri-slideshow-line fs-2 lh-1 text-white"></i>
                <div class="lh-1">
                    <h5 class="fw-bold m-0 text-white">Software</h5>
                    <small class="text-muted text-white-50">One Page</small>
                </div>
                <a class="stretched-link" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/index.html"></a>
            </div>
            <ul class="navbar-nav justify-content-end flex-grow-1 mt-4">
                <li class="nav-item">
                    <a class="nav-link active" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/index.html"><i class="ri-apps-2-line"></i> Home</a>
                </li>

                <li class="nav-item dropdown osahan-mega-menu position-static">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Elements </a>
                    <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                        <li>
                            <div class="dropdown-mega-content container">
                                <div class="row g-0">
                                    <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Elements 1</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-accordions-toggles.html">Accordions &amp; Toggles</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-tabs.html">Tabs</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-icons.html">Icons</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-pagination.html">Pagination</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-cards.html">Cards</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-carousels.html">Carousels</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-modals.html">Modals</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-placeholders.html">Placeholders</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-medias.html">Medias</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-maps.html">Maps</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-forms-basic.html">Forms</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Elements 2</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-buttons.html">Buttons</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-badges.html">Badges</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-lists.html">Lists</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-offcanvas.html">Offcanvas</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-image-frames.html">Image Frames</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-testimonials.html">Testimonials</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-blockquotes.html">Blockquotes</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-borders.html">Borders</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-process.html">Process</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-countdowns.html">Countdowns</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-spinners.html">Spinners</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Elements 3</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-call-to-action.html">Call to Action</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-pricing-tables.html">Pricing Tables</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-tables.html">Tables</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-progress-bars.html">Progress Bars</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-colors.html">Colors</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-dropdowns.html">Dropdowns</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-tooltips-popovers.html">Tooltips &amp; Popovers</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-sticky-elements.html">Sticky Elements</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-typography.html">Typography</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/elements/elements-alerts.html">Alerts</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-3 dropdown-mega-sub-content-block d-none d-lg-block bg-light p-5 osahan-dropdown-box border-end border-opacity-10 border-dark">
                                        <div class="position-relative d-flex align-items-center gap-2 site-brand">
                                            <i class="ri-slideshow-line fs-2 lh-1 text-black"></i>
                                            <div class="lh-1">
                                                <h5 class="fw-bold m-0 text-black">Software</h5>
                                                <small class="text-muted text-muted">One Page</small>
                                            </div>
                                            <a class="stretched-link" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/index.html"></a>
                                        </div>
                                        <h5 class="text-dark mt-5 mb-2"> Multi-Purpose</h5>
                                        <h1 class="text-primary fw-bold">And Powerful Bootstrap based </h1>
                                        <p class="lead mb-5">
                                            Template with 180+ Valid Multi-Page &amp; One-Page Layouts

                                        </p>
                                        <a class="btn btn-primary px-5 py-3" href="#">GET STARTED</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="nav-item dropdown single-dropdown-nav">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Shop </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-grid.html">Product Grid</a></li>
                        <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-list.html">Product List</a></li>
                        <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-full-three-coulmn.html">Product Three Coulmns</a></li>
                        <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-full-four-coulmn.html">Product Four Coulmns</a></li>
                        <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-product-detail.html">Product Detail</a></li>
                        <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-cart.html">Shop Cart</a></li>
                        <li><a class="dropdown-item" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/shop-checkout.html">Shop Checkout</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown osahan-mega-menu position-static">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Extra Pages </a>
                    <ul class="dropdown-menu w-100 m-0 border-opacity-10 border-dark border-top border-bottom p-0 start-0 end-0 rounded-0 shadow">
                        <li>
                            <div class="dropdown-mega-content container">
                                <div class="row g-0">
                                    <div class="col-lg-3 p-5 border-end border-start border-opacity-10 border-dark">
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Portfolio</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/portfolio-full-width.html">Portfolio Full Width</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/portfolio-boxed.html">Portfolio Boxed</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/portfolio-classic.html">Portfolio Classic</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/portfolio-masonry.html">Portfolio Masonry</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/single-project.html">Single Project</a></li>
                                        </ul>
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Help</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-help-center.html">Help Center</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-help-center-categories.html">Help Center: Categories</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-help-center-article.html">Help Center: Article</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Blog</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-grid.html">Blog Grid</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-grid-classic.html">Blog Grid Classic</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-grid-sidebar.html">Blog Grid Sidebar</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-list.html">Blog List</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-list-sidebar.html">Blog List Right Sidebar</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-left-sidebar.html">Blog List Left Sidebar</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-full-width.html">Blog Full Width</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-post.html">Blog Post</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/blog-author-profile.html">Author Profile</a></li>
                                        </ul>
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">FAQ</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/faq.html">FAQ v.1</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/faq-2.html">FAQ v.2</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">Company</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-hire-us.html">Hire Us</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-careers.html">Careers</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-careers-role-overview.html">Careers: Role Overview</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-careers-apply.html">Careers: Apply</a></li>
                                        </ul>
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold mt-4">Additional Pages</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-coming-soon.html">Coming Soon</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-coming-soon-simple.html">Coming Soon: Simple</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-error-404.html">Maintenance</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-error-404.html">Error 404</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-terms.html">Terms &amp; Conditions</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-privacy.html">Privacy &amp; Policy</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-3 p-5 border-end border-opacity-10 border-dark">
                                        <h6 class="dropdown-mega-sub-title mb-3 fw-bold">My Account</h6>
                                        <ul class="dropdown-mega-sub-nav list-unstyled">
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-login.html">Log In v.1</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-login-2.html">Log In v.2</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-signup.html">Sign Up v.1</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-signup-2.html">Sign Up v.2</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/page-reset-password.html">Forgot Password</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/account-orders.html">Orders</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/account-settings.html">Settings</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/account-address.html">Address</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/my-wallet.html">My Wallet</a></li>
                                            <li><a class="dropdown-item px-0 py-1 bg-transparent" href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/pages/account-notification.html">Notification</a></li>
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
            <a href="../../../../../../../../../../Users/eunji/OneDrive/바탕%20화면/bookbookbook/src/main/webapp/WEB-INF/views/index.html" class="btn btn-warning rounded-0"> <i class="ri-shopping-cart-line me-2"></i> Purchase Now </a>
        </div>
    </div>
</div>
<!-- Video Modal -->
<div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="videoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content bg-transparent border-0 rounded-0">
            <div class="modal-header d-flex justify-content-end border-0 py-0">
                <a href="#" class="link-light" data-bs-dismiss="modal" aria-label="Close"><i class="ri-close-fill ri-2x"></i></a>
            </div>
            <div class="modal-body px-5">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/gu-HhgJ7vfM?si=egwKhEDMVeXg3IuJ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
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
<script src="../js/script.js"></script><button id="back-to-top" title="Go to top" style="display: block;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: none;">Top</button><button id="back-to-top" title="Go to top" style="display: block;">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button><button id="back-to-top" title="Go to top">Top</button>


<img src="chrome-extension://lplhclpeegjedapdliokcacmphgcnlnd/img/error_128.png" title="Some errors occurred on this page. Click to see details." style="opacity: 1; position: fixed !important; bottom: 10px !important; right: 10px !important; cursor: pointer !important; z-index: 2147483647 !important; width: 38px !important; height: 38px !important; min-height: 38px !important; min-width: 38px !important; max-height: 38px !important; max-width: 38px !important;"><img src="chrome-extension://lplhclpeegjedapdliokcacmphgcnlnd/img/error_128.png" title="Some errors occurred on this page. Click to see details." style="opacity: 1; position: fixed !important; bottom: 10px !important; right: 10px !important; cursor: pointer !important; z-index: 2147483647 !important; width: 38px !important; height: 38px !important; min-height: 38px !important; min-width: 38px !important; max-height: 38px !important; max-width: 38px !important;"><img src="chrome-extension://lplhclpeegjedapdliokcacmphgcnlnd/img/error_128.png" title="Some errors occurred on this page. Click to see details." style="opacity: 1; position: fixed !important; bottom: 10px !important; right: 10px !important; cursor: pointer !important; z-index: 2147483647 !important; width: 38px !important; height: 38px !important; min-height: 38px !important; min-width: 38px !important; max-height: 38px !important; max-width: 38px !important;"></body></html>
