import React, { useEffect, useState } from "react";
import "./RightSide.css";

const RightSide = () => {
  const [username, setUsername] = useState('');

  useEffect(() => {
    // 로컬 스토리지에서 사용자 정보 가져오기
    const adminData = localStorage.getItem('admin');
    if (adminData) {
      const admin = JSON.parse(adminData);
      setUsername(admin.adminId);
    }
  }, []);

  return (
    <div className="RightSide">
    </div>
  );
};

export default RightSide;
