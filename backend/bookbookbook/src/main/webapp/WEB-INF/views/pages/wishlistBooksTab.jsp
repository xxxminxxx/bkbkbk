<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

								    <div id="wishlist-list">
								        <c:choose>
								                  <c:when test="${not empty wishlistBooks}">
									                <c:forEach var="book" items="${wishlistBooks}">
									                    <div class="wish-books book-item d-flex align-items-start mb-4">
															<c:choose>
																<c:when test="${book.bname != null}">
						                                   		  <img src="${book.bname}" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
																</c:when>
																<c:otherwise>
																	 <img src="../img/noImage.jpg" alt="책 표지" class="book-cover me-3" style="width: 100px; height: 150px;">
																</c:otherwise>
															</c:choose>
									                        <div class="book-info flex-grow-1">
									                            <div class="d-flex justify-content-between align-items-start">
									                                <div>
									                                    <h5 class="book-title">${book.bookTitle}</h5>
									                                    <p class="book-author mb-1">${book.writer}</p>
									                                    <p class="book-added-date mb-1">추가한 날짜: <span class="added-date">${book.addedDate}</span></p>
									                                </div>
									                                <form action="" method="post">
									                                    <input type="hidden" name="bookNum" value="${book.bookNum}">
																		<input type="hidden" name="shelfNum" value="${book.shelfNum}">
									                                </form>
									                            </div>
									                        </div>
															<button class="btn btn-sm delete-book" data-shelf-num="${book.shelfNum}"  data-book-num="${book.bookNum}">X</button>
									                    </div>
									                </c:forEach>
									            </c:when>
								            <c:otherwise>
												<div class="without-data">
												    <div class="d-flex justify-content-center align-items-center" style="height: 100px;">
												        <h4 class="no-books-message text-center m-0">읽고 싶은 책이 없습니다!</h4>
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