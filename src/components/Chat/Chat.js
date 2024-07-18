import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // JavaScript 파일 import
import './Chat.css';
import { useState } from "react";
import Modal from "../Modal/Modal"
import "../MainDash/MainDash.css";


const Chat= () => {

    const [searchCategory, setSearchCategory] = useState('채탕방명'); // 초기 검색 카테고리 설정
    //항목이 클릭되었을때 해당 선택된 항목으로 대체
    const handleCategoryClick = (searchCategory) => {
      setSearchCategory(searchCategory)
    }

    const [modalOpen, setModalOpen] = useState(false);

    
    return (
        
      <div className="MainDash container">
        <div className="row">
          <div className="col">
          <div class="input-group mb-3">
          <div class="dropdown">
    <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
      {searchCategory}
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('채탕방명')}>채탕방명</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('방장')}>방장</button></li>
    </ul>
  </div>
          <input type="text" class="form-control" placeholder="검색어를 입력해주세요"/>
          <div class="input-group-append">
          <button class="btn btn-success" type="submit">Go</button>
      </div>
      </div>
            <table className="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>채팅명</th>
                  <th>방장</th>
                  <th>현재 인원 수</th>
                  <th>최대 인원 수</th>
                  <th>채팅 생성일</th>
                  <th>채팅 종료일</th>
                  <th>신고여부</th>
                  <th>상태</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>채팅방1</td>
                  <td>방장1</td>
                  <td>3</td>
                  <td>10</td>
                  <td>2024-06-24</td>
                  <td>2024-06-30</td>
                  <td>o</td>
                  <td>채팅방정지</td>
                </tr>
                <tr>
                  <td>채팅방2</td>
                  <td>방장2</td>
                  <td>5</td>
                  <td>30</td>
                  <td>2023-06-24</td>
                  <td>2024-06-30</td>
                  <td>o</td>
                  <td>채팅방정지</td>
                </tr>
                <tr>
                <td>채팅방3</td>
                  <td>방장2</td>
                  <td>5</td>
                  <td>30</td>
                  <td>2023-06-24</td>
                  <td>2024-06-30</td>
                  <td>o</td>
                  <td>채팅방정지</td>
                </tr>
                <tr>
                <td>채팅방4</td>
                  <td>방장2</td>
                  <td>5</td>
                  <td>30</td>
                  <td>2023-06-24</td>
                  <td>2024-06-30</td>
                  <td>o</td>
                  <td>채팅방정지</td>
                </tr>
                <tr>
                <td>채팅방5</td>
                  <td>방장2</td>
                  <td>5</td>
                  <td>30</td>
                  <td>2023-06-24</td>
                  <td>2024-06-30</td>
                  <td>o</td>
                  <td>채팅방정지</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  

}

export default Chat