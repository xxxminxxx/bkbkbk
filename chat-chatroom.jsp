<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>채팅방</title>
        <!-- Bootstrap Css -->
        <link rel="stylesheet" href="../vender/bootstrap/css/bootstrap.min.css">
        <!-- Icofont Css -->
        <link rel="stylesheet" href="../vender/icofont/icofont.min.css">
        <!-- AOS Css -->
        <link rel="stylesheet" href="../vender/aos/dist/aos.css">
        <!-- Remix Icons -->
        <link rel="stylesheet" href="../vender/remixicon/remixicon.css">
        <!-- Custom Css -->
        <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="../css/style2.css">
        <!-- Common Css -->
        <link rel="stylesheet" href="../css/common.css">
    </head>
    <body>
        
        <div class="bg-elements elements-top-header position-relative">
            <!-- navbar -->
            <div class="elements-nav">
                <!-- top nav -->
                <!-- <div class="top-nav d-none d-lg-block py-2 bg-black bg-opacity-50">
                    <div class="container">
                        <div class="row align-items-center justify-content-between g-4">
                            <div class="col-auto">
                                <small class="link-secondary"><i class="ri-map-pin-line"></i> Rammurthy nagar, Bangalore-560016</small>
                            </div>
                            <div class="col-auto">
                                <div class="d-flex align-items-center gap-3">
                                    <a href="#" class="link-secondary"><i class="ri-facebook-circle-fill"></i></a> <a href="#" class="link-secondary"><i class="ri-twitter-fill"></i></a>
                                    <a href="#" class="link-secondary"><i class="ri-instagram-fill"></i></a> <a href="#" class="link-secondary"><i class="ri-linkedin-box-fill"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
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
                                <!-- <li class="nav-item">
                                    <a class="nav-link active" href="../index.html"><i class="ri-apps-2-line"></i> Home</a>
                                </li> -->
                                
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
        <div class="pb-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="rounded-4 border  bg-white mb-4"><!-- osahan-sidebar -->
                            <div class="text-center p-5 border-bottom">
                                <img src="../img/co2.png">
                                <h3 class="fw-bold mb-1">참가자 목록</h3>
                            </div>
                            <div class="p-4 osahan-sidebar-links">
                                <p><i class="ri-user-line me-2"></i> 참가자 닉네임 얻어오기 </p>
                                <p><i class="ri-user-line me-2"></i> User2 </p>
                                <p><i class="ri-user-line me-2"></i> User3 </p>
                                <p><i class="ri-user-line me-2"></i> User4 </p>
                                <p><i class="ri-user-line me-2"></i> User5 </p>
                            </div>
                        </div>
                    </div>
                    <div id="chat-page" class="col-lg-8 ps-lg-0">
                        <div class="ps-lg-5 pt-lg-5">
                            
                            <div class="col d-flex align-items-center justify-content-between bg-white border px-4 py-4 rounded-4">
                                <h1 class="m-0 fw-bold">[채팅방 이름]</h1>
                            </div>
                           <div>
							<br/>
							</div>
                            <ul id="messageArea">
								<div class="row row-cols-xl-1 row-cols-lg-1 row-cols-md-1 row-cols-1 g-3">
									<div class="col">
	                                    <div class="d-flex align-items-center justify-content-between bg-white border px-2 py-2 rounded-4">
	                                        <div class="w-75">
	                                            <div class="d-flex align-items-center gap-3 osahan-mb-1">
													<i class="ri-door-open-line text-muted fs-5"></i>
	                                                    <p class="text-truncate mb-2 small">oo님이 입장하셨습니다.</p>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
								</div>
                                <div class="row row-cols-xl-1 row-cols-lg-1 row-cols-md-1 row-cols-1 g-3">
                                    <div class="col">
                                        <div class="d-flex align-items-center justify-content-between bg-white border px-3 py-3 rounded-4">
                                            <div class="w-75">
                                                <div class="d-flex align-items-center gap-3 osahan-mb-1">
                                                    <i class="ri-user-line text-muted fs-5"></i>
                                                    <div class="lh-sm">
                                                        <h4 class="fw-bold text-primary mb-2">[상대 이름]</h4>
                                                        <p class="text-truncate mb-2 small">채팅 메세지</p>
                                                        <small class="text-muted">채팅 친 시간</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ms-auto d-flex align-items-center gap-3 text-center small">
                                          <button type="button" class="badge rounded-pill text-bg-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
										  신고하기
										   </button>
										  <!-- Modal -->
										   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										      <div class="modal-dialog">
										          <div class="modal-content">
										              <div class="modal-header">
										                  <h1 class="modal-title fs-5" id="exampleModalLabel">메세지 신고</h1>
										                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										              </div>
													  <form>
											              <div class="modal-body">
															신고 대상: [피신고자 아이디]<br/>
															신고자: [본인 아이디]<br/>
											               	신고 사유를 선택해주세요.<br/>
														   <select>
															<option>욕설</option>
															<option>광고</option>
															<option>기타</option>
															</select>
											              </div>
										              <div class="modal-footer">
										                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										                 <button type="submit" class="btn btn-danger">신고하기</button>
										               </div>
												   </form>
										             </div>
										         </div>
										  </div><!--end of Modal-->
										  
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col">
                                        <div class="d-flex align-items-center justify-content-between bg-white border px-3 py-3 rounded-4">
                                            <div class="w-75">
                                                <div class="d-flex align-items-center gap-3 osahan-mb-1">
                                                    <i class="ri-user-line text-muted fs-5"></i>
                                                    <div class="lh-sm">
                                                        <h4 class="fw-bold text-success mb-2">[내 이름]</h4>
                                                        <p class="text-truncate mb-2 small">내가 보낸 메세지</p>
                                                        <small class="text-muted">채팅 친 시간</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ms-auto d-flex align-items-center gap-3 text-center small"><!-- <span class="text-danger fw-bold h5 m-0">-$75</span> --></div>
                                        </div>
                                    </div>
                                </div>
                            </ul>
                            <!-- 메세지 입력창 -->
                            <form id="messageForm" name="messageForm" nameForm="messageForm">
                            	<div class="form-group">
                            		<div class="input-group input-group-lg">
                            			<input id="message" type="text" class="input-group-lg col-md-10" placeholder="메세지를 입력하세요"><button type="submit" class="col-md-2 btn btn-purple btn-theme">보내기</button>
                            		</div>
                            	</div>
                            </form>
                        </div>
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
        
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src="../js/chat.js"></script>
    </body>
</html>
