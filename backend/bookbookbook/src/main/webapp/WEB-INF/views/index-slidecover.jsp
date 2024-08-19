<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Slide Cover</title>
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
            background-color: #D85D47;
            font-family: 'DungGeunMo';
			position: fixed; /* 화면을 덮도록 고정 */
			top: 0;
			left: 0;
			z-index: 1000;
			transition: opacity 0.7s ease-out;
        }

        .cover-text {
            font-size: 10vw;
            font-weight: bold;
            color: #FCE3C8;
            line-height: 1.2;
            text-align: center;
        }

        .text-line {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #smiley {
            width: 1em;
            height: 1em;
            display: inline-block;
            vertical-align: middle;
        }

        #smiley img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }
    </style>
</head>
<body>
    <div class="cover-slide">
        <div class="cover-text">
            <div class="text-line">BOOK</div>
            <div class="text-line">BOOK</div>
            <div class="text-line">BO<span id="smiley"></span>K</div>
        </div>
    </div>

	<script>
	       document.addEventListener('DOMContentLoaded', function() {
	           const smiley = document.getElementById('smiley');
	           smiley.innerHTML = `<img src="img/1.png" alt="Smiley">`;
	       });

	       window.onload = function() {
	           setTimeout(() => {
	               const slideCover = document.getElementById('slide-cover');
	               if (slideCover) {
	                   slideCover.style.opacity = '0';
	                   setTimeout(() => {
	                       slideCover.style.display = 'none';
	                       document.body.style.overflow = 'auto'; // 스크롤을 다시 활성화
	                   }, 700);
	               }
	           }, 2000);
	       };
	   </script>
</body>
</html>