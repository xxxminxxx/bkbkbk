document.addEventListener('DOMContentLoaded', function() {
  const sortButtons = document.querySelectorAll('input[name="sort"]');
  const memoSection = document.querySelector('.memo-section');

  function sortMemos(order) {
    const memos = Array.from(memoSection.querySelectorAll('.memo-item'));
    memos.sort((a, b) => {
      const dateA = new Date(a.querySelector('small').textContent);
      const dateB = new Date(b.querySelector('small').textContent);
      return order === 'latest' ? dateB - dateA : dateA - dateB;
    });
    memos.forEach(memo => memoSection.appendChild(memo));
  }

  sortButtons.forEach(button => {
    button.addEventListener('change', function() {
      sortMemos(this.id);
    });
  });

  // 초기 정렬 (최신순)
  sortMemos('latest');

  // 메모 삭제 기능
  memoSection.addEventListener('click', function(e) {
    if (e.target.classList.contains('btn-outline-danger')) {
      e.target.closest('.memo-item').remove();
    }
  });

  // 메모 수정 기능
  memoSection.addEventListener('click', function(e) {
    if (e.target.classList.contains('btn-outline-primary')) {
      const memoItem = e.target.closest('.memo-item');
      const memoText = memoItem.querySelector('p').textContent;
      const memoDate = memoItem.querySelector('small').textContent;

      memoItem.innerHTML = `
        <textarea class="form-control memo-edit-area">${memoText}</textarea>
        <small>${memoDate}</small>
        <div class="mt-2">
          <button class="btn btn-sm btn-outline-success save-btn">저장</button>
          <button class="btn btn-sm btn-outline-secondary cancel-btn">취소</button>
        </div>
      `;
    }
  });

  // 메모 저장 및 취소 기능
  memoSection.addEventListener('click', function(e) {
    if (e.target.classList.contains('save-btn')) {
      const memoItem = e.target.closest('.memo-item');
      const newText = memoItem.querySelector('textarea').value;
      const memoDate = memoItem.querySelector('small').textContent;

      memoItem.innerHTML = `
        <p class="mb-1">${newText}</p>
        <small>${memoDate}</small>
        <div class="mt-2">
          <button class="btn btn-sm btn-outline-primary">수정</button>
          <button class="btn btn-sm btn-outline-danger">삭제</button>
        </div>
      `;
    } else if (e.target.classList.contains('cancel-btn')) {
      const memoItem = e.target.closest('.memo-item');
      const originalText = memoItem.querySelector('textarea').defaultValue;
      const memoDate = memoItem.querySelector('small').textContent;

      memoItem.innerHTML = `
        <p class="mb-1">${originalText}</p>
        <small>${memoDate}</small>
        <div class="mt-2">
          <button class="btn btn-sm btn-outline-primary">수정</button>
          <button class="btn btn-sm btn-outline-danger">삭제</button>
        </div>
      `;
    }
  });
});
