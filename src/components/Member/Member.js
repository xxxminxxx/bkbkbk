import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // JavaScript 파일 import
import './Member.css';
import { useState } from "react";
import Modal from "../Modal/Modal"



const Member= () => {

    const [searchCategory, setSearchCategory] = useState('회원명'); // 초기 검색 카테고리 설정
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
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('회원명')}>회원명</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('이메일')}>이메일</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('가입일')}>가입일</button></li>
    </ul>
  </div>
          <input type="text" class="form-control" placeholder="검색어를 입력해주세요"/>
          <div class="input-group-append">
          <button class="btn btn-success" type="submit">검색</button>
      </div>
      </div>
            <table className="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>회원명</th>
                  <th>이메일</th>
                  <th>가입일</th>
                  <th>읽은 책</th>
                  <th>읽고있는 책</th>
                  <th>읽고싶은 책</th>
                  <th>등급</th>
                  <th>신고받은수</th>
                  <th>관리</th>
                  <th>탈퇴여부</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                <td>
                  <a onClick={() => setModalOpen(true)}>홍길동</a>
                  {modalOpen && <Modal setOpenModal={setModalOpen}/>}
                </td>
                  <td>admin@naver.com</td>
                  <td>2019.09.27</td>
                  <td>4</td>
                  <td>3</td>
                  <td>1</td>
                  <td>A</td>
                  <td>0</td>
                  <td>C</td>
                  <td>x</td>
                </tr>
                <tr>
                <td>한기진</td>
                  <td>ICt@edu.com</td>
                  <td>2000.09.17</td>
                  <td>5</td>
                  <td>6</td>
                  <td>2</td>
                  <td>B</td>
                  <td>0</td>
                  <td>d</td>
                  <td>x</td>
                </tr>
                <tr>
                <td>김철수</td>
                  <td>abc@edu.com</td>
                  <td>1720.09.17</td>
                  <td>5</td>
                  <td>6</td>
                  <td>2</td>
                  <td>B</td>
                  <td>0</td>
                  <td>C</td>
                  <td>x</td>
                </tr>
                <tr>
                <td>이영희</td>
                  <td>xyz@edu.com</td>
                  <td>1980.09.17</td>
                  <td>5</td>
                  <td>6</td>
                  <td>2</td>
                  <td>B</td>
                  <td>0</td>
                  <td>C</td>
                  <td>x</td>
                </tr>
                <tr>
                <td>박민수</td>
                  <td>test@edu.com</td>
                  <td>2180.09.17</td>
                  <td>5</td>
                  <td>6</td>
                  <td>2</td>
                  <td>B</td>
                  <td>0</td>
                  <td>C</td>
                  <td>x</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  

}

export default Member