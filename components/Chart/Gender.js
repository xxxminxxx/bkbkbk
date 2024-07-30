import React, { useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import './Chart.css';
import { Bar } from 'react-chartjs-2'; // Bar 차트 컴포넌트 임포트
import ageData from '../../Data/gender.json'; // JSON 데이터 가져오기

const Gender = () => {
  // 연령대 선택 상태 관리
  const [selectedAgeGroup, setSelectedAgeGroup] = useState("20대");

  // 데이터 포맷팅
  const labels = ageData.map(data => Object.keys(data)[0].trim()); // 라벨 생성
  const values = ageData.map(data => Object.values(data)[0]); // 대출 횟수 값 가져오기

  // 선택한 연령대 남녀 대출 횟수 필터링
  const maleValue = values.find((value, index) => labels[index].includes(selectedAgeGroup) && labels[index].includes("남자"));
  const femaleValue = values.find((value, index) => labels[index].includes(selectedAgeGroup) && labels[index].includes("여자"));

  // 데이터셋 설정
  const data = {
    labels: [selectedAgeGroup], // 선택한 연령대만 사용
    datasets: [
      {
        label: '남자 대출 횟수', // 남자 데이터셋 레이블
        data: [maleValue || 0], // 남자 대출 횟수
        backgroundColor: 'rgba(75, 192, 192, 0.6)', // 남자 데이터 바 색상
        borderColor: 'rgba(75, 192, 192, 1)', // 남자 데이터 바 경계 색상
        borderWidth: 1,
      },
      {
        label: '여자 대출 횟수', // 여자 데이터셋 레이블
        data: [femaleValue || 0], // 여자 대출 횟수
        backgroundColor: 'rgba(255, 99, 132, 0.6)', // 여자 데이터 바 색상
        borderColor: 'rgba(255, 99, 132, 1)', // 여자 데이터 바 경계 색상
        borderWidth: 1,
      },
    ],
  };

  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: `${selectedAgeGroup} 남녀 대출 횟수`, // 차트 제목
      },
    },
    scales: {
      y: {
        beginAtZero: true, // y축 0부터 시작
        title: {
          display: true,
          text: '대출 횟수', // y축 제목
        },
      },
      x: {
        // x축 설정
      },
    },
  };

  // 연령대 선택 핸들러
  const handleAgeGroupChange = (event) => {
    setSelectedAgeGroup(event.target.value); // 선택된 연령대로 상태 업데이트
  };

  return (
    <div className='dataCard gender'>
      <h6 className="text">남녀 대출 횟수 통계(90일 기준)</h6>
      <select value={selectedAgeGroup} onChange={handleAgeGroupChange} className="form-select mb-3">
        <option value="20대">20대</option>
        <option value="30대">30대</option>
        <option value="40대">40대</option>
        <option value="50대">50대</option>
        <option value="60대">60대</option>
      </select>
      <Bar 
        data={data} // 데이터
        options={options} // 옵션
      />
    </div>
  );
};

export default Gender;
