import React, { useEffect, useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import './Chart.css';
import { Bar } from 'react-chartjs-2';
import { Chart as ChartJS, CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend } from 'chart.js';
import axios from "axios";

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend);

const MemberChart = () => {
  const [visitorCount, setVisitorCount] = useState(0);
  const [chartData, setChartData] = useState({
    labels: [],
    datasets: []
  });

  useEffect(() => {
    axios.get('http://localhost:8080/visitor-count')
      .then(result => {
        console.log(result.data);
        setVisitorCount(result.data.count);
        
        // 차트 데이터 설정
        setChartData({
          labels: ['오늘의 방문자 수'],
          datasets: [
            {
              label: '방문자 수',
              data: [result.data.count],
              backgroundColor: 'rgba(75, 192, 192, 0.6)',
              borderColor: 'rgba(75, 192, 192, 1)',
              borderWidth: 1,
            }
          ]
        });
      })
      .catch(error => {
        console.error('방문자 수를 가져오는 데 실패했습니다:', error);
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
        text: '일일 이용자 통계',
      },
    },
    scales: {
      y: {
        beginAtZero: true,
        title: {
          display: true,
          text: '방문자 수'
        }
      }
    }
  };

  return (
    <div className='dataCard dayuse'>
        <Bar options={options} data={chartData} />
      <p className="count">오늘의 방문자 수: {visitorCount}</p>
    </div>
  );
}

export default MemberChart;