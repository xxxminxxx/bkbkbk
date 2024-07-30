import React, { useState, useEffect } from "react";
import "./Sidebar.css";
import Logo from "../imgs/book_logo.png";
import { UilSignOutAlt, UilBars } from "@iconscout/react-unicons";
import { SidebarData } from "../Data/Data";
import { motion } from "framer-motion";
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';

const Sidebar = () => {
  const [selected, setSelected] = useState(0);
  const [expanded, setExpanded] = useState(true);
  const navigate = useNavigate();
  const sidebarVariants = {
    true: {
      left: '0'
    },
    false: {
      left: '-60%'
    }
  };

  useEffect(() => {
    const handleResize = () => {
      if (window.innerWidth > 768) {
        setExpanded(true);
      }
    };

    window.addEventListener('resize', handleResize);

    return () => {
      window.removeEventListener('resize', handleResize);
    };
  }, []);

  const handleLogout = async () => {
    try {
        const response = await axios.post('http://localhost:8080/logouted');

        if (response.data.success) {
            
            // 세션 스토리지에서 admin 정보 제거
            sessionStorage.removeItem('admin');
            
            // 로그인 페이지로 리다이렉트
            window.location.reload();
            
            alert('로그아웃에 성공하였습니다');
        } else {
            alert(response.data.message || "로그아웃에 실패했습니다");
            console.log(response);
        }
    } catch (e) {
        console.error('Logout error', e);
        alert('로그아웃 중 에러 발생');
    }
};


  return (
    <>
      <div className="bars" style={expanded ? { left: '60%' } : { left: '5%' }} onClick={() => setExpanded(!expanded)}>
        <UilBars />
      </div>
      <motion.div className='sidebar'
        variants={sidebarVariants}
        animate={window.innerWidth <= 768 ? `${expanded}` : ''}
      >
        {/* logo */}
        <div className="logo">
          <img src={Logo} alt="logo" />
          <span className="my-table">북북북</span>
        </div>

        <div className="menu">
          {SidebarData.map((item, index) => {
            return (
              <Link to={item.path} key={index} className="menuItem" onClick={() => setSelected(index)}>
                <div className={selected === index ? "active" : ""}>
                {typeof item.icon === 'string' ? (
                    <img src={item.icon} alt={item.heading} className="sidebar-icon" />
                  ) : (
                    <item.icon />
                  )}
                  <span>{item.heading}</span>
                </div>
              </Link>
            );
          })}
          {/* signoutIcon */}
          <div className="menuItem exit" onClick={handleLogout}>
            <UilSignOutAlt />로그아웃 
          </div>
        </div>
      </motion.div>
    </>
  );
};

export default Sidebar;
