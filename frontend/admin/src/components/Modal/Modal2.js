import React, { useState } from "react";
import "./Modal.css";
import person from "../../imgs/1.png";
import one from "../../imgs/2.png";
import two from "../../imgs/3.png";
import three from "../../imgs/4.png";
import four from "../../imgs/5.png";
import five from "../../imgs/6.png";
import six from "../../imgs/7.png";
import seven from "../../imgs/8.png";
import eight from "../../imgs/person.png";
import nine from "../../imgs/person.png";
import axios from "axios";


function Modal2({ setOpenModal, user }) {

  //사용자 레벨에 따른 이미지 선택
  const getLevelImage = (level) => {
    switch(level){
      case 1:
        return one;
      case 2:
        return two;
      case 3:
        return three;
      case 4:
        return four;
      case 5:
        return five;
      case 6:
        return six;
      case 7:
        return seven;
      case 8:
        return eight;
      case 9:
        return nine;
      default:
        return person;
    }
  };

  //사용자 입력값 저장할 변수 선언
  const[userId,setUserId] =useState(user.userId);          //id hiiden값
  const[userName,setUserName] = useState(user.userName)    //이름
  const[userTel,setUserTel] = useState(user.userTel)       //전화번호
  const[userLevel,setUserLevel] = useState(user.userLevel) //등급

  const updateHdlr = async function() {
    try {
      const temppath = `http://localhost:8080/update?userId=${userId}&userName=${userName}&userTel=${userTel}&userLevel=${userLevel}`;
      
      const response = await axios.post(temppath);
      
      if (response.status === 200) {
        alert('사용자 정보가 성공적으로 업데이트되었습니다.');
        setOpenModal(false);
        // 필요하다면 여기서 부모 컴포넌트의 상태를 업데이트하는 함수를 호출할 수 있습니다.
        window.location.reload(); // 페이지 새로고침
      } else {
        alert('사용자 정보 업데이트에 실패했습니다.');
      }
    } catch (error) {
      console.error('Error updating user:', error);
      alert('사용자 정보 업데이트 중 오류가 발생했습니다.');
    }
  };

  const deleteHdlr = async function() {
    try{
      const temppath = `http://localhost:8080/delete?userId=${userId}`;

      const response = await axios.delete(temppath);

      if(response.status === 200){
        alert('사용자 정보가 성공적으로 삭제되었습니다.');
        setOpenModal(false);
        window.location.reload();//페이지 새로고침
      }else{
        alert('사용자 정보 삭제에 실패했습니다');
      }
    }catch(error){
      console.error('Error delete user',error);
      alert('사용자 정보 삭제중 오류가 발생했습니다.');
    }
  }


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
          <img className="person" src={getLevelImage(user.userLevel)} alt={`Level ${user.userLevel}`}/>
        </div>
        <div className="body">
          <form>
            <input 
            type="hidden"
            value={userId}
            name="userId"
            className="form-control"
            onChange={(e)=>setUserId(e.target.value)}
            />
            <div className="form-group">
              <label>이름</label>
              <input
                type="text"
                value={userName}
                name="userName"
                className="form-control"
                onChange={(e)=>setUserName(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label>전화번호</label>
              <input
                type="text"
                value={userTel}
                name="userTel"
                className="form-control"
                onChange={(e)=>setUserTel(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label>등급</label>
              <input
                type="text"
                value={userLevel}
                name="title"
                className="form-control"
                onChange={(e)=>setUserLevel(e.target.value)}
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

export default Modal2;
