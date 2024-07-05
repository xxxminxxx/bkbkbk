document.addEventListener('DOMContentLoaded', function() {
    
    //placeholder 글씨체 변경
    //css에서 ::placeholder가 안 먹히면 js 사용
    // document.getElementById('email').placeholder = '이메일';
    // document.getElementById('email').style.fontFamily = 'DungGeunMo', sans-serif;

    // document.getElementById('password').placeholder = '비밀번호';
    // document.getElementById('password').style.fontFamily = 'DungGeunMo', sans-serif;

    // document.getElementById('search-input').placeholder = '대여하고 싶은 책을 검색해보세요';
    // document.getElementById('search-input').style.fontFamily = 'DungGeunMo', sans-serif;

    //모달 클릭 이벤트 처리 
    var loginButton = document.getElementById('login');
    const closeButton = document.getElementsByClassName('close-button');
    var modal = document.getElementById('loginModal');

    loginButton.onclick = function() {
        //모달 창을 보이게 만들기
        modal.style.display = "block";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            //모달 창을 숨기기
            modal.style.display = "none";
        }
    }

    var loginForm = document.getElementById('loginForm');
    loginForm.onsubmit = function(e) {
        e.preventDefault();
        // 여기에 로그인 로직을 추가하세요
        console.log('로그인 시도');
    }

    closeButton.addEventListener('click', closeModal);

    window.addEventListener('click', (event) => {
    if (event.target === modal) {
      closeModal();
    }
  });

    // 추가 기능들 (계정찾기, 비밀번호 찾기, 회원가입 등)은
    // 필요에 따라 구현하세요.
});