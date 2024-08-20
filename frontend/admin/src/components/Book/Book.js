import React, { useEffect, useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import styles from './Book.module.css';
import "../MainDash/MainDash.css";
import axios from "axios";

const Book = () => {
    const [searchCategory, setSearchCategory] = useState('도서명');
    const [searchKeyword, setSearchKeyword] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage, setItemsPerPage] = useState(5);
    const [books, setBooks] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8080/books')
            .then(result => {
                console.log(result.data);
                setBooks(result.data);
            });
    }, []);

    const handleCategoryClick = (searchCategory) => {
        setSearchCategory(searchCategory)
    }

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
                setCurrentPage(1);
            })
            .catch(error => {
                console.error("Error fetching data", error);
            });
    };

    const handleItemsPerPageChange = (e) => {
        setItemsPerPage(Number(e.target.value));
        setCurrentPage(1);
    }

    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = books.slice(indexOfFirstItem, indexOfLastItem);

    const totalPages = Math.ceil(books.length / itemsPerPage);

    const pageNumbers = [];
    let startPage, endPage;
    if (totalPages <= 5) {
        startPage = 1;
        endPage = totalPages;
    } else {
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
                    <div className="search-container d-flex align-items-center mb-3">
                        <div className="input-group me-3">
                            <div className="dropdown">
                                <button className="btn btn-light dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
                                    {searchCategory}
                                </button>
                                <ul className="dropdown-menu" aria-labelledby="dropdownMenu2">
                                    <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('도서명')}>도서명</button></li>
                                    <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('isbn')}>isbn</button></li>
                                    <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('저자')}>저자</button></li>
                                    <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('출판사')}>출판사</button></li>
                                    <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('출판일')}>출판일</button></li>
                                    <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('페이지')}>페이지</button></li>
                                </ul>
                            </div>
                            <input type="text" 
                                   className="form-control" 
                                   placeholder="검색어를 입력해주세요"
                                   value={searchKeyword}
                                   onChange={(e) => setSearchKeyword(e.target.value)}
                            />
                            <div className="input-group-append">
                                <button className="btn btn-success" type="submit" onClick={handleSearch}>검색</button>
                            </div>
                        </div>
                        <div className="items-per-page">
                            <select 
                                className="form-select" 
                                value={itemsPerPage} 
                                onChange={handleItemsPerPageChange}
                            >
                                <option value="5">5개씩 보기</option>
                                <option value="10">10개씩 보기</option>
                            </select>
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
                                    <td>{book.bookTitle}</td>
                                    <td>{book.isbn}</td>
                                    <td>{book.writer}</td>
                                    <td>{book.publisher}</td>
                                    <td>{book.publicationDate}</td>
                                    <td>{book.bookPage}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                    <div className="book1">
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
        </div>
    );
}

export default Book;