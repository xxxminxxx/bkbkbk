<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="read-list">
								        <c:choose>
								            <c:when test="${not empty readBooks}">
								                <c:forEach var="book" items="${readBooks}">
								                    <div class="read-books book-item d-flex align-items-start mb-4">
														<c:choose>
															<c:when test="${book.bname != null}">
					                                   		<img src="${book.bname}" alt="책 표지" class="book-cover" style="width: 100px; height: 150px;">
															</c:when>
															<c:otherwise>
																<img src="../img/noImage.jpg" alt="책 표지" class="book-cover" style="width: 100px; height: 150px;">
															</c:otherwise>
														</c:choose>
								                        <div class="book-info flex-grow-1 d-flex justify-content-between">
								                            
								                                <div>
								                                    <h5 class="book-title" id="book-title">${book.bookTitle}</h5>
								                                    <p class="book-author mb-1">${book.writer}</p>
								                                    <div class="book-rating mb-1">
								                                        <c:forEach var="i" begin="1" end="5">
								                                            <c:choose>
								                                                <c:when test="${i <= book.rating}">
								                                                    <span class="star">★</span>
								                                                </c:when>
								                                                <c:otherwise>
								                                                    <span class="star-empty">☆</span>
								                                                </c:otherwise>
								                                            </c:choose>
								                                        </c:forEach>
								                                    </div>
								                                    <p class="book-dates">시작일 <span class="start-date">${book.startDate}</span> 
																		종료일 <span class="end-date">${book.endDate}</span></p>
									                                </div>
																	<div class="book-actions d-flex">
																<input type="hidden" id="shelfNum" name="shelfNum" value="${book.shelfNum}">
																<button class="btn btn-sm memo-btn" data-toggle="modal" data-target="#memoModal1" data-book-title="${book.bookTitle}" data-shelf-num="${book.shelfNum}">
																  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 256 256">
																    <path d="M229.66,58.34l-32-32a8,8,0,0,0-11.32,0l-96,96A8,8,0,0,0,88,128v32a8,8,0,0,0,8,8h32a8,8,0,0,0,5.66-2.34l96-96A8,8,0,0,0,229.66,58.34ZM124.69,152H104V131.31l64-64L188.69,88ZM200,76.69,179.31,56,192,43.31,212.69,64ZM224,128v80a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32h80a8,8,0,0,1,0,16H48V208H208V128a8,8,0,0,1,16,0Z">
																    </path>
																  </svg>
																</button>
																<button class="btn btn-sm delete-book" data-shelf-num="${book.shelfNum}">X</button>
								                            </div>
														
								                        </div>
								                    </div>
								                </c:forEach>
								            </c:when>
								            <c:otherwise>
												<div class="without-data">
												    <div class="d-flex justify-content-center align-items-center" style="height: 100px;">
												        <h4 class="no-books-message text-center m-0">읽은 책이 없습니다!</h4>
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