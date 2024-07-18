import React from 'react';
import './Rank.css';


const LeaderboardItem = ({ rank, name, points, read, days }) => (
  <div className="leaderboard-item">
    <div className="leaderboard-item-left">
      <div className="leaderboard-item-avatar">
        {/* 여기에 캐릭터 이미지를 넣을 수 있습니다 */}
        <div className="leaderboard-item-avatar-placeholder">
        </div>
        <div className="leaderboard-item-rank">{rank}</div>
      </div>
      <span className="leaderboard-item-name">{name}</span>
    </div>
    <div className="leaderboard-item-right">
      <span className="leaderboard-item-stat">읽은권수: {read}</span>
      <span className="leaderboard-item-stat">회원 유지일수: {days}</span>
    </div>
  </div>
);

const Rank = () => {
  const data = [
    { name: '변*영', points: 15996.45, read: 997, days: 90 },
    { name: '이*윤', points: 7507.25, read: 608, days: 90 },
    { name: '조*빈', points: 7333.00, read: 521, days: 89 },
    { name: '노*경', points: 7109.85, read: 677, days: 90 },
    { name: '조*우', points: 7070.70, read: 515, days: 90 },
    { name: '*진', points: 7047.05, read: 627, days: 87 },
    { name: '이*이', points: 6932.00, read: 783, days: 80 },
  ];

  return (
    <div className="leaderboard-container">
      <h2 className="leaderboard-title">2024 상반기 영어독서왕선발대회</h2>
      <p className="leaderboard-period">대회 기간: 2024-04-01 ~ 2024-06-29</p>
      {data.map((item, index) => (
        <LeaderboardItem
          key={index}
          rank={index + 1}
          name={item.name}
          points={item.points}
          read={item.read}
          days={item.days}
        />
      ))}
    </div>
  );
};

export default Rank;