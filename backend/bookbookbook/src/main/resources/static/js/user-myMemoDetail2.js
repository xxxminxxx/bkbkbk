// DOM이 로드되면 실행
$(document).ready(function() {
    // 정렬 버튼 요소들을 선택
    const sortButtons = $('input[name="sort"]');
    // 책 항목 요소들을 선택
    const bookEntries = $('.book-entry-wrapper');

    // 각 정렬 버튼에 이벤트 리스너 추가
    sortButtons.change(function() {
        // 선택된 정렬 순서 가져오기
        const order = $(this).attr('id');
        // 각 책 항목의 메모 섹션에 대해 정렬 수행
        bookEntries.each(function() {
            const memoSection = $(this).find('.memo-section');
            sortMemos(order, memoSection[0]);
        });
    });

    // 초기 정렬 (최신순)
    bookEntries.each(function() {
        const memoSection = $(this).find('.memo-section');
        sortMemos('latest', memoSection[0]);
    });
	
	// 메모 삭제 클릭 이벤트 (이벤트 위임 사용)
	$(document).on('click', '.delete-btn', function(){
	    // 해당 memoNum 받아오기
	    var memoNum = $(this).closest('.memo-item').find('.memo-num').val();
	    var shelfNum = $(this).closest('.memo-item').find('.shelf-num').val();
	    var $memoItem = $(this).closest('.memo-item');  // 삭제할 메모 아이템 저장

	    $.ajax({
	        url: '/memoDetail/delete',
	        type: 'post',
	        data: {memoNum : memoNum},
	        success: function(response) {
	            console.log("memo delete 실행");
	            // 삭제 성공 시 해당 메모 항목 제거
	            if(response === 'success'){
	                // $memoItem.remove();  // 저장해둔 메모 아이템 삭제
					$(this).closest('.memo-item').remove();

	                // 항상 user-myMemoDetail로 리다이렉트
	                location.href = `/pages/user-myMemoDetail?shelfNum=${shelfNum}`;
	            } 
	            else {
	                alert('메모 삭제에 실패했습니다.');
	            }
	        },
	        error: function(xhr, status, error){
	            console.log("Error: ", error, " xhr : ", xhr, "status : ", status);
	            alert("메모 삭제하는 중 오류가 발생했습니다.");
	        }
	    });
	});

	// 메모 수정 버튼 클릭 이벤트
	$(document).on('click', '.btn-outline-primary', function() {
	    const $memoItem = $(this).closest('.memo-item');
	    var memoNum = $memoItem.find('.memo-num').val();
	    var shelfNum = $memoItem.find('.shelf-num').val();
	    const memoText = $memoItem.find('p').text();
	    const memoDate = $memoItem.find('small').text();
	    
	    // 원래 내용을 data 속성으로 저장
	    $memoItem.data('original-content', memoText);
	    $memoItem.data('original-date', memoDate);
	    
	    // memo-item의 내용을 수정 폼으로 교체
	    $memoItem.html(`
	        <textarea class="form-control memo-edit-area">${memoText}</textarea>
	        <small>${memoDate}</small>
	        <div class="mt-2">
	            <button class="btn btn-sm btn-outline-success save-btn" data-memo-num="${memoNum}" data-shelf-num="${shelfNum}">저장</button>
	            <button class="btn btn-sm btn-outline-secondary cancel-btn" data-memo-num="${memoNum}" data-shelf-num="${shelfNum}">취소</button>
	        </div>
	        <input type="hidden" class="memo-num" value="${memoNum}">
	        <input type="hidden" class="shelf-num" value="${shelfNum}">
	    `);
	});

	// 저장 버튼 클릭 이벤트 (동적으로 생성된 요소이므로 이벤트 위임 사용)
	$(document).on('click', '.save-btn', function() {
	    const $memoItem = $(this).closest('.memo-item');
	    var memoNum = $(this).data('memo-num');
	    const updatedMemoText = $memoItem.find('.memo-edit-area').val();
	    var shelfNum = $memoItem.closest('.book-entry-wrapper').data('shelf-num'); // shelfNum 가져오기
	    $.ajax({
	        url: '/memoDetail/update',
	        type: 'POST',
	        data: {
	            memoNum: memoNum,
	            memoContent: updatedMemoText
	        },
	        success: function(response) {
	            if (response === 'success') {
	                // 성공 시 UI 업데이트
	                $memoItem.html(`
	                    <p>${updatedMemoText}</p>
	                    <small>${new Date().toLocaleString()}</small>
	                    <div class="mt-2">
	                        <button class="btn btn-sm btn-outline-primary" data-memo-num="${memoNum}">수정</button>
	                        <button class="btn btn-sm btn-outline-danger delete-btn" data-memo-num="${memoNum}" data-shelf-num="${shelfNum}">삭제</button>
	                    </div>
	                    <input type="hidden" class="memo-num" value="${memoNum}">
	                    <input type="hidden" class="shelf-num" value="${shelfNum}">
	                `);
	            } else {
	                alert('메모 수정에 실패했습니다.');
	            }
	        },
	        error: function() {
	            alert('서버 오류가 발생했습니다.');
	        }
	    });
	});

	// 취소 버튼 클릭 이벤트
	$(document).on('click', '.cancel-btn', function() {
	    const $memoItem = $(this).closest('.memo-item');
	    var memoNum = $(this).data('memo-num');
	    var shelfNum = $(this).data('shelf-num');
	    const originalContent = $memoItem.data('original-content');
	    const originalDate = $memoItem.data('original-date');

	    // 원래 상태로 되돌리기
	    $memoItem.html(`
	        <p>${originalContent}</p>
	        <small>${originalDate}</small>
	        <div class="mt-2">
	            <button class="btn btn-sm btn-outline-primary" data-memo-num="${memoNum}">수정</button>
	            <button class="btn btn-sm btn-outline-danger delete-btn" data-memo-num="${memoNum}" data-shelf-num="${shelfNum}">삭제</button>
	        </div>
	        <input type="hidden" class="memo-num" value="${memoNum}">
	        <input type="hidden" class="shelf-num" value="${shelfNum}">
	    `);
	});
});

