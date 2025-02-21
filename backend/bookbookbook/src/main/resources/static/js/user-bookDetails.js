	$(function() {
	// hidden input의 값을 가져옴
	  const bookNum = $('#bookNum').val();
	  const userNum = $('#userNum').val();
	  const userId = $('#userId').val();

	  // 가져온 값을 콘솔에 출력
	  console.log("bookNum: " + bookNum);
	  console.log("userNum: " + userNum);
	  console.log("userId: " + userId);

	  // 위시리스트 버튼 클릭 시 이벤트 처리
	  $('#wish-book-btn').on('click', function() {
	      const bookNum = $('input[name="bookNum"]').val();

	      fetch("/wishlist/add", {
	          method: "POST",
	          headers: {
	              "Content-Type": "application/x-www-form-urlencoded",
	          },
	          body: new URLSearchParams({
	              bookNum: bookNum,
	              userNum: userNum
	          })
	      })
		   .then(response => {
		          // HTTP 상태 코드 확인
		          if (response.status === 409) {
		              // 409 Conflict 상태 코드를 별도로 처리
		              return { status: 'duplicate', message: '이미 나의 서재에 저장된 책입니다.' };
		          }
		          if (!response.ok) {
		              throw new Error('HTTP status ' + response.status);
		          }
		          return response.json(); // JSON 형식으로 파싱
		      })
		      .then(data => {
		          console.log(data);
		          // 서버 응답에 따른 다른 메시지 표시
		          if (data.status === 'success') {
		              // 성공적으로 저장된 경우
		              Swal.fire({
		                  icon: 'success',
		                  title: '성공!',
		                  text: data.message || '책이 나의 서재에 저장되었습니다.',
		                  confirmButtonColor: '#3085d6',
		                  confirmButtonText: '확인'
		              });
		          } else if (data.status === 'duplicate') {
		              // 이미 저장된 책인 경우
		              Swal.fire({
		                  icon: 'info',
		                  title: '알림',
		                  text: data.message || '이미 나의 서재에 저장된 책입니다.',
		                  confirmButtonColor: '#3085d6',
		                  confirmButtonText: '확인'
		              });
		          } else {
		              // 기타 오류 상황
		              throw new Error('Unknown status: ' + data.status);
		          }
		      })
		      .catch(error => {
		          console.error('Error:', error);
		          // 오류 발생 시 처리
		          Swal.fire({
		              icon: 'error',
		              title: '오류',
		              text: '책을 저장하는 중 문제가 발생했습니다.',
		              confirmButtonColor: '#d33',
		              confirmButtonText: '확인'
		          });
		      }); // end of fetch
		  }); // end of wish-book-btn
		  

		  // #[수정] 책 상태 확인 함수 추가
		  function checkBookStatus(bookNum, userNum) {
		    return $.ajax({
		      type: 'GET',
		      url: '/bookshelf/checkBookStatus',
		      data: { bookNum: bookNum, userNum: userNum }
		    });
		  }

	  // 읽은 책 탭팬에서 저장하기 버튼 클릭 시 이벤트 처리
	  $('#readBookForm').on('submit', function(e) {
	
	    e.preventDefault();

	      var startDate = $('#startDate').val();
	      var endDate = $('#endDate').val();
	      var rating = $('input[name="user-rating"]:checked').val();
	      var bookNum = $('#bookNum').val();	
		 // alert(startDate+endDate);

	      // 현재 날짜 가져오기
	      var currentDate = new Date().toISOString().split('T')[0];

		  // 날짜 유효성 체크
		    if (endDate > currentDate || endDate < startDate || startDate > currentDate) {
				// #{변경} alert를 SweetAlert2로 변경
				      Swal.fire({
				          icon: 'error',
				          title: '오류',
				          text: '날짜를 확인해주세요.',
				      });
				      return;
		    }

	      if (!rating) {
			// #{변경} alert를 SweetAlert2로 변경
			    Swal.fire({
			        icon: 'warning',
			        title: '잠시만요',
			        text: '별점을 선택해주세요!',
			    });
			    return;
	      }

	      var bookData = {
	          startDate: startDate,
	          endDate: endDate,
	          rating: rating,
	          bookNum: bookNum,
	          readStatus: "Y",
	          userNum: userNum,
	          userId: userId
	      };

	      console.log("bookData : ", bookData);

		   // #[수정] 책 상태 확인 후 처리
		    checkBookStatus(bookNum, userNum).then(function(response) {
		      if (response.exists) {
		        // 이미 저장된 책인 경우
		        Swal.fire({
		          icon: 'info',
		          title: '알림',
		          text: '이미 저장된 책입니다. 나의 서재를 확인해주세요.',
		        });
		      } else {
		        $.ajax({
		          type: 'POST',
		          url: '/saveBook',
		          contentType: 'application/json',
		          data: JSON.stringify(bookData),
		          success: function(response) {
		            console.log('서버 응답:', response);
		            if (response.status === 'success') {
		              Swal.fire({
		                icon: 'success',
		                title: '저장 완료',
		                text: '책이 나의 서재에 저장되었습니다.',
		              });
		            } else if (response.status === 'error') {
		              Swal.fire({
		                icon: 'warning',
		                title: '저장 실패',
		                text: response.message,
		              });
		            }
		          },
		          error: function(xhr, status, error) {
		            console.log('저장 실패:', error);
		            var errorMessage = xhr.responseText || "저장 중 오류가 발생했습니다.";
		            Swal.fire({
		              icon: 'error',
		              title: '저장 실패',
		              text: errorMessage,
		            });
		          }
		        });
		      }
		    }).catch(function(error) {
		      console.error('책 상태 확인 중 오류:', error);
		      Swal.fire({
		        icon: 'error',
		        title: '오류',
		        text: '책 상태를 확인하는 중 문제가 발생했습니다.',
		      });
		    });
		  });

 //읽고 있는 책 저장
 $("#readingBookForm").on('submit', function(e){
	e.preventDefault();  // 폼 제출 기본 동작을 막습니다.
	  

	 var readPages = parseInt($('#read-pages').val());
	     var startDate = $('#readingStartDate').val();
		  var bookNum = $('#bookNum').val();	
		 var bookPage = parseInt($('#bookPage').val());
		 // alert("bookPage: " + bookPage);
	
		  
		 // #[수정] 입력한 페이지 수가 전체 페이지 수를 초과하는지 확인
		    if (readPages > bookPage) {
		        Swal.fire({
		            icon: 'error',
		            title: '잠시만요!',
		            text: '입력한 페이지가 전체 페이지를 넘을 수 없습니다.'
		        });
		        return; // 함수 실행을 여기서 중단합니다.
		    }
			
		  var data={
			readPages: readPages,
			startDate: startDate,
			bookNum: bookNum,
			userNum: userNum,
			bookPage: bookPage  // 전체 페이지 수 추가
		  }
		  
		  console.log(data);
		  
		   // #[수정] 책 상태 확인 후 처리
		      checkBookStatus(bookNum, userNum).then(function(response) {
		        if (response.exists) {
		          // 이미 저장된 책인 경우
		          Swal.fire({
		            icon: 'info',
		            title: '알림',
		            text: '이미 저장된 책입니다. 나의 서재를 확인해주세요.',
		          });
		        } else {
		          // 저장되지 않은 책인 경우, 기존 저장 로직 실행
		          $.ajax({
		            type: 'POST',
		            url: '/saveReadingBook',
		            contentType: 'application/json',
		            data: JSON.stringify(data),
		            success: function(response) {
		              if (response.status === 'success') {
		                Swal.fire({
		                  icon: 'success',
		                  title: '성공!',
		                  text: response.message
		                });
		              } else {
		                Swal.fire({
		                  icon: 'error',
		                  title: '잠시만요!',
		                  text: response.message || '입력한 정보를 확인해주세요.'
		                });
		              }
		            },
		            error: function() {
		              Swal.fire({
		                icon: 'error',
		                title: '오류!',
		                text: '서버와의 통신 중 오류가 발생했습니다.'
		              });
		            }
		          });
		        }
		      }).catch(function(error) {
		        console.error('책 상태 확인 중 오류:', error);
		        Swal.fire({
		          icon: 'error',
		          title: '오류',
		          text: '책 상태를 확인하는 중 문제가 발생했습니다.',
		        });
		      });
		    });
		  });

   

