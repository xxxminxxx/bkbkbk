import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import './Member.css';
import { useState, useEffect } from "react";
import Modal from "../Modal/Modal"
import BookModal from "../Modal/BookModal";
import axios from "axios";

const Member = () => {
    const [searchCategory, setSearchCategory] = useState('회원명');
    const [searchKeyword, setSearchKeyword] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 2;

    const [users, setUsers] = useState([]);

    const [modalOpen, setModalOpen] = useState(false);

    useEffect(() => {
        axios.get('http://localhost:8080/users')
            .then(result => {
                console.log(result.data);
                setUsers(result.data);
            });
    }, []);

    const handleCategoryClick = (searchCategory) => {
        setSearchCategory(searchCategory);
    }

    const handleSearch = () => {
        let searchParam;
        switch(searchCategory) {
            case '회원명': searchParam = 'userName'; break;
            case '이메일': searchParam = 'userId'; break;
            case '가입일': searchParam = 'joinedDate'; break;
            default: searchParam = '';
        }

        const temppath = `http://localhost:8080/search?searchCategory=${searchParam}&searchKeyword=${searchKeyword}`;

        axios.get(temppath)
            .then(result => {
                console.log(result);
                setUsers(result.data);
                setCurrentPage(1); // 검색 후 첫 페이지로 리셋
            })
            .catch(error => {
                console.error("Error fetching data: ", error);
            });
    };

    // 페이징 로직
    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = users.slice(indexOfFirstItem, indexOfLastItem);

    const totalPages = Math.ceil(users.length / itemsPerPage);

    const pageNumbers = [];
    for (let i = 1; i <= totalPages; i++) {
        pageNumbers.push(i);
    }

    return (
        <div className="MainDash container">
            <div className="row">
                <div className="col">
                    <div className="input-group mb-3">
                        <div className="dropdown">
                            <button className="btn btn-light dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
                                {searchCategory}
                            </button>
                            <ul className="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('회원명')}>회원명</button></li>
                                <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('이메일')}>이메일</button></li>
                                <li><button className="dropdown-item" type="button" onClick={() => handleCategoryClick('가입일')}>가입일</button></li>
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
                    <table className="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>회원명</th>
                                <th>이메일</th>
                                <th>전화번호</th>
                                <th>가입일</th>
                                <th>회원 등급</th>
                                <th>신고받은수</th>
                                <th>정지여부</th>
                                <th>탈퇴</th>
                            </tr>
                        </thead>
                        <tbody>
                            {currentItems.map((user, index) => (
                                <tr key={index}>
                                    <td><a onClick={()=> setModalOpen(true)}>{user.userName}</a>
                                    {modalOpen && <BookModal setOpenModal={setModalOpen}/>}
                                    </td>
                                    <td>{user.userId}</td>
                                    <td>{user.userTel}</td>
                                    <td>{user.joinedDate}</td>
                                    <td>{user.userLevel}</td>
                                    <td>{user.reported}</td>
                                    <td>{user.banStatus}</td>
                                    <td>{user.quitStatus}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                    <nav>
                        <ul className="pagination justify-content-center">
                            <li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
                                <button className="page-link" onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}>이전</button>
                            </li>
                            {pageNumbers.map(number => (
                                <li key={number} className={`page-item ${currentPage === number ? 'abc' : ''}`}>
                                    <button className="page-link" onClick={() => setCurrentPage(number)}>{number}</button>
                                </li>
                            ))}
                            <li className={`page-item ${currentPage === totalPages ? 'disabled' : ''}`}>
                                <button className="page-link" onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}>다음</button>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    );
}

export default Member;