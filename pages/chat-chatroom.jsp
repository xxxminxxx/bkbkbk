<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>채팅방</title>
		<style>
				       @font-face {
				           font-family: 'DungGeunMo';
				           src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
				           font-weight: normal;
				           font-style: normal;
				       }
					   
					   div{
						 font-family: 'DungGeunMo';
					   }
				</style>
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
                <nav class="navbar navbar-expand bottom-nav bg-black borer-bottom border-opacity-10 border-white py-lg-0 py-3 bg-opacity-50">
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
								<li class="nav-item dropdown single-dropdown-nav">
		                            <a class="nav-link " href="/pages/user-myBookshelf" role="button" aria-expanded="false"> 나의 서재 </a>
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
                            <a href="/logout" class="btn btn-purple rounded-pill d-none d-lg-block btn-theme"> 로그아웃 </a>
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
                            <div id="joinedUser" class="p-4 osahan-sidebar-links">
                                <!-- 여기에 명단 출력-->
                            </div>
                        </div>
                    </div>
                    <div id="chat-page" class="col-lg-8 ps-lg-0">
                        <div class="ps-lg-5 pt-lg-5">
                            
                            <div class="col d-flex align-items-center justify-content-between bg-white border px-4 py-4 rounded-4">
                                <h1 class="m-0 fw-bold">${room.chatroomName}</h1>
                            </div>
                           <div>
							<br/>
							</div>
							<div id="messageAreaScroll">
                            <ul id="messageArea" >
								<!--<div style="display:none" class="row row-cols-xl-1 row-cols-lg-1 row-cols-md-1 row-cols-1 g-3">
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
								</div>-->
								
                                <div style="display:none" class="row row-cols-xl-1 row-cols-lg-1 row-cols-md-1 row-cols-1 g-3">
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
													  <form id="reportForm">
											              <div class="modal-body">
															<div class="container-fluid">
																<div class="row">
																	<div class="col-md-5">신고 대상:</div>
																	<div class="row col-md-7 ms-auto"> [피신고자 아이디]</div>
																</div>
																<div class="row">
																	<div class="col-md-5">신고자:</div>
																	<div class="row col-md-7 ms-auto"> [신고자 아이디]</div>
																</div>
																<div class="row">
													               	<div class="col-md-5">신고 사유:<br/></div>
																   <select class="row col-md-7 ms-auto">
																	<option>욕설</option>
																	<option>광고</option>
																	<option>기타</option>
																	</select>
																</div>
															</div>
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
									<!--<div id="messageTemplate" style="display:none">
	                                    <div class="col">
	                                        <div class="d-flex align-items-center justify-content-between bg-white border px-3 py-3 rounded-4">
	                                            <div class="w-75">
	                                                <div class="d-flex align-items-center gap-3 osahan-mb-1">
	                                                    <i class="ri-user-line text-muted fs-5"></i>
	                                                    <div class="lh-sm">
	                                                        <h4 class="fw-bold text-success mb-2">나의 이름</h4>
	                                                        <p class="text-truncate mb-2 small">내가 보낸 메세지</p>
	                                                        <small class="text-muted">메세지를 보낸 시간</small>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="ms-auto d-flex align-items-center gap-3 text-center small"> <span class="text-danger fw-bold h5 m-0">-$75</span> </div>
	                                        </div>
	                                    </div>
									</div>-->
                                </div>
                            </ul>
							</div>
                            <!-- 메세지 입력창 -->
                            <form id="messageForm" name="messageForm" nameForm="messageForm">
                            	<div class="form-group">
                            		<div class="input-group input-group-lg">
                            			<input id="messageInput" type="text" class="input-group-lg col-md-10" placeholder="메세지를 입력하세요">
										<button type="submit" class="col-md-2 btn btn-purple btn-theme">보내기</button>
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
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
   
		<!-- 채팅기능-->
		<script>
		       var socket = new SockJS('/chat-websocket'); // WebSocket endpoint URL
		       var stompClient = Stomp.over(socket);
 			   var message={};
			   var username= '';
			   <c:choose>
			        <c:when test="${not empty sessionScope.userId}">
			            username="${sessionScope.userName}";
			        </c:when>
			        <c:otherwise>
			            username= "임시";
			        </c:otherwise>
			    </c:choose>
			   
			   
			   var roomNum = ${room.chatroomNum};
			   
		       stompClient.connect({}, function(frame) {
				   //console.log('Connected: ' + frame);
				   //메세지 송수신
		           stompClient.subscribe('/topic/public/'+roomNum, function(messageOutput) {
		               showMessage(JSON.parse(messageOutput.body));
		           });
				   //유저 JOIN
				   stompClient.subscribe('/app/chat.addUser/'+roomNum, function(messageOutput) {
				           showMessage(JSON.parse(messageOutput.body));
				       });
				   stompClient.send("/app/chat.addUser/"+roomNum,
			           {},
			           JSON.stringify({sender: username, type: 'JOIN', time: new Date().toISOString()})
			       )
				   //유저 목록
				   stompClient.subscribe('/topic/activeUsers/'+roomNum, function(users) {
				           let userList = JSON.parse(users.body); // 받은 데이터를 파싱
				           // 여기서 userList를 이용하여 UI를 업데이트하거나 다른 작업을 수행할 수 있음
						   var li = document.createElement('li');
						   var joinedUser = document.getElementById('joinedUser');
						   joinedUser.innerHTML='';
						   var members='';
						   for(let i=0;i<userList.length;i++){
							//console.log(userList[i].split('/'));
							if (userList[i].split('/')[0] == roomNum){
								members += '<p><i class="ri-user-line mb-2"></i>'+userList[i].split('/')[1]+'</p>';
							}
						   }//end of for
						   li.innerHTML=members;
						   li.className = 'mb-2 list-unstyled';
						   joinedUser.appendChild(li);
				       });
					   
				   //유저 LEAVE
				   window.addEventListener('beforeunload', function(event) {
				               // WebSocket 연결이 있다면 연결 종료
				               if (stompClient !== null) {
				                   stompClient.send("/app/chat.removeUser/"+${room.chatroomNum},
				                       {},
				                       JSON.stringify({sender: username, type: 'LEAVE', time: new Date().toISOString()})
				                   );

				                   stompClient.disconnect(function() {
				                       console.log('WebSocket disconnected');
				                   });
				               }
				           });
		       });
			   
			   
		       function showMessage(message) {
		           var messageArea = document.getElementById('messageArea');
		           var li = document.createElement('li');
		           li.className = 'mb-2';
				   var text = JSON.stringify(message);
				   var parsedMessage = JSON.parse(text);
				   var messageId=parsedMessage.time;
				   var messageContent='';
				   	//console.log(parsedMessage.type);
				   // ISO 문자열을 Date 객체로 변환
				   var date = new Date(messageId);

				   // 한국 시간대로 변환 (Asia/Seoul)
				   var options = {
				       timeZone: 'Asia/Seoul',
				       year: 'numeric',
				       month: '2-digit',
				       day: '2-digit',
				       hour: '2-digit',
				       minute: '2-digit',
				       second: '2-digit'
				   };

				   var localizedDate = date.toLocaleDateString('ko-KR', options);
				   
				   if(parsedMessage.type==='JOIN'){
				   		messageContent= parsedMessage.sender+'님이 참여하였습니다.'+ '<small class="text-muted">' + localizedDate.substring(14,25) + '</small>';
						
						//var userList= document.getElementById('joinedUser');
						//var userAdd = '<i class="ri-user-line me-2"></i>'+ 'username';
						//var pElement = document.createElement('p');
						//pElement.innerHTML=userAdd;
						//userList.appendChild(pElement);
						
				   }else if(parsedMessage.type==='LEAVE'){
						messageContent= parsedMessage.sender+'님이 나가셨습니다.'+'<small class="text-muted">' + localizedDate.substring(14,25) + '</small>';
				   }else{
					messageContent = 
					    '<div class="col">' +
					        '<div class="d-flex align-items-center justify-content-between bg-white border px-3 py-3 rounded-4">' +
					            '<div class="w-75">' +
					                '<div class="d-flex align-items-center gap-3 osahan-mb-1">' +
					                    '<i class="ri-user-line text-muted fs-5"></i>' +
					                    '<div class="lh-sm">' +
											(parsedMessage.sender === username ?
											        '<h6 class="fw-bold text-success mb-2">' + parsedMessage.sender + '</h6>' :
											        '<h6 class="fw-bold text-primary mb-2">' + parsedMessage.sender + '</h6>'
											    ) +
					                        '<h6 class="text-truncate mb-2 bold">' + parsedMessage.content + '</h6>' +
					                        '<small class="text-muted">' + localizedDate + '</small>' +
					                    '</div>' +
					                '</div>' +
					            '</div>' +
					            '<div class="ms-auto d-flex align-items-center gap-3 text-center small">' +
					                '<button type="button" class="badge rounded-pill text-bg-warning" data-bs-toggle="modal" data-bs-target="#exampleModal'+messageId+'">' +
					                    '신고하기' +
					                '</button>' +
									'<div class="modal fade" id="exampleModal'+messageId+'" tabindex="-1" aria-labelledby="exampleModalLabel'+messageId+'" aria-hidden="true">'+
									     '<div class="modal-dialog">'+
									          '<div class="modal-content">'+
									              '<div class="modal-header">'+
									                  '<h1 class="modal-title fs-5" id="exampleModalLabel'+messageId+'">메세지 신고</h1>'+
									                      '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>'+
									              '</div>'+
												  '<form action="/submitReport" name="reportForm">'+
										              '<div class="modal-body">'+
														'<div class="container-fluid">'+
															'<div class="row">'+
																'<input type="hidden" name="chatroomNum" value="'+${room.chatroomNum}+'">'+
																'<input type="hidden" name="reportTime" value="'+messageId.replaceAll('-','').replace('T','').replaceAll(':','').replace('.','')+'">'+
																'<div class="col-md-5">신고 대상:</div>'+
																'<div class="row col-md-7 ms-auto">'+ '<input name="reportedUser" value="'+parsedMessage.sender+'" readonly></div>'+
															'</div>'+
															'<div class="row">'+
																'<br/>'+
															'</div>'+
															'<div class="row">'+
																'<div class="col-md-5">신고자:</div>'+
																'<div class="row col-md-7 ms-auto">'+ '<input name="reportUser" value="신고자 아이디" readonly/></div>'+
															'</div>'+
															'<div class="row">'+
																'<br/>'+
															'</div>'+
															'<div class="row">'+
																'<div class="col-md-5">신고 내용:</div>'+
																'<div class="row col-md-7 ms-auto">'+ '<span>'+parsedMessage.content +'</span></div>'+
															'</div>'+
															'<div class="row">'+
																'<br/>'+
															'</div>'+
															'<div class="row">'+
												               	'<div class="col-md-5">신고 사유:<br/></div>'+
															   '<select name="reportType" class="row col-md-7 ms-auto">'+
																'<option>욕설</option>'+
																'<option>광고</option>'+
																'<option>기타</option>'+
																'</select>'+
															'</div>'+
															'<div class="row">'+
																'<br/>'+
															'</div>'+
															'<div class="row">'+
																'<hr/>'+
																'<div class="col-md-12">허위신고시 서비스 이용이 제한될 수 있습니다.<br/></div>'+
															'</div>'+
														'</div>'+
										              '</div>'+
									              '<div class="modal-footer">'+
									                 '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>'+
									                 '<button type="submit" class="btn btn-danger">신고하기</button>'+
									               '</div>'+
											   '</form>'+
									             '</div>'+
									         '</div>'+
									  '</div>' +
							        '</div>' +
							    '</div>';
					}//end of if
		           li.innerHTML = messageContent;
				   li.className = 'list-unstyled';
		           messageArea.appendChild(li);
				   //스크롤 아래로 이동
				   document.getElementById('messageAreaScroll').scrollTop = messageArea.scrollHeight;
				  
		       }

		       document.getElementById('messageForm').onsubmit = function(event) {
		           event.preventDefault();
		           var messageInput = document.getElementById('messageInput');
		           var messageContent = messageInput.value.trim();
				  
				   //console.log("메세지콘텐트"+messageContent);
		           if (messageContent) {
		               var message = {
						   type: 'CHAT',
		                   sender: username, // 사용자명을 여기에 설정 (실제로는 로그인 정보에서 가져와야 함)
		                   content: messageContent,
		                   //time: new Date().toLocaleTimeString([], {hour: '2-digit', minute: '2-digit'}) // 현재 시간
						   time: new Date().toISOString()  // ISO-8601 형식으로 변환
					    };
		               stompClient.send("/app/chat.sendMessage/"+${room.chatroomNum}, {}, JSON.stringify(message));
		               messageInput.value = '';
		           }
		       };
			   
			   //신고기능
			  $(document).on('submit', 'form[name="reportForm"]', function(e) {
				e.preventDefault();
				var formData = $(this).serialize();
				$.ajax({
				    url: '/submitReport',
				    method: 'POST',
				    data: formData, 
				    success: function(response) {
				        $('div .modal').modal('hide');
						alert('신고가 성공적으로 제출되었습니다.');
				    },
				    error: function(err) {
				        console.error('Failed to submit report:', err);
				    }
				});//end of ajax
			   });
		   </script>
		
    </body>
</html>
