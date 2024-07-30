import React, { useEffect, useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import './Chart.css';
import { Line } from 'react-chartjs-2';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend } from 'chart.js';
import axios from "axios";

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

const RegistChart = () => {
  const [chartData, setChartData] = useState({
    labels: [],
    datasets: []
  });

  useEffect(() => {
    axios.get('http://localhost:8080/users')
      .then(result => {
        const users = result.data;
        console.log('서버에서 받은 데이터2',users)
        
        // 월별 가입자 수 계산
        const monthlyCounts = Array(12).fill(0); // 1월부터 12월까지의 배열 초기화
        console.log('카운트된 값',monthlyCounts)

        users.forEach(user => {
          const joinDate = new Date(user.joinedDate);
          const month = joinDate.getMonth(); // 0부터 11까지의 값
          if (month >= 0 && month < 12) { // 유효한 월인지 확인
            monthlyCounts[month]++;
          }
        });

        console.log(monthlyCounts); // 배열 값 확인
        
        const monthNames = [
          '1월', '2월', '3월', '4월', '5월', '6월',
          '7월', '8월', '9월', '10월', '11월', '12월'
        ];

        setChartData({
          labels: monthNames,
          datasets: [{
            label: '월별 가입자 수',
            data: monthlyCounts,
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
          }]
        });
      })
      .catch(error => {
        console.error('가입자 데이터를 가져오는 데 실패했습니다:', error);
      });
  }, []);

  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: '월별 가입자 통계',
      },
    },
    scales: {
      y: {
        beginAtZero: true,
        title: {
          display: true,
          text: '가입자 수'
        }
      }
    }
  };

  return (
    <div className='dataCard dayuse'>
      <Line options={options} data={chartData}/>
    </div>
  );
}

export default RegistChart;
