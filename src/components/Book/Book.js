import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // JavaScript 파일 import
import './Book.css';
import { useState } from "react";
import Modal from "../Modal/Modal"
import "../MainDash/MainDash.css";


const Book= () => {

    const [searchCategory, setSearchCategory] = useState('도서명'); // 초기 검색 카테고리 설정
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
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('도서명')}>도서명</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('저자')}>저자</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('출판사')}>출판사</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('장르')}>장르</button></li>
      <li><button class="dropdown-item" type="button" onClick={() => handleCategoryClick('관심사')}>관심사</button></li>
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
                  <th>도서명</th>
                  <th>isbn</th>
                  <th>저자</th>
                  <th>출판사</th>
                  <th>출판일</th>
                  <th>페이지</th>

                </tr>
              </thead>
              <tbody>
                <tr>
                <td>
                  <a onClick={() => setModalOpen(true)}>피어나다 여섯번째</a>
                  {modalOpen && <Modal setOpenModal={setModalOpen}/>}
                </td>
                  <td>8809447061023</td>
                  <td>최향미 (지은이)</td>
                  <td>시원북스</td>
                  <td>2024-06-24</td>
                  <td>256</td>
                </tr>
                <tr>
                <td>시사매거진 2024.7</td>
                  <td>9771975403509</td>
                  <td>베이커리 편집부 (지은이)</td>
                  <td>알에이치코리아(RHK)</td>
                  <td>2024-06-30</td>
                  <td>68</td>
                </tr>
                <tr>
                <td>해양과 문학 2024 제28호</td>
                  <td>9771975435005</td>
                  <td>두산매거진 편집부 (지은이)</td>
                  <td>(주)YBM(와이비엠)</td>
                  <td>2024-07-09</td>
                  <td>134</td>
                </tr>
                <tr>
                <td>기도수첩 2024.8 (한글판)</td>
                  <td>9771975705009</td>
                  <td>도란 (지은이)</td>
                  <td>중앙books(중앙북스)</td>
                  <td>2024-06-28</td>
                  <td>52</td>
                </tr>
                <tr>
                <td>컴퓨터 월드 2024.7</td>
                  <td>9771976175009</td>
                  <td>영진정보연구소 (지은이)</td>
                  <td>영진.com(영진닷컴)</td>
                  <td>2024-07-10</td>
                  <td>48</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  

}

export default Book