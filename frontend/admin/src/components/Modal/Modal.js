import React, { useState } from "react";
import "./Modal.css";
import { useNavigate } from "react-router-dom";
import person from "../../imgs/코기1.png";
import one from "../../imgs/코기1.png";
import two from "../../imgs/코기2.png";
import three from "../../imgs/코기3.png";
import four from "../../imgs/코기4.png";
import five from "../../imgs/코기5.png";
import six from "../../imgs/코기6.png";
import seven from "../../imgs/코기7.png";
import eight from "../../imgs/코기8.png";
import nine from "../../imgs/코기9.png";
import axios from "axios";
import Swal from "sweetalert2";

function Modal({ setOpenModal, user, refreshUserList}) {

  // 사용자 레벨에 따른 이미지 선택
  const getLevelImage = (level) => {
    switch(level){
      case 1: return one;
      case 2: return two;
      case 3: return three;
      case 4: return four;
      case 5: return five;
      case 6: return six;
      case 7: return seven;
      case 8: return eight;
      case 9: return nine;
      default: return person;
    }
  };

  // 사용자 입력값 저장할 변수 선언
  const [userId, setUserId] = useState(user.userId);
  const [userName, setUserName] = useState(user.userName);
  const [userTel, setUserTel] = useState(user.userTel);
  const [userLevel, setUserLevel] = useState(user.userLevel);
  const navigate = useNavigate();

  const updateHdlr = async function() {
    try {
      const temppath = `http://localhost:8080/update?userId=${userId}&userName=${userName}&userTel=${userTel}&userLevel=${userLevel}`;
      
      const response = await axios.post(temppath);
      
      if (response.status === 200) {
        Swal.fire({
          title: "성공!",
          text: "사용자 정보가 성공적으로 업데이트되었습니다.",
          icon: "success"
        });
        setOpenModal(false);
        refreshUserList();
      } else {
        Swal.fire({
          title: "오류!",
          text: "사용자 정보 업데이트에 실패했습니다.",
          icon: "error"
        });
      }
    } catch (error) {
      console.error('Error updating user:', error);
      Swal.fire({
        title: "오류!",
        text: "사용자 정보 업데이트 중 오류가 발생했습니다.",
        icon: "error"
      });
    }
  };

  const deleteHdlr = async function() {
    try {
      const result = await Swal.fire({
        title: '정말로 삭제하시겠습니까?',
        text: "이 작업은 되돌릴 수 없습니다!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '네, 삭제합니다!',
        cancelButtonText: '취소'
      });

      if (result.isConfirmed) {
        const temppath = `http://localhost:8080/delete?userId=${userId}`;
        const response = await axios.delete(temppath);

        if(response.status === 200){
          Swal.fire(
            '삭제됨!',
            '사용자 정보가 성공적으로 삭제되었습니다.',
            'success'
          );
          setOpenModal(false);
          refreshUserList();
        } else {
          Swal.fire({
            title: "오류!",
            text: "사용자 정보 삭제에 실패했습니다",
            icon: "error"
          });
        }
      }
    } catch(error) {
      console.error('Error delete user', error);
      Swal.fire({
        title: "오류!",
        text: "사용자 정보 삭제 중 오류가 발생했습니다.",
        icon: "error"
      });
    }
  }

  return (
    <div className="modalBackground">
      <div className="modalContainer">
        <div className="titleCloseBtn">
          <button onClick={() => setOpenModal(false)}>X</button>
        </div>
        <div className="title">
          <img className="person" src={getLevelImage(user.userLevel)} alt={`Level ${user.userLevel}`}/>
        </div>
        <div className="body">
          <form>
            <input 
              type="hidden"
              value={userId}
              name="userId"
              className="form-control"
              onChange={(e) => setUserId(e.target.value)}
            />
            <div className="form-group">
              <label>이름</label>
              <input
                type="text"
                value={userName}
                name="userName"
                className="form-control"
                onChange={(e) => setUserName(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label>전화번호</label>
              <input
                type="text"
                value={userTel}
                name="userTel"
                className="form-control"
                onChange={(e) => setUserTel(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label>등급</label>
              <input
                type="text"
                value={userLevel}
                name="title"
                className="form-control"
                onChange={(e) => setUserLevel(e.target.value)}
              />
            </div>
            <br/>
            <div className="form-group">
              <p>가입일 : {user.joinedDate}</p>
            </div>
            <div className="form-group">
              <p>신고누적횟수 : {user.reported}회</p>
            </div>
          </form>
        </div>
        <div className="footer">
          <button onClick={updateHdlr}>수정</button>
          <button onClick={deleteHdlr} id="delBtn">삭제</button>
        </div>
      </div>
    </div>
  );
}

export default Modal;