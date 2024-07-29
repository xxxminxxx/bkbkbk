<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to BOOKBOOKBOOK</title>
    <style>
        @font-face {
            font-family: 'DungGeunMo';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
        }

        .cover-slide {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100vw;
            background-color: #87CEEB; /* 하늘색 배경 */
            font-family: 'DungGeunMo';
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            transition: opacity 1.5s ease-in-out;
        }

        .cover-text {
            font-size: 8vw;
            font-weight: bold;
            color: #FCE3C8;
            line-height: 1.2;
            text-align: center;
            margin-bottom: 20px;
            opacity: 0;
            animation: fadeIn 2.5s forwards;
            animation-delay: 1s;
        }

        .welcome-image {
            width: 30vw;
            max-width: 300px;
            height: auto;
            opacity: 0;
            transform: translateY(30px);
            animation: slideIn 2.5s forwards;
            animation-delay: 1.5s;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        #particles-js {
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: 999;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <div id="particles-js"></div>
    <div class="cover-slide" id="welcome-cover">
        <div class="cover-text">WELCOME</div>
        <img src="../../../resources/img/welcome.png" alt="Welcome" class="welcome-image">
    </div>

    <!-- 여기에 회원가입 성공 후 표시할 메인 콘텐츠를 추가하세요 -->

    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
        // Particle.js 설정
        particlesJS("particles-js", {
            "particles": {
                "number": {
                    "value": 150, // 파티클 수 증가
                    "density": {
                        "enable": true,
                        "value_area": 800
                    }
                },
                "color": {
                    "value": ["#ff0000", "#00ff00", "#0000ff"] // 다양한 색상 추가
                },
                "shape": {
                    "type": "circle",
                    "stroke": {
                        "width": 0,
                        "color": "#000000"
                    },
                    "polygon": {
                        "nb_sides": 5
                    },
                    "image": {
                        "src": "img/github.svg",
                        "width": 100,
                        "height": 100
                    }
                },
                "opacity": {
                    "value": 0.8,
                    "random": true,
                    "anim": {
                        "enable": true,
                        "speed": 1,
                        "opacity_min": 0.1,
                        "sync": false
                    }
                },
                "size": {
                    "value": 5,
                    "random": true,
                    "anim": {
                        "enable": true,
                        "speed": 10,
                        "size_min": 0.1,
                        "sync": false
                    }
                },
                "line_linked": {
                    "enable": false,
                    "distance": 150,
                    "color": "#ffffff",
                    "opacity": 0.4,
                    "width": 1
                },
                "move": {
                    "enable": true,
                    "speed": 10,
                    "direction": "none",
                    "random": false,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false,
                    "attract": {
                        "enable": false,
                        "rotateX": 600,
                        "rotateY": 1200
                    }
                }
            },
            "interactivity": {
                "detect_on": "canvas",
                "events": {
                    "onhover": {
                        "enable": true,
                        "mode": "repulse"
                    },
                    "onclick": {
                        "enable": true,
                        "mode": "push"
                    },
                    "resize": true
                },
                "modes": {
                    "grab": {
                        "distance": 400,
                        "line_linked": {
                            "opacity": 1
                        }
                    },
                    "bubble": {
                        "distance": 400,
                        "size": 40,
                        "duration": 2,
                        "opacity": 8,
                        "speed": 3
                    },
                    "repulse": {
                        "distance": 200,
                        "duration": 0.4
                    },
                    "push": {
                        "particles_nb": 4
                    },
                    "remove": {
                        "particles_nb": 2
                    }
                }
            },
            "retina_detect": true
        });

        // 환영 페이지 페이드 아웃 설정
        window.onload = function() {
            setTimeout(() => {
                const welcomeCover = document.getElementById('welcome-cover');
                if (welcomeCover) {
                    welcomeCover.style.opacity = '0';
                    setTimeout(() => {
                        welcomeCover.style.display = 'none';
                        document.body.style.overflow = 'auto'; // 스크롤을 다시 활성화
                    }, 1500);
                }
            }, 5000); // 보여주는 시간을 더 길게 설정
        };
    </script>
</body>
</html>
