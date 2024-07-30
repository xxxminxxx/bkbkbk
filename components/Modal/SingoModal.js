import React from 'react';
import './SingoModal.css';

const SingoModal = ({ setOpenModal, project }) => {
  return (
    <div className='modalBackground'>
      <div className='modalContainer'>
        
        {/* Close button to exit the modal */}
        <div className='titleCloseBtn'>
          <button onClick={() => setOpenModal(false)}>X</button>
        </div>

        {/* Modal title */}
        <div className='title'>
          <h2>신고게시판</h2>
        </div>

        {/* Modal body containing the tables */}
        <div className='body'>
          <table>
            <thead>
              <tr>
                <th colSpan="2">신고 상세 정보</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  {/* Product inquiry details */}
                  <table>
                    <tbody>
                      <tr><th>게시판명</th><td>상품문의</td></tr>
                      <tr><th>작성자</th><td>{project.email}</td></tr>
                      <tr><th>날짜</th><td>{project.name}</td></tr>
                      <tr><th>제목</th><td>{project.project}</td></tr>
                      <tr><th>내용</th><td>{project.id}</td></tr>
                    </tbody>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  {/* Report details */}
                  <table>
                    <thead>
                      <tr>
                        <th colSpan="2">신고 정보</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr><th>신고자</th><td>{project.weeks}</td></tr>
                      <tr><th>신고일</th><td>{project.budget}</td></tr>
                      <tr><th>신고내용</th><td>{project.status}</td></tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        {/* Modal footer with action buttons */}
        <div className="footer">
          <button>수정</button>
          <button id="delBtn">삭제</button>
        </div>
      </div> 
    </div>
  );
};

export default SingoModal;
