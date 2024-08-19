import React, { useState } from 'react';
import axios from 'axios';
import './AdminModal.css';
import Swal from 'sweetalert2';

const AdminModal = ({ show, handleClose, fetchAdminList }) => {
  const [id, setId] = useState('');
  const [name, setName] = useState('');
  const [pass, setPass] = useState('');
  const [tel, setTel] = useState('');

  const saveHandler = async (e) => {
    e.preventDefault();
    try {
      const path = `http://localhost:8080/insert?id=${id}&name=${name}&pass=${pass}&tel=${tel}`;
      const response = await axios.put(path);
      
      if (response.status === 200) {
        Swal.fire({
          title: '성공!',
          text: '관리자가 성공적으로 추가되었습니다',
          icon: 'success',
          confirmButtonText: '확인'
        });
        fetchAdminList();
        handleClose();
        resetForm();
      } else {
        Swal.fire({
          title: '실패!',
          text: '관리자 추가에 실패했습니다.',
          icon: 'error',
          confirmButtonText: '확인'
        });
      }
    } catch (error) {
      console.error('Error adding admin:', error);
      Swal.fire({
        title: '오류!',
        text: '관리자 추가 중 오류가 발생했습니다.',
        icon: 'error',
        confirmButtonText: '확인'
      });
    }
  };

  const resetForm = () => {
    setId('');
    setName('');
    setPass('');
    setTel('');
  };

  if (!show) {
    return null;
  }

  return (
    <div className="modalBackground">
      <div className="modalContainer">
        <div className="titleCloseBtn">
          <button onClick={handleClose}>X</button>
        </div>
        <div className="title">
          <h2>관리자 추가</h2>
        </div>
        <div className="body">
          <form onSubmit={saveHandler}>
            <div className="form-group">
              <label htmlFor="id">ID</label>
              <input
                id="id"
                type="text"
                value={id}
                onChange={(e) => setId(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="name">이름</label>
              <input
                id="name"
                type="text"
                value={name}
                onChange={(e) => setName(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="pass">비밀번호</label>
              <input
                id="pass"
                type="password"
                value={pass}
                onChange={(e) => setPass(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="tel">전화번호</label>
              <input
                id="tel"
                type="text"
                value={tel}
                onChange={(e) => setTel(e.target.value)}
                required
              />
            </div>
            <div className="footer">
              <button type="submit">관리자 추가</button>
              <button onClick={handleClose} id="cancelBtn">취소</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};

export default AdminModal;