import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import './Chart.css';
import { Bar } from 'react-chartjs-2'; // Bar 차트 컴포넌트 임포트
import 'chart.js/auto';

import ageData from '../../Data/age_sums.json'; // JSON 데이터 가져오기

const RentCount = () => {
  // 데이터 포맷팅
  const labels = ageData.map(data => data.label);
  const values = ageData.map(data => data.value);

  const data = {
    labels: labels, // 레이블
    datasets: [
      {
        label: '대출 횟수', // 데이터셋의 레이블
        data: values, // JSON에서 가져온 값
        backgroundColor: 'rgba(75, 192, 192, 0.6)', // 데이터 바 색상
        borderColor: 'rgba(75, 192, 192, 1)', // 데이터 바 경계 색상
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
        text: '연령대별 대출 횟수', // 차트 제목
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
    },
  };

  return (
    <div className='dataCard dayuse'>
      <h6 className="text">연령대별 인기도서 대출량 통계(90일 기준)</h6>
      <Bar 
        data={data} // 데이터
        options={options} // 옵션
      />
    </div>
  );
};

export default RentCount;
