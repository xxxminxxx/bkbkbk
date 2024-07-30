<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- forEach 용 taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko" class="translated-ltr" data-darkreader-mode="dynamic" data-darkreader-scheme="dark" data-darkreader-proxy-injected="true"><head><style class="darkreader darkreader--fallback" media="screen"></style><style class="darkreader darkreader--text" media="screen"></style><style class="darkreader darkreader--invert" media="screen">.jfk-bubble.gtx-bubble, .captcheck_answer_label > input + img, span#closed_text > img[src^="https://www.gstatic.com/images/branding/googlelogo"], span[data-href^="https://www.hcaptcha.com/"] > #icon, ::-webkit-calendar-picker-indicator, img.Wirisformula {
	filter: invert(100%) hue-rotate(180deg) contrast(90%) !important;
}</style><style class="darkreader darkreader--inline" media="screen">[data-darkreader-inline-bgcolor] {
	background-color: var(--darkreader-inline-bgcolor) !important;
}
[data-darkreader-inline-bgimage] {
	background-image: var(--darkreader-inline-bgimage) !important;
}
[data-darkreader-inline-border] {
	border-color: var(--darkreader-inline-border) !important;
}
[data-darkreader-inline-border-bottom] {
	border-bottom-color: var(--darkreader-inline-border-bottom) !important;
}
[data-darkreader-inline-border-left] {
	border-left-color: var(--darkreader-inline-border-left) !important;
}
[data-darkreader-inline-border-right] {
	border-right-color: var(--darkreader-inline-border-right) !important;
}
[data-darkreader-inline-border-top] {
	border-top-color: var(--darkreader-inline-border-top) !important;
}
[data-darkreader-inline-boxshadow] {
	box-shadow: var(--darkreader-inline-boxshadow) !important;
}
[data-darkreader-inline-color] {
	color: var(--darkreader-inline-color) !important;
}
[data-darkreader-inline-fill] {
	fill: var(--darkreader-inline-fill) !important;
}
[data-darkreader-inline-stroke] {
	stroke: var(--darkreader-inline-stroke) !important;
}
[data-darkreader-inline-outline] {
	outline-color: var(--darkreader-inline-outline) !important;
}
[data-darkreader-inline-stopcolor] {
	stop-color: var(--darkreader-inline-stopcolor) !important;
}
[data-darkreader-inline-bg] {
	background: var(--darkreader-inline-bg) !important;
}
[data-darkreader-inline-invert] {
	filter: invert(100%) hue-rotate(180deg);
}</style><style class="darkreader darkreader--variables" media="screen">:root {
	--darkreader-neutral-background: #131516;
	--darkreader-neutral-text: #d8d4cf;
	--darkreader-selection-background: #004daa;
	--darkreader-selection-text: #e8e6e3;
}</style><style class="darkreader darkreader--root-vars" media="screen"></style><style class="darkreader darkreader--user-agent" media="screen">@layer {
	html {
		background-color: #181a1b !important;
	}
	html {
		color-scheme: dark !important;
	}
	iframe {
		color-scheme: initial;
	}
	html, body {
		background-color: #181a1b;
	}
	html, body {
		border-color: #736b5e;
		color: #e8e6e3;
	}
	a {
		color: #3391ff;
	}
	table {
		border-color: #545b5e;
	}
	mark {
		color: #e8e6e3;
	}
	::placeholder {
		color: #b2aba1;
	}
	input:-webkit-autofill,
	textarea:-webkit-autofill,
	select:-webkit-autofill {
		background-color: #404400 !important;
		color: #e8e6e3 !important;
	}
	::-webkit-scrollbar {
		background-color: #202324;
		color: #aba499;
	}
	::-webkit-scrollbar-thumb {
		background-color: #454a4d;
	}
	::-webkit-scrollbar-thumb:hover {
		background-color: #575e62;
	}
	::-webkit-scrollbar-thumb:active {
		background-color: #484e51;
	}
	::-webkit-scrollbar-corner {
		background-color: #181a1b;
	}
	::selection {
		background-color: #004daa !important;
		color: #e8e6e3 !important;
	}
	::-moz-selection {
		background-color: #004daa !important;
		color: #e8e6e3 !important;
	}
}</style>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="../img/pages/icon.png" type="image/png">
	<title>나의 통계</title>
	<!-- Bootstrap Css -->
	<link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css"><style class="darkreader darkreader--sync" media="screen"></style>
	<!-- Icofont Css -->
	<link rel="stylesheet" href="../venduser-myStat2.jsper/icofont/icofont.min.css">
	<!-- AOS Css -->
	<link rel="stylesheet" href="../vender/aos/dist/aos.css"><style class="darkreader darkreader--sync" media="screen"></style>
	<!-- Remix Icons -->
	<link rel="stylesheet" href="../vender/remixicon/remixicon.css"><style class="darkreader darkreader--sync" media="screen"></style>
	<!-- Custom Css -->
	<link rel="stylesheet" href="../css/style2.css"><style class="darkreader darkreader--cors" media="screen">body{
		font-family: 'DungGeunMo', sans-serif;
	}


	a{
		text-decoration: none;
		color: #e14a00;
	}
	.text-purple{
		color: #f14f00 !important;
	}
	.btn-theme {
		padding: 10px 25px !important;
	}
	.btn-purple{
		background-color: #f14f00;
		color: #ffffff;
		border: 1px solid #f14f00;
	}
	.btn-purple:hover, .btn-purple:focus, .btn-outline-purple:hover {
		background-color: #e14a00;
		color: #ffffff;
		border: 1px solid #e14a00;
	}
	.btn-outline-purple{
		color: #e14a00;
		border: 1px solid #e14a00;
	}
	.nav-pills.purple-tab .nav-link.active, .nav-pills.purple-tab .show>.nav-link {
		background-color: #f14f00;
	}
	.bg-purple{
		background-color: #f14f00;
	}
	.purple-tab .nav-link {
		color: #f14f00;
	}
	.border-primary {
		border-color: #f14f00 !important;
	}
	.form-check-input:checked {
		background-color: #f14f00;
		border-color: #f14f00;
	}
	.breadcrumb.bg-dark .breadcrumb-item+.breadcrumb-item::before {
		color: rgb(204 204 204 / 23%);
	}
	.bg-opacity-purple {
		background: rgb(139 61 255 / 8%);
	}


	.osahan-header-logo .logo {
		height: 30px;
	}
	.osahan-main-nav.fixed-top {
		background-color: #000000 !important;
	}
	.elements-top-header  a.nav-link {
		padding-top: 30px !important;
		padding-bottom: 30px !important;
		color: #ffffff !important;
	}
	.my-account-nav  a.nav-link {
		padding-top: 30px !important;
		padding-bottom: 30px !important;
	}


	.svg-border-rounded svg {
		position: absolute;
		bottom: 0;
		left: 0;
		height: 60px;
		width: 100%;
	}
	.sticky-sidebar {
		position: sticky;
		top: 20px;
	}
	.bg-primary.rounded-circle.admin-icon img {
		height: 22px;
		width: 22px;
		object-fit: cover;
	}
	.bg-primary.rounded-circle.admin-icon {
		background: transparent !important;
	}
	.blog-list-osahan .cover-background img {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	.blog-author-profile-header .profile-img {
		height: 120px;
		width: 120px;
		object-fit: cover;
	}
	.portfolio-osahan-w .card-img {
		height: 300px;
		object-fit: cover;
	}
	.portfolio-osahan-h .card-img {
		height: 600px;
		object-fit: cover;
	}
	.shop-product-detail-slider {
		margin-top: -155px !important;
	}
	.shop-product-detail-slider.small-img .img-fluid {
		border: 4px solid #fff;
	}
	.shop-product-detail-slider.small-img .img-fluid.slick-current.slick-active {
		border-color: #f14f00;
	}


	.avtar-sm {
		width: 40px;
		height: 40px;
		object-fit: cover;
	}
	.osahan-sidebar {
		margin-top: -120px;
		position: relative;
	}
	.osahan-sidebar .profile-img {
		height: 120px;
		width: 120px;
		object-fit: cover;
	}
	.btn-file {
		position: relative;
		overflow: hidden;
	}
	.btn-file input[type=file] {
		position: absolute;
		top: 0;
		right: 0;
		text-align: right;
		filter: alpha(opacity=0);
		opacity: 0;
		outline: none;
		cursor: inherit;
		width: 125px;
		display: block;
		height: 38px;
	}
	.osahan-sidebar-links .dropdown-item {
		font-size: 15px;
		padding: 12px 15px;
		color: #595c5f;
		border-radius: 8px;
		margin: 2px 0;
	}
	.osahan-sidebar-links .dropdown-item.active, .osahan-sidebar-links .dropdown-item:hover {
		background: rgb(139 61 255 / 8%);
		color: #f14f00;
	}
	.osahan-user-header {
		background-image: url('http://localhost:8080/img/pages/banner.jpeg');
		position: relative;
		display: flex;
		align-items: flex-end;
		height: 400px;
		border-radius: 24px;
		background-repeat: no-repeat;
		background-position: 50% 50%;
		background-size: cover;
		overflow: hidden;
		max-width: 1380px;
		margin: auto;
	}
	.build-something-together {
		background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('http://localhost:8080/img/pages/banner.jpeg');
		background-position: top;
		background-repeat: no-repeat;
		background-size: cover;
		margin-bottom: -10rem;
	}
	.footer-icon {
		height: 45px;
		width: 45px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.nav-tabs-osahan .nav-link {
		color: #979797;
	}
	.nav-tabs-osahan .nav-link.active {
		color: #f14f00;
	}


	.bg-elements {
		background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('http://localhost:8080/img/pages/banner.jpeg');
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
	}


	.cart-img.rounded-2 {
		height: 70px;
		width: 58px;
		min-width: 58px;
		object-fit: cover;
	}
	.quantity-osahan {
		width: 110px;
		text-align: center;
		border-radius: 10px;
		border: 0px solid #dee2e6;
		overflow: hidden;
		padding: 3px;
	}
	.quantity-osahan .quantity-input {
		text-align: center;
	}
	.quantity-osahan .btn {
		padding: 0 0 1px 0;
		border-radius: 8px !important;
		width: 33px;
		height: 33px;
		display: flex;
		align-items: end;
		justify-content: center;
		font-size: 23px;
	}
	.quantity-osahan .quantity-input {
		border: none;
		padding: 0px;
	}


	.osahan-filter .accordion-button {
		border-radius: 0px !important;
		font-weight: bold;
		color: #000;
		padding: 0 0 19px 0px;
		background: none;
		text-transform: uppercase;
		font-size: 15px;
		border-bottom: 1px solid #dee2e6;
		box-shadow: none;
		letter-spacing: 1px;
		position: relative;
	}
	.osahan-filter .accordion-item {
		border: none;
		border-radius: 0px !important;
		margin-bottom: 20px;
	}
	.osahan-filter .accordion-body {
		padding: 18px 0 27px 0;
	}
	.osahan-filter .accordion-button:after {
		width: 16px;
		height: 16px;
		background-size: 16px;
	}
	.osahan-filter .accordion-button:before {
		border-bottom: 3px solid #f14f00;
		width: 62px;
		position: absolute;
		content: "";
		bottom: -1px;
	}


	@media (max-width:992px) {
		.m-none {
			display: none;
		}
	}
	@media (min-width:1280px) {
		.position-lg-relative {
			position: relative;
		}
		.position-lg-absolute {
			position: absolute;
		}
	}</style><style class="darkreader darkreader--sync" media="screen"></style>
	<!-- Common Css -->
	<link rel="stylesheet" href="../css/common.css"><style class="darkreader darkreader--cors" media="screen">.bi::before,[class*=" bi-"]::before,[class^=bi-]::before{display:inline-block;font-family:bootstrap-icons!important;font-style:normal;font-weight:400!important;font-variant:normal;text-transform:none;line-height:1;vertical-align:-.125em;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}.bi-123::before{content:"\f67f"}.bi-alarm-fill::before{content:"\f101"}.bi-alarm::before{content:"\f102"}.bi-align-bottom::before{content:"\f103"}.bi-align-center::before{content:"\f104"}.bi-align-end::before{content:"\f105"}.bi-align-middle::before{content:"\f106"}.bi-align-start::before{content:"\f107"}.bi-align-top::before{content:"\f108"}.bi-alt::before{content:"\f109"}.bi-app-indicator::before{content:"\f10a"}.bi-app::before{content:"\f10b"}.bi-archive-fill::before{content:"\f10c"}.bi-archive::before{content:"\f10d"}.bi-arrow-90deg-down::before{content:"\f10e"}.bi-arrow-90deg-left::before{content:"\f10f"}.bi-arrow-90deg-right::before{content:"\f110"}.bi-arrow-90deg-up::before{content:"\f111"}.bi-arrow-bar-down::before{content:"\f112"}.bi-arrow-bar-left::before{content:"\f113"}.bi-arrow-bar-right::before{content:"\f114"}.bi-arrow-bar-up::before{content:"\f115"}.bi-arrow-clockwise::before{content:"\f116"}.bi-arrow-counterclockwise::before{content:"\f117"}.bi-arrow-down-circle-fill::before{content:"\f118"}.bi-arrow-down-circle::before{content:"\f119"}.bi-arrow-down-left-circle-fill::before{content:"\f11a"}.bi-arrow-down-left-circle::before{content:"\f11b"}.bi-arrow-down-left-square-fill::before{content:"\f11c"}.bi-arrow-down-left-square::before{content:"\f11d"}.bi-arrow-down-left::before{content:"\f11e"}.bi-arrow-down-right-circle-fill::before{content:"\f11f"}.bi-arrow-down-right-circle::before{content:"\f120"}.bi-arrow-down-right-square-fill::before{content:"\f121"}.bi-arrow-down-right-square::before{content:"\f122"}.bi-arrow-down-right::before{content:"\f123"}.bi-arrow-down-short::before{content:"\f124"}.bi-arrow-down-square-fill::before{content:"\f125"}.bi-arrow-down-square::before{content:"\f126"}.bi-arrow-down-up::before{content:"\f127"}.bi-arrow-down::before{content:"\f128"}.bi-arrow-left-circle-fill::before{content:"\f129"}.bi-arrow-left-circle::before{content:"\f12a"}.bi-arrow-left-right::before{content:"\f12b"}.bi-arrow-left-short::before{content:"\f12c"}.bi-arrow-left-square-fill::before{content:"\f12d"}.bi-arrow-left-square::before{content:"\f12e"}.bi-arrow-left::before{content:"\f12f"}.bi-arrow-repeat::before{content:"\f130"}.bi-arrow-return-left::before{content:"\f131"}.bi-arrow-return-right::before{content:"\f132"}.bi-arrow-right-circle-fill::before{content:"\f133"}.bi-arrow-right-circle::before{content:"\f134"}.bi-arrow-right-short::before{content:"\f135"}.bi-arrow-right-square-fill::before{content:"\f136"}.bi-arrow-right-square::before{content:"\f137"}.bi-arrow-right::before{content:"\f138"}.bi-arrow-up-circle-fill::before{content:"\f139"}.bi-arrow-up-circle::before{content:"\f13a"}.bi-arrow-up-left-circle-fill::before{content:"\f13b"}.bi-arrow-up-left-circle::before{content:"\f13c"}.bi-arrow-up-left-square-fill::before{content:"\f13d"}.bi-arrow-up-left-square::before{content:"\f13e"}.bi-arrow-up-left::before{content:"\f13f"}.bi-arrow-up-right-circle-fill::before{content:"\f140"}.bi-arrow-up-right-circle::before{content:"\f141"}.bi-arrow-up-right-square-fill::before{content:"\f142"}.bi-arrow-up-right-square::before{content:"\f143"}.bi-arrow-up-right::before{content:"\f144"}.bi-arrow-up-short::before{content:"\f145"}.bi-arrow-up-square-fill::before{content:"\f146"}.bi-arrow-up-square::before{content:"\f147"}.bi-arrow-up::before{content:"\f148"}.bi-arrows-angle-contract::before{content:"\f149"}.bi-arrows-angle-expand::before{content:"\f14a"}.bi-arrows-collapse::before{content:"\f14b"}.bi-arrows-expand::before{content:"\f14c"}.bi-arrows-fullscreen::before{content:"\f14d"}.bi-arrows-move::before{content:"\f14e"}.bi-aspect-ratio-fill::before{content:"\f14f"}.bi-aspect-ratio::before{content:"\f150"}.bi-asterisk::before{content:"\f151"}.bi-at::before{content:"\f152"}.bi-award-fill::before{content:"\f153"}.bi-award::before{content:"\f154"}.bi-back::before{content:"\f155"}.bi-backspace-fill::before{content:"\f156"}.bi-backspace-reverse-fill::before{content:"\f157"}.bi-backspace-reverse::before{content:"\f158"}.bi-backspace::before{content:"\f159"}.bi-badge-3d-fill::before{content:"\f15a"}.bi-badge-3d::before{content:"\f15b"}.bi-badge-4k-fill::before{content:"\f15c"}.bi-badge-4k::before{content:"\f15d"}.bi-badge-8k-fill::before{content:"\f15e"}.bi-badge-8k::before{content:"\f15f"}.bi-badge-ad-fill::before{content:"\f160"}.bi-badge-ad::before{content:"\f161"}.bi-badge-ar-fill::before{content:"\f162"}.bi-badge-ar::before{content:"\f163"}.bi-badge-cc-fill::before{content:"\f164"}.bi-badge-cc::before{content:"\f165"}.bi-badge-hd-fill::before{content:"\f166"}.bi-badge-hd::before{content:"\f167"}.bi-badge-tm-fill::before{content:"\f168"}.bi-badge-tm::before{content:"\f169"}.bi-badge-vo-fill::before{content:"\f16a"}.bi-badge-vo::before{content:"\f16b"}.bi-badge-vr-fill::before{content:"\f16c"}.bi-badge-vr::before{content:"\f16d"}.bi-badge-wc-fill::before{content:"\f16e"}.bi-badge-wc::before{content:"\f16f"}.bi-bag-check-fill::before{content:"\f170"}.bi-bag-check::before{content:"\f171"}.bi-bag-dash-fill::before{content:"\f172"}.bi-bag-dash::before{content:"\f173"}.bi-bag-fill::before{content:"\f174"}.bi-bag-plus-fill::before{content:"\f175"}.bi-bag-plus::before{content:"\f176"}.bi-bag-x-fill::before{content:"\f177"}.bi-bag-x::before{content:"\f178"}.bi-bag::before{content:"\f179"}.bi-bar-chart-fill::before{content:"\f17a"}.bi-bar-chart-line-fill::before{content:"\f17b"}.bi-bar-chart-line::before{content:"\f17c"}.bi-bar-chart-steps::before{content:"\f17d"}.bi-bar-chart::before{content:"\f17e"}.bi-basket-fill::before{content:"\f17f"}.bi-basket::before{content:"\f180"}.bi-basket2-fill::before{content:"\f181"}.bi-basket2::before{content:"\f182"}.bi-basket3-fill::before{content:"\f183"}.bi-basket3::before{content:"\f184"}.bi-battery-charging::before{content:"\f185"}.bi-battery-full::before{content:"\f186"}.bi-battery-half::before{content:"\f187"}.bi-battery::before{content:"\f188"}.bi-bell-fill::before{content:"\f189"}.bi-bell::before{content:"\f18a"}.bi-bezier::before{content:"\f18b"}.bi-bezier2::before{content:"\f18c"}.bi-bicycle::before{content:"\f18d"}.bi-binoculars-fill::before{content:"\f18e"}.bi-binoculars::before{content:"\f18f"}.bi-blockquote-left::before{content:"\f190"}.bi-blockquote-right::before{content:"\f191"}.bi-book-fill::before{content:"\f192"}.bi-book-half::before{content:"\f193"}.bi-book::before{content:"\f194"}.bi-bookmark-check-fill::before{content:"\f195"}.bi-bookmark-check::before{content:"\f196"}.bi-bookmark-dash-fill::before{content:"\f197"}.bi-bookmark-dash::before{content:"\f198"}.bi-bookmark-fill::before{content:"\f199"}.bi-bookmark-heart-fill::before{content:"\f19a"}.bi-bookmark-heart::before{content:"\f19b"}.bi-bookmark-plus-fill::before{content:"\f19c"}.bi-bookmark-plus::before{content:"\f19d"}.bi-bookmark-star-fill::before{content:"\f19e"}.bi-bookmark-star::before{content:"\f19f"}.bi-bookmark-x-fill::before{content:"\f1a0"}.bi-bookmark-x::before{content:"\f1a1"}.bi-bookmark::before{content:"\f1a2"}.bi-bookmarks-fill::before{content:"\f1a3"}.bi-bookmarks::before{content:"\f1a4"}.bi-bookshelf::before{content:"\f1a5"}.bi-bootstrap-fill::before{content:"\f1a6"}.bi-bootstrap-reboot::before{content:"\f1a7"}.bi-bootstrap::before{content:"\f1a8"}.bi-border-all::before{content:"\f1a9"}.bi-border-bottom::before{content:"\f1aa"}.bi-border-center::before{content:"\f1ab"}.bi-border-inner::before{content:"\f1ac"}.bi-border-left::before{content:"\f1ad"}.bi-border-middle::before{content:"\f1ae"}.bi-border-outer::before{content:"\f1af"}.bi-border-right::before{content:"\f1b0"}.bi-border-style::before{content:"\f1b1"}.bi-border-top::before{content:"\f1b2"}.bi-border-width::before{content:"\f1b3"}.bi-border::before{content:"\f1b4"}.bi-bounding-box-circles::before{content:"\f1b5"}.bi-bounding-box::before{content:"\f1b6"}.bi-box-arrow-down-left::before{content:"\f1b7"}.bi-box-arrow-down-right::before{content:"\f1b8"}.bi-box-arrow-down::before{content:"\f1b9"}.bi-box-arrow-in-down-left::before{content:"\f1ba"}.bi-box-arrow-in-down-right::before{content:"\f1bb"}.bi-box-arrow-in-down::before{content:"\f1bc"}.bi-box-arrow-in-left::before{content:"\f1bd"}.bi-box-arrow-in-right::before{content:"\f1be"}.bi-box-arrow-in-up-left::before{content:"\f1bf"}.bi-box-arrow-in-up-right::before{content:"\f1c0"}.bi-box-arrow-in-up::before{content:"\f1c1"}.bi-box-arrow-left::before{content:"\f1c2"}.bi-box-arrow-right::before{content:"\f1c3"}.bi-box-arrow-up-left::before{content:"\f1c4"}.bi-box-arrow-up-right::before{content:"\f1c5"}.bi-box-arrow-up::before{content:"\f1c6"}.bi-box-seam::before{content:"\f1c7"}.bi-box::before{content:"\f1c8"}.bi-braces::before{content:"\f1c9"}.bi-bricks::before{content:"\f1ca"}.bi-briefcase-fill::before{content:"\f1cb"}.bi-briefcase::before{content:"\f1cc"}.bi-brightness-alt-high-fill::before{content:"\f1cd"}.bi-brightness-alt-high::before{content:"\f1ce"}.bi-brightness-alt-low-fill::before{content:"\f1cf"}.bi-brightness-alt-low::before{content:"\f1d0"}.bi-brightness-high-fill::before{content:"\f1d1"}.bi-brightness-high::before{content:"\f1d2"}.bi-brightness-low-fill::before{content:"\f1d3"}.bi-brightness-low::before{content:"\f1d4"}.bi-broadcast-pin::before{content:"\f1d5"}.bi-broadcast::before{content:"\f1d6"}.bi-brush-fill::before{content:"\f1d7"}.bi-brush::before{content:"\f1d8"}.bi-bucket-fill::before{content:"\f1d9"}.bi-bucket::before{content:"\f1da"}.bi-bug-fill::before{content:"\f1db"}.bi-bug::before{content:"\f1dc"}.bi-building::before{content:"\f1dd"}.bi-bullseye::before{content:"\f1de"}.bi-calculator-fill::before{content:"\f1df"}.bi-calculator::before{content:"\f1e0"}.bi-calendar-check-fill::before{content:"\f1e1"}.bi-calendar-check::before{content:"\f1e2"}.bi-calendar-date-fill::before{content:"\f1e3"}.bi-calendar-date::before{content:"\f1e4"}.bi-calendar-day-fill::before{content:"\f1e5"}.bi-calendar-day::before{content:"\f1e6"}.bi-calendar-event-fill::before{content:"\f1e7"}.bi-calendar-event::before{content:"\f1e8"}.bi-calendar-fill::before{content:"\f1e9"}.bi-calendar-minus-fill::before{content:"\f1ea"}.bi-calendar-minus::before{content:"\f1eb"}.bi-calendar-month-fill::before{content:"\f1ec"}.bi-calendar-month::before{content:"\f1ed"}.bi-calendar-plus-fill::before{content:"\f1ee"}.bi-calendar-plus::before{content:"\f1ef"}.bi-calendar-range-fill::before{content:"\f1f0"}.bi-calendar-range::before{content:"\f1f1"}.bi-calendar-week-fill::before{content:"\f1f2"}.bi-calendar-week::before{content:"\f1f3"}.bi-calendar-x-fill::before{content:"\f1f4"}.bi-calendar-x::before{content:"\f1f5"}.bi-calendar::before{content:"\f1f6"}.bi-calendar2-check-fill::before{content:"\f1f7"}.bi-calendar2-check::before{content:"\f1f8"}.bi-calendar2-date-fill::before{content:"\f1f9"}.bi-calendar2-date::before{content:"\f1fa"}.bi-calendar2-day-fill::before{content:"\f1fb"}.bi-calendar2-day::before{content:"\f1fc"}.bi-calendar2-event-fill::before{content:"\f1fd"}.bi-calendar2-event::before{content:"\f1fe"}.bi-calendar2-fill::before{content:"\f1ff"}.bi-calendar2-minus-fill::before{content:"\f200"}.bi-calendar2-minus::before{content:"\f201"}.bi-calendar2-month-fill::before{content:"\f202"}.bi-calendar2-month::before{content:"\f203"}.bi-calendar2-plus-fill::before{content:"\f204"}.bi-calendar2-plus::before{content:"\f205"}.bi-calendar2-range-fill::before{content:"\f206"}.bi-calendar2-range::before{content:"\f207"}.bi-calendar2-week-fill::before{content:"\f208"}.bi-calendar2-week::before{content:"\f209"}.bi-calendar2-x-fill::before{content:"\f20a"}.bi-calendar2-x::before{content:"\f20b"}.bi-calendar2::before{content:"\f20c"}.bi-calendar3-event-fill::before{content:"\f20d"}.bi-calendar3-event::before{content:"\f20e"}.bi-calendar3-fill::before{content:"\f20f"}.bi-calendar3-range-fill::before{content:"\f210"}.bi-calendar3-range::before{content:"\f211"}.bi-calendar3-week-fill::before{content:"\f212"}.bi-calendar3-week::before{content:"\f213"}.bi-calendar3::before{content:"\f214"}.bi-calendar4-event::before{content:"\f215"}.bi-calendar4-range::before{content:"\f216"}.bi-calendar4-week::before{content:"\f217"}.bi-calendar4::before{content:"\f218"}.bi-camera-fill::before{content:"\f219"}.bi-camera-reels-fill::before{content:"\f21a"}.bi-camera-reels::before{content:"\f21b"}.bi-camera-video-fill::before{content:"\f21c"}.bi-camera-video-off-fill::before{content:"\f21d"}.bi-camera-video-off::before{content:"\f21e"}.bi-camera-video::before{content:"\f21f"}.bi-camera::before{content:"\f220"}.bi-camera2::before{content:"\f221"}.bi-capslock-fill::before{content:"\f222"}.bi-capslock::before{content:"\f223"}.bi-card-checklist::before{content:"\f224"}.bi-card-heading::before{content:"\f225"}.bi-card-image::before{content:"\f226"}.bi-card-list::before{content:"\f227"}.bi-card-text::before{content:"\f228"}.bi-caret-down-fill::before{content:"\f229"}.bi-caret-down-square-fill::before{content:"\f22a"}.bi-caret-down-square::before{content:"\f22b"}.bi-caret-down::before{content:"\f22c"}.bi-caret-left-fill::before{content:"\f22d"}.bi-caret-left-square-fill::before{content:"\f22e"}.bi-caret-left-square::before{content:"\f22f"}.bi-caret-left::before{content:"\f230"}.bi-caret-right-fill::before{content:"\f231"}.bi-caret-right-square-fill::before{content:"\f232"}.bi-caret-right-square::before{content:"\f233"}.bi-caret-right::before{content:"\f234"}.bi-caret-up-fill::before{content:"\f235"}.bi-caret-up-square-fill::before{content:"\f236"}.bi-caret-up-square::before{content:"\f237"}.bi-caret-up::before{content:"\f238"}.bi-cart-check-fill::before{content:"\f239"}.bi-cart-check::before{content:"\f23a"}.bi-cart-dash-fill::before{content:"\f23b"}.bi-cart-dash::before{content:"\f23c"}.bi-cart-fill::before{content:"\f23d"}.bi-cart-plus-fill::before{content:"\f23e"}.bi-cart-plus::before{content:"\f23f"}.bi-cart-x-fill::before{content:"\f240"}.bi-cart-x::before{content:"\f241"}.bi-cart::before{content:"\f242"}.bi-cart2::before{content:"\f243"}.bi-cart3::before{content:"\f244"}.bi-cart4::before{content:"\f245"}.bi-cash-stack::before{content:"\f246"}.bi-cash::before{content:"\f247"}.bi-cast::before{content:"\f248"}.bi-chat-dots-fill::before{content:"\f249"}.bi-chat-dots::before{content:"\f24a"}.bi-chat-fill::before{content:"\f24b"}.bi-chat-left-dots-fill::before{content:"\f24c"}.bi-chat-left-dots::before{content:"\f24d"}.bi-chat-left-fill::before{content:"\f24e"}.bi-chat-left-quote-fill::before{content:"\f24f"}.bi-chat-left-quote::before{content:"\f250"}.bi-chat-left-text-fill::before{content:"\f251"}.bi-chat-left-text::before{content:"\f252"}.bi-chat-left::before{content:"\f253"}.bi-chat-quote-fill::before{content:"\f254"}.bi-chat-quote::before{content:"\f255"}.bi-chat-right-dots-fill::before{content:"\f256"}.bi-chat-right-dots::before{content:"\f257"}.bi-chat-right-fill::before{content:"\f258"}.bi-chat-right-quote-fill::before{content:"\f259"}.bi-chat-right-quote::before{content:"\f25a"}.bi-chat-right-text-fill::before{content:"\f25b"}.bi-chat-right-text::before{content:"\f25c"}.bi-chat-right::before{content:"\f25d"}.bi-chat-square-dots-fill::before{content:"\f25e"}.bi-chat-square-dots::before{content:"\f25f"}.bi-chat-square-fill::before{content:"\f260"}.bi-chat-square-quote-fill::before{content:"\f261"}.bi-chat-square-quote::before{content:"\f262"}.bi-chat-square-text-fill::before{content:"\f263"}.bi-chat-square-text::before{content:"\f264"}.bi-chat-square::before{content:"\f265"}.bi-chat-text-fill::before{content:"\f266"}.bi-chat-text::before{content:"\f267"}.bi-chat::before{content:"\f268"}.bi-check-all::before{content:"\f269"}.bi-check-circle-fill::before{content:"\f26a"}.bi-check-circle::before{content:"\f26b"}.bi-check-square-fill::before{content:"\f26c"}.bi-check-square::before{content:"\f26d"}.bi-check::before{content:"\f26e"}.bi-check2-all::before{content:"\f26f"}.bi-check2-circle::before{content:"\f270"}.bi-check2-square::before{content:"\f271"}.bi-check2::before{content:"\f272"}.bi-chevron-bar-contract::before{content:"\f273"}.bi-chevron-bar-down::before{content:"\f274"}.bi-chevron-bar-expand::before{content:"\f275"}.bi-chevron-bar-left::before{content:"\f276"}.bi-chevron-bar-right::before{content:"\f277"}.bi-chevron-bar-up::before{content:"\f278"}.bi-chevron-compact-down::before{content:"\f279"}.bi-chevron-compact-left::before{content:"\f27a"}.bi-chevron-compact-right::before{content:"\f27b"}.bi-chevron-compact-up::before{content:"\f27c"}.bi-chevron-contract::before{content:"\f27d"}.bi-chevron-double-down::before{content:"\f27e"}.bi-chevron-double-left::before{content:"\f27f"}.bi-chevron-double-right::before{content:"\f280"}.bi-chevron-double-up::before{content:"\f281"}.bi-chevron-down::before{content:"\f282"}.bi-chevron-expand::before{content:"\f283"}.bi-chevron-left::before{content:"\f284"}.bi-chevron-right::before{content:"\f285"}.bi-chevron-up::before{content:"\f286"}.bi-circle-fill::before{content:"\f287"}.bi-circle-half::before{content:"\f288"}.bi-circle-square::before{content:"\f289"}.bi-circle::before{content:"\f28a"}.bi-clipboard-check::before{content:"\f28b"}.bi-clipboard-data::before{content:"\f28c"}.bi-clipboard-minus::before{content:"\f28d"}.bi-clipboard-plus::before{content:"\f28e"}.bi-clipboard-x::before{content:"\f28f"}.bi-clipboard::before{content:"\f290"}.bi-clock-fill::before{content:"\f291"}.bi-clock-history::before{content:"\f292"}.bi-clock::before{content:"\f293"}.bi-cloud-arrow-down-fill::before{content:"\f294"}.bi-cloud-arrow-down::before{content:"\f295"}.bi-cloud-arrow-up-fill::before{content:"\f296"}.bi-cloud-arrow-up::before{content:"\f297"}.bi-cloud-check-fill::before{content:"\f298"}.bi-cloud-check::before{content:"\f299"}.bi-cloud-download-fill::before{content:"\f29a"}.bi-cloud-download::before{content:"\f29b"}.bi-cloud-drizzle-fill::before{content:"\f29c"}.bi-cloud-drizzle::before{content:"\f29d"}.bi-cloud-fill::before{content:"\f29e"}.bi-cloud-fog-fill::before{content:"\f29f"}.bi-cloud-fog::before{content:"\f2a0"}.bi-cloud-fog2-fill::before{content:"\f2a1"}.bi-cloud-fog2::before{content:"\f2a2"}.bi-cloud-hail-fill::before{content:"\f2a3"}.bi-cloud-hail::before{content:"\f2a4"}.bi-cloud-haze-fill::before{content:"\f2a6"}.bi-cloud-haze::before{content:"\f2a7"}.bi-cloud-haze2-fill::before{content:"\f2a8"}.bi-cloud-lightning-fill::before{content:"\f2a9"}.bi-cloud-lightning-rain-fill::before{content:"\f2aa"}.bi-cloud-lightning-rain::before{content:"\f2ab"}.bi-cloud-lightning::before{content:"\f2ac"}.bi-cloud-minus-fill::before{content:"\f2ad"}.bi-cloud-minus::before{content:"\f2ae"}.bi-cloud-moon-fill::before{content:"\f2af"}.bi-cloud-moon::before{content:"\f2b0"}.bi-cloud-plus-fill::before{content:"\f2b1"}.bi-cloud-plus::before{content:"\f2b2"}.bi-cloud-rain-fill::before{content:"\f2b3"}.bi-cloud-rain-heavy-fill::before{content:"\f2b4"}.bi-cloud-rain-heavy::before{content:"\f2b5"}.bi-cloud-rain::before{content:"\f2b6"}.bi-cloud-slash-fill::before{content:"\f2b7"}.bi-cloud-slash::before{content:"\f2b8"}.bi-cloud-sleet-fill::before{content:"\f2b9"}.bi-cloud-sleet::before{content:"\f2ba"}.bi-cloud-snow-fill::before{content:"\f2bb"}.bi-cloud-snow::before{content:"\f2bc"}.bi-cloud-sun-fill::before{content:"\f2bd"}.bi-cloud-sun::before{content:"\f2be"}.bi-cloud-upload-fill::before{content:"\f2bf"}.bi-cloud-upload::before{content:"\f2c0"}.bi-cloud::before{content:"\f2c1"}.bi-clouds-fill::before{content:"\f2c2"}.bi-clouds::before{content:"\f2c3"}.bi-cloudy-fill::before{content:"\f2c4"}.bi-cloudy::before{content:"\f2c5"}.bi-code-slash::before{content:"\f2c6"}.bi-code-square::before{content:"\f2c7"}.bi-code::before{content:"\f2c8"}.bi-collection-fill::before{content:"\f2c9"}.bi-collection-play-fill::before{content:"\f2ca"}.bi-collection-play::before{content:"\f2cb"}.bi-collection::before{content:"\f2cc"}.bi-columns-gap::before{content:"\f2cd"}.bi-columns::before{content:"\f2ce"}.bi-command::before{content:"\f2cf"}.bi-compass-fill::before{content:"\f2d0"}.bi-compass::before{content:"\f2d1"}.bi-cone-striped::before{content:"\f2d2"}.bi-cone::before{content:"\f2d3"}.bi-controller::before{content:"\f2d4"}.bi-cpu-fill::before{content:"\f2d5"}.bi-cpu::before{content:"\f2d6"}.bi-credit-card-2-back-fill::before{content:"\f2d7"}.bi-credit-card-2-back::before{content:"\f2d8"}.bi-credit-card-2-front-fill::before{content:"\f2d9"}.bi-credit-card-2-front::before{content:"\f2da"}.bi-credit-card-fill::before{content:"\f2db"}.bi-credit-card::before{content:"\f2dc"}.bi-crop::before{content:"\f2dd"}.bi-cup-fill::before{content:"\f2de"}.bi-cup-straw::before{content:"\f2df"}.bi-cup::before{content:"\f2e0"}.bi-cursor-fill::before{content:"\f2e1"}.bi-cursor-text::before{content:"\f2e2"}.bi-cursor::before{content:"\f2e3"}.bi-dash-circle-dotted::before{content:"\f2e4"}.bi-dash-circle-fill::before{content:"\f2e5"}.bi-dash-circle::before{content:"\f2e6"}.bi-dash-square-dotted::before{content:"\f2e7"}.bi-dash-square-fill::before{content:"\f2e8"}.bi-dash-square::before{content:"\f2e9"}.bi-dash::before{content:"\f2ea"}.bi-diagram-2-fill::before{content:"\f2eb"}.bi-diagram-2::before{content:"\f2ec"}.bi-diagram-3-fill::before{content:"\f2ed"}.bi-diagram-3::before{content:"\f2ee"}.bi-diamond-fill::before{content:"\f2ef"}.bi-diamond-half::before{content:"\f2f0"}.bi-diamond::before{content:"\f2f1"}.bi-dice-1-fill::before{content:"\f2f2"}.bi-dice-1::before{content:"\f2f3"}.bi-dice-2-fill::before{content:"\f2f4"}.bi-dice-2::before{content:"\f2f5"}.bi-dice-3-fill::before{content:"\f2f6"}.bi-dice-3::before{content:"\f2f7"}.bi-dice-4-fill::before{content:"\f2f8"}.bi-dice-4::before{content:"\f2f9"}.bi-dice-5-fill::before{content:"\f2fa"}.bi-dice-5::before{content:"\f2fb"}.bi-dice-6-fill::before{content:"\f2fc"}.bi-dice-6::before{content:"\f2fd"}.bi-disc-fill::before{content:"\f2fe"}.bi-disc::before{content:"\f2ff"}.bi-discord::before{content:"\f300"}.bi-display-fill::before{content:"\f301"}.bi-display::before{content:"\f302"}.bi-distribute-horizontal::before{content:"\f303"}.bi-distribute-vertical::before{content:"\f304"}.bi-door-closed-fill::before{content:"\f305"}.bi-door-closed::before{content:"\f306"}.bi-door-open-fill::before{content:"\f307"}.bi-door-open::before{content:"\f308"}.bi-dot::before{content:"\f309"}.bi-download::before{content:"\f30a"}.bi-droplet-fill::before{content:"\f30b"}.bi-droplet-half::before{content:"\f30c"}.bi-droplet::before{content:"\f30d"}.bi-earbuds::before{content:"\f30e"}.bi-easel-fill::before{content:"\f30f"}.bi-easel::before{content:"\f310"}.bi-egg-fill::before{content:"\f311"}.bi-egg-fried::before{content:"\f312"}.bi-egg::before{content:"\f313"}.bi-eject-fill::before{content:"\f314"}.bi-eject::before{content:"\f315"}.bi-emoji-angry-fill::before{content:"\f316"}.bi-emoji-angry::before{content:"\f317"}.bi-emoji-dizzy-fill::before{content:"\f318"}.bi-emoji-dizzy::before{content:"\f319"}.bi-emoji-expressionless-fill::before{content:"\f31a"}.bi-emoji-expressionless::before{content:"\f31b"}.bi-emoji-frown-fill::before{content:"\f31c"}.bi-emoji-frown::before{content:"\f31d"}.bi-emoji-heart-eyes-fill::before{content:"\f31e"}.bi-emoji-heart-eyes::before{content:"\f31f"}.bi-emoji-laughing-fill::before{content:"\f320"}.bi-emoji-laughing::before{content:"\f321"}.bi-emoji-neutral-fill::before{content:"\f322"}.bi-emoji-neutral::before{content:"\f323"}.bi-emoji-smile-fill::before{content:"\f324"}.bi-emoji-smile-upside-down-fill::before{content:"\f325"}.bi-emoji-smile-upside-down::before{content:"\f326"}.bi-emoji-smile::before{content:"\f327"}.bi-emoji-sunglasses-fill::before{content:"\f328"}.bi-emoji-sunglasses::before{content:"\f329"}.bi-emoji-wink-fill::before{content:"\f32a"}.bi-emoji-wink::before{content:"\f32b"}.bi-envelope-fill::before{content:"\f32c"}.bi-envelope-open-fill::before{content:"\f32d"}.bi-envelope-open::before{content:"\f32e"}.bi-envelope::before{content:"\f32f"}.bi-eraser-fill::before{content:"\f330"}.bi-eraser::before{content:"\f331"}.bi-exclamation-circle-fill::before{content:"\f332"}.bi-exclamation-circle::before{content:"\f333"}.bi-exclamation-diamond-fill::before{content:"\f334"}.bi-exclamation-diamond::before{content:"\f335"}.bi-exclamation-octagon-fill::before{content:"\f336"}.bi-exclamation-octagon::before{content:"\f337"}.bi-exclamation-square-fill::before{content:"\f338"}.bi-exclamation-square::before{content:"\f339"}.bi-exclamation-triangle-fill::before{content:"\f33a"}.bi-exclamation-triangle::before{content:"\f33b"}.bi-exclamation::before{content:"\f33c"}.bi-exclude::before{content:"\f33d"}.bi-eye-fill::before{content:"\f33e"}.bi-eye-slash-fill::before{content:"\f33f"}.bi-eye-slash::before{content:"\f340"}.bi-eye::before{content:"\f341"}.bi-eyedropper::before{content:"\f342"}.bi-eyeglasses::before{content:"\f343"}.bi-facebook::before{content:"\f344"}.bi-file-arrow-down-fill::before{content:"\f345"}.bi-file-arrow-down::before{content:"\f346"}.bi-file-arrow-up-fill::before{content:"\f347"}.bi-file-arrow-up::before{content:"\f348"}.bi-file-bar-graph-fill::before{content:"\f349"}.bi-file-bar-graph::before{content:"\f34a"}.bi-file-binary-fill::before{content:"\f34b"}.bi-file-binary::before{content:"\f34c"}.bi-file-break-fill::before{content:"\f34d"}.bi-file-break::before{content:"\f34e"}.bi-file-check-fill::before{content:"\f34f"}.bi-file-check::before{content:"\f350"}.bi-file-code-fill::before{content:"\f351"}.bi-file-code::before{content:"\f352"}.bi-file-diff-fill::before{content:"\f353"}.bi-file-diff::before{content:"\f354"}.bi-file-earmark-arrow-down-fill::before{content:"\f355"}.bi-file-earmark-arrow-down::before{content:"\f356"}.bi-file-earmark-arrow-up-fill::before{content:"\f357"}.bi-file-earmark-arrow-up::before{content:"\f358"}.bi-file-earmark-bar-graph-fill::before{content:"\f359"}.bi-file-earmark-bar-graph::before{content:"\f35a"}.bi-file-earmark-binary-fill::before{content:"\f35b"}.bi-file-earmark-binary::before{content:"\f35c"}.bi-file-earmark-break-fill::before{content:"\f35d"}.bi-file-earmark-break::before{content:"\f35e"}.bi-file-earmark-check-fill::before{content:"\f35f"}.bi-file-earmark-check::before{content:"\f360"}.bi-file-earmark-code-fill::before{content:"\f361"}.bi-file-earmark-code::before{content:"\f362"}.bi-file-earmark-diff-fill::before{content:"\f363"}.bi-file-earmark-diff::before{content:"\f364"}.bi-file-earmark-easel-fill::before{content:"\f365"}.bi-file-earmark-easel::before{content:"\f366"}.bi-file-earmark-excel-fill::before{content:"\f367"}.bi-file-earmark-excel::before{content:"\f368"}.bi-file-earmark-fill::before{content:"\f369"}.bi-file-earmark-font-fill::before{content:"\f36a"}.bi-file-earmark-font::before{content:"\f36b"}.bi-file-earmark-image-fill::before{content:"\f36c"}.bi-file-earmark-image::before{content:"\f36d"}.bi-file-earmark-lock-fill::before{content:"\f36e"}.bi-file-earmark-lock::before{content:"\f36f"}.bi-file-earmark-lock2-fill::before{content:"\f370"}.bi-file-earmark-lock2::before{content:"\f371"}.bi-file-earmark-medical-fill::before{content:"\f372"}.bi-file-earmark-medical::before{content:"\f373"}.bi-file-earmark-minus-fill::before{content:"\f374"}.bi-file-earmark-minus::before{content:"\f375"}.bi-file-earmark-music-fill::before{content:"\f376"}.bi-file-earmark-music::before{content:"\f377"}.bi-file-earmark-person-fill::before{content:"\f378"}.bi-file-earmark-person::before{content:"\f379"}.bi-file-earmark-play-fill::before{content:"\f37a"}.bi-file-earmark-play::before{content:"\f37b"}.bi-file-earmark-plus-fill::before{content:"\f37c"}.bi-file-earmark-plus::before{content:"\f37d"}.bi-file-earmark-post-fill::before{content:"\f37e"}.bi-file-earmark-post::before{content:"\f37f"}.bi-file-earmark-ppt-fill::before{content:"\f380"}.bi-file-earmark-ppt::before{content:"\f381"}.bi-file-earmark-richtext-fill::before{content:"\f382"}.bi-file-earmark-richtext::before{content:"\f383"}.bi-file-earmark-ruled-fill::before{content:"\f384"}.bi-file-earmark-ruled::before{content:"\f385"}.bi-file-earmark-slides-fill::before{content:"\f386"}.bi-file-earmark-slides::before{content:"\f387"}.bi-file-earmark-spreadsheet-fill::before{content:"\f388"}.bi-file-earmark-spreadsheet::before{content:"\f389"}.bi-file-earmark-text-fill::before{content:"\f38a"}.bi-file-earmark-text::before{content:"\f38b"}.bi-file-earmark-word-fill::before{content:"\f38c"}.bi-file-earmark-word::before{content:"\f38d"}.bi-file-earmark-x-fill::before{content:"\f38e"}.bi-file-earmark-x::before{content:"\f38f"}.bi-file-earmark-zip-fill::before{content:"\f390"}.bi-file-earmark-zip::before{content:"\f391"}.bi-file-earmark::before{content:"\f392"}.bi-file-easel-fill::before{content:"\f393"}.bi-file-easel::before{content:"\f394"}.bi-file-excel-fill::before{content:"\f395"}.bi-file-excel::before{content:"\f396"}.bi-file-fill::before{content:"\f397"}.bi-file-font-fill::before{content:"\f398"}.bi-file-font::before{content:"\f399"}.bi-file-image-fill::before{content:"\f39a"}.bi-file-image::before{content:"\f39b"}.bi-file-lock-fill::before{content:"\f39c"}.bi-file-lock::before{content:"\f39d"}.bi-file-lock2-fill::before{content:"\f39e"}.bi-file-lock2::before{content:"\f39f"}.bi-file-medical-fill::before{content:"\f3a0"}.bi-file-medical::before{content:"\f3a1"}.bi-file-minus-fill::before{content:"\f3a2"}.bi-file-minus::before{content:"\f3a3"}.bi-file-music-fill::before{content:"\f3a4"}.bi-file-music::before{content:"\f3a5"}.bi-file-person-fill::before{content:"\f3a6"}.bi-file-person::before{content:"\f3a7"}.bi-file-play-fill::before{content:"\f3a8"}.bi-file-play::before{content:"\f3a9"}.bi-file-plus-fill::before{content:"\f3aa"}.bi-file-plus::before{content:"\f3ab"}.bi-file-post-fill::before{content:"\f3ac"}.bi-file-post::before{content:"\f3ad"}.bi-file-ppt-fill::before{content:"\f3ae"}.bi-file-ppt::before{content:"\f3af"}.bi-file-richtext-fill::before{content:"\f3b0"}.bi-file-richtext::before{content:"\f3b1"}.bi-file-ruled-fill::before{content:"\f3b2"}.bi-file-ruled::before{content:"\f3b3"}.bi-file-slides-fill::before{content:"\f3b4"}.bi-file-slides::before{content:"\f3b5"}.bi-file-spreadsheet-fill::before{content:"\f3b6"}.bi-file-spreadsheet::before{content:"\f3b7"}.bi-file-text-fill::before{content:"\f3b8"}.bi-file-text::before{content:"\f3b9"}.bi-file-word-fill::before{content:"\f3ba"}.bi-file-word::before{content:"\f3bb"}.bi-file-x-fill::before{content:"\f3bc"}.bi-file-x::before{content:"\f3bd"}.bi-file-zip-fill::before{content:"\f3be"}.bi-file-zip::before{content:"\f3bf"}.bi-file::before{content:"\f3c0"}.bi-files-alt::before{content:"\f3c1"}.bi-files::before{content:"\f3c2"}.bi-film::before{content:"\f3c3"}.bi-filter-circle-fill::before{content:"\f3c4"}.bi-filter-circle::before{content:"\f3c5"}.bi-filter-left::before{content:"\f3c6"}.bi-filter-right::before{content:"\f3c7"}.bi-filter-square-fill::before{content:"\f3c8"}.bi-filter-square::before{content:"\f3c9"}.bi-filter::before{content:"\f3ca"}.bi-flag-fill::before{content:"\f3cb"}.bi-flag::before{content:"\f3cc"}.bi-flower1::before{content:"\f3cd"}.bi-flower2::before{content:"\f3ce"}.bi-flower3::before{content:"\f3cf"}.bi-folder-check::before{content:"\f3d0"}.bi-folder-fill::before{content:"\f3d1"}.bi-folder-minus::before{content:"\f3d2"}.bi-folder-plus::before{content:"\f3d3"}.bi-folder-symlink-fill::before{content:"\f3d4"}.bi-folder-symlink::before{content:"\f3d5"}.bi-folder-x::before{content:"\f3d6"}.bi-folder::before{content:"\f3d7"}.bi-folder2-open::before{content:"\f3d8"}.bi-folder2::before{content:"\f3d9"}.bi-fonts::before{content:"\f3da"}.bi-forward-fill::before{content:"\f3db"}.bi-forward::before{content:"\f3dc"}.bi-front::before{content:"\f3dd"}.bi-fullscreen-exit::before{content:"\f3de"}.bi-fullscreen::before{content:"\f3df"}.bi-funnel-fill::before{content:"\f3e0"}.bi-funnel::before{content:"\f3e1"}.bi-gear-fill::before{content:"\f3e2"}.bi-gear-wide-connected::before{content:"\f3e3"}.bi-gear-wide::before{content:"\f3e4"}.bi-gear::before{content:"\f3e5"}.bi-gem::before{content:"\f3e6"}.bi-geo-alt-fill::before{content:"\f3e7"}.bi-geo-alt::before{content:"\f3e8"}.bi-geo-fill::before{content:"\f3e9"}.bi-geo::before{content:"\f3ea"}.bi-gift-fill::before{content:"\f3eb"}.bi-gift::before{content:"\f3ec"}.bi-github::before{content:"\f3ed"}.bi-globe::before{content:"\f3ee"}.bi-globe2::before{content:"\f3ef"}.bi-google::before{content:"\f3f0"}.bi-graph-down::before{content:"\f3f1"}.bi-graph-up::before{content:"\f3f2"}.bi-grid-1x2-fill::before{content:"\f3f3"}.bi-grid-1x2::before{content:"\f3f4"}.bi-grid-3x2-gap-fill::before{content:"\f3f5"}.bi-grid-3x2-gap::before{content:"\f3f6"}.bi-grid-3x2::before{content:"\f3f7"}.bi-grid-3x3-gap-fill::before{content:"\f3f8"}.bi-grid-3x3-gap::before{content:"\f3f9"}.bi-grid-3x3::before{content:"\f3fa"}.bi-grid-fill::before{content:"\f3fb"}.bi-grid::before{content:"\f3fc"}.bi-grip-horizontal::before{content:"\f3fd"}.bi-grip-vertical::before{content:"\f3fe"}.bi-hammer::before{content:"\f3ff"}.bi-hand-index-fill::before{content:"\f400"}.bi-hand-index-thumb-fill::before{content:"\f401"}.bi-hand-index-thumb::before{content:"\f402"}.bi-hand-index::before{content:"\f403"}.bi-hand-thumbs-down-fill::before{content:"\f404"}.bi-hand-thumbs-down::before{content:"\f405"}.bi-hand-thumbs-up-fill::before{content:"\f406"}.bi-hand-thumbs-up::before{content:"\f407"}.bi-handbag-fill::before{content:"\f408"}.bi-handbag::before{content:"\f409"}.bi-hash::before{content:"\f40a"}.bi-hdd-fill::before{content:"\f40b"}.bi-hdd-network-fill::before{content:"\f40c"}.bi-hdd-network::before{content:"\f40d"}.bi-hdd-rack-fill::before{content:"\f40e"}.bi-hdd-rack::before{content:"\f40f"}.bi-hdd-stack-fill::before{content:"\f410"}.bi-hdd-stack::before{content:"\f411"}.bi-hdd::before{content:"\f412"}.bi-headphones::before{content:"\f413"}.bi-headset::before{content:"\f414"}.bi-heart-fill::before{content:"\f415"}.bi-heart-half::before{content:"\f416"}.bi-heart::before{content:"\f417"}.bi-heptagon-fill::before{content:"\f418"}.bi-heptagon-half::before{content:"\f419"}.bi-heptagon::before{content:"\f41a"}.bi-hexagon-fill::before{content:"\f41b"}.bi-hexagon-half::before{content:"\f41c"}.bi-hexagon::before{content:"\f41d"}.bi-hourglass-bottom::before{content:"\f41e"}.bi-hourglass-split::before{content:"\f41f"}.bi-hourglass-top::before{content:"\f420"}.bi-hourglass::before{content:"\f421"}.bi-house-door-fill::before{content:"\f422"}.bi-house-door::before{content:"\f423"}.bi-house-fill::before{content:"\f424"}.bi-house::before{content:"\f425"}.bi-hr::before{content:"\f426"}.bi-hurricane::before{content:"\f427"}.bi-image-alt::before{content:"\f428"}.bi-image-fill::before{content:"\f429"}.bi-image::before{content:"\f42a"}.bi-images::before{content:"\f42b"}.bi-inbox-fill::before{content:"\f42c"}.bi-inbox::before{content:"\f42d"}.bi-inboxes-fill::before{content:"\f42e"}.bi-inboxes::before{content:"\f42f"}.bi-info-circle-fill::before{content:"\f430"}.bi-info-circle::before{content:"\f431"}.bi-info-square-fill::before{content:"\f432"}.bi-info-square::before{content:"\f433"}.bi-info::before{content:"\f434"}.bi-input-cursor-text::before{content:"\f435"}.bi-input-cursor::before{content:"\f436"}.bi-instagram::before{content:"\f437"}.bi-intersect::before{content:"\f438"}.bi-journal-album::before{content:"\f439"}.bi-journal-arrow-down::before{content:"\f43a"}.bi-journal-arrow-up::before{content:"\f43b"}.bi-journal-bookmark-fill::before{content:"\f43c"}.bi-journal-bookmark::before{content:"\f43d"}.bi-journal-check::before{content:"\f43e"}.bi-journal-code::before{content:"\f43f"}.bi-journal-medical::before{content:"\f440"}.bi-journal-minus::before{content:"\f441"}.bi-journal-plus::before{content:"\f442"}.bi-journal-richtext::before{content:"\f443"}.bi-journal-text::before{content:"\f444"}.bi-journal-x::before{content:"\f445"}.bi-journal::before{content:"\f446"}.bi-journals::before{content:"\f447"}.bi-joystick::before{content:"\f448"}.bi-justify-left::before{content:"\f449"}.bi-justify-right::before{content:"\f44a"}.bi-justify::before{content:"\f44b"}.bi-kanban-fill::before{content:"\f44c"}.bi-kanban::before{content:"\f44d"}.bi-key-fill::before{content:"\f44e"}.bi-key::before{content:"\f44f"}.bi-keyboard-fill::before{content:"\f450"}.bi-keyboard::before{content:"\f451"}.bi-ladder::before{content:"\f452"}.bi-lamp-fill::before{content:"\f453"}.bi-lamp::before{content:"\f454"}.bi-laptop-fill::before{content:"\f455"}.bi-laptop::before{content:"\f456"}.bi-layer-backward::before{content:"\f457"}.bi-layer-forward::before{content:"\f458"}.bi-layers-fill::before{content:"\f459"}.bi-layers-half::before{content:"\f45a"}.bi-layers::before{content:"\f45b"}.bi-layout-sidebar-inset-reverse::before{content:"\f45c"}.bi-layout-sidebar-inset::before{content:"\f45d"}.bi-layout-sidebar-reverse::before{content:"\f45e"}.bi-layout-sidebar::before{content:"\f45f"}.bi-layout-split::before{content:"\f460"}.bi-layout-text-sidebar-reverse::before{content:"\f461"}.bi-layout-text-sidebar::before{content:"\f462"}.bi-layout-text-window-reverse::before{content:"\f463"}.bi-layout-text-window::before{content:"\f464"}.bi-layout-three-columns::before{content:"\f465"}.bi-layout-wtf::before{content:"\f466"}.bi-life-preserver::before{content:"\f467"}.bi-lightbulb-fill::before{content:"\f468"}.bi-lightbulb-off-fill::before{content:"\f469"}.bi-lightbulb-off::before{content:"\f46a"}.bi-lightbulb::before{content:"\f46b"}.bi-lightning-charge-fill::before{content:"\f46c"}.bi-lightning-charge::before{content:"\f46d"}.bi-lightning-fill::before{content:"\f46e"}.bi-lightning::before{content:"\f46f"}.bi-link-45deg::before{content:"\f470"}.bi-link::before{content:"\f471"}.bi-linkedin::before{content:"\f472"}.bi-list-check::before{content:"\f473"}.bi-list-nested::before{content:"\f474"}.bi-list-ol::before{content:"\f475"}.bi-list-stars::before{content:"\f476"}.bi-list-task::before{content:"\f477"}.bi-list-ul::before{content:"\f478"}.bi-list::before{content:"\f479"}.bi-lock-fill::before{content:"\f47a"}.bi-lock::before{content:"\f47b"}.bi-mailbox::before{content:"\f47c"}.bi-mailbox2::before{content:"\f47d"}.bi-map-fill::before{content:"\f47e"}.bi-map::before{content:"\f47f"}.bi-markdown-fill::before{content:"\f480"}.bi-markdown::before{content:"\f481"}.bi-mask::before{content:"\f482"}.bi-megaphone-fill::before{content:"\f483"}.bi-megaphone::before{content:"\f484"}.bi-menu-app-fill::before{content:"\f485"}.bi-menu-app::before{content:"\f486"}.bi-menu-button-fill::before{content:"\f487"}.bi-menu-button-wide-fill::before{content:"\f488"}.bi-menu-button-wide::before{content:"\f489"}.bi-menu-button::before{content:"\f48a"}.bi-menu-down::before{content:"\f48b"}.bi-menu-up::before{content:"\f48c"}.bi-mic-fill::before{content:"\f48d"}.bi-mic-mute-fill::before{content:"\f48e"}.bi-mic-mute::before{content:"\f48f"}.bi-mic::before{content:"\f490"}.bi-minecart-loaded::before{content:"\f491"}.bi-minecart::before{content:"\f492"}.bi-moisture::before{content:"\f493"}.bi-moon-fill::before{content:"\f494"}.bi-moon-stars-fill::before{content:"\f495"}.bi-moon-stars::before{content:"\f496"}.bi-moon::before{content:"\f497"}.bi-mouse-fill::before{content:"\f498"}.bi-mouse::before{content:"\f499"}.bi-mouse2-fill::before{content:"\f49a"}.bi-mouse2::before{content:"\f49b"}.bi-mouse3-fill::before{content:"\f49c"}.bi-mouse3::before{content:"\f49d"}.bi-music-note-beamed::before{content:"\f49e"}.bi-music-note-list::before{content:"\f49f"}.bi-music-note::before{content:"\f4a0"}.bi-music-player-fill::before{content:"\f4a1"}.bi-music-player::before{content:"\f4a2"}.bi-newspaper::before{content:"\f4a3"}.bi-node-minus-fill::before{content:"\f4a4"}.bi-node-minus::before{content:"\f4a5"}.bi-node-plus-fill::before{content:"\f4a6"}.bi-node-plus::before{content:"\f4a7"}.bi-nut-fill::before{content:"\f4a8"}.bi-nut::before{content:"\f4a9"}.bi-octagon-fill::before{content:"\f4aa"}.bi-octagon-half::before{content:"\f4ab"}.bi-octagon::before{content:"\f4ac"}.bi-option::before{content:"\f4ad"}.bi-outlet::before{content:"\f4ae"}.bi-paint-bucket::before{content:"\f4af"}.bi-palette-fill::before{content:"\f4b0"}.bi-palette::before{content:"\f4b1"}.bi-palette2::before{content:"\f4b2"}.bi-paperclip::before{content:"\f4b3"}.bi-paragraph::before{content:"\f4b4"}.bi-patch-check-fill::before{content:"\f4b5"}.bi-patch-check::before{content:"\f4b6"}.bi-patch-exclamation-fill::before{content:"\f4b7"}.bi-patch-exclamation::before{content:"\f4b8"}.bi-patch-minus-fill::before{content:"\f4b9"}.bi-patch-minus::before{content:"\f4ba"}.bi-patch-plus-fill::before{content:"\f4bb"}.bi-patch-plus::before{content:"\f4bc"}.bi-patch-question-fill::before{content:"\f4bd"}.bi-patch-question::before{content:"\f4be"}.bi-pause-btn-fill::before{content:"\f4bf"}.bi-pause-btn::before{content:"\f4c0"}.bi-pause-circle-fill::before{content:"\f4c1"}.bi-pause-circle::before{content:"\f4c2"}.bi-pause-fill::before{content:"\f4c3"}.bi-pause::before{content:"\f4c4"}.bi-peace-fill::before{content:"\f4c5"}.bi-peace::before{content:"\f4c6"}.bi-pen-fill::before{content:"\f4c7"}.bi-pen::before{content:"\f4c8"}.bi-pencil-fill::before{content:"\f4c9"}.bi-pencil-square::before{content:"\f4ca"}.bi-pencil::before{content:"\f4cb"}.bi-pentagon-fill::before{content:"\f4cc"}.bi-pentagon-half::before{content:"\f4cd"}.bi-pentagon::before{content:"\f4ce"}.bi-people-fill::before{content:"\f4cf"}.bi-people::before{content:"\f4d0"}.bi-percent::before{content:"\f4d1"}.bi-person-badge-fill::before{content:"\f4d2"}.bi-person-badge::before{content:"\f4d3"}.bi-person-bounding-box::before{content:"\f4d4"}.bi-person-check-fill::before{content:"\f4d5"}.bi-person-check::before{content:"\f4d6"}.bi-person-circle::before{content:"\f4d7"}.bi-person-dash-fill::before{content:"\f4d8"}.bi-person-dash::before{content:"\f4d9"}.bi-person-fill::before{content:"\f4da"}.bi-person-lines-fill::before{content:"\f4db"}.bi-person-plus-fill::before{content:"\f4dc"}.bi-person-plus::before{content:"\f4dd"}.bi-person-square::before{content:"\f4de"}.bi-person-x-fill::before{content:"\f4df"}.bi-person-x::before{content:"\f4e0"}.bi-person::before{content:"\f4e1"}.bi-phone-fill::before{content:"\f4e2"}.bi-phone-landscape-fill::before{content:"\f4e3"}.bi-phone-landscape::before{content:"\f4e4"}.bi-phone-vibrate-fill::before{content:"\f4e5"}.bi-phone-vibrate::before{content:"\f4e6"}.bi-phone::before{content:"\f4e7"}.bi-pie-chart-fill::before{content:"\f4e8"}.bi-pie-chart::before{content:"\f4e9"}.bi-pin-angle-fill::before{content:"\f4ea"}.bi-pin-angle::before{content:"\f4eb"}.bi-pin-fill::before{content:"\f4ec"}.bi-pin::before{content:"\f4ed"}.bi-pip-fill::before{content:"\f4ee"}.bi-pip::before{content:"\f4ef"}.bi-play-btn-fill::before{content:"\f4f0"}.bi-play-btn::before{content:"\f4f1"}.bi-play-circle-fill::before{content:"\f4f2"}.bi-play-circle::before{content:"\f4f3"}.bi-play-fill::before{content:"\f4f4"}.bi-play::before{content:"\f4f5"}.bi-plug-fill::before{content:"\f4f6"}.bi-plug::before{content:"\f4f7"}.bi-plus-circle-dotted::before{content:"\f4f8"}.bi-plus-circle-fill::before{content:"\f4f9"}.bi-plus-circle::before{content:"\f4fa"}.bi-plus-square-dotted::before{content:"\f4fb"}.bi-plus-square-fill::before{content:"\f4fc"}.bi-plus-square::before{content:"\f4fd"}.bi-plus::before{content:"\f4fe"}.bi-power::before{content:"\f4ff"}.bi-printer-fill::before{content:"\f500"}.bi-printer::before{content:"\f501"}.bi-puzzle-fill::before{content:"\f502"}.bi-puzzle::before{content:"\f503"}.bi-question-circle-fill::before{content:"\f504"}.bi-question-circle::before{content:"\f505"}.bi-question-diamond-fill::before{content:"\f506"}.bi-question-diamond::before{content:"\f507"}.bi-question-octagon-fill::before{content:"\f508"}.bi-question-octagon::before{content:"\f509"}.bi-question-square-fill::before{content:"\f50a"}.bi-question-square::before{content:"\f50b"}.bi-question::before{content:"\f50c"}.bi-rainbow::before{content:"\f50d"}.bi-receipt-cutoff::before{content:"\f50e"}.bi-receipt::before{content:"\f50f"}.bi-reception-0::before{content:"\f510"}.bi-reception-1::before{content:"\f511"}.bi-reception-2::before{content:"\f512"}.bi-reception-3::before{content:"\f513"}.bi-reception-4::before{content:"\f514"}.bi-record-btn-fill::before{content:"\f515"}.bi-record-btn::before{content:"\f516"}.bi-record-circle-fill::before{content:"\f517"}.bi-record-circle::before{content:"\f518"}.bi-record-fill::before{content:"\f519"}.bi-record::before{content:"\f51a"}.bi-record2-fill::before{content:"\f51b"}.bi-record2::before{content:"\f51c"}.bi-reply-all-fill::before{content:"\f51d"}.bi-reply-all::before{content:"\f51e"}.bi-reply-fill::before{content:"\f51f"}.bi-reply::before{content:"\f520"}.bi-rss-fill::before{content:"\f521"}.bi-rss::before{content:"\f522"}.bi-rulers::before{content:"\f523"}.bi-save-fill::before{content:"\f524"}.bi-save::before{content:"\f525"}.bi-save2-fill::before{content:"\f526"}.bi-save2::before{content:"\f527"}.bi-scissors::before{content:"\f528"}.bi-screwdriver::before{content:"\f529"}.bi-search::before{content:"\f52a"}.bi-segmented-nav::before{content:"\f52b"}.bi-server::before{content:"\f52c"}.bi-share-fill::before{content:"\f52d"}.bi-share::before{content:"\f52e"}.bi-shield-check::before{content:"\f52f"}.bi-shield-exclamation::before{content:"\f530"}.bi-shield-fill-check::before{content:"\f531"}.bi-shield-fill-exclamation::before{content:"\f532"}.bi-shield-fill-minus::before{content:"\f533"}.bi-shield-fill-plus::before{content:"\f534"}.bi-shield-fill-x::before{content:"\f535"}.bi-shield-fill::before{content:"\f536"}.bi-shield-lock-fill::before{content:"\f537"}.bi-shield-lock::before{content:"\f538"}.bi-shield-minus::before{content:"\f539"}.bi-shield-plus::before{content:"\f53a"}.bi-shield-shaded::before{content:"\f53b"}.bi-shield-slash-fill::before{content:"\f53c"}.bi-shield-slash::before{content:"\f53d"}.bi-shield-x::before{content:"\f53e"}.bi-shield::before{content:"\f53f"}.bi-shift-fill::before{content:"\f540"}.bi-shift::before{content:"\f541"}.bi-shop-window::before{content:"\f542"}.bi-shop::before{content:"\f543"}.bi-shuffle::before{content:"\f544"}.bi-signpost-2-fill::before{content:"\f545"}.bi-signpost-2::before{content:"\f546"}.bi-signpost-fill::before{content:"\f547"}.bi-signpost-split-fill::before{content:"\f548"}.bi-signpost-split::before{content:"\f549"}.bi-signpost::before{content:"\f54a"}.bi-sim-fill::before{content:"\f54b"}.bi-sim::before{content:"\f54c"}.bi-skip-backward-btn-fill::before{content:"\f54d"}.bi-skip-backward-btn::before{content:"\f54e"}.bi-skip-backward-circle-fill::before{content:"\f54f"}.bi-skip-backward-circle::before{content:"\f550"}.bi-skip-backward-fill::before{content:"\f551"}.bi-skip-backward::before{content:"\f552"}.bi-skip-end-btn-fill::before{content:"\f553"}.bi-skip-end-btn::before{content:"\f554"}.bi-skip-end-circle-fill::before{content:"\f555"}.bi-skip-end-circle::before{content:"\f556"}.bi-skip-end-fill::before{content:"\f557"}.bi-skip-end::before{content:"\f558"}.bi-skip-forward-btn-fill::before{content:"\f559"}.bi-skip-forward-btn::before{content:"\f55a"}.bi-skip-forward-circle-fill::before{content:"\f55b"}.bi-skip-forward-circle::before{content:"\f55c"}.bi-skip-forward-fill::before{content:"\f55d"}.bi-skip-forward::before{content:"\f55e"}.bi-skip-start-btn-fill::before{content:"\f55f"}.bi-skip-start-btn::before{content:"\f560"}.bi-skip-start-circle-fill::before{content:"\f561"}.bi-skip-start-circle::before{content:"\f562"}.bi-skip-start-fill::before{content:"\f563"}.bi-skip-start::before{content:"\f564"}.bi-slack::before{content:"\f565"}.bi-slash-circle-fill::before{content:"\f566"}.bi-slash-circle::before{content:"\f567"}.bi-slash-square-fill::before{content:"\f568"}.bi-slash-square::before{content:"\f569"}.bi-slash::before{content:"\f56a"}.bi-sliders::before{content:"\f56b"}.bi-smartwatch::before{content:"\f56c"}.bi-snow::before{content:"\f56d"}.bi-snow2::before{content:"\f56e"}.bi-snow3::before{content:"\f56f"}.bi-sort-alpha-down-alt::before{content:"\f570"}.bi-sort-alpha-down::before{content:"\f571"}.bi-sort-alpha-up-alt::before{content:"\f572"}.bi-sort-alpha-up::before{content:"\f573"}.bi-sort-down-alt::before{content:"\f574"}.bi-sort-down::before{content:"\f575"}.bi-sort-numeric-down-alt::before{content:"\f576"}.bi-sort-numeric-down::before{content:"\f577"}.bi-sort-numeric-up-alt::before{content:"\f578"}.bi-sort-numeric-up::before{content:"\f579"}.bi-sort-up-alt::before{content:"\f57a"}.bi-sort-up::before{content:"\f57b"}.bi-soundwave::before{content:"\f57c"}.bi-speaker-fill::before{content:"\f57d"}.bi-speaker::before{content:"\f57e"}.bi-speedometer::before{content:"\f57f"}.bi-speedometer2::before{content:"\f580"}.bi-spellcheck::before{content:"\f581"}.bi-square-fill::before{content:"\f582"}.bi-square-half::before{content:"\f583"}.bi-square::before{content:"\f584"}.bi-stack::before{content:"\f585"}.bi-star-fill::before{content:"\f586"}.bi-star-half::before{content:"\f587"}.bi-star::before{content:"\f588"}.bi-stars::before{content:"\f589"}.bi-stickies-fill::before{content:"\f58a"}.bi-stickies::before{content:"\f58b"}.bi-sticky-fill::before{content:"\f58c"}.bi-sticky::before{content:"\f58d"}.bi-stop-btn-fill::before{content:"\f58e"}.bi-stop-btn::before{content:"\f58f"}.bi-stop-circle-fill::before{content:"\f590"}.bi-stop-circle::before{content:"\f591"}.bi-stop-fill::before{content:"\f592"}.bi-stop::before{content:"\f593"}.bi-stoplights-fill::before{content:"\f594"}.bi-stoplights::before{content:"\f595"}.bi-stopwatch-fill::before{content:"\f596"}.bi-stopwatch::before{content:"\f597"}.bi-subtract::before{content:"\f598"}.bi-suit-club-fill::before{content:"\f599"}.bi-suit-club::before{content:"\f59a"}.bi-suit-diamond-fill::before{content:"\f59b"}.bi-suit-diamond::before{content:"\f59c"}.bi-suit-heart-fill::before{content:"\f59d"}.bi-suit-heart::before{content:"\f59e"}.bi-suit-spade-fill::before{content:"\f59f"}.bi-suit-spade::before{content:"\f5a0"}.bi-sun-fill::before{content:"\f5a1"}.bi-sun::before{content:"\f5a2"}.bi-sunglasses::before{content:"\f5a3"}.bi-sunrise-fill::before{content:"\f5a4"}.bi-sunrise::before{content:"\f5a5"}.bi-sunset-fill::before{content:"\f5a6"}.bi-sunset::before{content:"\f5a7"}.bi-symmetry-horizontal::before{content:"\f5a8"}.bi-symmetry-vertical::before{content:"\f5a9"}.bi-table::before{content:"\f5aa"}.bi-tablet-fill::before{content:"\f5ab"}.bi-tablet-landscape-fill::before{content:"\f5ac"}.bi-tablet-landscape::before{content:"\f5ad"}.bi-tablet::before{content:"\f5ae"}.bi-tag-fill::before{content:"\f5af"}.bi-tag::before{content:"\f5b0"}.bi-tags-fill::before{content:"\f5b1"}.bi-tags::before{content:"\f5b2"}.bi-telegram::before{content:"\f5b3"}.bi-telephone-fill::before{content:"\f5b4"}.bi-telephone-forward-fill::before{content:"\f5b5"}.bi-telephone-forward::before{content:"\f5b6"}.bi-telephone-inbound-fill::before{content:"\f5b7"}.bi-telephone-inbound::before{content:"\f5b8"}.bi-telephone-minus-fill::before{content:"\f5b9"}.bi-telephone-minus::before{content:"\f5ba"}.bi-telephone-outbound-fill::before{content:"\f5bb"}.bi-telephone-outbound::before{content:"\f5bc"}.bi-telephone-plus-fill::before{content:"\f5bd"}.bi-telephone-plus::before{content:"\f5be"}.bi-telephone-x-fill::before{content:"\f5bf"}.bi-telephone-x::before{content:"\f5c0"}.bi-telephone::before{content:"\f5c1"}.bi-terminal-fill::before{content:"\f5c2"}.bi-terminal::before{content:"\f5c3"}.bi-text-center::before{content:"\f5c4"}.bi-text-indent-left::before{content:"\f5c5"}.bi-text-indent-right::before{content:"\f5c6"}.bi-text-left::before{content:"\f5c7"}.bi-text-paragraph::before{content:"\f5c8"}.bi-text-right::before{content:"\f5c9"}.bi-textarea-resize::before{content:"\f5ca"}.bi-textarea-t::before{content:"\f5cb"}.bi-textarea::before{content:"\f5cc"}.bi-thermometer-half::before{content:"\f5cd"}.bi-thermometer-high::before{content:"\f5ce"}.bi-thermometer-low::before{content:"\f5cf"}.bi-thermometer-snow::before{content:"\f5d0"}.bi-thermometer-sun::before{content:"\f5d1"}.bi-thermometer::before{content:"\f5d2"}.bi-three-dots-vertical::before{content:"\f5d3"}.bi-three-dots::before{content:"\f5d4"}.bi-toggle-off::before{content:"\f5d5"}.bi-toggle-on::before{content:"\f5d6"}.bi-toggle2-off::before{content:"\f5d7"}.bi-toggle2-on::before{content:"\f5d8"}.bi-toggles::before{content:"\f5d9"}.bi-toggles2::before{content:"\f5da"}.bi-tools::before{content:"\f5db"}.bi-tornado::before{content:"\f5dc"}.bi-trash-fill::before{content:"\f5dd"}.bi-trash::before{content:"\f5de"}.bi-trash2-fill::before{content:"\f5df"}.bi-trash2::before{content:"\f5e0"}.bi-tree-fill::before{content:"\f5e1"}.bi-tree::before{content:"\f5e2"}.bi-triangle-fill::before{content:"\f5e3"}.bi-triangle-half::before{content:"\f5e4"}.bi-triangle::before{content:"\f5e5"}.bi-trophy-fill::before{content:"\f5e6"}.bi-trophy::before{content:"\f5e7"}.bi-tropical-storm::before{content:"\f5e8"}.bi-truck-flatbed::before{content:"\f5e9"}.bi-truck::before{content:"\f5ea"}.bi-tsunami::before{content:"\f5eb"}.bi-tv-fill::before{content:"\f5ec"}.bi-tv::before{content:"\f5ed"}.bi-twitch::before{content:"\f5ee"}.bi-twitter::before{content:"\f5ef"}.bi-type-bold::before{content:"\f5f0"}.bi-type-h1::before{content:"\f5f1"}.bi-type-h2::before{content:"\f5f2"}.bi-type-h3::before{content:"\f5f3"}.bi-type-italic::before{content:"\f5f4"}.bi-type-strikethrough::before{content:"\f5f5"}.bi-type-underline::before{content:"\f5f6"}.bi-type::before{content:"\f5f7"}.bi-ui-checks-grid::before{content:"\f5f8"}.bi-ui-checks::before{content:"\f5f9"}.bi-ui-radios-grid::before{content:"\f5fa"}.bi-ui-radios::before{content:"\f5fb"}.bi-umbrella-fill::before{content:"\f5fc"}.bi-umbrella::before{content:"\f5fd"}.bi-union::before{content:"\f5fe"}.bi-unlock-fill::before{content:"\f5ff"}.bi-unlock::before{content:"\f600"}.bi-upc-scan::before{content:"\f601"}.bi-upc::before{content:"\f602"}.bi-upload::before{content:"\f603"}.bi-vector-pen::before{content:"\f604"}.bi-view-list::before{content:"\f605"}.bi-view-stacked::before{content:"\f606"}.bi-vinyl-fill::before{content:"\f607"}.bi-vinyl::before{content:"\f608"}.bi-voicemail::before{content:"\f609"}.bi-volume-down-fill::before{content:"\f60a"}.bi-volume-down::before{content:"\f60b"}.bi-volume-mute-fill::before{content:"\f60c"}.bi-volume-mute::before{content:"\f60d"}.bi-volume-off-fill::before{content:"\f60e"}.bi-volume-off::before{content:"\f60f"}.bi-volume-up-fill::before{content:"\f610"}.bi-volume-up::before{content:"\f611"}.bi-vr::before{content:"\f612"}.bi-wallet-fill::before{content:"\f613"}.bi-wallet::before{content:"\f614"}.bi-wallet2::before{content:"\f615"}.bi-watch::before{content:"\f616"}.bi-water::before{content:"\f617"}.bi-whatsapp::before{content:"\f618"}.bi-wifi-1::before{content:"\f619"}.bi-wifi-2::before{content:"\f61a"}.bi-wifi-off::before{content:"\f61b"}.bi-wifi::before{content:"\f61c"}.bi-wind::before{content:"\f61d"}.bi-window-dock::before{content:"\f61e"}.bi-window-sidebar::before{content:"\f61f"}.bi-window::before{content:"\f620"}.bi-wrench::before{content:"\f621"}.bi-x-circle-fill::before{content:"\f622"}.bi-x-circle::before{content:"\f623"}.bi-x-diamond-fill::before{content:"\f624"}.bi-x-diamond::before{content:"\f625"}.bi-x-octagon-fill::before{content:"\f626"}.bi-x-octagon::before{content:"\f627"}.bi-x-square-fill::before{content:"\f628"}.bi-x-square::before{content:"\f629"}.bi-x::before{content:"\f62a"}.bi-youtube::before{content:"\f62b"}.bi-zoom-in::before{content:"\f62c"}.bi-zoom-out::before{content:"\f62d"}.bi-bank::before{content:"\f62e"}.bi-bank2::before{content:"\f62f"}.bi-bell-slash-fill::before{content:"\f630"}.bi-bell-slash::before{content:"\f631"}.bi-cash-coin::before{content:"\f632"}.bi-check-lg::before{content:"\f633"}.bi-coin::before{content:"\f634"}.bi-currency-bitcoin::before{content:"\f635"}.bi-currency-dollar::before{content:"\f636"}.bi-currency-euro::before{content:"\f637"}.bi-currency-exchange::before{content:"\f638"}.bi-currency-pound::before{content:"\f639"}.bi-currency-yen::before{content:"\f63a"}.bi-dash-lg::before{content:"\f63b"}.bi-exclamation-lg::before{content:"\f63c"}.bi-file-earmark-pdf-fill::before{content:"\f63d"}.bi-file-earmark-pdf::before{content:"\f63e"}.bi-file-pdf-fill::before{content:"\f63f"}.bi-file-pdf::before{content:"\f640"}.bi-gender-ambiguous::before{content:"\f641"}.bi-gender-female::before{content:"\f642"}.bi-gender-male::before{content:"\f643"}.bi-gender-trans::before{content:"\f644"}.bi-headset-vr::before{content:"\f645"}.bi-info-lg::before{content:"\f646"}.bi-mastodon::before{content:"\f647"}.bi-messenger::before{content:"\f648"}.bi-piggy-bank-fill::before{content:"\f649"}.bi-piggy-bank::before{content:"\f64a"}.bi-pin-map-fill::before{content:"\f64b"}.bi-pin-map::before{content:"\f64c"}.bi-plus-lg::before{content:"\f64d"}.bi-question-lg::before{content:"\f64e"}.bi-recycle::before{content:"\f64f"}.bi-reddit::before{content:"\f650"}.bi-safe-fill::before{content:"\f651"}.bi-safe2-fill::before{content:"\f652"}.bi-safe2::before{content:"\f653"}.bi-sd-card-fill::before{content:"\f654"}.bi-sd-card::before{content:"\f655"}.bi-skype::before{content:"\f656"}.bi-slash-lg::before{content:"\f657"}.bi-translate::before{content:"\f658"}.bi-x-lg::before{content:"\f659"}.bi-safe::before{content:"\f65a"}.bi-apple::before{content:"\f65b"}.bi-microsoft::before{content:"\f65d"}.bi-windows::before{content:"\f65e"}.bi-behance::before{content:"\f65c"}.bi-dribbble::before{content:"\f65f"}.bi-line::before{content:"\f660"}.bi-medium::before{content:"\f661"}.bi-paypal::before{content:"\f662"}.bi-pinterest::before{content:"\f663"}.bi-signal::before{content:"\f664"}.bi-snapchat::before{content:"\f665"}.bi-spotify::before{content:"\f666"}.bi-stack-overflow::before{content:"\f667"}.bi-strava::before{content:"\f668"}.bi-wordpress::before{content:"\f669"}.bi-vimeo::before{content:"\f66a"}.bi-activity::before{content:"\f66b"}.bi-easel2-fill::before{content:"\f66c"}.bi-easel2::before{content:"\f66d"}.bi-easel3-fill::before{content:"\f66e"}.bi-easel3::before{content:"\f66f"}.bi-fan::before{content:"\f670"}.bi-fingerprint::before{content:"\f671"}.bi-graph-down-arrow::before{content:"\f672"}.bi-graph-up-arrow::before{content:"\f673"}.bi-hypnotize::before{content:"\f674"}.bi-magic::before{content:"\f675"}.bi-person-rolodex::before{content:"\f676"}.bi-person-video::before{content:"\f677"}.bi-person-video2::before{content:"\f678"}.bi-person-video3::before{content:"\f679"}.bi-person-workspace::before{content:"\f67a"}.bi-radioactive::before{content:"\f67b"}.bi-webcam-fill::before{content:"\f67c"}.bi-webcam::before{content:"\f67d"}.bi-yin-yang::before{content:"\f67e"}.bi-bandaid-fill::before{content:"\f680"}.bi-bandaid::before{content:"\f681"}.bi-bluetooth::before{content:"\f682"}.bi-body-text::before{content:"\f683"}.bi-boombox::before{content:"\f684"}.bi-boxes::before{content:"\f685"}.bi-dpad-fill::before{content:"\f686"}.bi-dpad::before{content:"\f687"}.bi-ear-fill::before{content:"\f688"}.bi-ear::before{content:"\f689"}.bi-envelope-check-fill::before{content:"\f68b"}.bi-envelope-check::before{content:"\f68c"}.bi-envelope-dash-fill::before{content:"\f68e"}.bi-envelope-dash::before{content:"\f68f"}.bi-envelope-exclamation-fill::before{content:"\f691"}.bi-envelope-exclamation::before{content:"\f692"}.bi-envelope-plus-fill::before{content:"\f693"}.bi-envelope-plus::before{content:"\f694"}.bi-envelope-slash-fill::before{content:"\f696"}.bi-envelope-slash::before{content:"\f697"}.bi-envelope-x-fill::before{content:"\f699"}.bi-envelope-x::before{content:"\f69a"}.bi-explicit-fill::before{content:"\f69b"}.bi-explicit::before{content:"\f69c"}.bi-git::before{content:"\f69d"}.bi-infinity::before{content:"\f69e"}.bi-list-columns-reverse::before{content:"\f69f"}.bi-list-columns::before{content:"\f6a0"}.bi-meta::before{content:"\f6a1"}.bi-nintendo-switch::before{content:"\f6a4"}.bi-pc-display-horizontal::before{content:"\f6a5"}.bi-pc-display::before{content:"\f6a6"}.bi-pc-horizontal::before{content:"\f6a7"}.bi-pc::before{content:"\f6a8"}.bi-playstation::before{content:"\f6a9"}.bi-plus-slash-minus::before{content:"\f6aa"}.bi-projector-fill::before{content:"\f6ab"}.bi-projector::before{content:"\f6ac"}.bi-qr-code-scan::before{content:"\f6ad"}.bi-qr-code::before{content:"\f6ae"}.bi-quora::before{content:"\f6af"}.bi-quote::before{content:"\f6b0"}.bi-robot::before{content:"\f6b1"}.bi-send-check-fill::before{content:"\f6b2"}.bi-send-check::before{content:"\f6b3"}.bi-send-dash-fill::before{content:"\f6b4"}.bi-send-dash::before{content:"\f6b5"}.bi-send-exclamation-fill::before{content:"\f6b7"}.bi-send-exclamation::before{content:"\f6b8"}.bi-send-fill::before{content:"\f6b9"}.bi-send-plus-fill::before{content:"\f6ba"}.bi-send-plus::before{content:"\f6bb"}.bi-send-slash-fill::before{content:"\f6bc"}.bi-send-slash::before{content:"\f6bd"}.bi-send-x-fill::before{content:"\f6be"}.bi-send-x::before{content:"\f6bf"}.bi-send::before{content:"\f6c0"}.bi-steam::before{content:"\f6c1"}.bi-terminal-dash::before{content:"\f6c3"}.bi-terminal-plus::before{content:"\f6c4"}.bi-terminal-split::before{content:"\f6c5"}.bi-ticket-detailed-fill::before{content:"\f6c6"}.bi-ticket-detailed::before{content:"\f6c7"}.bi-ticket-fill::before{content:"\f6c8"}.bi-ticket-perforated-fill::before{content:"\f6c9"}.bi-ticket-perforated::before{content:"\f6ca"}.bi-ticket::before{content:"\f6cb"}.bi-tiktok::before{content:"\f6cc"}.bi-window-dash::before{content:"\f6cd"}.bi-window-desktop::before{content:"\f6ce"}.bi-window-fullscreen::before{content:"\f6cf"}.bi-window-plus::before{content:"\f6d0"}.bi-window-split::before{content:"\f6d1"}.bi-window-stack::before{content:"\f6d2"}.bi-window-x::before{content:"\f6d3"}.bi-xbox::before{content:"\f6d4"}.bi-ethernet::before{content:"\f6d5"}.bi-hdmi-fill::before{content:"\f6d6"}.bi-hdmi::before{content:"\f6d7"}.bi-usb-c-fill::before{content:"\f6d8"}.bi-usb-c::before{content:"\f6d9"}.bi-usb-fill::before{content:"\f6da"}.bi-usb-plug-fill::before{content:"\f6db"}.bi-usb-plug::before{content:"\f6dc"}.bi-usb-symbol::before{content:"\f6dd"}.bi-usb::before{content:"\f6de"}.bi-boombox-fill::before{content:"\f6df"}.bi-displayport::before{content:"\f6e1"}.bi-gpu-card::before{content:"\f6e2"}.bi-memory::before{content:"\f6e3"}.bi-modem-fill::before{content:"\f6e4"}.bi-modem::before{content:"\f6e5"}.bi-motherboard-fill::before{content:"\f6e6"}.bi-motherboard::before{content:"\f6e7"}.bi-optical-audio-fill::before{content:"\f6e8"}.bi-optical-audio::before{content:"\f6e9"}.bi-pci-card::before{content:"\f6ea"}.bi-router-fill::before{content:"\f6eb"}.bi-router::before{content:"\f6ec"}.bi-thunderbolt-fill::before{content:"\f6ef"}.bi-thunderbolt::before{content:"\f6f0"}.bi-usb-drive-fill::before{content:"\f6f1"}.bi-usb-drive::before{content:"\f6f2"}.bi-usb-micro-fill::before{content:"\f6f3"}.bi-usb-micro::before{content:"\f6f4"}.bi-usb-mini-fill::before{content:"\f6f5"}.bi-usb-mini::before{content:"\f6f6"}.bi-cloud-haze2::before{content:"\f6f7"}.bi-device-hdd-fill::before{content:"\f6f8"}.bi-device-hdd::before{content:"\f6f9"}.bi-device-ssd-fill::before{content:"\f6fa"}.bi-device-ssd::before{content:"\f6fb"}.bi-displayport-fill::before{content:"\f6fc"}.bi-mortarboard-fill::before{content:"\f6fd"}.bi-mortarboard::before{content:"\f6fe"}.bi-terminal-x::before{content:"\f6ff"}.bi-arrow-through-heart-fill::before{content:"\f700"}.bi-arrow-through-heart::before{content:"\f701"}.bi-badge-sd-fill::before{content:"\f702"}.bi-badge-sd::before{content:"\f703"}.bi-bag-heart-fill::before{content:"\f704"}.bi-bag-heart::before{content:"\f705"}.bi-balloon-fill::before{content:"\f706"}.bi-balloon-heart-fill::before{content:"\f707"}.bi-balloon-heart::before{content:"\f708"}.bi-balloon::before{content:"\f709"}.bi-box2-fill::before{content:"\f70a"}.bi-box2-heart-fill::before{content:"\f70b"}.bi-box2-heart::before{content:"\f70c"}.bi-box2::before{content:"\f70d"}.bi-braces-asterisk::before{content:"\f70e"}.bi-calendar-heart-fill::before{content:"\f70f"}.bi-calendar-heart::before{content:"\f710"}.bi-calendar2-heart-fill::before{content:"\f711"}.bi-calendar2-heart::before{content:"\f712"}.bi-chat-heart-fill::before{content:"\f713"}.bi-chat-heart::before{content:"\f714"}.bi-chat-left-heart-fill::before{content:"\f715"}.bi-chat-left-heart::before{content:"\f716"}.bi-chat-right-heart-fill::before{content:"\f717"}.bi-chat-right-heart::before{content:"\f718"}.bi-chat-square-heart-fill::before{content:"\f719"}.bi-chat-square-heart::before{content:"\f71a"}.bi-clipboard-check-fill::before{content:"\f71b"}.bi-clipboard-data-fill::before{content:"\f71c"}.bi-clipboard-fill::before{content:"\f71d"}.bi-clipboard-heart-fill::before{content:"\f71e"}.bi-clipboard-heart::before{content:"\f71f"}.bi-clipboard-minus-fill::before{content:"\f720"}.bi-clipboard-plus-fill::before{content:"\f721"}.bi-clipboard-pulse::before{content:"\f722"}.bi-clipboard-x-fill::before{content:"\f723"}.bi-clipboard2-check-fill::before{content:"\f724"}.bi-clipboard2-check::before{content:"\f725"}.bi-clipboard2-data-fill::before{content:"\f726"}.bi-clipboard2-data::before{content:"\f727"}.bi-clipboard2-fill::before{content:"\f728"}.bi-clipboard2-heart-fill::before{content:"\f729"}.bi-clipboard2-heart::before{content:"\f72a"}.bi-clipboard2-minus-fill::before{content:"\f72b"}.bi-clipboard2-minus::before{content:"\f72c"}.bi-clipboard2-plus-fill::before{content:"\f72d"}.bi-clipboard2-plus::before{content:"\f72e"}.bi-clipboard2-pulse-fill::before{content:"\f72f"}.bi-clipboard2-pulse::before{content:"\f730"}.bi-clipboard2-x-fill::before{content:"\f731"}.bi-clipboard2-x::before{content:"\f732"}.bi-clipboard2::before{content:"\f733"}.bi-emoji-kiss-fill::before{content:"\f734"}.bi-emoji-kiss::before{content:"\f735"}.bi-envelope-heart-fill::before{content:"\f736"}.bi-envelope-heart::before{content:"\f737"}.bi-envelope-open-heart-fill::before{content:"\f738"}.bi-envelope-open-heart::before{content:"\f739"}.bi-envelope-paper-fill::before{content:"\f73a"}.bi-envelope-paper-heart-fill::before{content:"\f73b"}.bi-envelope-paper-heart::before{content:"\f73c"}.bi-envelope-paper::before{content:"\f73d"}.bi-filetype-aac::before{content:"\f73e"}.bi-filetype-ai::before{content:"\f73f"}.bi-filetype-bmp::before{content:"\f740"}.bi-filetype-cs::before{content:"\f741"}.bi-filetype-css::before{content:"\f742"}.bi-filetype-csv::before{content:"\f743"}.bi-filetype-doc::before{content:"\f744"}.bi-filetype-docx::before{content:"\f745"}.bi-filetype-exe::before{content:"\f746"}.bi-filetype-gif::before{content:"\f747"}.bi-filetype-heic::before{content:"\f748"}.bi-filetype-html::before{content:"\f749"}.bi-filetype-java::before{content:"\f74a"}.bi-filetype-jpg::before{content:"\f74b"}.bi-filetype-js::before{content:"\f74c"}.bi-filetype-jsx::before{content:"\f74d"}.bi-filetype-key::before{content:"\f74e"}.bi-filetype-m4p::before{content:"\f74f"}.bi-filetype-md::before{content:"\f750"}.bi-filetype-mdx::before{content:"\f751"}.bi-filetype-mov::before{content:"\f752"}.bi-filetype-mp3::before{content:"\f753"}.bi-filetype-mp4::before{content:"\f754"}.bi-filetype-otf::before{content:"\f755"}.bi-filetype-pdf::before{content:"\f756"}.bi-filetype-php::before{content:"\f757"}.bi-filetype-png::before{content:"\f758"}.bi-filetype-ppt::before{content:"\f75a"}.bi-filetype-psd::before{content:"\f75b"}.bi-filetype-py::before{content:"\f75c"}.bi-filetype-raw::before{content:"\f75d"}.bi-filetype-rb::before{content:"\f75e"}.bi-filetype-sass::before{content:"\f75f"}.bi-filetype-scss::before{content:"\f760"}.bi-filetype-sh::before{content:"\f761"}.bi-filetype-svg::before{content:"\f762"}.bi-filetype-tiff::before{content:"\f763"}.bi-filetype-tsx::before{content:"\f764"}.bi-filetype-ttf::before{content:"\f765"}.bi-filetype-txt::before{content:"\f766"}.bi-filetype-wav::before{content:"\f767"}.bi-filetype-woff::before{content:"\f768"}.bi-filetype-xls::before{content:"\f76a"}.bi-filetype-xml::before{content:"\f76b"}.bi-filetype-yml::before{content:"\f76c"}.bi-heart-arrow::before{content:"\f76d"}.bi-heart-pulse-fill::before{content:"\f76e"}.bi-heart-pulse::before{content:"\f76f"}.bi-heartbreak-fill::before{content:"\f770"}.bi-heartbreak::before{content:"\f771"}.bi-hearts::before{content:"\f772"}.bi-hospital-fill::before{content:"\f773"}.bi-hospital::before{content:"\f774"}.bi-house-heart-fill::before{content:"\f775"}.bi-house-heart::before{content:"\f776"}.bi-incognito::before{content:"\f777"}.bi-magnet-fill::before{content:"\f778"}.bi-magnet::before{content:"\f779"}.bi-person-heart::before{content:"\f77a"}.bi-person-hearts::before{content:"\f77b"}.bi-phone-flip::before{content:"\f77c"}.bi-plugin::before{content:"\f77d"}.bi-postage-fill::before{content:"\f77e"}.bi-postage-heart-fill::before{content:"\f77f"}.bi-postage-heart::before{content:"\f780"}.bi-postage::before{content:"\f781"}.bi-postcard-fill::before{content:"\f782"}.bi-postcard-heart-fill::before{content:"\f783"}.bi-postcard-heart::before{content:"\f784"}.bi-postcard::before{content:"\f785"}.bi-search-heart-fill::before{content:"\f786"}.bi-search-heart::before{content:"\f787"}.bi-sliders2-vertical::before{content:"\f788"}.bi-sliders2::before{content:"\f789"}.bi-trash3-fill::before{content:"\f78a"}.bi-trash3::before{content:"\f78b"}.bi-valentine::before{content:"\f78c"}.bi-valentine2::before{content:"\f78d"}.bi-wrench-adjustable-circle-fill::before{content:"\f78e"}.bi-wrench-adjustable-circle::before{content:"\f78f"}.bi-wrench-adjustable::before{content:"\f790"}.bi-filetype-json::before{content:"\f791"}.bi-filetype-pptx::before{content:"\f792"}.bi-filetype-xlsx::before{content:"\f793"}.bi-1-circle-fill::before{content:"\f796"}.bi-1-circle::before{content:"\f797"}.bi-1-square-fill::before{content:"\f798"}.bi-1-square::before{content:"\f799"}.bi-2-circle-fill::before{content:"\f79c"}.bi-2-circle::before{content:"\f79d"}.bi-2-square-fill::before{content:"\f79e"}.bi-2-square::before{content:"\f79f"}.bi-3-circle-fill::before{content:"\f7a2"}.bi-3-circle::before{content:"\f7a3"}.bi-3-square-fill::before{content:"\f7a4"}.bi-3-square::before{content:"\f7a5"}.bi-4-circle-fill::before{content:"\f7a8"}.bi-4-circle::before{content:"\f7a9"}.bi-4-square-fill::before{content:"\f7aa"}.bi-4-square::before{content:"\f7ab"}.bi-5-circle-fill::before{content:"\f7ae"}.bi-5-circle::before{content:"\f7af"}.bi-5-square-fill::before{content:"\f7b0"}.bi-5-square::before{content:"\f7b1"}.bi-6-circle-fill::before{content:"\f7b4"}.bi-6-circle::before{content:"\f7b5"}.bi-6-square-fill::before{content:"\f7b6"}.bi-6-square::before{content:"\f7b7"}.bi-7-circle-fill::before{content:"\f7ba"}.bi-7-circle::before{content:"\f7bb"}.bi-7-square-fill::before{content:"\f7bc"}.bi-7-square::before{content:"\f7bd"}.bi-8-circle-fill::before{content:"\f7c0"}.bi-8-circle::before{content:"\f7c1"}.bi-8-square-fill::before{content:"\f7c2"}.bi-8-square::before{content:"\f7c3"}.bi-9-circle-fill::before{content:"\f7c6"}.bi-9-circle::before{content:"\f7c7"}.bi-9-square-fill::before{content:"\f7c8"}.bi-9-square::before{content:"\f7c9"}.bi-airplane-engines-fill::before{content:"\f7ca"}.bi-airplane-engines::before{content:"\f7cb"}.bi-airplane-fill::before{content:"\f7cc"}.bi-airplane::before{content:"\f7cd"}.bi-alexa::before{content:"\f7ce"}.bi-alipay::before{content:"\f7cf"}.bi-android::before{content:"\f7d0"}.bi-android2::before{content:"\f7d1"}.bi-box-fill::before{content:"\f7d2"}.bi-box-seam-fill::before{content:"\f7d3"}.bi-browser-chrome::before{content:"\f7d4"}.bi-browser-edge::before{content:"\f7d5"}.bi-browser-firefox::before{content:"\f7d6"}.bi-browser-safari::before{content:"\f7d7"}.bi-c-circle-fill::before{content:"\f7da"}.bi-c-circle::before{content:"\f7db"}.bi-c-square-fill::before{content:"\f7dc"}.bi-c-square::before{content:"\f7dd"}.bi-capsule-pill::before{content:"\f7de"}.bi-capsule::before{content:"\f7df"}.bi-car-front-fill::before{content:"\f7e0"}.bi-car-front::before{content:"\f7e1"}.bi-cassette-fill::before{content:"\f7e2"}.bi-cassette::before{content:"\f7e3"}.bi-cc-circle-fill::before{content:"\f7e6"}.bi-cc-circle::before{content:"\f7e7"}.bi-cc-square-fill::before{content:"\f7e8"}.bi-cc-square::before{content:"\f7e9"}.bi-cup-hot-fill::before{content:"\f7ea"}.bi-cup-hot::before{content:"\f7eb"}.bi-currency-rupee::before{content:"\f7ec"}.bi-dropbox::before{content:"\f7ed"}.bi-escape::before{content:"\f7ee"}.bi-fast-forward-btn-fill::before{content:"\f7ef"}.bi-fast-forward-btn::before{content:"\f7f0"}.bi-fast-forward-circle-fill::before{content:"\f7f1"}.bi-fast-forward-circle::before{content:"\f7f2"}.bi-fast-forward-fill::before{content:"\f7f3"}.bi-fast-forward::before{content:"\f7f4"}.bi-filetype-sql::before{content:"\f7f5"}.bi-fire::before{content:"\f7f6"}.bi-google-play::before{content:"\f7f7"}.bi-h-circle-fill::before{content:"\f7fa"}.bi-h-circle::before{content:"\f7fb"}.bi-h-square-fill::before{content:"\f7fc"}.bi-h-square::before{content:"\f7fd"}.bi-indent::before{content:"\f7fe"}.bi-lungs-fill::before{content:"\f7ff"}.bi-lungs::before{content:"\f800"}.bi-microsoft-teams::before{content:"\f801"}.bi-p-circle-fill::before{content:"\f804"}.bi-p-circle::before{content:"\f805"}.bi-p-square-fill::before{content:"\f806"}.bi-p-square::before{content:"\f807"}.bi-pass-fill::before{content:"\f808"}.bi-pass::before{content:"\f809"}.bi-prescription::before{content:"\f80a"}.bi-prescription2::before{content:"\f80b"}.bi-r-circle-fill::before{content:"\f80e"}.bi-r-circle::before{content:"\f80f"}.bi-r-square-fill::before{content:"\f810"}.bi-r-square::before{content:"\f811"}.bi-repeat-1::before{content:"\f812"}.bi-repeat::before{content:"\f813"}.bi-rewind-btn-fill::before{content:"\f814"}.bi-rewind-btn::before{content:"\f815"}.bi-rewind-circle-fill::before{content:"\f816"}.bi-rewind-circle::before{content:"\f817"}.bi-rewind-fill::before{content:"\f818"}.bi-rewind::before{content:"\f819"}.bi-train-freight-front-fill::before{content:"\f81a"}.bi-train-freight-front::before{content:"\f81b"}.bi-train-front-fill::before{content:"\f81c"}.bi-train-front::before{content:"\f81d"}.bi-train-lightrail-front-fill::before{content:"\f81e"}.bi-train-lightrail-front::before{content:"\f81f"}.bi-truck-front-fill::before{content:"\f820"}.bi-truck-front::before{content:"\f821"}.bi-ubuntu::before{content:"\f822"}.bi-unindent::before{content:"\f823"}.bi-unity::before{content:"\f824"}.bi-universal-access-circle::before{content:"\f825"}.bi-universal-access::before{content:"\f826"}.bi-virus::before{content:"\f827"}.bi-virus2::before{content:"\f828"}.bi-wechat::before{content:"\f829"}.bi-yelp::before{content:"\f82a"}.bi-sign-stop-fill::before{content:"\f82b"}.bi-sign-stop-lights-fill::before{content:"\f82c"}.bi-sign-stop-lights::before{content:"\f82d"}.bi-sign-stop::before{content:"\f82e"}.bi-sign-turn-left-fill::before{content:"\f82f"}.bi-sign-turn-left::before{content:"\f830"}.bi-sign-turn-right-fill::before{content:"\f831"}.bi-sign-turn-right::before{content:"\f832"}.bi-sign-turn-slight-left-fill::before{content:"\f833"}.bi-sign-turn-slight-left::before{content:"\f834"}.bi-sign-turn-slight-right-fill::before{content:"\f835"}.bi-sign-turn-slight-right::before{content:"\f836"}.bi-sign-yield-fill::before{content:"\f837"}.bi-sign-yield::before{content:"\f838"}.bi-ev-station-fill::before{content:"\f839"}.bi-ev-station::before{content:"\f83a"}.bi-fuel-pump-diesel-fill::before{content:"\f83b"}.bi-fuel-pump-diesel::before{content:"\f83c"}.bi-fuel-pump-fill::before{content:"\f83d"}.bi-fuel-pump::before{content:"\f83e"}.bi-0-circle-fill::before{content:"\f83f"}.bi-0-circle::before{content:"\f840"}.bi-0-square-fill::before{content:"\f841"}.bi-0-square::before{content:"\f842"}.bi-rocket-fill::before{content:"\f843"}.bi-rocket-takeoff-fill::before{content:"\f844"}.bi-rocket-takeoff::before{content:"\f845"}.bi-rocket::before{content:"\f846"}.bi-stripe::before{content:"\f847"}.bi-subscript::before{content:"\f848"}.bi-superscript::before{content:"\f849"}.bi-trello::before{content:"\f84a"}.bi-envelope-at-fill::before{content:"\f84b"}.bi-envelope-at::before{content:"\f84c"}.bi-regex::before{content:"\f84d"}.bi-text-wrap::before{content:"\f84e"}.bi-sign-dead-end-fill::before{content:"\f84f"}.bi-sign-dead-end::before{content:"\f850"}.bi-sign-do-not-enter-fill::before{content:"\f851"}.bi-sign-do-not-enter::before{content:"\f852"}.bi-sign-intersection-fill::before{content:"\f853"}.bi-sign-intersection-side-fill::before{content:"\f854"}.bi-sign-intersection-side::before{content:"\f855"}.bi-sign-intersection-t-fill::before{content:"\f856"}.bi-sign-intersection-t::before{content:"\f857"}.bi-sign-intersection-y-fill::before{content:"\f858"}.bi-sign-intersection-y::before{content:"\f859"}.bi-sign-intersection::before{content:"\f85a"}.bi-sign-merge-left-fill::before{content:"\f85b"}.bi-sign-merge-left::before{content:"\f85c"}.bi-sign-merge-right-fill::before{content:"\f85d"}.bi-sign-merge-right::before{content:"\f85e"}.bi-sign-no-left-turn-fill::before{content:"\f85f"}.bi-sign-no-left-turn::before{content:"\f860"}.bi-sign-no-parking-fill::before{content:"\f861"}.bi-sign-no-parking::before{content:"\f862"}.bi-sign-no-right-turn-fill::before{content:"\f863"}.bi-sign-no-right-turn::before{content:"\f864"}.bi-sign-railroad-fill::before{content:"\f865"}.bi-sign-railroad::before{content:"\f866"}.bi-building-add::before{content:"\f867"}.bi-building-check::before{content:"\f868"}.bi-building-dash::before{content:"\f869"}.bi-building-down::before{content:"\f86a"}.bi-building-exclamation::before{content:"\f86b"}.bi-building-fill-add::before{content:"\f86c"}.bi-building-fill-check::before{content:"\f86d"}.bi-building-fill-dash::before{content:"\f86e"}.bi-building-fill-down::before{content:"\f86f"}.bi-building-fill-exclamation::before{content:"\f870"}.bi-building-fill-gear::before{content:"\f871"}.bi-building-fill-lock::before{content:"\f872"}.bi-building-fill-slash::before{content:"\f873"}.bi-building-fill-up::before{content:"\f874"}.bi-building-fill-x::before{content:"\f875"}.bi-building-fill::before{content:"\f876"}.bi-building-gear::before{content:"\f877"}.bi-building-lock::before{content:"\f878"}.bi-building-slash::before{content:"\f879"}.bi-building-up::before{content:"\f87a"}.bi-building-x::before{content:"\f87b"}.bi-buildings-fill::before{content:"\f87c"}.bi-buildings::before{content:"\f87d"}.bi-bus-front-fill::before{content:"\f87e"}.bi-bus-front::before{content:"\f87f"}.bi-ev-front-fill::before{content:"\f880"}.bi-ev-front::before{content:"\f881"}.bi-globe-americas::before{content:"\f882"}.bi-globe-asia-australia::before{content:"\f883"}.bi-globe-central-south-asia::before{content:"\f884"}.bi-globe-europe-africa::before{content:"\f885"}.bi-house-add-fill::before{content:"\f886"}.bi-house-add::before{content:"\f887"}.bi-house-check-fill::before{content:"\f888"}.bi-house-check::before{content:"\f889"}.bi-house-dash-fill::before{content:"\f88a"}.bi-house-dash::before{content:"\f88b"}.bi-house-down-fill::before{content:"\f88c"}.bi-house-down::before{content:"\f88d"}.bi-house-exclamation-fill::before{content:"\f88e"}.bi-house-exclamation::before{content:"\f88f"}.bi-house-gear-fill::before{content:"\f890"}.bi-house-gear::before{content:"\f891"}.bi-house-lock-fill::before{content:"\f892"}.bi-house-lock::before{content:"\f893"}.bi-house-slash-fill::before{content:"\f894"}.bi-house-slash::before{content:"\f895"}.bi-house-up-fill::before{content:"\f896"}.bi-house-up::before{content:"\f897"}.bi-house-x-fill::before{content:"\f898"}.bi-house-x::before{content:"\f899"}.bi-person-add::before{content:"\f89a"}.bi-person-down::before{content:"\f89b"}.bi-person-exclamation::before{content:"\f89c"}.bi-person-fill-add::before{content:"\f89d"}.bi-person-fill-check::before{content:"\f89e"}.bi-person-fill-dash::before{content:"\f89f"}.bi-person-fill-down::before{content:"\f8a0"}.bi-person-fill-exclamation::before{content:"\f8a1"}.bi-person-fill-gear::before{content:"\f8a2"}.bi-person-fill-lock::before{content:"\f8a3"}.bi-person-fill-slash::before{content:"\f8a4"}.bi-person-fill-up::before{content:"\f8a5"}.bi-person-fill-x::before{content:"\f8a6"}.bi-person-gear::before{content:"\f8a7"}.bi-person-lock::before{content:"\f8a8"}.bi-person-slash::before{content:"\f8a9"}.bi-person-up::before{content:"\f8aa"}.bi-scooter::before{content:"\f8ab"}.bi-taxi-front-fill::before{content:"\f8ac"}.bi-taxi-front::before{content:"\f8ad"}.bi-amd::before{content:"\f8ae"}.bi-database-add::before{content:"\f8af"}.bi-database-check::before{content:"\f8b0"}.bi-database-dash::before{content:"\f8b1"}.bi-database-down::before{content:"\f8b2"}.bi-database-exclamation::before{content:"\f8b3"}.bi-database-fill-add::before{content:"\f8b4"}.bi-database-fill-check::before{content:"\f8b5"}.bi-database-fill-dash::before{content:"\f8b6"}.bi-database-fill-down::before{content:"\f8b7"}.bi-database-fill-exclamation::before{content:"\f8b8"}.bi-database-fill-gear::before{content:"\f8b9"}.bi-database-fill-lock::before{content:"\f8ba"}.bi-database-fill-slash::before{content:"\f8bb"}.bi-database-fill-up::before{content:"\f8bc"}.bi-database-fill-x::before{content:"\f8bd"}.bi-database-fill::before{content:"\f8be"}.bi-database-gear::before{content:"\f8bf"}.bi-database-lock::before{content:"\f8c0"}.bi-database-slash::before{content:"\f8c1"}.bi-database-up::before{content:"\f8c2"}.bi-database-x::before{content:"\f8c3"}.bi-database::before{content:"\f8c4"}.bi-houses-fill::before{content:"\f8c5"}.bi-houses::before{content:"\f8c6"}.bi-nvidia::before{content:"\f8c7"}.bi-person-vcard-fill::before{content:"\f8c8"}.bi-person-vcard::before{content:"\f8c9"}.bi-sina-weibo::before{content:"\f8ca"}.bi-tencent-qq::before{content:"\f8cb"}.bi-wikipedia::before{content:"\f8cc"}.bi-alphabet-uppercase::before{content:"\f2a5"}.bi-alphabet::before{content:"\f68a"}.bi-amazon::before{content:"\f68d"}.bi-arrows-collapse-vertical::before{content:"\f690"}.bi-arrows-expand-vertical::before{content:"\f695"}.bi-arrows-vertical::before{content:"\f698"}.bi-arrows::before{content:"\f6a2"}.bi-ban-fill::before{content:"\f6a3"}.bi-ban::before{content:"\f6b6"}.bi-bing::before{content:"\f6c2"}.bi-cake::before{content:"\f6e0"}.bi-cake2::before{content:"\f6ed"}.bi-cookie::before{content:"\f6ee"}.bi-copy::before{content:"\f759"}.bi-crosshair::before{content:"\f769"}.bi-crosshair2::before{content:"\f794"}.bi-emoji-astonished-fill::before{content:"\f795"}.bi-emoji-astonished::before{content:"\f79a"}.bi-emoji-grimace-fill::before{content:"\f79b"}.bi-emoji-grimace::before{content:"\f7a0"}.bi-emoji-grin-fill::before{content:"\f7a1"}.bi-emoji-grin::before{content:"\f7a6"}.bi-emoji-surprise-fill::before{content:"\f7a7"}.bi-emoji-surprise::before{content:"\f7ac"}.bi-emoji-tear-fill::before{content:"\f7ad"}.bi-emoji-tear::before{content:"\f7b2"}.bi-envelope-arrow-down-fill::before{content:"\f7b3"}.bi-envelope-arrow-down::before{content:"\f7b8"}.bi-envelope-arrow-up-fill::before{content:"\f7b9"}.bi-envelope-arrow-up::before{content:"\f7be"}.bi-feather::before{content:"\f7bf"}.bi-feather2::before{content:"\f7c4"}.bi-floppy-fill::before{content:"\f7c5"}.bi-floppy::before{content:"\f7d8"}.bi-floppy2-fill::before{content:"\f7d9"}.bi-floppy2::before{content:"\f7e4"}.bi-gitlab::before{content:"\f7e5"}.bi-highlighter::before{content:"\f7f8"}.bi-marker-tip::before{content:"\f802"}.bi-nvme-fill::before{content:"\f803"}.bi-nvme::before{content:"\f80c"}.bi-opencollective::before{content:"\f80d"}.bi-pci-card-network::before{content:"\f8cd"}.bi-pci-card-sound::before{content:"\f8ce"}.bi-radar::before{content:"\f8cf"}.bi-send-arrow-down-fill::before{content:"\f8d0"}.bi-send-arrow-down::before{content:"\f8d1"}.bi-send-arrow-up-fill::before{content:"\f8d2"}.bi-send-arrow-up::before{content:"\f8d3"}.bi-sim-slash-fill::before{content:"\f8d4"}.bi-sim-slash::before{content:"\f8d5"}.bi-sourceforge::before{content:"\f8d6"}.bi-substack::before{content:"\f8d7"}.bi-threads-fill::before{content:"\f8d8"}.bi-threads::before{content:"\f8d9"}.bi-transparency::before{content:"\f8da"}.bi-twitter-x::before{content:"\f8db"}.bi-type-h4::before{content:"\f8dc"}.bi-type-h5::before{content:"\f8dd"}.bi-type-h6::before{content:"\f8de"}.bi-backpack-fill::before{content:"\f8df"}.bi-backpack::before{content:"\f8e0"}.bi-backpack2-fill::before{content:"\f8e1"}.bi-backpack2::before{content:"\f8e2"}.bi-backpack3-fill::before{content:"\f8e3"}.bi-backpack3::before{content:"\f8e4"}.bi-backpack4-fill::before{content:"\f8e5"}.bi-backpack4::before{content:"\f8e6"}.bi-brilliance::before{content:"\f8e7"}.bi-cake-fill::before{content:"\f8e8"}.bi-cake2-fill::before{content:"\f8e9"}.bi-duffle-fill::before{content:"\f8ea"}.bi-duffle::before{content:"\f8eb"}.bi-exposure::before{content:"\f8ec"}.bi-gender-neuter::before{content:"\f8ed"}.bi-highlights::before{content:"\f8ee"}.bi-luggage-fill::before{content:"\f8ef"}.bi-luggage::before{content:"\f8f0"}.bi-mailbox-flag::before{content:"\f8f1"}.bi-mailbox2-flag::before{content:"\f8f2"}.bi-noise-reduction::before{content:"\f8f3"}.bi-passport-fill::before{content:"\f8f4"}.bi-passport::before{content:"\f8f5"}.bi-person-arms-up::before{content:"\f8f6"}.bi-person-raised-hand::before{content:"\f8f7"}.bi-person-standing-dress::before{content:"\f8f8"}.bi-person-standing::before{content:"\f8f9"}.bi-person-walking::before{content:"\f8fa"}.bi-person-wheelchair::before{content:"\f8fb"}.bi-shadows::before{content:"\f8fc"}.bi-suitcase-fill::before{content:"\f8fd"}.bi-suitcase-lg-fill::before{content:"\f8fe"}.bi-suitcase-lg::before{content:"\f8ff"}.bi-suitcase::before{content:"\f900"}.bi-suitcase2-fill::before{content:"\f901"}.bi-suitcase2::before{content:"\f902"}.bi-vignette::before{content:"\f903"}

	>{
		overflow-x: hidden;
	}
	a{
		-webkit-transition: all 0.3s ease 0s;
		-moz-transition: all 0.3s ease 0s;
		-o-transition: all 0.3s ease 0s;
		transition: all 0.3s ease 0s;
	}


	.text-purple{
		color: #f14f00 !important;
	}
	.btn-theme {
		padding: 10px 25px !important;
	}
	.btn-purple{
		background-color: #f14f00;
		color: #ffffff;
		border: 1px solid #f14f00;
	}
	.btn-purple:hover, .btn-purple:focus, .btn-outline-purple:hover {
		background-color: #e14a00;
		color: #ffffff;
		border: 1px solid #e14a00;
	}
	.btn-outline-purple{
		color: #e14a00;
		border: 1px solid #e14a00;
	}
	.bg-purple{
		background-color: #f14f00;
	}
	.purple-tab .nav-link {
		color: #f14f00;
	}
	.bg-opacity-purple {
		background: rgb(139 61 255 / 8%);
	}
	.shadow {
		box-shadow: 0 10px 40px 0 rgba(47,47,47,.1) !important;
	}
	.transition-3d-hover {
		transition: all 0.2s ease-in-out;
	}
	.transition-3d-hover:hover {
		-webkit-transform: translateY(-3px);
		transform: translateY(-3px);
	}
	.osahan-dropdown-box {
		background-image: url('http://localhost:8080/img/bg.png') !important;
		background-size: cover;
		background-repeat: no-repeat;
	}
	.card-osahan-demo .card-img-top {
		border-radius: 18px 0 0 0 !important;
		border-right: 0px !important;
		border-bottom: 0px !important;
	}
	.card-osahan-demo{
		transition: all .35s;
		-webkit-transition: all .35s;
		-moz-transition: all .35s;
	}
	.card-osahan-demo:hover {
		box-shadow:0px 0px 40px 10px rgba(0,0,0,0.05);
		transform: translateY(-10px);
	}


	.osahan-main-nav{
		-webkit-transition: all .5s;
		-moz-transition: all .5s;
		transition: all .5s;
	}
	.osahan-main-nav.fixed-top{
		background-color: #ffffff;
		box-shadow: 0px 10px 15px rgba(0,0,0,0.04);
	}
	.navbar-nav .dropdown-menu {
		box-shadow: 0px 24px 21px rgb(0 0 0 / 11%) !important;
	}
	.dropdown:hover>.dropdown-menu {
		display: block;
		animation: dropdown-show 0.25s cubic-bezier(0.68, -0.55, 0.265, 1.55);
	}
	@keyframes dropdown-show {
		from {
			opacity: 0;
			transform: scale(0.9);
		}
		to {
			opacity: 1;
			transform: scale(1);
		}
	}
	.dropdown-menu:hover .dropdown-item{
		opacity: 0.6;
	}
	.dropdown-menu .dropdown-item:hover{
		opacity: unset;
		font-weight: 500;
	}
	.dropdown-item{
		transition: all 0.2s ease-in-out;
		padding-right: 40px;
	}
	.dropdown-item:hover{
		-webkit-transform: translateX(3px);
		transform: translateX(3px);
	}
	.dropdown-item:after {
		content: "\ea6c";
		font-family: remixicon!important;
		font-style: normal;
		position: absolute;
		right: 0;
		font-size: 14px;
		line-height: 24px;
		opacity: 0;
		-webkit-transition: all 0.3s ease 0s;
		-moz-transition: all 0.3s ease 0s;
		-o-transition: all 0.3s ease 0s;
		transition: all 0.3s ease 0s;
	}
	.dropdown-item:hover:after{
		opacity: unset;
		-webkit-transition: all 0.3s ease 0s;
		-moz-transition: all 0.3s ease 0s;
		-o-transition: all 0.3s ease 0s;
		transition: all 0.3s ease 0s;
	}
	.dropdown-item {
		position: relative;
	}
	.single-dropdown-nav .dropdown-menu {
		border: none;
		border-radius: 11px;
		padding: 14px 22px 14px 14px;
		min-width: 270px;
	}
	.single-dropdown-nav .dropdown-menu .dropdown-item {
		padding: 7px 40px 7px 14px;
		border-radius: 6px;
	}
	.single-dropdown-nav .dropdown-menu .dropdown-item::after {
		right: 11px;
	}
	.site-brand  small {
		font-size: 11px;
		letter-spacing: 0.1px;
	}
	.site-brand .fw-bold {
		line-height: 20px;
	}
	.site-brand .lh-1 {
		line-height: 12px !important;
	}
	.osahan-dropdown-box p.lead.mb-5 {
		font-size: 13px;
		margin-bottom: 29px !important;
	}
	.osahan-dropdown-box  a.btn {
		padding: 10px 23px !important;
		border-radius: 32px;
		font-size: 14px;
		background: #000;
		border: none;
	}
	.osahan-dropdown-box  h1.text-primary {
		font-size: 25px;
		color: #000 !important;
	}
	.osahan-dropdown-box h5.text-dark {
		font-size: 15px;
		opacity: 0.7;
		margin-top: 30px !important;
	}


	#back-to-top {
		display: none;
		position: fixed;
		bottom: 20px;
		right: 20px;
		box-shadow: 0 10px 40px 0 rgba(47,47,47,.1) !important;
		background-color: #fff;
		color: #2d2a3e;
		width: 50px;
		border-radius: 100px;
		cursor: pointer;
		height: 50px;
		border: 3px solid #ebebeb;
		text-transform: uppercase;
		font-weight: bold;
		font-size: 14px;
	}
	#back-to-top:hover {
		box-shadow: 0 10px 40px 0 rgba(47,47,47,.1) !important;
		background-color: #2d2a3e;
		color: #ffffff;
	}


	#sidebar .offcanvas-header .link-light {
		color: #000 !important;
	}
	#sidebar .offcanvas-body .nav-item .nav-link {
		text-align: center;
		padding: 15px 20px !important;
	}
	#sidebar .offcanvas-body .nav-item.dropdown {
		position: unset !important;
	}
	#sidebar .offcanvas-body .dropdown-menu {
		position: relative !important;
		transform: unset !important;
		box-shadow: none !important;
	}
	#sidebar .offcanvas-body .dropdown-menu .dropdown-mega-content .col-lg-3 {
		border: none !important;
		padding: 15px 15px !important;
		text-align: center;
	}


	.page-loading {
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 100%;
		-webkit-transition: all .4s .2s ease-in-out;
		transition: all .4s .2s ease-in-out;
		background-color: #fff;
		opacity: 0;
		visibility: hidden;
		z-index: 9999;
	}
	[data-bs-theme="dark"] .page-loading {
		background-color: #121519;
	}
	.page-loading.active {
		opacity: 1;
		visibility: visible;
	}
	.page-loading-inner {
		position: absolute;
		top: 50%;
		left: 0;
		width: 100%;
		text-align: center;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%);
		-webkit-transition: opacity .2s ease-in-out;
		transition: opacity .2s ease-in-out;
		opacity: 0;
	}
	.page-loading.active > .page-loading-inner {
		opacity: 1;
	}
	.page-loading-inner > span {
		display: block;
		font-family: "Inter", sans-serif;
		font-size: 1rem;
		font-weight: normal;
		color: #6f788b;
	}
	[data-bs-theme="dark"] .page-loading-inner > span {
		color: #fff;
		opacity: .6;
	}
	.page-spinner {
		display: inline-block;
		width: 2.75rem;
		height: 2.75rem;
		margin-bottom: .75rem;
		vertical-align: text-bottom;
		background-color: #d7dde2;
		border-radius: 50%;
		opacity: 0;
		-webkit-animation: spinner .75s linear infinite;
		animation: spinner .75s linear infinite;
	}
	[data-bs-theme="dark"] .page-spinner {
		background-color: rgba(255,255,255,.25);
	}
	@-webkit-keyframes spinner {
		0% {
			-webkit-transform: scale(0);
			transform: scale(0);
		}
		50% {
			opacity: 1;
			-webkit-transform: none;
			transform: none;
		}
	}
	@keyframes spinner {
		0% {
			-webkit-transform: scale(0);
			transform: scale(0);
		}
		50% {
			opacity: 1;
			-webkit-transform: none;
			transform: none;
		}
	}</style><style class="darkreader darkreader--sync" media="screen"></style>
	<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.26tY-h6gH9w.L.W.O/am=GAY/d=0/rs=AN8SPfrev-A3NvrBP0gNq8zXCqKY7IcBLA/m=el_main_css"><style class="darkreader darkreader--cors" media="screen">.VIpgJd-ZVi9od-ORHb-OEVmcd{left:0;top:0;height:39px;width:100%;z-index:10000001;position:fixed;border:none;border-bottom:1px solid #6B90DA;margin:0;box-shadow:0 0 8px 1px #999}.VIpgJd-ZVi9od-xl07Ob-OEVmcd{z-index:10000002;border:none;position:fixed;box-shadow:0 3px 8px 2px #999}.VIpgJd-ZVi9od-SmfZ-OEVmcd{z-index:10000000;border:none;margin:0}.goog-te-gadget{font-family:arial;font-size:11px;color:#666;white-space:nowrap}.goog-te-gadget img{vertical-align:middle;border:none}.goog-te-gadget-simple{background-color:#FFF;border-left:1px solid #D5D5D5;border-top:1px solid #9B9B9B;border-bottom:1px solid #E8E8E8;border-right:1px solid #D5D5D5;font-size:10pt;display:inline-block;padding-top:1px;padding-bottom:2px;cursor:pointer}.goog-te-gadget-icon{margin-left:2px;margin-right:2px;width:19px;height:19px;border:none;vertical-align:middle}.goog-te-combo{margin-left:4px;margin-right:4px;vertical-align:baseline}.goog-te-gadget .goog-te-combo{margin:4px 0}.VIpgJd-ZVi9od-l4eHX-hSRGPd,.VIpgJd-ZVi9od-l4eHX-hSRGPd:link,.VIpgJd-ZVi9od-l4eHX-hSRGPd:visited,.VIpgJd-ZVi9od-l4eHX-hSRGPd:hover,.VIpgJd-ZVi9od-l4eHX-hSRGPd:active{font-size:12px;font-weight:bold;color:#444;text-decoration:none}.VIpgJd-ZVi9od-ORHb .VIpgJd-ZVi9od-l4eHX-hSRGPd,.VIpgJd-ZVi9od-TvD9Pc-hSRGPd{display:block;margin:0 10px}.VIpgJd-ZVi9od-ORHb .VIpgJd-ZVi9od-l4eHX-hSRGPd{padding-top:2px;padding-left:4px}.goog-te-combo,.VIpgJd-ZVi9od-ORHb *,.VIpgJd-ZVi9od-SmfZ *,.VIpgJd-ZVi9od-xl07Ob *,.VIpgJd-ZVi9od-vH1Gmf *,.VIpgJd-ZVi9od-l9xktf *{font-family:arial;font-size:10pt}.VIpgJd-ZVi9od-ORHb{margin:0;background-color:#E4EFFB;overflow:hidden}.VIpgJd-ZVi9od-ORHb img{border:none}.VIpgJd-ZVi9od-ORHb-bN97Pc{color:#000}.VIpgJd-ZVi9od-ORHb-bN97Pc img{vertical-align:middle}.VIpgJd-ZVi9od-ORHb-Tswv1b{color:#666;vertical-align:top;margin-top:0;font-size:7pt}.VIpgJd-ZVi9od-ORHb-KE6vqe{width:8px}.VIpgJd-ZVi9od-LgbsSe{border-color:#E7E7E7;border-style:none solid solid none;border-width:0 1px 1px 0}.VIpgJd-ZVi9od-LgbsSe div{border-color:#CCC #999 #999 #CCC;border-right:1px solid #999;border-style:solid;border-width:1px;height:20px}.VIpgJd-ZVi9od-LgbsSe button{background:transparent;border:none;cursor:pointer;height:20px;overflow:hidden;margin:0;vertical-align:top;white-space:nowrap}.VIpgJd-ZVi9od-LgbsSe button:active{background:none repeat scroll 0 0 #CCC}.VIpgJd-ZVi9od-SmfZ{margin:0;background-color:#FFF;white-space:nowrap}.VIpgJd-ZVi9od-SmfZ-hSRGPd{text-decoration:none;font-weight:bold;font-size:10pt;border:1px outset #888;padding:6px 10px;white-space:nowrap;position:absolute;left:0;top:0}.VIpgJd-ZVi9od-SmfZ-hSRGPd img{margin-left:2px;margin-right:2px;width:19px;height:19px;border:none;vertical-align:middle}.VIpgJd-ZVi9od-SmfZ-hSRGPd span{text-decoration:underline;margin-left:2px;margin-right:2px;vertical-align:middle}.goog-te-float-top .VIpgJd-ZVi9od-SmfZ-hSRGPd{padding:2px;border-top-width:0}.goog-te-float-bottom .VIpgJd-ZVi9od-SmfZ-hSRGPd{padding:2px;border-bottom-width:0}.VIpgJd-ZVi9od-xl07Ob-lTBxed{text-decoration:none;color:#00C;white-space:nowrap;margin-left:4px;margin-right:4px}.VIpgJd-ZVi9od-xl07Ob-lTBxed span{text-decoration:underline}.VIpgJd-ZVi9od-xl07Ob-lTBxed img{margin-left:2px;margin-right:2px}.goog-te-gadget-simple .VIpgJd-ZVi9od-xl07Ob-lTBxed{color:#000}.goog-te-gadget-simple .VIpgJd-ZVi9od-xl07Ob-lTBxed span{text-decoration:none}.VIpgJd-ZVi9od-xl07Ob{background-color:#FFF;text-decoration:none;border:2px solid #C3D9FF;overflow-y:scroll;overflow-x:hidden;position:absolute;left:0;top:0}.VIpgJd-ZVi9od-xl07Ob-ibnC6b{padding:3px;text-decoration:none}.VIpgJd-ZVi9od-xl07Ob-ibnC6b,.VIpgJd-ZVi9od-xl07Ob-ibnC6b:link{color:#00C;background:#FFF}.VIpgJd-ZVi9od-xl07Ob-ibnC6b:visited{color:#551A8B}.VIpgJd-ZVi9od-xl07Ob-ibnC6b:hover{background:#C3D9FF}.VIpgJd-ZVi9od-xl07Ob-ibnC6b:active{color:#00C}.VIpgJd-ZVi9od-vH1Gmf{background-color:#FFF;text-decoration:none;border:1px solid #6B90DA;overflow:hidden;padding:4px}.VIpgJd-ZVi9od-vH1Gmf-KrhPNb{width:16px}.VIpgJd-ZVi9od-vH1Gmf-hgDUwe{margin:6px 0;height:1px;background-color:#aaa;overflow:hidden}.VIpgJd-ZVi9od-vH1Gmf-ibnC6b div,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd div{padding:4px}.VIpgJd-ZVi9od-vH1Gmf-ibnC6b .uDEFge{display:none}.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd .uDEFge{display:auto}.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd .fmcmS{padding-left:4px;padding-right:4px}.VIpgJd-ZVi9od-vH1Gmf-ibnC6b,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd{text-decoration:none}.VIpgJd-ZVi9od-vH1Gmf-ibnC6b div,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b:link div,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b:visited div,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b:active div{color:#00C;background:#FFF}.VIpgJd-ZVi9od-vH1Gmf-ibnC6b:hover div{color:#FFF;background:#36C}.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd div,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd:link div,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd:visited div,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd:hover div,.VIpgJd-ZVi9od-vH1Gmf-ibnC6b-gk6SMd:active div{color:#000;font-weight:bold}.VIpgJd-ZVi9od-l9xktf{background-color:#FFF;overflow:hidden;padding:8px;border:none;border-radius:10px}.VIpgJd-ZVi9od-l9xktf-OEVmcd{background-color:#FFF;border:1px solid #6B90DA;box-shadow:0 3px 8px 2px #999;border-radius:8px}.VIpgJd-ZVi9od-l9xktf img{border:none}.VIpgJd-ZVi9od-l9xktf-fmcmS{margin-top:6px}.VIpgJd-ZVi9od-l9xktf-VgwJlc{margin-top:6px;white-space:nowrap}.VIpgJd-ZVi9od-l9xktf-VgwJlc *{vertical-align:middle}.VIpgJd-ZVi9od-l9xktf-VgwJlc .DUGJie{background-image:url('https://www&google.com/images/zippy_minus_sm.gif')}.VIpgJd-ZVi9od-l9xktf-VgwJlc .TdyTDe{background-image:url('https://www&google.com/images/zippy_plus_sm.gif')}.VIpgJd-ZVi9od-l9xktf-VgwJlc span{color:#00C;text-decoration:underline;cursor:pointer;margin:0 4px}.VIpgJd-ZVi9od-l9xktf-I9GLp{margin:6px 0 0}.VIpgJd-ZVi9od-l9xktf-I9GLp form{margin:0}.VIpgJd-ZVi9od-l9xktf-I9GLp form textarea{margin-bottom:4px;width:100%}.VIpgJd-ZVi9od-l9xktf-yePe5c{margin:6px 0 4px}.VIpgJd-ZVi9od-aZ2wEe-wOHMyf{z-index:1000;position:fixed;-webkit-transition-delay:.6s;transition-delay:.6s;left:-1000px;top:-1000px}.VIpgJd-ZVi9od-aZ2wEe-wOHMyf-ti6hGc{-webkit-transition-delay:0s;transition-delay:0s;left:-14px;top:-14px}.VIpgJd-ZVi9od-aZ2wEe-OiiCO{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;width:104px;height:104px;border-radius:50px;background:#FFF url('https://www.gstatic.com/images/branding/product/2x/translate_24dp.png') 50% 50% no-repeat;-webkit-transition:all .6s ease-in-out;transition:all .6s ease-in-out;-webkit-transform:scale(.4);transform:scale(.4);opacity:0}.VIpgJd-ZVi9od-aZ2wEe-OiiCO-ti6hGc{-webkit-transform:scale(.5);transform:scale(.5);opacity:1}.VIpgJd-ZVi9od-aZ2wEe{margin:2px 0 0 2px;-webkit-animation:spinner-rotator 1.4s linear infinite;animation:spinner-rotator 1.4s linear infinite}@-webkit-keyframes spinner-rotator{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(270deg);transform:rotate(270deg)}}@keyframes spinner-rotator{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(270deg);transform:rotate(270deg)}}.VIpgJd-ZVi9od-aZ2wEe-Jt5cK{stroke-dasharray:187;stroke-dashoffset:0;stroke:#4285F4;-webkit-transform-origin:center;transform-origin:center;-webkit-animation:spinner-dash 1.4s ease-in-out infinite;animation:spinner-dash 1.4s ease-in-out infinite}@-webkit-keyframes spinner-dash{0%{stroke-dashoffset:187}50%{stroke-dashoffset:46.75;-webkit-transform:rotate(135deg);transform:rotate(135deg)}100%{stroke-dashoffset:187;-webkit-transform:rotate(450deg);transform:rotate(450deg)}}@keyframes spinner-dash{0%{stroke-dashoffset:187}50%{stroke-dashoffset:46.75;-webkit-transform:rotate(135deg);transform:rotate(135deg)}100%{stroke-dashoffset:187;-webkit-transform:rotate(450deg);transform:rotate(450deg)}}.VIpgJd-yAWNEb-L7lbkb html,.VIpgJd-yAWNEb-L7lbkb body,.VIpgJd-yAWNEb-L7lbkb div,.VIpgJd-yAWNEb-L7lbkb span,.VIpgJd-yAWNEb-L7lbkb iframe,.VIpgJd-yAWNEb-L7lbkb h1,.VIpgJd-yAWNEb-L7lbkb h2,.VIpgJd-yAWNEb-L7lbkb h3,.VIpgJd-yAWNEb-L7lbkb h4,.VIpgJd-yAWNEb-L7lbkb h5,.VIpgJd-yAWNEb-L7lbkb h6,.VIpgJd-yAWNEb-L7lbkb p,.VIpgJd-yAWNEb-L7lbkb a,.VIpgJd-yAWNEb-L7lbkb img,.VIpgJd-yAWNEb-L7lbkb ol,.VIpgJd-yAWNEb-L7lbkb ul,.VIpgJd-yAWNEb-L7lbkb li,.VIpgJd-yAWNEb-L7lbkb table,.VIpgJd-yAWNEb-L7lbkb form,.VIpgJd-yAWNEb-L7lbkb tbody,.VIpgJd-yAWNEb-L7lbkb tr,.VIpgJd-yAWNEb-L7lbkb td{margin:0;padding:0;border:0;font:inherit;font-size:100%;vertical-align:baseline;text-align:left;line-height:normal}.VIpgJd-yAWNEb-L7lbkb ol,.VIpgJd-yAWNEb-L7lbkb ul{list-style:none}.VIpgJd-yAWNEb-L7lbkb table{border-collapse:collapse;border-spacing:0}.VIpgJd-yAWNEb-L7lbkb caption,.VIpgJd-yAWNEb-L7lbkb th,.VIpgJd-yAWNEb-L7lbkb td{text-align:left;font-weight:normal}.VIpgJd-yAWNEb-L7lbkb input::-moz-focus-inner{border:0}div>.VIpgJd-yAWNEb-L7lbkb{padding:10px 14px}.VIpgJd-yAWNEb-L7lbkb{color:#222;background-color:#fff;border:1px solid #eee;box-shadow:0 4px 16px rgba(0,0,0,.2);-moz-box-shadow:0 4px 16px rgba(0,0,0,.2);-webkit-box-shadow:0 4px 16px rgba(0,0,0,.2);display:none;font-family:arial;font-size:10pt;width:420px;padding:12px;position:absolute;z-index:10000}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-nVMfcd-fmcmS,.VIpgJd-yAWNEb-yAWNEb-Vy2Aqc-pbTTYe{clear:both;font-size:10pt;position:relative;text-align:justify;width:100%}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-r4nke{color:#999;font-family:arial,sans-serif;margin:4px 0;text-align:left}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-TvD9Pc-LgbsSe{display:none}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-l4eHX{float:left;margin:0}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-Z0Arqf-PLDbbf{display:inline-block}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-fw42Ze-Z0Arqf-haAclf{display:none;width:100%}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-Z0Arqf-H9tDt{margin-top:20px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-LK5yu{float:left}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-qwU8Me{float:right}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-cGMI2b{min-height:15px;position:relative;height:1%}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-jOfkMb-Ne3sFf{background:-webkit-linear-gradient(top,#29910d 0,#20af0e 100%);background:-webkit-gradient(linear,left top,left bottom,from(#29910d),to(#20af0e));background:linear-gradient(top,#29910d 0,#20af0e 100%);background:#29910d;border-radius:4px;-moz-border-radius:4px;-webkit-border-radius:4px;box-shadow:inset 0 2px 2px #1e6609;-moz-box-shadow:inset 0 2px 2px #1e6609;-webkit-box-shadow:inset 0 2px 2px #1e6609;color:white;font-size:9pt;font-weight:bolder;margin-top:12px;padding:6px;text-shadow:1px 1px 1px #1e6609}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-Z0Arqf-hSRGPd{color:#15c;cursor:pointer;font-family:arial;font-size:11px;margin-right:15px;text-decoration:none}.VIpgJd-yAWNEb-L7lbkb>textarea{font-family:arial;resize:vertical;width:100%;margin-bottom:10px;border-radius:1px;border:1px solid #d9d9d9;border-top:1px solid silver;font-size:13px;height:auto;overflow-y:auto;padding:1px}.VIpgJd-yAWNEb-L7lbkb textarea:focus{box-shadow:inset 0 1px 2px rgba(0,0,0,.3);border:1px solid #4d90fe;outline:none}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-Z0Arqf-IbE0S{margin-right:10px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp{min-height:25px;vertical-align:middle;padding-top:8px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp{margin-bottom:5px;margin-bottom:0}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input{display:inline-block;min-width:54px;*min-width:70px;border:1px solid #dcdcdc;border:1px solid rgba(0,0,0,.1);text-align:center;color:#444;font-size:11px;font-weight:bold;height:27px;outline:0;padding:0 8px;vertical-align:middle;line-height:27px;margin:0 16px 0 0;box-shadow:0 1px 2px rgba(0,0,0,.1);-moz-box-shadow:0 1px 2px rgba(0,0,0,.1);-webkit-box-shadow:0 1px 2px rgba(0,0,0,.1);border-radius:2px;-webkit-transition:all .218s;transition:all .218s;background-color:#f5f5f5;background-image:-webkit-gradient(linear,left top,left bottom,from(#f5f5f5),to(#f1f1f1));background-image:-webkit-linear-gradient(top,#f5f5f5,#f1f1f1);background-image:linear-gradient(top,#f5f5f5,#f1f1f1);-webkit-user-select:none;-moz-user-select:none;cursor:default}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:hover{border:1px solid #c6c6c6;color:#222;-webkit-transition:all 0s;transition:all 0s;background-color:#f8f8f8;background-image:-webkit-gradient(linear,left top,left bottom,from(#f8f8f8),to(#f1f1f1));background-image:-webkit-linear-gradient(top,#f8f8f8,#f1f1f1);background-image:linear-gradient(top,#f8f8f8,#f1f1f1)}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:active{border:1px solid #c6c6c6;color:#333;background-color:#f6f6f6;background-image:-webkit-gradient(linear,left top,left bottom,from(#f6f6f6),to(#f1f1f1));background-image:-webkit-linear-gradient(top,#f6f6f6,#f1f1f1);background-image:linear-gradient(top,#f6f6f6,#f1f1f1)}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:focus .VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input.AHmuwe .VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:active,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:focus:active{box-shadow:inset 0 0 0 1px rgba(255,255,255,.5);-webkit-box-shadow:inset 0 0 0 1px rgba(255,255,255,.5);-moz-box-shadow:inset 0 0 0 1px rgba(255,255,255,.5)}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:focus,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input.AHmuwe{outline:none;border:1px solid #4d90fe;z-index:4!important}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input.gk6SMd{background-color:#eee;background-image:-webkit-gradient(linear,left top,left bottom,from(#eee),to(#e0e0e0));background-image:-webkit-linear-gradient(top,#eee,#e0e0e0);background-image:linear-gradient(top,#eee,#e0e0e0);box-shadow:inset 0 1px 2px rgba(0,0,0,.1);border:1px solid #ccc;color:#333}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf{color:white;border-color:#3079ed;background-color:#4d90fe;background-image:-webkit-gradient(linear,left top,left bottom,from(#4d90fe),to(#4787ed));background-image:-webkit-linear-gradient(top,#4d90fe,#4787ed);background-image:linear-gradient(top,#4d90fe,#4787ed)}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf:hover .VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf:focus,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf.AHmuwe .VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf:active{border-color:#3079ed;background-color:#357ae8;background-image:-webkit-gradient(linear,left top,left bottom,from(#4d90fe),to(#357ae8));background-image:-webkit-linear-gradient(top,#4d90fe,#357ae8);background-image:linear-gradient(top,#4d90fe,#357ae8)}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf:hover{box-shadow:inset 0 0 0 1px #fff,0 1px 1px rgba(0,0,0,.1);-webkit-box-shadow:inset 0 0 0 1px #fff,0 1px 1px rgba(0,0,0,.1);-moz-box-shadow:inset 0 0 0 1px #fff,0 1px 1px rgba(0,0,0,.1)}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:focus,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input.AHmuwe,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:active,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input:hover,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf:focus,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf.AHmuwe,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf:active,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-L4Nn5e-I9GLp .VIpgJd-yAWNEb-Z0Arqf-I9GLp input .VIpgJd-yAWNEb-Z0Arqf-sFeBqf:hover{border-color:#3079ed}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-mrxPge{color:#999;font-family:arial,sans-serif}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-W0vJo-fmcmS{color:#999;font-size:11px;font-family:arial,sans-serif;margin:15px 0 5px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-u0pjoe-fmcmS{color:#800;display:none;font-size:9pt}.VIpgJd-yAWNEb-VIpgJd-fmcmS-sn54Q{background-color:#c9d7f1;box-shadow:2px 2px 4px #99a;box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;position:relative}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-xl07Ob .VIpgJd-yAWNEb-VIpgJd-xl07Ob{background:#fff;border:1px solid #ddd;box-shadow:0 2px 4px #99a;min-width:0;outline:none;padding:0;position:absolute;z-index:2000}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-xl07Ob .VIpgJd-yAWNEb-VIpgJd-j7LFlb{cursor:pointer;padding:2px 5px 5px;margin-right:0;border-style:none}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-xl07Ob .VIpgJd-yAWNEb-VIpgJd-j7LFlb:hover{background:#ddd}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-xl07Ob .VIpgJd-yAWNEb-VIpgJd-j7LFlb h1{font-size:100%;font-weight:bold;margin:4px 0}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-xl07Ob .VIpgJd-yAWNEb-VIpgJd-j7LFlb strong{color:#345aad}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-VIpgJd-eKm5Fc-hFsbo{text-align:right;position:absolute;right:0;left:auto}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-VIpgJd-j7LFlb-SIsrTd .VIpgJd-yAWNEb-VIpgJd-eKm5Fc-hFsbo{text-align:left;position:absolute;left:0;right:auto}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-yAWNEb-Vy2Aqc-fmcmS,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-TVLw9c-ppHlrf-sn54Q{background-color:#f1ea00;border-radius:4px;-webkit-border-radius:4px;-moz-border-radius:4px;box-shadow:rgba(0,0,0,.5) 3px 3px 4px;box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;color:#f1ea00;cursor:pointer;margin:-2px -2px -2px -3px;padding:2px 2px 2px 3px;position:relative}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-TVLw9c-ppHlrf-sn54Q{color:#222}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-yAWNEb-Vy2Aqc-pbTTYe{color:white;position:absolute!important}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-TVLw9c-ppHlrf,.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-TVLw9c-ppHlrf .VIpgJd-yAWNEb-TVLw9c-ppHlrf-sn54Q{background-color:#c9d7f1;border-radius:4px 4px 0 0;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;box-shadow:rgba(0,0,0,.5) 3px 3px 4px;box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;cursor:pointer;margin:-2px -2px -2px -3px;padding:2px 2px 3px 3px;position:relative}.VIpgJd-yAWNEb-L7lbkb span:focus{outline:none}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-TVLw9c-DyVDA{background-color:transparent;border:1px solid #4d90fe;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0;margin:-2px;padding:1px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-yAWNEb-TVLw9c-sn54Q-LzX3ef{border-left:2px solid red;margin-left:-2px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-yAWNEb-TVLw9c-sn54Q-YIAiIb{border-right:2px solid red;margin-right:-2px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-YPqjbf{padding:2px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-YPqjbf-fmcmS{font-size:11px;padding:2px 2px 3px;margin:0;background-color:#fff;color:#333;border:1px solid #d9d9d9;border-top:1px solid #c0c0c0;display:inline-block;vertical-align:top;height:21px;box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;-webkit-border-radius:1px}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-YPqjbf-fmcmS:hover{border:1px solid #b9b9b9;border-top:1px solid #a0a0a0;box-shadow:inset 0 1px 2px rgba(0,0,0,.1)}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-YPqjbf-fmcmS:focus{box-shadow:inset 0 1px 2px rgba(0,0,0,.3);outline:none;border:1px solid #4d90fe}.VIpgJd-yAWNEb-L7lbkb .VIpgJd-yAWNEb-IFdKyd-YPqjbf-sFeBqf{font-size:11px;padding:2px 6px 3px;margin:0 0 0 2px;height:21px}.VIpgJd-yAWNEb-hvhgNd{font-family:"Google Sans",Arial,sans-serif}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-l4eHX-i3jM8c{position:absolute;top:10px;left:14px}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-l4eHX-SIsrTd{position:absolute;top:10px;right:14px}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-k77Iif-i3jM8c,.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-k77Iif-SIsrTd{margin:16px;padding:0}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-IuizWc{margin:0 0 0 36px;padding:0;color:#747775;font-size:14px;font-weight:500}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-k77Iif-SIsrTd .VIpgJd-yAWNEb-hvhgNd-IuizWc{text-align:right;margin:0 36px 0 0}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-axAV1{width:auto;padding:12px 0 0;color:#1f1f1f;font-size:16px;text-align:initial}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-axAV1 .VIpgJd-yAWNEb-SIsrTd{text-align:right}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-N7Eqid{border-radius:0 0 12px 12px;margin:0;background:#f1f4f9;position:relative;min-height:50px}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-N7Eqid .VIpgJd-yAWNEb-SIsrTd{text-align:right}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od{display:inline-block;width:77%;padding:12px}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od .VIpgJd-yAWNEb-SIsrTd{text-align:right}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-UTujCb{color:#1f1f1f;font-size:12px;font-weight:500}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od .VIpgJd-yAWNEb-SIsrTd .VIpgJd-yAWNEb-hvhgNd-UTujCb{text-align:right}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-eO9mKe{color:#444746;font-size:12px;padding-top:4px}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od .VIpgJd-yAWNEb-SIsrTd .VIpgJd-yAWNEb-hvhgNd-eO9mKe{text-align:right}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-xgov5{position:absolute;top:10px;right:5px}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-xgov5 .VIpgJd-yAWNEb-SIsrTd{left:5px;right:auto}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-THI6Vb{fill:#0b57d0}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-bgm6sf{margin:-4px 2px 0 0;padding:2px 0 0;width:48px;height:48px;border:none;border-radius:24px;cursor:pointer;background:none}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-bgm6sf:hover{background:#e8ebec}.VIpgJd-yAWNEb-hvhgNd .VIpgJd-yAWNEb-hvhgNd-aXYTce{display:none}sentinel{}</style><style class="darkreader darkreader--sync" media="screen"></style><style>
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
	</style><style class="darkreader darkreader--sync" media="screen"></style><meta name="darkreader" content="01fb250a24e0464ab67d0fc6d04d971d"><style class="darkreader darkreader--override" media="screen">.vimvixen-hint {
		background-color: #7b5300 !important;
		border-color: #d8b013 !important;
		color: #f3e8c8 !important;
	}
	#vimvixen-console-frame {
		color-scheme: light !important;
	}
	::placeholder {
		opacity: 0.5 !important;
	}
	#edge-translate-panel-body,
	.MuiTypography-body1,
	.nfe-quote-text {
		color: var(--darkreader-neutral-text) !important;
	}
	gr-main-header {
		background-color: #0f3a48 !important;
	}
	.tou-z65h9k,
	.tou-mignzq,
	.tou-1b6i2ox,
	.tou-lnqlqk {
		background-color: var(--darkreader-neutral-background) !important;
	}
	.tou-75mvi {
		background-color: #032029 !important;
	}
	.tou-ta9e87,
	.tou-1w3fhi0,
	.tou-1b8t2us,
	.tou-py7lfi,
	.tou-1lpmd9d,
	.tou-1frrtv8,
	.tou-17ezmgn {
		background-color: #0a0a0a !important;
	}
	.tou-uknfeu {
		background-color: #231603 !important;
	}
	.tou-6i3zyv {
		background-color: #19576c !important;
	}
	div.mermaid-viewer-control-panel .btn {
		background-color: var(--darkreader-neutral-background);
		fill: var(--darkreader-neutral-text);
	}
	svg g rect.er {
		fill: var(--darkreader-neutral-background) !important;
	}
	svg g rect.er.entityBox {
		fill: var(--darkreader-neutral-background) !important;
	}
	svg g rect.er.attributeBoxOdd {
		fill: var(--darkreader-neutral-background) !important;
	}
	svg g rect.er.attributeBoxEven {
		fill: var(--darkreader-selection-background);
		fill-opacity: 0.8 !important;
	}
	svg rect.er.relationshipLabelBox {
		fill: var(--darkreader-neutral-background) !important;
	}
	svg g g.nodes rect,
	svg g g.nodes polygon {
		fill: var(--darkreader-neutral-background) !important;
	}
	svg g rect.task {
		fill: var(--darkreader-selection-background) !important;
	}
	svg line.messageLine0,
	svg line.messageLine1 {
		stroke: var(--darkreader-neutral-text) !important;
	}
	div.mermaid .actor {
		fill: var(--darkreader-neutral-background) !important;
	}
	mitid-authenticators-code-app > .code-app-container {
		background-color: white !important;
		padding-top: 1rem;
	}
	iframe#unpaywall[src$="unpaywall.html"] {
		color-scheme: light !important;
	}
	embed[type="application/pdf"][src="about:blank"] { filter: invert(100%) contrast(90%); }
	
	.btn-primary {
			    background-color: #f77808d9;
			    border-color: #f77808d9;
			    color: white;
			    padding: 10px 20px;
			    font-size: 18px;
			    border-radius: 5px;
			    text-decoration: none;
			    transition: background-color 0.3s ease;
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

<!--월별 권수-->
<script>
	let datax = [];
	let monthx = [];
	<c:forEach items="${userStatVO2}" var="vo">
		datax.push(${vo.bookCount});
		monthx.push(${vo.bookMonth}+'월');
	</c:forEach>
	console.log(datax);
</script>

<script>
	const ctx = document.getElementById('myChart1');
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
	console.log(datax);
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
