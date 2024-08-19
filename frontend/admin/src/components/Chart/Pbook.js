import React, { useEffect, useState } from "react";
import { Doughnut } from 'react-chartjs-2';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import axios from 'axios';

ChartJS.register(ArcElement, Tooltip, Legend);

const Pbook = () => {
    const [levelData, setLevelData] = useState({
        labels: ['Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Level 9'],
        datasets: [{
            label: '레벨별 사용자 수',
            data: [0, 0, 0, 0, 0, 0, 0, 0, 0], // 초기 데이터
            backgroundColor: [
                'rgba(255, 99, 132, 0.6)',
                'rgba(54, 162, 235, 0.6)',
                'rgba(255, 206, 86, 0.6)',
                'rgba(75, 192, 192, 0.6)',
                'rgba(153, 102, 255, 0.6)',
                'rgba(255, 159, 64, 0.6)',
                'rgba(199, 199, 199, 0.6)',
                'rgba(83, 102, 255, 0.6)',
                'rgba(40, 159, 64, 0.6)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(199, 199, 199, 1)',
                'rgba(83, 102, 255, 1)',
                'rgba(40, 159, 64, 1)'
            ],
            borderWidth: 1,
        }],
    });

    useEffect(() => {
        axios.get('http://localhost:8080/user-levels')
            .then(result => {
                const levelCounts = result.data;
                console.log('서버에서 받은 데이터:', levelCounts);

                const levelData = Array(9).fill(0);
                levelCounts.forEach(item => {
                    if (item.level >= 1 && item.level <= 9) {
                        levelData[item.level - 1] = item.count;
                    }
                });

                console.log('Level Data:', levelData);

                setLevelData(prevData => ({
                    ...prevData,
                    datasets: [{
                        ...prevData.datasets[0],
                        data: levelData,
                    }],
                }));
            })
            .catch(error => {
                console.error('레벨 데이터를 가져오는 데 실패했습니다:', error);
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
                text: '레벨별 사용자 분포',
            },
        },
    };

    return (
        <div className="dataCard level">
            <Doughnut data={levelData} options={options} />
        </div>
    );
}

export default Pbook;