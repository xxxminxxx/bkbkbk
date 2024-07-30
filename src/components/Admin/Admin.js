// src/components/Admin.js
import React, { useState, useEffect } from 'react';
import './Admin.css'; // CSS 파일을 임포트합니다.
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css'; // Bootstrap CSS 임포트

const Admin = () => {
  // 관리자의 정보 저장 변수
  const [id, setId] = useState('');
  const [name, setUserName] = useState('');
  const [pass, setUserPass] = useState('');
  const [tel, setTel] = useState('');
  const [adminList, setAdminList] = useState([]); // 관리자 목록 상태

  // 관리자가 로드될 때 데이터 가져오기
  useEffect(() => {
    fetchAdminList();
  }, []);

  // 관리자 목록을 가져오는 함수
  const fetchAdminList = async () => {
    try {
      const response = await axios.get('http://localhost:8080/getAdmins'); 
      console.log(response.data)
      setAdminList(response.data); // 응답 데이터로 상태 업데이트
    } catch (error) {
      console.error('Error fetching admin list:', error);
    }
  };

  // 관리자를 추가하는 함수
  const saveHdlr = async () => {
    try {
      const path = `http://localhost:8080/insert?id=${id}&name=${name}&pass=${pass}&tel=${tel}`;
      const response = await axios.put(path);

      if (response.status === 200) {
        alert('관리자가 성공적으로 추가되었습니다');
        fetchAdminList(); // 관리자 추가 후 목록 갱신
        resetForm(); // 폼 초기화
      } else {
        alert('관리자 추가에 실패했습니다.');
      }
    } catch (error) {
      console.error('Error updating user:', error);
    }
  };

  // 폼 초기화 함수
  const resetForm = () => {
    setId('');
    setUserName('');
    setUserPass('');
    setTel('');
  };

  return (
    <div className="container mt-5">
      <h2>관리자 등록</h2>
      <form onSubmit={(e) => { e.preventDefault(); saveHdlr(); }}>
        <div className="form-group">
          <label htmlFor="adminId">ID</label>
          <input
            type="text"
            className="form-control"
            id="adminId"
            value={id}
            onChange={(e) => setId(e.target.value)}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="adminName">이름</label>
          <input
            type="text"
            className="form-control"
            id="adminName"
            value={name}
            onChange={(e) => setUserName(e.target.value)}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="adminPass">비밀번호</label>
          <input
            type="password"
            className="form-control"
            id="adminPass"
            value={pass}
            onChange={(e) => setUserPass(e.target.value)}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="adminTel">전화번호</label>
          <input
            type="text"
            className="form-control"
            id="adminTel"
            value={tel}
            onChange={(e) => setTel(e.target.value)}
            required
          />
        </div>
        <button type="submit" className="btn btn-primary">관리자 추가</button>
      </form>

      <h2 className="mt-5">등록된 관리자 목록</h2>
      <table className="table table-bordered mt-3">
        <thead>
          <tr>
            <th>ID</th>
            <th>이름</th>
            <th>전화번호</th>
          </tr>
        </thead>
        <tbody>
          {adminList.map((admin) => (
            <tr key={admin.id}>
              <td>{admin.adminId}</td>
              <td>{admin.adminName}</td>
              <td>{admin.adminTel}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Admin;
