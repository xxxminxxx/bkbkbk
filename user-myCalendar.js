// 서버에서 받아온 events 데이터를 저장할 변수
let eventsData = [];

/* 달력 형태 */
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	// ** today 설정
	var today = new Date();
    today.setHours(0, 0, 0, 0);  // 시간을 00:00:00으로 설정
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            right: 'prev,today,next'
        },
		events: [
		    
		],
		// 날짜 옵션 클릭 시 이벤트
        dateClick: function(info) {
			// prev, next 클릭 시 연도, 월 선택도 업데이트
			if (info.date <= today) {
                updateDropdowns(info.date);
                displaySelectedDate(info.date);
            }
        },
		// 요일 색상 설정
		datesSet: function(info) {
		    colorizeWeekends();
			updateNextButtonState();
		},
		dayCellDidMount: function(arg) {
            checkAttendance(arg.date, arg.el);
            if (arg.date > today) {
                arg.el.classList.add('future-date');
            }
        }
    }); // end of var calendar

    calendar.render();
	
	// 'prev' 버튼 클릭 이벤트
    document.querySelector('.fc-prev-button').addEventListener('click', function() {
        updateDropdowns(calendar.getDate());
    });

    // 'next' 버튼 클릭 이벤트
    document.querySelector('.fc-next-button').addEventListener('click', function() {
        updateDropdowns(calendar.getDate());
    });

    // 'today' 버튼 클릭 이벤트
    document.querySelector('.fc-today-button').addEventListener('click', function() {
        var today = new Date();
        updateDropdowns(today);
        displaySelectedDate(today);
    });

	// 다음달 클릭 이벤트
	function updateNextButtonState() {
        var currentDate = calendar.getDate();
        var nextButton = document.querySelector('.fc-next-button');
        if (currentDate.getMonth() === today.getMonth() && currentDate.getFullYear() === today.getFullYear()) {
            nextButton.disabled = true;
            nextButton.classList.add('fc-state-disabled');
        } else {
            nextButton.disabled = false;
            nextButton.classList.remove('fc-state-disabled');
        }
    }
	
    var monthSelect = document.getElementById('month-select');
    var yearSelect = document.getElementById('year-select');
    
    // 현재 날짜 가져오기
    var today = new Date();
    var currentYear = today.getFullYear();
    var currentMonth = today.getMonth();

    // 월 옵션 추가 (현재 월까지)
    for (var i = 0; i <= currentMonth; i++) {
        var option = document.createElement('option');
        option.value = i;
        option.text = new Date(0, i).toLocaleString('default', { month: 'long' });
        monthSelect.appendChild(option);
    }

    // 현재 연도부터 10년 전까지 옵션 추가
    for (var i = currentYear; i >= currentYear - 10; i--) {
        var option = document.createElement('option');
        option.value = i;
        option.text = i;
        yearSelect.appendChild(option);
    }

    // 드롭다운 변경 시 달력 업데이트
    monthSelect.addEventListener('change', updateCalendarDate);
    yearSelect.addEventListener('change', updateYearAndMonthOptions);

    function updateYearAndMonthOptions() {
        var selectedYear = yearSelect.value;
        var selectedMonth = monthSelect.value;

        // 현재 연도를 선택하면 월 옵션을 현재 월까지로 제한
        if (selectedYear == currentYear) {
            monthSelect.innerHTML = '';
            for (var i = 0; i <= currentMonth; i++) {
                var option = document.createElement('option');
                option.value = i;
                option.text = new Date(0, i).toLocaleString('default', { month: 'long' });
                monthSelect.appendChild(option);
            }
        } 
        // 과거 연도를 선택하면 모든 월을 추가
        else {
            monthSelect.innerHTML = '';
            for (var i = 0; i < 12; i++) {
                var option = document.createElement('option');
                option.value = i;
                option.text = new Date(0, i).toLocaleString('default', { month: 'long' });
                monthSelect.appendChild(option);
            }
        }

        calendar.gotoDate(new Date(selectedYear, selectedMonth));
    } // end of updateYearAndMonthOptions

    function updateCalendarDate() {
        var selectedMonth = monthSelect.value;
        var selectedYear = yearSelect.value;
        calendar.gotoDate(new Date(selectedYear, selectedMonth));
    } // end of updateCalendarDate
    
    // today 버튼 클릭 시 드롭다운 업데이트
    document.querySelector('.fc-today-button').addEventListener('click', function() {
        var today = new Date();
        updateDropdowns(today);
    });

    function updateDropdowns(date) {
        monthSelect.value = date.getMonth();
        yearSelect.value = date.getFullYear();
    }
    
    // 초기값 설정
    updateDropdowns(new Date());
	displaySelectedDate(new Date());
    updateNextButtonState();
    
	// 날짜 클릭 시, 해당 날짜 이벤트들 표시
	function displaySelectedDate(date) {
	    var selectedDateEl = document.getElementById('selected-date');
	    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
	    selectedDateEl.innerHTML = date.toLocaleDateString('ko-KR', options);
	    
	    var eventDetails = document.getElementById('event-details');
	    var events = calendar.getEvents().filter(function(event) {
	        var eventStart = event.start;
	        var eventEnd = event.end || new Date(eventStart.getTime() + 24*60*60*1000); // 종료일이 없으면 시작일 다음 날로 설정
	        
	        // 날짜 비교를 위해 시간을 00:00:00으로 설정
	        var compareDate = new Date(date.getFullYear(), date.getMonth(), date.getDate());
	        var compareStart = new Date(eventStart.getFullYear(), eventStart.getMonth(), eventStart.getDate());
	        var compareEnd = new Date(eventEnd.getFullYear(), eventEnd.getMonth(), eventEnd.getDate());
	        
	        // 종료일의 전날까지 포함
	        compareEnd.setDate(compareEnd.getDate() - 1);
	        
	        return compareDate >= compareStart && compareDate <= compareEnd;
	    });

	    if (events.length > 0) {
	        var eventHtml = '<ul class="event-list">';
	        events.forEach(function(event) {
	            eventHtml += '<li class="event-item">' + event.title + '</li>';
	        });
	        eventHtml += '</ul>';
	        eventDetails.innerHTML = eventHtml;
	    } else {
	        eventDetails.innerHTML = '<p>이 날짜에 예정된 이벤트가 없습니다.</p>';
	    }
		
		// 출석체크 버튼 표시 여부 결정
		var attendanceCheckButton = document.getElementById('attendance-check');
		if (date.toDateString() === new Date().toDateString()) {
		   attendanceCheckButton.style.display = 'flex';
		 } 
		 else {
		   attendanceCheckButton.style.display = 'none';
		 }
		
	} // end of displaySelectedDate
    
	// 일요일, 토요일, 평일 날짜 색상 변경 함수
	function colorizeWeekends() {
	    document.querySelectorAll('.fc-daygrid-day').forEach(function(el) {
	        var dayOfWeek = new Date(el.dataset.date).getDay();
	        if (dayOfWeek === 0) {  // 일요일
	            el.querySelector('.fc-daygrid-day-number').style.color = 'red';
	        } else if (dayOfWeek === 6) {  // 토요일
	            el.querySelector('.fc-daygrid-day-number').style.color = 'blue';
	        } else {  // 평일
	            el.querySelector('.fc-daygrid-day-number').style.color = 'black';
	        }
	    });
	} // end of colorizeWeekends
	
	// 출석체크 버튼에 클릭 이벤트 리스너를 추가합니다.
	document.getElementById('attendance-check').addEventListener('click', function() {
	    // 현재 날짜를 생성합니다.
	    var today = new Date();
	    // 출석체크 및 마킹 함수를 호출합니다.
	    checkAndMarkAttendance(today);
	});
	
	// *** [1] 페이지 로드 시 실행
	document.addEventListener('DOMContentLoaded', function() {
		// *** [2] 출석 정보를 가져와 달력에 표시
	    getAttendanceList();
	});
	
	// *** [3] 출석 정보 가져오는 함수 ( getAttendanceList 실행 )
	// 출석 정보를 가져와서 달력에 표시하는 함수를 정의합니다.
	function getAttendanceList() {
	    $.ajax({
	        url: '/calendar/getAttendance',
	        type: 'GET',
	        dataType: 'json',
	        success: function(data) {
	            console.log("Received attendance data:", data); // 받은 데이터를 콘솔에 출력합니다.
	            if (data.attendanceList && Array.isArray(data.attendanceList)) { // 출석 리스트가 존재하고 배열이라면
	                console.log("getAttendanceList 실행");
	                data.attendanceList.forEach(function(attendance) {
	                    var attendanceDate = new Date(attendance.calendarDate); // 출석 날짜를 Date 객체로 변환합니다.
	                    markAttendance(attendanceDate); // 각 출석 날짜에 대해 출석 표시를 추가합니다.
	                });
	            } else {
	                console.log("No attendance data or invalid format"); // 데이터가 없거나 형식이 잘못되었다면 콘솔에 출력합니다.
	            }
	            updateAttendanceButton(); // 출석체크 버튼의 표시 여부를 업데이트합니다.
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error); // 오류를 콘솔에 출력합니다.
	            alert('출석 정보를 가져오는 중 오류가 발생했습니다.'); // 사용자에게 오류 알림을 표시합니다.
	        }
	    });
	}

	// * 출석체크 버튼 클릭 시 실행
	// 출석체크 및 마킹 함수를 정의합니다.
	function checkAndMarkAttendance() {
	    $.ajax({
	        url: '/calendar/checkAttendance',
	        type: 'POST',
	        dataType: 'text',
	        success: function(result) {
	            if (result === 'success') { // 출석체크가 성공했다면
	                getAttendanceList(); // 출석 정보를 새로 가져와서 달력에 표시합니다.
	                alert('출석체크 되었습니다!'); // 사용자에게 알림을 표시합니다.
	            } else {
	                alert('이미 출석체크를 완료하셨습니다.'); // 이미 출석체크를 했다면 알림을 표시합니다.
	            }
	            updateAttendanceButton(); // 출석체크 버튼의 표시 여부를 업데이트합니다.
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error); // 오류를 콘솔에 출력합니다.
	            alert('출석체크 중 오류가 발생했습니다.'); // 사용자에게 오류 알림을 표시합니다.
	        }
	    });
	}
	
	// *  checkAndMarkAttendance()나 getAttendanceList()에서 호출될 때 실행
	// 날짜에 출석체크 표시를 추가하는 함수를 정의합니다.
	function markAttendance(date) {
	    var dateStr = date.toLocaleDateString('en-CA'); // 날짜를 'YYYY-MM-DD' 형식의 문자열로 변환합니다.
	    var cell = document.querySelector('.fc-day[data-date="' + dateStr + '"]'); // 해당 날짜의 달력 셀을 찾습니다.
	    if (cell) { // 셀이 존재한다면
	        var existingMark = cell.querySelector('.attendance-mark'); // 이미 출석 표시가 있는지 확인합니다.
	        if (!existingMark) { // 출석 표시가 없다면
	            var mark = document.createElement('div'); // 새로운 div 요소를 생성합니다.
	            mark.className = 'attendance-mark'; // 클래스 이름을 설정합니다.
	            mark.style.position = 'absolute'; // 위치를 절대 위치로 설정합니다.
	            mark.style.top = '5px'; // 상단에서 5px 떨어진 위치에 배치합니다.
	            mark.style.left = '5px'; // 왼쪽에서 5px 떨어진 위치에 배치합니다.
	            mark.style.width = '20px'; // 너비를 20px로 설정합니다.
	            mark.style.height = '20px'; // 높이를 20px로 설정합니다.
	            mark.style.backgroundImage = 'url("../img/출석완료이미지.png")'; // 배경 이미지를 설정합니다.
	            mark.style.backgroundSize = 'cover'; // 배경 이미지가 요소를 꽉 채우도록 설정합니다.

	            var dayTop = cell.querySelector('.fc-daygrid-day-top'); // 날짜 표시 영역을 찾습니다.
	            if (dayTop) {
	                dayTop.style.position = 'relative'; // 상대 위치로 설정합니다.
	                dayTop.appendChild(mark); // 출석 표시를 날짜 표시 영역에 추가합니다.
	            } else {
	                cell.appendChild(mark); // 날짜 표시 영역이 없으면 셀에 직접 추가합니다.
	            }
	        }
	    }
	}

	// * 캘린더의 각 날짜 셀이 마운트될 때 실행
	// 출석체크 여부를 확인하는 함수를 정의합니다.
	function checkAttendance(date, cell) {
	    var dateStr = date.toLocaleDateString('en-CA'); // 날짜를 'YYYY-MM-DD' 형식의 문자열로 변환합니다.
	    
	    $.ajax({
	        url: '/calendar/getAttendance',
	        type: 'GET',
	        data: { date: dateStr },
	        dataType: 'json',
	        success: function(data) {
	            if (data.attended) { // 출석했다면
	                console.log("checkAttendance 실행");
	                markAttendance(date); // 출석 표시를 추가합니다.
	            }
	            updateAttendanceButton(); // 출석체크 버튼의 표시 여부를 업데이트합니다.
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	        }
	    });
	}
	
	// * 여러 함수에서 호출, 출석 정보를 가져온 후 실행
	// 출석 버튼의 표시 여부를 관리하는 함수를 정의합니다.
	function updateAttendanceButton() {
	    var today = new Date().toISOString().split('T')[0]; // 오늘 날짜를 'YYYY-MM-DD' 형식으로 가져옵니다.
	    var attendanceButton = document.getElementById('attendance-check'); // 출석체크 버튼 요소를 가져옵니다.

	    $.ajax({
	        url: '/calendar/getAttendance',
	        type: 'GET',
	        dataType: 'json',
	        success: function(data) {
	            console.log("updateAttendanceButton 실행");
	            var todayAttendance = data.attendanceList.some(function(attendance) {
	                return attendance.calendarDate.split('T')[0] === today;
	            }); // 오늘 출석했는지 확인합니다.
	            attendanceButton.style.display = todayAttendance ? 'none' : 'flex'; // 출석 여부에 따라 버튼을 표시하거나 숨깁니다.
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	        }
	    });
	}

	getAttendanceList(); // 출석 정보를 가져와 달력에 표시하는 함수를 호출합니다.
	
	
	/********************* 메모 조회 *****************************/
	function getMemoList(){
		
		$.ajax({
			url : '/calendar/getMemos',
			type : 'GET',
			dataType: 'List',
			success: function(data){
				console.log("getMemoList 실행");
			}
		}); // end of ajax
	}
});
