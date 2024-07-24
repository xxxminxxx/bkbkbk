import React from "react";
import "./BookModal.css";

function BookModal({ setOpenModal, userData, onUpdate, onDelete }) {
  return (
    <div className="modalBackground">
      <div className="modalContainer">
        <div className="modalHeader">
          <button
            className="closeButton"
            onClick={() => setOpenModal(false)}
          >
            X
          </button>
        </div>
        <div className="modalContent">
          <div className="userIcon">
            {/* 사용자 아이콘 이미지 */}
            <img src="/path/to/user-icon.png" alt="User" />
          </div>
          <div className="userInfo">
            <div className="infoField">
              <label>이름</label>
              <input type="text" placeholder="내용을 입력해주세요" value={userData.name} />
            </div>
            <div className="infoField">
              <label>전화번호</label>
              <input type="text" placeholder="전화번호 입력" value={userData.phone} />
            </div>
            <div className="infoField">
              <label>등급</label>
              <input type="text" placeholder="전화번호 입력" value={userData.grade} />
            </div>
            <div className="infoField">
              <label>가입일:</label>
              <span>{userData.joinDate}</span>
            </div>
            <div className="infoField">
              <label>신고 누적횟수</label>
              <span>{userData.reportCount}</span>
            </div>
          </div>
        </div>
        <div className="modalFooter">
          <button className="updateButton" onClick={onUpdate}>수정</button>
          <button className="deleteButton" onClick={onDelete}>삭제</button>
        </div>
      </div>
    </div>
  );
}

export default BookModal;