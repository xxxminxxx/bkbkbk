document.addEventListener('DOMContentLoaded', function() {
    // 필요한 요소들을 가져옵니다
    var joinButton = document.getElementById('join');
    var signupModal = document.getElementById('signupModal');
    var signupForm = document.getElementById('signupForm');

    // 회원가입 버튼 클릭 시 모달을 보여줍니다
    joinButton.onclick = function() {
        signupModal.style.display = "block";
    }

    // 모달 외부 클릭 시 모달을 닫습니다
    window.onclick = function(event) {
        if (event.target == signupModal) {
            signupModal.style.display = "none";
        }
    }

    // 생년월일 선택 옵션을 생성합니다
    var yearSelect = document.getElementById('birth-year');
    var monthSelect = document.getElementById('birth-month');
    var daySelect = document.getElementById('birth-day');

    // 년도 옵션 생성 (1900년부터 현재 년도까지)
    var currentYear = new Date().getFullYear();
    for (var i = currentYear; i >= 1900; i--) {
        var option = document.createElement('option');
        option.value = i;
        option.textContent = i;
        yearSelect.appendChild(option);
    }

    // // 월 옵션 생성
    // for (var i = 1; i <= 12; i++) {
    //     var option = document.createElement('option');
    //     option.value = i;
    //     option.textContent = i;
    //     monthSelect.appendChild(option);
    // }

    // // 일 옵션 생성 (기본 31일)
    // for (var i = 1; i <= 31; i++) {
    //     var option = document.createElement('option');
    //     option.value = i;
    //     option.textContent = i;
    //     daySelect.appendChild(option);
    // }

    // 회원가입 폼 제출 처리
    signupForm.onsubmit = function(e) {
        e.preventDefault(); // 기본 제출 동작을 막습니다
        // 여기에 회원가입 처리 로직을 추가하세요
        console.log('회원가입 시도');
        // 예: 서버에 데이터 전송, 유효성 검사 등
    }
});