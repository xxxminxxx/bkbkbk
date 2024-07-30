import React from "react";
import './Chat2.css';

const Chat2= ()=> {
    const tableData = Array(10).fill({
        title: '제목 입력',
        category: '카테고리명',
        teacher: '강사 제임스',
        lesson: '강의명',
        enrolled: '16',
        price: '$25.00',
        status: '활성'
      });

    return(
        <div className="container2">
        <div className="header2">
          <h2>테이블</h2>
          <div className="search-bar2">
            <input type="text" placeholder="여기에서 검색..." />
            <button>Add New</button>
          </div>
        </div>
        <table>
          <thead>
            <tr>
              <th>제목</th>
              <th>카테고리</th>
              <th>강사</th>
              <th>강의</th>
              <th>등록일</th>
              <th>가격</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody>
            {tableData.map((item, index) => (
              <tr key={index}>
                <td>{item.title}</td>
                <td>{item.category}</td>
                <td>{item.teacher}</td>
                <td>{item.lesson}</td>
                <td>{item.enrolled}</td>
                <td>{item.price}</td>
                <td><span className="status">{item.status}</span></td>
              </tr>
            ))}
          </tbody>
        </table>
        <div className="pagination2">
          <button>&lt;</button>
          <button>1</button>
          <button>2</button>
          <button>&gt;</button>
        </div>
      </div>
    );
}

export default Chat2