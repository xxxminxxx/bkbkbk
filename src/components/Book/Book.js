import React, { useEffect } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // JavaScript 파일 import
import './Book.css';
import { useState } from "react";
import Modal from "../Modal/Modal"
import "../MainDash/MainDash.css";
import axios from "axios";


const Book= () => {

    const [searchCategory, setSearchCategory] = useState('도서명'); // 초기 검색 카테고리 설정
    const [searchKeyword, setSearchKeyword] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 7;

    const[books,setBooks] = useState([]);


    useEffect(() => {
      axios.get('http://localhost:8080/books')
          .then(result => {
              console.log(result.data);
              setBooks(result.data);
          });
  }, []);

    //항목이 클릭되었을때 해당 선택된 항목으로 대체
    const handleCategoryClick = (searchCategory) => {
      setSearchCategory(searchCategory)
    }

    const [modalOpen, setModalOpen] = useState(false);

    const handleSearch = async () => {
      let searchParam;
      switch(searchCategory){
        case '도서명': searchParam = 'bookTitle'; break;
        case 'isbn': searchParam = 'isbn'; break;
        case '저자': searchParam = 'writer'; break;
        case '출판사': searchParam = 'publisher'; break;
        case '출판일': searchParam = 'publicationDate'; break;
        case '페이지': searchParam = 'bookPage'; break;
        default: searchParam = '';
      }
      
      const path = `http://localhost:8080/searchb?searchCategory=${searchParam}&searchKeyword=${searchKeyword}`;

      await axios.get(path)
        .then(result => {
          console.log(result);
          setBooks(result.data);
          setCurrentPage(1); //검색 후 첫 페이지로 리셋
        })
        .catch(error => {
          console.error("Error fetching data", error);
        });
    };

    
    // 페이징 로직
    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = books.slice(indexOfFirstItem, indexOfLastItem);

    const totalPages = Math.ceil(books.length / itemsPerPage);

    const pageNumbers = [];
    let startPage, endPage;
    if (totalPages <= 5) {
        // 전체 페이지가 5개 이하면 모든 페이지 표시
        startPage = 1;
        endPage = totalPages;
    } else {
        // 현재 페이지 주변의 페이지만 표시
        if (currentPage <= 3) {
            startPage = 1;
            endPage = 5;
        } else if (currentPage + 2 >= totalPages) {
            startPage = totalPages - 4;
            endPage = totalPages;
        } else {
            startPage = currentPage - 2;
            endPage = currentPage + 2;
        }
    }

    for (let i = startPage; i <= endPage; i++) {
        pageNumbers.push(i);
    }

    
    return (
        
      <div className="MainDash container">
        <div className="row">
          <div className="col">
          <div class="input-group mb-3">
          <div class="dropdown">
    <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
      {searchCategory}
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('도서명')}>도서명</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('isbn')}>isbn</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('저자')}>저자</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('출판사')}>출판사</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('출판일')}>출판일</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('페이지')}>페이지</button></li>
    </ul>
  </div>
          <input type="text" 
                 class="form-control" 
                 placeholder="검색어를 입력해주세요"
                 value={searchKeyword}
                 onChange={(e) => setSearchKeyword(e.target.value)}
          />

          <div class="input-group-append">
              <button class="btn btn-success" type="submit" onClick={handleSearch}>검색</button>
          </div>
      </div>
            <table className="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>도서명</th>
                  <th>isbn</th>
                  <th>저자</th>
                  <th>출판사</th>
                  <th>출판일</th>
                  <th>페이지</th>
                </tr>
              </thead>
              <tbody>
                  {currentItems.map((book, index) => (
                      <tr key={index}>
                        <td><a onClick={()=> setModalOpen(true)}>{book.bookTitle}</a>
                        {modalOpen && <Modal setOpenModal={setModalOpen}/>}
                        </td>
                        <td>{book.isbn}</td>
                        <td>{book.writer}</td>
                        <td>{book.publisher}</td>
                        <td>{book.publicationDate}</td>
                        <td>{book.bookPage}</td>
                      </tr>
                ))}
              </tbody>
            </table>
            <nav>
            <ul className="pagination justify-content-center">
                <li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
                    <button className="page-link" onClick={() => setCurrentPage(1)}>처음</button>
                </li>
                <li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
                    <button className="page-link" onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}>이전</button>
                </li>
                {startPage > 1 && <li className="page-item"><span className="page-link">...</span></li>}
                {pageNumbers.map(number => (
                    <li key={number} className={`page-item ${currentPage === number ? 'abc' : ''}`}>
                        <button className="page-link" onClick={() => setCurrentPage(number)}>{number}</button>
                    </li>
                ))}
                {endPage < totalPages && <li className="page-item"><span className="page-link">...</span></li>}
                <li className={`page-item ${currentPage === totalPages ? 'disabled' : ''}`}>
                    <button className="page-link" onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}>다음</button>
                </li>
                <li className={`page-item ${currentPage === totalPages ? 'disabled' : ''}`}>
                    <button className="page-link" onClick={() => setCurrentPage(totalPages)}>마지막</button>
                </li>
            </ul>
        </nav>
          </div>
        </div>
      </div>
    );
  

}

export default Book