// 메모 정렬 함수
function sortMemos(order, memoSection) {
    const memos = $(memoSection).find('.memo-item').get();
    memos.sort((a, b) => {
        const dateA = parseDate($(a).find('small').text());
        const dateB = parseDate($(b).find('small').text());
        return order === 'latest' ? dateB - dateA : dateA - dateB;
    });
    $(memoSection).append(memos);
}

// 날짜 문자열을 Date 객체로 변환하는 함수
function parseDate(dateString) {
    const parts = dateString.split(' ');
    const datePart = parts[0].split('-');
    const timePart = parts[1] ? parts[1].split(':') : ['00', '00', '00'];
    return new Date(datePart[0], datePart[1] - 1, datePart[2],
        timePart[0], timePart[1], timePart[2]);
}

// 메모 저장 함수
function saveMemo($button) {
    const $memoItem = $button.closest('.memo-item');
    const newText = $memoItem.find('textarea').val();
    const memoDate = $memoItem.find('small').text();

    $memoItem.html(`
        <p class="mb-1">${newText}</p>
        <small>${memoDate}</small>
        <div class="mt-2">
            <button class="btn btn-sm btn-outline-primary">수정</button>
            <button class="btn btn-sm btn-outline-danger">삭제</button>
        </div>
    `);
}

// 메모 취소 함수
function cancelMemo($button) {
    const $memoItem = $button.closest('.memo-item');
    const originalText = $memoItem.find('textarea').prop('defaultValue');
    const memoDate = $memoItem.find('small').text();

    $memoItem.html(`
        <p class="mb-1">${originalText}</p>
        <small>${memoDate}</small>
        <div class="mt-2">
            <button class="btn btn-sm btn-outline-primary">수정</button>
            <button class="btn btn-sm btn-outline-danger">삭제</button>
        </div>
    `);
}