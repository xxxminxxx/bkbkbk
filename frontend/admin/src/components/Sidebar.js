import React, { useState, useEffect } from "react";
import "./Sidebar.css";
import Logo from "../imgs/book_logo.png";
import { UilSignOutAlt, UilBars } from "@iconscout/react-unicons";
import { SidebarData } from "../Data/Data";
import { motion } from "framer-motion";
import { Link, useLocation, useNavigate } from 'react-router-dom';
import axios from 'axios';
import Swal from "sweetalert2";

const Sidebar = () => {
  const [selected, setSelected] = useState(0);
  const [expanded, setExpanded] = useState(true);
  const navigate = useNavigate();
  const location = useLocation();

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

    // 현재 경로에 따라 선택된 메뉴 항목 설정
    const currentPath = location.pathname;
    const selectedIndex = SidebarData.findIndex(item => item.path === currentPath);
    if (selectedIndex !== -1) {
      setSelected(selectedIndex);
    } else if (currentPath === '/admin/chart' || currentPath === '/admin') {
      // '/admin/chart' 또는 '/admin'일 경우 통계 메뉴 선택
      const chartIndex = SidebarData.findIndex(item => item.path === '/admin/chart');
      if (chartIndex !== -1) {
        setSelected(chartIndex);
      }
    }

    return () => {
      window.removeEventListener('resize', handleResize);
    };
  }, [location]);

  const handleLogout = async () => {
    try {
      const result = await Swal.fire({
        title: '로그아웃',
        text: "정말 로그아웃 하시겠습니까?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '예',
        cancelButtonText: '아니오'
      });

      if (result.isConfirmed) {
        const response = await axios.post('http://localhost:8080/logouted');

        if (response.data.success) {
          // 세션 스토리지에서 admin 정보 제거
          sessionStorage.removeItem('admin');

          const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
              toast.addEventListener('mouseenter', Swal.stopTimer)
              toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
          });

          Toast.fire({
            icon: 'success',
            title: '로그아웃에 성공하였습니다'
          });

          // 로그인 페이지로 리다이렉트
          window.location.reload();
        } else {
          Swal.fire({
            icon: 'error',
            title: '로그아웃 실패',
            text: response.data.message || "로그아웃에 실패했습니다"
          });
          console.log(response);
        }
      }
    } catch (e) {
      console.error('Logout error', e);
      Swal.fire({
        icon: 'error',
        title: '로그아웃 에러',
        text: '로그아웃 중 에러가 발생했습니다'
      });
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
              <Link 
                to={item.path} 
                key={index} 
                className={`menuItem ${selected === index ? "active" : ""}`}
                onClick={() => setSelected(index)}
              >
                <div>
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