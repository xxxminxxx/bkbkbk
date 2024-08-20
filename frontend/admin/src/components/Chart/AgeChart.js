import React, { useEffect, useState } from "react";
import { Doughnut } from 'react-chartjs-2';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import axios from 'axios';

// ChartJS에 필요한 요소 등록
ChartJS.register(ArcElement, Tooltip, Legend);

const AgeChart = () => {
    const [ageData, setAgeData] = useState({
        labels: ['10대', '20대', '30대', '40대', '50대 이상'],
        datasets: [{
            label: '연령대별 가입자수',
            data: [0, 0, 0, 0, 0], // 초기 데이터
            backgroundColor: [
                'rgba(255, 99, 132, 0.6)', // 10대 색상
                'rgba(54, 162, 235, 0.6)',  // 20대 색상
                'rgba(255, 205, 86, 0.6)',   // 30대 색상
                'rgba(75, 192, 192, 0.6)',   // 40대 색상
                'rgba(153, 102, 255, 0.6)'   // 50대 이상 색상
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 205, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1,
        }],
    });

    useEffect(() => {
        axios.get('http://localhost:8080/birthday')
            .then(result => {
                const currentYear = new Date().getFullYear();
                const ageGroups = [0, 0, 0, 0, 0]; // 10대, 20대, 30대, 40대, 50대 이상
                
                const birthdayData = result.data;
                console.log('서버에서 받은 데이터:', birthdayData);

                // 생년월일을 기반으로 연령대 계산
                birthdayData.forEach(person => {
                    const birthYear = parseInt(person.birthDate.substring(0, 4));
                    const age = currentYear - birthYear;

                    // 10세 이상 모두 포함
                    if (age < 20) ageGroups[0]++; // 10대
                    else if (age < 30) ageGroups[1]++; // 20대
                    else if (age < 40) ageGroups[2]++; // 30대
                    else if (age < 50) ageGroups[3]++; // 40대
                    else ageGroups[4]++; // 50대 이상
                });

                console.log('Age Groups:', ageGroups); // 업데이트된 ageGroups 확인

                // 업데이트된 ageGroups를 차트 데이터에 설정
                setAgeData(prevData => ({
                    ...prevData,
                    datasets: [{
                        ...prevData.datasets[0],
                        data: ageGroups,
                    }],
                }));
            })
            .catch(error => {
                console.error('생일 데이터를 가져오는 데 실패했습니다:', error);
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
                text: '가입자수 연령통계',
            },
        },
    };

    return (
        <div className="dataCard age">
            <Doughnut data={ageData} options={options} />
        </div>
    );
}

export default AgeChart;
