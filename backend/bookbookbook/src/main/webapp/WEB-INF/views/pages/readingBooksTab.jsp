<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="reading-list">
										    <c:choose>
										        <c:when test="${not empty readingBooks}">
										            <c:forEach var="book" items="${readingBooks}">
														<div class="reading-books book-item d-flex align-items-start mb-4" data-shelf-num="${book.shelfNum}" data-book-num="${book.bookNum}">
															<c:choose>
																<c:when test="${book.bname != null}">
						                                   		 <img src="${book.bname}" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
																</c:when>
																<c:otherwise>
																	 <img src="../img/noImage.jpg" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
																</c:otherwise>
															</c:choose>
														    <div class="book-info flex-grow-1">
														        <div>
														            <h5 class="book-title">${book.bookTitle}</h5>
														            <p class="book-author mb-1">${book.writer}</p>
														            <p class="book-dates book-start-date mb-1">시작일 <span class="start-date">${book.startDate}</span></p>
														            
														            <c:set var="progress" value="${(book.readPages / book.bookPage) * 100}" />
														            <div class="progress mb-2" style="height: 10px;">
														                <div class="progress-bar bg-success" role="progressbar"
														                    style="width: ${progress}%" aria-valuenow="${progress}"
														                    aria-valuemin="0" aria-valuemax="100" value="${progress}"></div>
														            </div>
														            <p class="book-progress mb-0">
														                <fmt:formatNumber value="${progress}" maxFractionDigits="0"/>% (${book.readPages}/${book.bookPage} 페이지)
														            </p>
														        </div>
														        <div class="book-actions">
														            <button class="btn btn-sm memo-btn" data-toggle="modal" data-target="#memoModal1" data-book-title="${book.bookTitle}"
																	data-shelf-num="${book.shelfNum}">
														                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 256 256">
														                    <path d="M229.66,58.34l-32-32a8,8,0,0,0-11.32,0l-96,96A8,8,0,0,0,88,128v32a8,8,0,0,0,8,8h32a8,8,0,0,0,5.66-2.34l96-96A8,8,0,0,0,229.66,58.34ZM124.69,152H104V131.31l64-64L188.69,88ZM200,76.69,179.31,56,192,43.31,212.69,64ZM224,128v80a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32h80a8,8,0,0,1,0,16H48V208H208V128a8,8,0,0,1,16,0Z"></path>
														                </svg>
														            </button>
														            <button class="btn btn-sm delete-book" data-shelf-num="${book.shelfNum}">X</button>
																	<!--수정하기 버튼-->
																	<button class="btn btn-sm edit-progress" 
																	data-shelf-num="${book.shelfNum}" 
																	data-book-page="${book.bookPage}"
																	 data-book-num="${book.bookNum}">수정</button>
																	                     
																 </div>
										                    </div>
										                </div>
										            </c:forEach>
										        </c:when>
												<c:otherwise>
													<div class="without-data">
													    <div class="d-flex justify-content-center align-items-center" style="height: 100px;">
													        <h4 class="no-books-message text-center m-0">읽고 있는 책이 없습니다!</h4>
													    </div>
													    <div class="d-flex justify-content-center">
													        <a href="/" class="btn btn-primary mx-2">추천 도서 구경하러 가기</a>
													        <a href="/pages/book-categorySearch" class="btn btn-secondary mx-2">카테고리별 책 구경하기</a>
													        <a href="/pages/book-bookSearchResult" class="btn btn-success mx-2">읽고 싶은 책 등록하기</a>
													    </div>
													</div>
								            </c:otherwise>
										    </c:choose>
									    </div>
										<!-- 페이지 수정 모달 -->
										<div class="modal fade" id="editProgressModal" tabindex="-1" role="dialog" aria-labelledby="editProgressModalLabel" aria-hidden="true">
										  <div class="modal-dialog" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="editProgressModalLabel">독서 진행 상황 수정</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
												 
												</button>
										      </div>
										      <div class="modal-body">
										        <div class="form-group">
										          <label for="editStartDate">시작일</label>
										          <input type="date" id="editStartDate" class="form-control">
										        </div>
										        <div class="form-group">
										          <label for="editPageInput">읽은 페이지</label>
										       <input type="number" id="editPageInput" class="form-control no-spinner" min="0">
										        </div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 97px; height: 50px; margin-right: 10px;">닫기</button>
										        <button type="button" class="btn btn-primary" id="saveProgress" style=" height: 50px; margin-left: 10px;">저장</button>
										     </div>
										        </div>
										    </div>
										</div>