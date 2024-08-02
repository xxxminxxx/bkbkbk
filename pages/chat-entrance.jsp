<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>오픈책팅방</title>
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
    </head>
    <body>
        
        <div class="bg-light elements-top-header position-relative">
            <!-- navbar -->
            <div class="elements-nav">
                <!-- bootom nav -->
				<%@ include file="../header.jsp" %>
            </div>
            <!-- header -->
            <div class="py-5">
                <div class="container py-5">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-8 col-lg-8 col-md-10 col-12">
                            <div class="text-black py-5 text-center">
                                <span class="fw-bold d-block text-black mb-3">책에 대한 이야기를 나눠보세요.
                                <h1 class="display-4 text-purple fw-bold">오픈책팅방</h1>
                                <span class=""> 원하는 방이 없다면 </span>
								<button id="createNewChatroom" class="btn btn-outline-purple rounded-pill ms-1 "data-bs-toggle="modal" data-bs-target="#exampleModal">새 방 만들기</button></span>
	                        <!-- Modal -->
		                        <div class=" text-black align-items-center modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		                            <div class="modal-dialog">
		                                <div class="modal-content">
		                                    <div class="modal-header">
		                                        <h1 class="modal-title fs-5" id="exampleModalLabel">새 채팅방 만들기</h1>
		                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                                    </div>
											 <form action="/createChatroom" method="POST" enctype="multipart/form-data" name="createChatroom" onsubmit="return validateForm(event)">
		                                    <div class="modal-body">
												<div class="container-fluid">
													<div class="row">
		                                        		<div class="col-md-5">채팅방 이름</div>
														<div class="row col-md-7 ms-auto">
															<select  id="chatroomNameSelect" name="chatroomName" size=3>
																<option value="" disabled selected>채팅방을 선택하세요</option>
																<c:forEach items="${myBooks}" var="book">
																    <option value="${book.bookTitle}" data-image="${book.bname}">${book.bookTitle}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="row">
														<br/>
													</div>
													<div class="row">
														<div class="col-md-5">채팅방 이미지</div>
														<div class="row col-md-7 ms-auto" style="display:none"> <input id="imageUpload" type="file" name="file"></div>
														<div class="row col-md-7 ms-auto"> <img id="chatroomImage" src=""><input id="imgPath" type="hidden" value="" name="chatFilePath"></div>
													</div>
													<div class="row">
														<br/>
													</div>
													<div class="row">
														<div class="col-md-5">인원수 제한(최대 30명)</div>
														<div class="row col-md-7 ms-auto"><input type="number" value="30" max="30" name="chatroomStatus"></div>
													</div>
													<div class="row">
														<br/>
													</div>
													<div class="row">
														<div id="previewContainer"></div>
													</div>
												</div>
		                                    </div>
		                                    <div class="modal-footer">
		                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		                                        <button type="submit" class="btn btn-primary">만들기</button>
		                                    </div>
											</form>
		                                </div>
		                            </div>
		                        </div>	
								
								<p class="lead text-white-50 m-0"></p>
                            </div>
							<form action="/searchChatroom" name="chatRoomSearch">
                            	<div class="row">
                                	<input name="chatRoomName" class="col-md-10" placeholder="채팅방을 검색해보세요.">
                                	<button id="searchBtn" class="col-md-2 btn btn-purple d-none d-lg-block btn-theme" type="submit">검색</button>
                            	</div>
							</form>
                            <div><br/></div>
							
                            <div class="row g-4">
								<div id="getChatroom" class="row g-4">
									<input type="hidden" name="userCount" value="${userCountsByRoom}">
	                                <c:forEach items="${chatrooms}" var="chatroom">
										<div class="col-lg-6 col-12 mb-4">
		                                    <div class="shadow bg-white rounded-0 border-light-subtle hover:bg-warning rounded-4 p-4">
												<input type="hidden" name="hiddenroomNum" value="${chatroom.chatroomNum}" data-room-name="${chatroom.chatroomName}">
												
												<c:choose>
				                                   <c:when test="${userCountsByRoom[chatroom.chatroomNum.toString()]/chatroom.chatroomStatus lt 1}">
				                                        <span class="badge bg-success small text-success bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">참여가능</span>
				                                   </c:when>
				                                   <c:otherwise>
				                                       <span class="badge bg-danger small text-danger bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">참여불가</span>
				                                   </c:otherwise>
				                               </c:choose>
		                                        <div class="row">
													<div class="col-lg-8">
													<h5 class="fw-bold mt-2 mb-0 text-black d-flex align-items-center">${chatroom.chatroomName}</h5>
													<br/>
													<!-- 아이콘 & 참여자 수-->
														<div class="d-flex align-items-center gap-2">
			                                                 <i class="ri-user-line"></i>
			                                                <div>
			                                                    <small class="text-muted">참여자 수</small>
																<c:choose>
								                                   <c:when test="${userCountsByRoom[chatroom.chatroomNum.toString()] != null}">
								                                       <p class="m-0">
								                                           ${userCountsByRoom[chatroom.chatroomNum.toString()]}명/${chatroom.chatroomStatus}명
								                                       </p>
								                                   </c:when>
								                                   <c:otherwise>
								                                       <p class="m-0">
								                                           0명/${chatroom.chatroomStatus}명
								                                       </p>
								                                   </c:otherwise>
								                               </c:choose>
			                                                </div>
			                                            </div>
													</div><!--end of class="col-lg-8"-->
												<div class="col-lg-4">
													<script>
													        var cfname = "${chatroom.cfname}";
													        if (cfname) {
													            var imageSrc = `${chatroom.cfname}`;
													            var imageElement = document.createElement("img");
													            imageElement.setAttribute("src", imageSrc);
													            imageElement.setAttribute("width", "80px");
													            imageElement.setAttribute("height", "100px");
													            document.write(imageElement.outerHTML); // 이미지 출력
													        }
												    </script>
												</div>
												</div><!--end of class="row"-->
		                                        <div class="fs-7 d-flex small align-items-center gap-3 w-100 justify-content-between my-3">
		                                        </div>
												<c:choose>
				                                   <c:when test="${userCountsByRoom[chatroom.chatroomNum.toString()]/chatroom.chatroomStatus lt 1}">
		                                        		<a href="chat-chatroom?roomNum=${chatroom.chatroomNum}" class="encounter btn btn-outline-purple w-100 mt-2">입장하기</a>
													</c:when>
													<c:otherwise>
														<a  class="btn btn-outline-purple w-100 mt-2">입장할 수 없습니다.</a>
													</c:otherwise>
												</c:choose>
		                                    </div>
		                                </div>
									</c:forEach>
	                            </div> <!-- end of <div id="getChatroom" class="row g-4">-->
									
									<div class="row" id="chatroomPage">
									    <div class="col-xl-6">
									        <%-- 이전 버튼 --%>
									        <c:if test="${currentPage > 1}">
									            <a class="text-purple" href="/pages/chat-entrance?page=${currentPage - 1}">
									                &lt; 이전으로
									            </a>
									        </c:if>
									    </div>
									    <div class="col-xl-6 d-flex justify-content-end">
									        <%-- 다음 버튼 --%>
									        <c:if test="${currentPage < totalPage}">
									            <a class="text-purple" href="/pages/chat-entrance?page=${currentPage + 1}">
									                다음으로 &gt;
									            </a>
									        </c:if>
									    </div>
									</div>
								  
							</div>
                        </div>
                    </div>
                    <div>
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
		                    <a href="/" class="btn btn-warning rounded-0"> <i class="ri-door-line me-2"></i> 로그아웃 </a>
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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
		
		
		<script>
			<!--//채팅방 이미지 업로드 미리보기
			var imageUpload = document.getElementById('imageUpload');
			imageUpload.addEventListener('change', function(event) {  
				var file = event.target.files[0];
			 		 if (file) {   
			  	 		var reader = new FileReader();
			   				 reader.onload = function(event) {      
			  	 				var previewImage = document.createElement('img');      
			   	 				previewImage.src = event.target.result;      
			 	   				previewImage.style.width = '150px'; // 미리보기 이미지 크기 조절      
			  	  				previewImage.style.height = '200px';// 미리보기 이미지를 원하는 위치 (예: 컨테이너 요소)에 표시
			    				var previewContainer = document.getElementById('previewContainer'); 
			    				$('#previewContainer img').remove();
			    				previewContainer.appendChild(previewImage);    
			    			};//end of reader.onload function
			    		reader.readAsDataURL(file);  
			   		 } //end of if
			 });//end of imageUpload addEventListener-->
			 
			 //입장 시 읽은 책 여부 확인하기
			 $('#getChatroom').on('click','.encounter',function(e){
				e.preventDefault();
				   var chatroomName = $(this).closest('.shadow').find('h5').text();
				   //myBooks 리스트 가져오기
				   var chatroomNames = [];
                   $('#chatroomNameSelect option').each(function() {
                       var value = $(this).val();
                       if (value) { // Exclude the disabled and selected option
                           chatroomNames.push(value);
                       }
                   });
				   if (chatroomNames.includes(chatroomName)) {
					   window.location.href = $(this).attr('href');
                   } else {
                       alert('내 서재에 해당 책을 저장한 후 입장하실 수 있습니다.');
                   }
			 });
			 
			 //이미지 띄우기
			 var selectElement = document.getElementById('chatroomNameSelect');
			 var imageElement = document.getElementById('chatroomImage');
			 var imgPath = document.getElementById('imgPath');

		    selectElement.addEventListener('change', function() {
		        var selectedOption = selectElement.options[selectElement.selectedIndex];
		        var imageUrl = selectedOption.getAttribute('data-image');
				console.log(imageUrl);
		        imageElement.src = imageUrl;
				imgPath.value=imageUrl;
		    });
			
			
			//검색기능 이용 시 인원 수 표시 파트 #####################
			var userCount = $('input[name="userCount"]').val();

			// 문자열에서 중괄호를 제거하고, 등호를 콜론으로 변경
			var jsonStr = userCount
			    .replace('{', '')
			    .replace('}', '')
			    .replaceAll('=', ':'); // 등호를 콜론으로 변경
				
			var countSet = {};
			// 쉼표를 기준으로 문자열을 나누어 배열로 변환하고, 각 항목을 JSON 형식의 문자열로 변환
			var formattedStr = jsonStr.split(',') 
			    .map(item => {
			        var [key, value] = item.split(':'); // 각 항목을 콜론을 기준으로 나눔
					countSet[key]= parseInt(value);
			    })
			// countSet 객체를 JSON 문자열로 변환
			var jsonString = JSON.stringify(countSet);
			// ############################################
			
			
			 //채팅방 출력
			 $('#searchBtn').click(function(e){
				e.preventDefault();
				var keyword = $('input[name="chatRoomName"]').val();
				
					$('input[name="chatRoomName"]').val('');
					$.ajax({
					    url: '/searchChatroom',
					    method: 'GET',
					    data: { keyword: keyword },
					    success: function (data) {
					        var itemsPerPage = 6;
					        var currentPage = 1;
					        var totalPages;
 							var chatroomList = $('#getChatroom');
				            var searchResult = '';
		
							//검색 결과 출력
					        function displayPage(page) {
					            var startIndex = (page - 1) * itemsPerPage;
					            var endIndex = startIndex + itemsPerPage;
					            totalPages = Math.ceil(data.length / itemsPerPage);
					            var slicedData = data.slice(startIndex, endIndex);

					            if (slicedData.length != 0) {
					                $('#chatroomPage').html('');
					                chatroomList.html('');
					                for (let i = 0; i < slicedData.length; i++) {
										var imgData = '';
										//이미지 존재 여부
										if(slicedData[i].cfname){
											imgData='<img src="'+slicedData[i].cfname+'" width="80px" height="100px">';
										}
										//참여 인원 수 
										var enterAble= '<span class="badge bg-success small text-success bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">참여가능</span>';
										var enter =  '<a href="chat-chatroom?roomNum=' + slicedData[i].chatroomNum + '" class="encounter btn btn-outline-purple w-100 mt-2">입장하기</a>'
										if(countSet[slicedData[i].chatroomNum] !=null){
											var memberCount = countSet[slicedData[i].chatroomNum];
											if(memberCount >= slicedData[i].chatroomStatus){
												enterAble='<span class="badge bg-danger small text-danger bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">참여불가</span>';
												enter = '<a  class="btn btn-outline-purple w-100 mt-2">입장할 수 없습니다.</a>';
											}
										}else{
											var memberCount =0;
										}
					                    searchResult += '<div class="col-lg-6 col-12 mb-4">' +
					                        '<div class="shadow bg-white rounded-0 border-light-subtle hover:bg-warning rounded-4 p-4">' +
					                        //'<span class="badge bg-success small text-success bg-opacity-10 text-uppercase mb-2 px-3 py-2 rounded-pill">참여가능</span>'+
											enterAble+
											'<div class="row">'+
											'<div class="col-lg-8">'+
					                        '<h5 class="fw-bold mt-2 mb-0 text-black d-flex align-items-center">' + slicedData[i].chatroomName + '</h5>' +'<br/>'+
					                        '<div class="d-flex align-items-center gap-2">' +
					                        '<i class="ri-user-line"></i>' +
					                        '<div>' +
					                        '<small class="text-muted">참여자 수</small>' +
					                        '<p class="m-0">' + memberCount
											+'명/'+slicedData[i].chatroomStatus + '명</p>' +
					                        '</div>' +
					                        '</div>' +
					                        '</div>' +
											'<div class="col-lg-4">'+
											imgData+
											'</div>'+
											'</div>'+ <!--end of class="row"-->
											'<div class="fs-7 d-flex small align-items-center gap-3 w-100 justify-content-between my-3">'+
											'</div>'+
					                       enter +
					                        '</div>' +
					                        '</div>';
					                }
					                chatroomList.append(searchResult);
					                // 더보기 버튼
					                if (currentPage < totalPages) {
					                    $('#chatroomPage').html('<button class="btn btn-outline-purple mt-3" id="loadMoreBtn">더 보기</button>');
					                } else {
					                    $('#chatroomPage').html('');
					                }//end of if-else
					            }else{
									if (currentPage === 1) { // currentPage가 1일 때만 alert를 띄워야 함
					                    alert('검색 결과가 없습니다.');
					                }
								}//end of if  
					        }//end of  function displayPage

					        displayPage(currentPage);

					        // 더보기 버튼 클릭 이벤트
					        $('#chatroomPage').on('click', '#loadMoreBtn', function () {
					            currentPage++;
					            displayPage(currentPage);
					        });
					    },
					    error: function (err) {
					        console.error('Failed to load chatroom search:', err);
					    }
					});//end of ajax
				
			 });//end of click event
		 
		</script>
		<script>
		       function validateForm(event) {
		           var selectBox = document.getElementById('chatroomNameSelect');
		           var selectedValue = selectBox.value;

		           if (selectedValue === "") {
		               alert('채팅방을 선택하세요.');
		               event.preventDefault(); // 폼 제출을 막음
		               return false;
		           }
		           return true;
		       }
		   </script>
    </body>
</html>
