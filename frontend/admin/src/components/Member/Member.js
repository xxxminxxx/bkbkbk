import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import './Member.css';
import { useState, useEffect } from "react";
import Modal from "../Modal/Modal"
import axios from "axios";
import Swal from "sweetalert2";

const Member = () => {
    const [searchCategory, setSearchCategory] = useState('회원명');
    const [searchKeyword, setSearchKeyword] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const [stop, setStop] = useState('Y');
    const [itemsPerPage, setItemsPerPage] = useState(5);

    const [users, setUsers] = useState([]);

    const [modalOpen, setModalOpen] = useState(false);
    const [selectedUser, setSelectedUser] = useState(null);

    const showSuccessAlert = (message) => {
        Swal.fire({
            title: "성공!",
            text: message,
            icon: "success"
        });
    };

    const showErrorAlert = (message) => {
        Swal.fire({
            title: "오류!",
            text: message,
            icon: "error"
        });
    };

    const refreshUserList = () => {
        axios.get('http://localhost:8080/users')
        .then(result => {
            console.log(result.data);
            setUsers(result.data);
        })
        .catch(error => {
            console.log("Error fetching users:", error)
            showErrorAlert("사용자 목록을 불러오는 중 오류가 발생했습니다.");
        });
    };

    useEffect(() => {
        refreshUserList();
    }, []);

    const handleCategoryClick = (searchCategory) => {
        setSearchCategory(searchCategory);
    }
    
    const stopHdlr = async (userId) => {
        const temppath = `http://localhost:8080/stop`;
        try {
            const result = await axios.post(temppath, null, {
                params: {
                    userId: userId,
                    stop: 'Y'
                }
            });
            if (result.status === 200) {
                showSuccessAlert('해당 회원이 성공적으로 정지되었습니다.');
                refreshUserList();
            } else {
                showErrorAlert('해당 회원 정지가 실패하였습니다.');
            }
        } catch (error) {
            console.error("Error stopping user:", error);
            showErrorAlert('정지 처리 중 오류가 발생했습니다.');
        }
    }

    const releaseHdlr = async (userId) => {
        const temppath = `http://localhost:8080/release`;
        try {
            const result = await axios.post(temppath, null, {
                params: {
                    userId: userId,
                    stop: 'N'
                }
            });
            if (result.status === 200) {
                showSuccessAlert('해당 회원이 성공적으로 해제되었습니다.');
                refreshUserList();
            } else {
                showErrorAlert('해당 회원 해제가 실패하였습니다.');
            }
        } catch (error) {
            console.error("Error releasing user:", error);
            showErrorAlert('해제 처리 중 오류가 발생했습니다.');
        }
    };

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
                setCurrentPage(1);
            })
            .catch(error => {
                console.error("Error fetching data: ", error);
                showErrorAlert("검색 중 오류가 발생했습니다.");
            });
    };

    const handleUserClick = (user) => {
        setSelectedUser(user);
        setModalOpen(true);
    }

    const handleItemsPerPageChange = (e) => {
        setItemsPerPage(Number(e.target.value));
        setCurrentPage(1);
    }

    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = users.slice(indexOfFirstItem, indexOfLastItem);

    const totalPages = Math.ceil(users.length / itemsPerPage);

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
        <div className="MainDash container-fluid d-flex flex-column">
            <div className="row">
                <div className="col-12">
                    <div className="search-container mb-3">
                        <div className="input-group">
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
                    <div className="table-responsive">
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
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                {currentItems.map((user, index) => (
                                    <tr key={index}>
                                        <td><a onClick={() => handleUserClick(user)}>{user.userName}</a></td>
                                        <td>{user.userId}</td>
                                        <td>{user.userTel}</td>
                                        <td>{user.joinedDate}</td>
                                        <td>{user.userLevel}</td>
                                        <td>{user.reported}</td>
                                        <td><span className={user.banStatus === 'Y' ? 'status-banned' : 'status-active'}>
                                                {user.banStatus === 'Y' ? '정지중' : '정상'}
                                            </span></td>
                                        <td>{user.quitStatus}</td>
                                        <td>
                                        {user.banStatus === 'Y' ? (
                                                <button className="release-button" onClick={() => releaseHdlr(user.userId)}>해제</button>
                                            ) : (
                                                <button className="stop-button" onClick={() => stopHdlr(user.userId)}>정지</button>
                                            )}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
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
            {modalOpen && <Modal setOpenModal={setModalOpen} user={selectedUser} refreshUserList={refreshUserList} />}
        </div>
    );
}

export default Member;