import React, { useEffect, useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import './Chart.css';
import { Bar } from 'react-chartjs-2';
import { Chart as ChartJS, CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend } from 'chart.js';
import axios from "axios";

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend);

const Mcount = () => {
  const [visitorCount, setVisitorCount] = useState(0);
  const [selectedYear, setSelectedYear] = useState('');
  const [selectedMonth, setSelectedMonth] = useState('');
  const [chartData, setChartData] = useState({
    labels: [],
    datasets: []
  });

  useEffect(() => {
    // 초기 로딩 시 현재 연도와 월 설정
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear().toString();
    const currentMonth = String(currentDate.getMonth() + 1).padStart(2, '0');
    
    setSelectedYear(currentYear);
    setSelectedMonth(currentMonth);
    
    // 초기 데이터 로드
    fetchVisitorCount(currentYear, currentMonth);
  }, []);

  const fetchVisitorCount = (year, month) => {
    axios.get(`http://localhost:8080/EachMonthCount?year=${year}&month=${month}`)
      .then(result => {
        console.log(result.data);
        setVisitorCount(result.data.count);

        setChartData({
          labels: [`${year}년 ${month}월`],
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
  };

  const generateYearOptions = () => {
    const currentYear = new Date().getFullYear();
    return Array.from({length: currentYear - 2023}, (_, i) => currentYear - i);
  };

  const generateMonthOptions = () => {
    return Array.from({length: 12}, (_, i) => String(i + 1).padStart(2, '0'));
  };

  const handleYearChange = (event) => {
    setSelectedYear(event.target.value);
  };

  const handleMonthChange = (event) => {
    setSelectedMonth(event.target.value);
  };

  const handleSearch = () => {
    fetchVisitorCount(selectedYear, selectedMonth);
  };

  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: '월별 방문자 통계',
      },
    },
  };

  return (
    <div className='dataCard dayuse'>
      <select value={selectedYear} onChange={handleYearChange}>
        {generateYearOptions().map(year => (
          <option key={year} value={year}>{year}년</option>
        ))}
      </select>
      <select value={selectedMonth} onChange={handleMonthChange}>
        {generateMonthOptions().map(month => (
          <option key={month} value={month}>{month}월</option>
        ))}
      </select>
      <button onClick={handleSearch}>검색</button>
      <Bar options={options} data={chartData} />
      <p className="count">{selectedYear}년 {selectedMonth}월 방문자 수: {visitorCount}</p>
    </div>
  );
}

export default Mcount;