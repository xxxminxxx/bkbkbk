$(function() {
  // DOM 요소 선택
  const backButton = document.querySelector('.back-button');
  const prevButton = document.querySelector('.prev-button');
  const nextButton = document.querySelector('.next-button');
  const characterContent = document.getElementById('character-content');
  const unavailableMessage = document.getElementById('unavailable-message');
  
  // URL에서 현재 stage 값을 가져옴
  const currentStage = parseInt(new URLSearchParams(window.location.search).get('stage'));
  // 숨겨진 input 필드에서 userLevel 값을 가져옴
  const userLevel = parseInt(document.getElementById('userLevel').value);
  const maxStage = 9; // 최대 단계 수 설정
  
  // 뒤로 가기 버튼 클릭 이벤트
  backButton.addEventListener('click', function() {
    window.location.href = '/pages/user-myCharacters';
  });

  // 네비게이션 버튼 상태 업데이트 함수
  function updateNavButtons() {
    // 첫 번째 단계에서는 이전 버튼 비활성화
    prevButton.classList.toggle('disabled', currentStage === 1);
    // 마지막 단계이거나 사용자 레벨 이상일 때 다음 버튼 비활성화
    nextButton.classList.toggle('disabled', currentStage === maxStage || currentStage >= userLevel);
  }

  // 이전 버튼 클릭 이벤트
  prevButton.addEventListener('click', function() {
    if (currentStage > 1) {
      window.location.href = `/pages/user-myCharactersDetail?stage=${currentStage - 1}`;
    }
  });

  // 다음 버튼 클릭 이벤트
  nextButton.addEventListener('click', function() {
    if (currentStage < maxStage && currentStage < userLevel) {
      window.location.href = `/pages/user-myCharactersDetail?stage=${currentStage + 1}`;
    }
  });

  // 네비게이션 버튼 상태 초기화
  updateNavButtons();
});
