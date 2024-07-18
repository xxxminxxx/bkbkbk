import React, { useState, useEffect } from "react";
import "./Sidebar.css";
import Logo from "../imgs/book_logo.png";
import { UilSignOutAlt, UilBars } from "@iconscout/react-unicons";
import { SidebarData } from "../Data/Data";
import { motion } from "framer-motion";
import { Link } from 'react-router-dom';

const Sidebar = () => {
  const [selected, setSelected] = useState(0);
  const [expanded, setExpanded] = useState(true);

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
          <div className="menuItem" onClick={() => /* 로그아웃 로직 추가 */ {}}>
            <UilSignOutAlt />나가기 
          </div>
        </div>
      </motion.div>
    </>
  );
};

export default Sidebar;
