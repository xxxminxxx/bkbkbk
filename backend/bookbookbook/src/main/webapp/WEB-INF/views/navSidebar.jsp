<%@ page language="java" 
contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

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
