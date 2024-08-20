import Logo from "../imgs/bkbkbklogo.png";
import { useNavigate } from "react-router-dom";
import React, { useEffect, useState } from 'react'
import './Login.css'
import axios from "axios";
import Swal from "sweetalert2";

export default function Login({setIsLoggedIn}) {
    const navigate = useNavigate();

    const [email, setEmail] = useState('');
    const [pw, setPw] = useState('');
    const [emailValid, setEmailValid] = useState(false);
    const [pwValid, setPwValid] = useState(false);
    const [notAllow, setNotAllow] = useState(true);

    useEffect(() => {
      if(emailValid && pwValid) {
        setNotAllow(false);
        return;
      }
      setNotAllow(true);
    }, [emailValid, pwValid]);

    const handleEmail = (e) => {
      setEmail(e.target.value);
      const regex =
        /^(([^<>()\[\].,;:\s@"]+(\.[^<>()\[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
      if (regex.test(e.target.value)) {
        setEmailValid(true);
      } else {
        setEmailValid(false);
      }
    };
    const handlePw = (e) => {
      setPw(e.target.value);
      const regex =
        /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
      if (regex.test(e.target.value)) {
        setPwValid(true);
      } else {
        setPwValid(false);
      }
    };
    const onClickConfirmButton = async () => {
        try{
          const response = await axios.post('http://localhost:8080/login',{
            adminId: email,
            adminPass: pw
          });

          if (response.data.success){
            setIsLoggedIn(true);
            sessionStorage.setItem('admin',JSON.stringify(response.data.admin));
            
            // Sweetalert2를 사용한 성공 메시지
            const Toast = Swal.mixin({
              toast: true,
              position: "top",
              showConfirmButton: false,
              timer: 3000,
              timerProgressBar: true,
              didOpen: (toast) => {
                toast.onmouseenter = Swal.stopTimer;
                toast.onmouseleave = Swal.resumeTimer;
              }
            });
            Toast.fire({
              icon: "success",
              title: "로그인에 성공하였습니다"
            });

            navigate('/admin/chat');
          }else{
            Swal.fire({
              icon: 'error',
              title: '로그인 실패',
              text: response.data.message || "로그인에 실패했습니다"
            });
            console.log(response)
          }
        }catch(e){
          console.error('Login error',e);
          Swal.fire({
            icon: 'error',
            title: '로그인 에러',
            text: '로그인 중 에러가 발생했습니다'
          });
        }
    }

    return (
      <div className="page">
          <img src={Logo} style={{marginRight:'80px'}}/>
         <div className="contentWrap">
           <div className="inputTitle">이메일 주소</div>
          <div
            className="inputWrap"
          >
            <input
              className="input"
              type="text"
              placeholder="test@gmail.com"
              value={email}
              onChange={handleEmail}
            />
          </div>
          <div className="errorMessageWrap">
            {!emailValid && email.length > 0 && (
              <div>올바른 이메일을 입력해주세요.</div>
            )}
          </div>

           <div style={{ marginTop: "26px" }} className="inputTitle">
            비밀번호
          </div>
          <div className="inputWrap">
            <input
              className="input"
              type="password"
              placeholder="영문, 숫자, 특수문자 포함 8자 이상"
              value={pw}
              onChange={handlePw}
            />
          </div>
          <div className="errorMessageWrap">
            {!pwValid && pw.length > 0 && (
              <div>영문, 숫자, 특수문자 포함 8자 이상 입력해주세요.</div>
            )}
          </div>
        </div>

         <div>
          <button onClick={onClickConfirmButton} disabled={notAllow} className="bottomButton">
            로그인
          </button>
        </div>
      </div>
    );
}