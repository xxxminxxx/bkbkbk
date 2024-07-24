document.addEventListener('DOMContentLoaded', function() {
	// 정렬 버튼 및 도서당 메모 전체 변수
  	const sortButtons = document.querySelectorAll('input[name="sort"]');
  	const bookEntriesContainer = document.getElementById('book-entries');
	
	// order : 최신순 or 오래된 순 둘 중 하나
  	function sortEntries(order) {
		// 도서당 메모 칸 변수
    	const bookEntries = Array.from(bookEntriesContainer.getElementsByClassName('book-entry'));
    	// bookentries 정렬
    	bookEntries.sort((a, b) => {
      	const dateA = new Date(a.querySelector('.memo-date .text-muted').textContent);
      	const dateB = new Date(b.querySelector('.memo-date .text-muted').textContent);
      	return order === 'latest' ? dateB - dateA : dateA - dateB;
    	});
		 
    	bookEntries.forEach(entry => bookEntriesContainer.appendChild(entry));
  	}
	
  	sortButtons.forEach(button => {
    	button.addEventListener('change', function() {
      	sortEntries(this.id);
    	});
  	});

  	// 초기 정렬 (최신순)
  	sortEntries('latest');
});
