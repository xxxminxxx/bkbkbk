import React, { useState, useEffect } from 'react';
import './Admin.css';
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Button } from 'react-bootstrap';
import AdminModal from '../Modal/AdminModal';

const Admin = () => {
  const [adminList, setAdminList] = useState([]);
  const [showModal, setShowModal] = useState(false);
  
  // 페이징을 위한 상태
  const [currentPage, setCurrentPage] = useState(1);
  const [adminsPerPage] = useState(3);

  useEffect(() => {
    fetchAdminList();
  }, []);

  const fetchAdminList = async () => {
    try {
      const response = await axios.get('http://localhost:8080/getAdmins');
      setAdminList(response.data);
    } catch (error) {
      console.error('Error fetching admin list:', error);
    }
  };

  const handleShowModal = () => setShowModal(true);
  const handleCloseModal = () => setShowModal(false);

  // 페이징 로직
  const indexOfLastAdmin = currentPage * adminsPerPage;
  const indexOfFirstAdmin = indexOfLastAdmin - adminsPerPage;
  const currentAdmins = adminList.slice(indexOfFirstAdmin, indexOfLastAdmin);

  const totalPages = Math.ceil(adminList.length / adminsPerPage);

  const pageNumbers = [];
  for (let i = 1; i <= totalPages; i++) {
    pageNumbers.push(i);
  }

  return (
    <div className="container mt-5">
      <AdminModal 
        show={showModal} 
        handleClose={handleCloseModal} 
        fetchAdminList={fetchAdminList}
      />
      <Button variant="primary" onClick={handleShowModal}>
        관리자 추가
      </Button>

      <table className="table table-bordered mt-3">
        <thead>
          <tr>
            <th>ID</th>
            <th>이름</th>
            <th>전화번호</th>
          </tr>
        </thead>
        <tbody>
          {currentAdmins.map((admin) => (
            <tr key={admin.id}>
              <td>{admin.adminId}</td>
              <td>{admin.adminName}</td>
              <td>{admin.adminTel}</td>
            </tr>
          ))}
        </tbody>
      </table>
      <div className='adminadd'>
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
  );
};

export default Admin;