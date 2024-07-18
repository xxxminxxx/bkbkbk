/* eslint-disable no-unused-vars */
import './App.css'
import MainDash from './components/MainDash/MainDash';
import RightSide from './components/RigtSide/RightSide';
import Sidebar from './components/Sidebar';
import { BrowserRouter,Route,Navigate } from 'react-router-dom';
import { Routes } from 'react-router-dom';
import Book from './components/Book/Book'
import Member from './components/Member/Member';
import Chat from './components/Chat/Chat';
import Login from './components/Login';
import Chart from './components/Chart/Chart';
import Member2 from './components/Member/Member2';
import Rank from './components/Rank/Rank';
import { useState } from 'react';

/*
Dom: BrowserRouter,Route,Routes를 사용하여 동적으로 웹페이지를 변경처리
path:경로 주소 규칙 /admin/해당 페이지 js파일 이름
컴포넌트 사용 예를들어 export default exam을 내보내면 다른 파일에서 import exam from './해당경로'해서  <exam/>
이런식으로 작성하면 exam파일을 끌어다 쓸수 있음

*/ 


function App() {
  const [isLogin, setIsLoggedIn] = useState(false); // 로그인 상태를 관리하는 state

  return (
    <div className="App">
      <div className="AppGlass">
        <BrowserRouter>
          {isLogin ? (
            <>
              <Sidebar />
              <Routes>
                <Route path='/admin/chat' element={<Chat />} />
                <Route path='/admin/member' element={<Member />} />
                <Route path='/admin/book' element={<Book />} />
                <Route path='/admin/chart' element={<Chart />} />
                <Route path='/admin/rank' element={<Rank />} />
                {/* 필요한 다른 경로들을 추가하세요 */}
                <Route path="*" element={<Navigate  to="/admin/chat" replace />} />
              </Routes>
              <RightSide />
              </>
          ) : (
            <Routes>
              <Route path="/login" element={<Login setIsLoggedIn={setIsLoggedIn} />} />
              <Route path="*" element={<Navigate  to="/login" replace />} />
            </Routes>
          )}
        </BrowserRouter>
      </div>
    </div>
  );
}

export default App;
