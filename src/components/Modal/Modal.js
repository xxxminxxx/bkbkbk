import React from "react";
import "./Modal.css";
import person from "../../imgs/person.png";

function Modal({ setOpenModal }) {
  return (
    <div className="modalBackground">
      <div className="modalContainer">
        <div className="titleCloseBtn">
          <button
            onClick={() => {
              setOpenModal(false);
            }}
          >
            X
          </button>
        </div>
        <div className="title">
          <img className="person" src={person} alt=""/>
        </div>
        <div className="body">
        <div>
            <p>이름 : 홍길동</p>
            <p>등급 : B</p>
            <p>가입일 : 2023/07/31</p>
            <p>신고 누적 횟수 : 2회</p>
        </div>
        </div>
        <div className="footer">
        <button>수정</button>
          <button
            onClick={() => {
              setOpenModal(false);
            }}
            id="cancelBtn"
          >
            닫기
          </button>
          
        </div>
      </div>
    </div>
  );
}

export default Modal;