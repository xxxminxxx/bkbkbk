document.addEventListener('DOMContentLoaded', function() {
    // 정렬 버튼 요소
    const sortButtons = document.querySelectorAll('input[name="sort"]');
    // 책 항목들 포함하는 컨테이너 요소
    const bookEntriesContainer = document.getElementById('book-entries');
    
    // 페이징 관련
    // 페이징 변수
    const itemPerPage = 5;    // 한 페이지 당 변수 
    let currentPage = 1;    // 현재 페이지 번호 ( 사용자가 페이지 버튼을 클릭할 때마다 변경 )
    // 모든 책 항목 배열로 변환
    let bookEntries = Array.from(bookEntriesContainer.getElementsByClassName('book-entry'));
    console.log("bookEntries : " + bookEntries);
    
    // 수정: 페이지네이션 컨테이너를 HTML에서 선택하도록 변경
    const paginationContainer = document.getElementById('pagination-container');
    
    // order : 최신순 or 오래된 순 둘 중 하나
    function sortEntries(order) {
        // bookentries 정렬 ( 날짜 기준 )
        bookEntries.sort((a, b) => {
            const dateA = new Date(a.querySelector('.memo-date .text-muted').textContent);
            const dateB = new Date(b.querySelector('.memo-date .text-muted').textContent);
            return order === 'latest' ? dateB - dateA : dateA - dateB;
        });
        // 정렬된 항목들을 DOM에 다시 추가
        bookEntries.forEach(entry => bookEntriesContainer.appendChild(entry));
        
        // 현재 페이지 표시
        displayPage(currentPage);
        // 페이지네이션 UI 업데이트
        renderPagination();
    }
    
    // 특정 페이지의 항목들 표시 함수
    function displayPage(page) {
        const startIndex = (page - 1) * itemPerPage;    // currentPage에서 표시할 첫번째 항목의 인덱스
        const endIndex = startIndex + itemPerPage;        // currentPage에서 표시할 마지막 항목의 인덱스
        
        bookEntries.forEach((entry, index) => {
            if (index >= startIndex && index < endIndex) {
                entry.style.display = ''; // 해당 페이지 항목 표시
            } else {
                entry.style.display = 'none'; // 다른 페이지 항목 숨김
            }
        });
    }
    
    // 페이지네이션 UI를 생성하는 함수
    function renderPagination() {
        console.log("renderPagination called"); // 수정: 로그 추가
        
        // 총 페이지 수 계산    
        const totalPages = Math.ceil(bookEntries.length / itemPerPage); // 수정: itemsPerPage를 itemPerPage로 변경
        console.log("totalPages:", totalPages); // 수정: 로그 추가
        console.log("currentPage:", currentPage); // 수정: 로그 추가
        
        const range = 2; 			// 현재 페이지 주변에 표시할 페이지 수
        const maxPagesToShow = 5; 	// 최대로 표시할 페이지 번호 수
		
		// 페이지네이션 html 시작
        let paginationHtml = '<nav aria-label="Page navigation"><ul class="pagination align-items-center justify-content-center">';

        // 첫 페이지로 이동 버튼
        paginationHtml += `<li class="page-item"><a class="page-link text-purple" href="#" data-page="1">&lt;&lt;</a></li>`;

        // 이전 페이지 버튼
        paginationHtml += `<li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
            <a class="page-link text-purple" href="#" aria-label="Previous" id="prevPage">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>`;

        // 표시할 페이지 번호의 시작과 끝 계산
        let startPage = Math.max(1, currentPage - range);
        let endPage = Math.min(totalPages, currentPage + range);

        // 페이지 번호 범위 조정
        if (endPage - startPage < maxPagesToShow - 1) {
            if (startPage === 1) {
                endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);
            } else if (endPage === totalPages) {
                startPage = Math.max(1, endPage - maxPagesToShow + 1);
            }
        }

        // 페이지 번호 버튼 생성
        for (let i = startPage; i <= endPage; i++) {
            paginationHtml += `<li class="page-item ${i === currentPage ? 'active' : ''}">
                <a class="page-link text-purple" href="#" data-page="${i}">${i}</a>
            </li>`;
        }

        // 다음 페이지 버튼 ( 현재 페이지가 마지막 페이지면 비활성화됨 )
        paginationHtml += `<li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">
            <a class="page-link text-purple" href="#" aria-label="Next" id="nextPage">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>`;

        // 마지막 페이지로 이동 버튼
        paginationHtml += `<li class="page-item"><a class="page-link text-purple" href="#" data-page="${totalPages}">&gt;&gt;</a></li>`;
		// 페이지네이션 html 종료
        paginationHtml += '</ul></nav>';
		// 생성된 페이지네이션 HTML을 컨테이너에 삽입
        paginationContainer.innerHTML = paginationHtml;
        
        // 페이지네이션 버튼에 이벤트 리스너 추가
        paginationContainer.querySelectorAll('.page-link').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                if (this.id === 'prevPage' && currentPage > 1) {
                    currentPage--; // 이전 페이지로 이동
                } 
				else if (this.id === 'nextPage' && currentPage < totalPages) {
                    currentPage++; // 다음 페이지로 이동
                } 
				else if (this.dataset.page) {
                    currentPage = parseInt(this.dataset.page); // 특정 페이지로 이동
                }
				// 새 페이지 표시
                displayPage(currentPage);
				// 페이지네이션 UI 업데이트
                renderPagination();
            });
        });
    }

    // 정렬 버튼에 이벤트 리스너 추가
    sortButtons.forEach(button => {
        button.addEventListener('change', function() {
            sortEntries(this.id);
        });
    });
    
    console.log("DOMContentLoaded 이벤트 발생");
    console.log("bookEntries 길이:", bookEntries.length);
    sortEntries('latest');
    console.log("sortEntries 실행 완료");
    displayPage(currentPage);
    console.log("displayPage 실행 완료");
    renderPagination();
    console.log("renderPagination 실행 완료");
});
