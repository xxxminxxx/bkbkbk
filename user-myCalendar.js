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
		    {
		        title: '이벤트 제목',
		        start: '2024-07-15',
		        end: '2024-07-20',
		        allDay: true,  // 종일 이벤트임을 명시
		    },
		    {
		        title: '이벤트 제목2',
		        start: '2024-07-15',
		        allDay: true  // 종일 이벤트임을 명시
		    }
		    // 추가적인 이벤트 데이터
		],
		// 날짜 클릭 시 이벤트
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
	
	// 출석체크 버튼 이벤트 리스너
	document.getElementById('attendance-check').addEventListener('click', function() {
	    var today = new Date();
		// 출석체크가 이미 되어 있다면
	    if (isAttendanceMarked(today)) {
	        alert('이미 출석체크를 완료하셨습니다.');
	        return;
	    }
	    markAttendance(today);
	    alert(today.toLocaleDateString() + '에 출석체크 되었습니다!');
	});
	
	// 출석체크 여부 판단 함수
	function isAttendanceMarked(date) {
	    var dateStr = date.toLocaleDateString('en-CA');
	    var attendanceDates = JSON.parse(localStorage.getItem('attendanceDates') || '[]');
	    return attendanceDates.includes(dateStr);
	}
	
	// 날짜에 출석체크 표시 추가 함수
	function markAttendance(date) {
	    var dateStr = date.toLocaleDateString('en-CA');
	    var cell = document.querySelector('.fc-day[data-date="' + dateStr + '"]');
	    
	    if (cell) {
	        if (isAttendanceMarked(date)) {
	            return;  // 이미 출석체크 완료
	        }

	        // 새로운 출석 표시 추가
	        var mark = document.createElement('div');
	        mark.className = 'attendance-mark';
	        mark.style.position = 'absolute';
	        mark.style.top = '5px';
	        mark.style.left = '5px';
	        mark.style.width = '20px';
	        mark.style.height = '20px';
	        mark.style.backgroundImage = 'url("../img/출석완료이미지.png")';
	        mark.style.backgroundSize = 'cover';
	        
	        var dayTop = cell.querySelector('.fc-daygrid-day-top');
	        if (dayTop) {
	            dayTop.style.position = 'relative';
	            dayTop.appendChild(mark);
	        } else {
	            cell.appendChild(mark);
	        }

	        // 로컬 스토리지에 출석 정보 저장
	        var attendanceDates = JSON.parse(localStorage.getItem('attendanceDates') || '[]');
	        attendanceDates.push(dateStr);
	        localStorage.setItem('attendanceDates', JSON.stringify(attendanceDates));
	    }

	    // 출석체크 버튼 비활성화
	    updateAttendanceButton();
	}
	
	// 출석체크 버튼 함수 
	function checkAttendance(date, cell) {
	    var dateStr = date.toLocaleDateString('en-CA');
	    var cell = document.querySelector('.fc-day[data-date="' + dateStr + '"]');
		
		// 출석체크 판단 코드
		var attendanceDates = JSON.parse(localStorage.getItem('attendanceDates') || '[]');
	        
	    if (cell && attendanceDates.includes(dateStr)) {
	        var existingMark = cell.querySelector('.attendance-mark');
	        if (!existingMark) {
	            var mark = document.createElement('div');
	            mark.className = 'attendance-mark';
	            mark.style.position = 'absolute';
	            mark.style.top = '5px';
	            mark.style.left = '5px';
	            mark.style.width = '20px';
	            mark.style.height = '20px';
	            mark.style.backgroundImage = 'url("../img/출석완료이미지.png")';
	            mark.style.backgroundSize = 'cover';
	            
	            var dayTop = cell.querySelector('.fc-daygrid-day-top');
	            if (dayTop) {
	                dayTop.style.position = 'relative';
	                dayTop.appendChild(mark);
	            } else {
	                cell.appendChild(mark);
	            }
	        }
	    }
	    
	    // 출석체크 버튼 상태 업데이트
	    updateAttendanceButton();
	}
	
	// 출석 버튼의 표시 여부 관리 함수
	function updateAttendanceButton() {
	    var today = new Date();
	    var attendanceButton = document.getElementById('attendance-check');
	    if (isAttendanceMarked(today)) {
	        attendanceButton.style.display = 'none';
	    } else {
	        attendanceButton.style.display = 'flex';
	    }
	}
    
	// 초기 체크 (페이지 로드 시 실행)
	document.addEventListener('DOMContentLoaded', function() {
	    checkAttendance(new Date());
	});
});
