<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../img/pages/icon.png" type="image/png">
        <title>북북북 | 카테고리별 도서</title>
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

		<style>
		
		#bookList{
			overflow-y:auto;
			height: 55em;
			word-break: keep-all; /* 단어를 줄바꿈하지 않고 유지 */
          	overflow-wrap: break-word; /* 긴 단어를 줄바꿈하여 컨테이너의 너비를 초과하지 않도록 */
		}
		.active .page-link{
			background-color: white;
			border-color: #e74c3c;
		}
		
		.accordion-body a:hover{
			color:#e74c3c !important;
		}
		</style>
    </head>
    <body>
        
        <div class="bg-elements elements-top-header position-relative">
            <!-- navbar -->
            <div class="elements-nav">
                <!-- bootom nav -->
               <%@ include file="../header.jsp" %>
            </div>
            <!-- header -->
            <div class=" py-5">
                <div class="container py-5">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-6 col-lg-5 col-md-10 col-12 text-center">
                            <div class="text-white">
                                <h1 class="text-white fw-bolder display-5 mb-3">카테고리별 도서 추천</h1>
                                <p class="m-0 text-white-50">분류 주제를 선택하여 책을 찾아보세요.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="svg-border-rounded text-light">
                <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 144.54 17.34" preserveaspectratio="none" fill="#ffffff"><path d="M144.54,17.34H0V0H144.54ZM0,0S32.36,17.34,72.27,17.34,144.54,0,144.54,0"></path></svg>
            </div>
        </div>
        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-12">
                        <div class="sticky-sidebar p-3">
                            <div class="mb-4">
                               <!-- <button class="btn btn-outline-purple mb-3 w-100 d-lg-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    Show filter
                                  </button>-->
                                  <div class="collapse d-lg-block mb-5" id="collapseExample">
                                    <div class="accordion osahan-filter">
                                        <div class="accordion-item">
                                          <h2 class="accordion-header">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                카테고리 대분류
                                            </button>
                                          </h2>
                                          <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                <ul id="depth_first" class="list-unstyled m-0">
													
												</ul>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                  카테고리 중분류
                                              </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse hide" data-bs-parent="#accordionExample">
                                              <div class="accordion-body">
                                                  <ul id="depth_second" class="list-unstyled m-0">
                                                      <!--<li class="mb-1"><a href="#" class="text-dark">중분류 카테고리 항목 출력해오기 </a></li>-->
                                                  </ul>
                                              </div>
                                            </div>
                                      	</div><!--카테고리 중분류-->
										
										<div class="accordion-item">
                                            <h2 class="accordion-header">
                                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                  카테고리 소분류
                                              </button>
                                            </h2>
                                            <div id="collapseThree" class="accordion-collapse collapse hide" data-bs-parent="#accordionExample">
                                              <div class="accordion-body">
                                                  <ul id="depth_third" class="list-unstyled m-0">
                                                      <!--<li class="mb-1"><a href="#" class="text-dark">중분류 카테고리 항목 출력해오기 </a></li>-->
                                                  </ul>
                                              </div>
                                            </div>
                                      	</div><!--카테고리 소분류-->
										
                                      </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                    <div class="bg-light col-lg-9 col-12">
                        <div class="p-3">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <small id="selectedCate">선택하신 분야의 책은 다음과 같습니다.</small>
                                <select id="select" class="form-select w-25" aria-label="Default select example">
                                    <option selected>정렬</option>
                                    <option value="titleAsc">이름 오름차순 정렬</option>
                                    <option value="titleDesc">이름 내림차순 정렬</option>
                                    <option value="pubAsc">발매일 순 정렬</option>
                                </select>
                            </div>
                        <div id="bookList" class="row g-4">    
                        </div>
                    </div>
					<div id="paginationContainer"></div>
						
                    </div>
                </div>
            </div>
        </div>
        <!-- Build Something Together -->
        <div class="pt-0">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                    </div>
                </div>
            </div>
        </div>
        
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
        <script src="../js/script.js"></script>
		<script>
			var sort_first='';
			var sort_second='';
			var sort_third='';
			var sortType='';
			
			$(document).ready(function() {
				$.ajax({
					url:'/loadCategory',
					method:'POST',
					success:function(data){
						var cateHtml ='';
						for(let i=0; i<data.length;i++){
							cateHtml+='<li class="mb-1"><a href="#" class="text-dark" name="'+data[i].interestNum1+'">'+data[i].interestNum1+'</a></li>'
						}
						$('#depth_first').html(cateHtml); 
						
						
						$('a[name]').on('click',function(e) {
				            e.preventDefault();
				            var categoryFirst = $(this).attr('name');//categoryFirst가 대분류
							sort_first=categoryFirst;
							//대분류 선택 시 중분류 목록 가져오는 함수
				            loadCategoryData(categoryFirst);
		       			 });//end of click
					},
					erorr: function(err){
						console.log(err);
					}
				});//end of ajax
				
				   
				
				$('#select').change(function(){
					sortType= $(this).val();
					cateBookList(sort_first, sort_second, sort_third, sortType);
				});//end of change
			});
				
				
				//대분류 선택 시 중분류 목록 가져오는 함수
			    function loadCategoryData(categoryFirst) {
			        $.ajax({
			            url: '/loadCategoryData',  // 서버 측 엔드포인트 URL
			            method: 'POST',
			            data: { category: categoryFirst },
			            success: function(data) {
							var html = '<ul class="list-unstyled">';  // 리스트 시작
				            for (var i = 0; i < data.length; i++) {
				                html += '<li class="list-unstyled mb-1"><a href="#" class="text-dark" data-value="'+data[i].interestNum2+'">' + data[i].interestNum2 + '</a></li>';
				            }
				            html += '</ul>';
				            $('#depth_second').html(html);  // #depth_second에 HTML 추가
							
							// 생성된 <a> 태그에 클릭 이벤트 추가
				            $('a[data-value]').click(function(e){
				                e.preventDefault();
				                var categorySecond = $(this).attr('data-value');//categorySecond는 중분류
								sort_second=categorySecond;
				                // 중분류 선택 시 책을 가져오는 함수 호출
				                loadCategoryDataSecond(categoryFirst, categorySecond);      
				            });
							//카테고리 대분류 클래스에 show 지우고 hide 부여
							$('#collapseOne').removeClass("show");
							$('#collapseOne').addClass("hide");
							$('#collapseTwo').addClass("show");
							$('#collapseThree').addClass("hide");
						},
			            error: function(err) {
			                console.error('Failed to load category data1:', err);
			            }
			        });//end of ajax
			    }//end of loadCategoryData
				
				//중분류 선택 시 
				function loadCategoryDataSecond(categoryFirst, categorySecond){
					$.ajax({
						url:'/loadCategoryDataSecond',
						method:'get',
						data:{categoryFirst: categoryFirst, categorySecond: categorySecond},
						success:function(data){
							var html = '<ul class="list-unstyled">';  // 리스트 시작
				            for (var i = 0; i < data.length; i++) {
								if(i===0 || data[i].interestNum3 != data[i-1].interestNum3){
				                html += '<li class="list-unstyled mb-1"><a href="#" class="text-dark" cateThird="'+data[i].interestNum3+'">' + data[i].interestNum3 + '</a></li>';
								}
				            }
				            html += '</ul>';
				            $('#depth_third').html(html);  // #depth_second에 HTML 추가
							
							// 생성된 <a> 태그에 클릭 이벤트 추가
				            $('a[cateThird]').click(function(e){
				                e.preventDefault();
				                var categoryThird = $(this).attr('cateThird');//categoryThird는 소분류
								sort_third=categoryThird;
								//소분류 선택 시 책 가져오는 함수 호출
								cateBookList(sort_first, sort_second, sort_third, sortType)   
				            });
							//카테고리 중분류 클래스에 show 지우고 hide 부여
							$('#collapseTwo').removeClass("show");
							$('#collapseTwo').addClass("hide");
							$('#collapseThree').addClass("show");
						},
						error:function(err){
							console.error('Failed to load category data2:', err);
						}
					})//end of ajax
				}
				
				//소분류 선택 시 책을 가져오는 함수
				function cateBookList(sort_first, sort_second, sort_third, sortType){
					$.ajax({
						url:'/loadCateBookList',
						method:'get',
						data: {categoryFirst: sort_first, categorySecond: sort_second, categoryThird: sort_third, sortType: sortType},
						success:function(data){
								//카테고리 대분류 클래스에 show 지우고 hide 부여
								$('#collapseThree').removeClass("show");
								$('#collapseThree').addClass("hide");
								
								//한 페이지에 9개씩 출력
					            var itemsPerPage = 9; 
					            var currentPage = 1;

								//화면에 출력
					            function displayPage(page) {
									var bookData='';
					                var startIndex = (page - 1) * itemsPerPage;
					                var endIndex = startIndex + itemsPerPage;
					                var slicedData = data.slice(startIndex, endIndex);
									if(slicedData.length==0){
										bookData="<h3>해당하는 데이터가 없습니다.</h3>";
									}else{
									//목록 출력
									for(let i=0; i<slicedData.length;i++){
									var bookImage = slicedData[i].bname ? '<img src="'+slicedData[i].bname+'" class="rounded" alt="'+slicedData[i].bookTitle+'의 표지">' : '<img src="../img/noimage.jpg" class="rounded" alt="등록된 이미지가 없습니다.">'
																			
									bookData += '<div class="col-lg-4 col-md-6 col-12">'+
					                                    '<div class="card bg-transparent border-0 h-100">'+
					                                        '<a href="/bookDetails?bookNum='+slicedData[i].bookNum+'" class="position-relative">'+
																bookImage+
					                                        	'<div class="card-body px-0">'+
					                                            '<h4 class="text-purple card-title lh-base">'+slicedData[i].bookTitle+'</h4>'+
																'</a>'+
					                                            '<h5 class="card-text">'+
					                                                slicedData[i].writer+'<br/><span class="text-muted small">'+slicedData[i].publisher+'</span>'+
					                                            '</h5>'+
					                                        '</div>'+
					                                    '</div>'+
					                               '</div>'
									}//end of for
									}//end of if
									$('#bookList').html(bookData);
								}//end of displayPage
								
								// 처음 페이지 로드
						        displayPage(currentPage);

						            // 페이지네이션 UI 생성 (Bootstrap Pagination 사용)
						            function renderPagination() {
						                var totalPages = Math.ceil(data.length / itemsPerPage);//소수점 올림
										var range = 2; // 현재 페이지를 중심으로 표시할 범위 (현재 페이지 앞뒤로 몇 페이지씩 보여줄지)
										var maxPagesToShow = 5; // 표시할 최대 페이지 수

										    var paginationHtml = '<nav aria-label="Page navigation example"><ul class="pagination align-items-center justify-content-center" style="margin-left: 3rem;">';
										    
										    // 이전 페이지 버튼
										    paginationHtml += '<li class="page-item"><a class="text-purple page-link" href="#" aria-label="Previous" id="prevPage"><span aria-hidden="true">&laquo;</span></a></li>';

										    // 현재 페이지 기준으로 범위 내의 페이지 번호 추가
										    var startPage = Math.max(1, currentPage - range);
										    var endPage = Math.min(totalPages, currentPage + range);

										    // 페이지 번호를 중앙에 맞추기 위한 보정
										    if (endPage - startPage < maxPagesToShow - 1) {
										        if (startPage === 1) {
										            endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);
										        } else if (endPage === totalPages) {
										            startPage = Math.max(1, endPage - maxPagesToShow + 1);
										        }
										    }

										    for (var i = startPage; i <= endPage; i++) {
										        if (i === currentPage) {
										            paginationHtml += '<li class="page-item active"><a class="text-purple page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
										        } else {
										            paginationHtml += '<li class="page-item"><a class="text-purple page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
										        }
										    }

										    // 다음 페이지 버튼
										    paginationHtml += '<li class="page-item"><a class="text-purple page-link" href="#" aria-label="Next" id="nextPage"><span aria-hidden="true">&raquo;</span></a></li>';
										    paginationHtml += '</ul></nav>';
						                $('#paginationContainer').html(paginationHtml);

						                // 페이지 번호 클릭 시 해당 페이지 데이터 표시
						                $('a[data-page]').click(function(e) {
						                    e.preventDefault();
						                    currentPage = parseInt($(this).attr('data-page'));
						                    displayPage(currentPage);
											renderPagination()
						                });

						                // 이전 페이지 버튼 클릭 시
						                $('#prevPage').click(function(e) {
						                    e.preventDefault();
						                    if (currentPage > 1) {
						                        currentPage--;
						                        displayPage(currentPage);
												renderPagination()
						                    }
						                });

						                // 다음 페이지 버튼 클릭 시
						                $('#nextPage').click(function(e) {
						                    e.preventDefault();
						                    if (currentPage < totalPages) {
						                        currentPage++;
						                        displayPage(currentPage);
												renderPagination()
						                    }
						                });
						            }//end of renderPagination

						            // 페이지네이션 UI 초기 렌더링
						            renderPagination();
						},//end of success,
						error: function(err) {
			                console.error('Failed to load category data:', err);
			            }
					});//end of ajax
				}//end of cateBookList
		</script>
    </body>
	
</html>
