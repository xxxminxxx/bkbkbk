$(function() {
	
	  // 도(시/도) 선택 드롭다운에 변경 이벤트 리스너 추가
	  $('.doSelect').on('change', fetchGuguns);
	
	  // '위치찾기' 버튼들을 선택하고 각각에 클릭 이벤트 리스너 추가
	  let buttons = document.querySelectorAll('button[value="위치찾기"]');
	  	    buttons.forEach(function(button) {
	  	        button.addEventListener('click', function() {
	  	            findLocation(this);					
	  	        });
	  	    });
			
// 구/군 목록을 가져오는 함수
    function fetchGuguns() {
		// 선택된 도(시/도) 이름 가져오기
        let doName = $('.doSelect').val(); 
        if (doName) {
			// AJAX 요청으로 해당 도의 구/군 목록 가져오기
            $.ajax({
                url: '/getGuguns',
                type: 'GET',
                data: { doName: doName },
                success: function(response) {
                    console.log("/getGuguns 실행 결과 : " + response);
					let gugunSelect = $('.gugunSelect'); 
					// 구/군 선택 드롭다운 초기화
                    gugunSelect.innerHTML = '<option value="" selected disabled>구/군 선택</option>';
					// 받아온 구/군 목록으로 드롭다운 옵션 생성
					response.forEach(function(gugun) {
					                   gugunSelect.append($('<option>', {
					                       value: gugun.localCode,
					                       text: gugun.city
					                   }));
					               });
					           },
                error: function(error) {
                    alert('구/군 목록을 가져오는 데 실패했습니다.');
                    console.error("AJAX 요청 실패: ", error);
                }
            });
        }
    }

    let map;
	
	// 도서관 위치를 지도에 표시하는 함수
    function findLocation(button) {
		// 클릭된 버튼의 부모 행(tr)에서 도서관 정보 추출
        let row = button.closest('tr');
        let libraryName = row.cells[0].textContent;
        let address = row.cells[1].textContent;
        let libraryTel = row.cells[2].textContent;
        let url = row.cells[3].querySelector('a').href;
        let latitude = parseFloat(row.cells[4].textContent);
        let longitude = parseFloat(row.cells[5].textContent);
        let localCode = row.cells[6].textContent;
        let libraryCode = row.cells[7].textContent;
		
      console.log("1: " + libraryCode);
	  
	  	// 지도를 표시할 div 요소 가져오기 및 표시 설정
        let mapDiv = document.getElementById('map');
        mapDiv.style.display = 'block';
      console.log("2: " + mapDiv);
	  
	    //지도 옵션 설정
        let options = {
            center: new kakao.maps.LatLng(latitude, longitude),
            level: 3
        };
        console.log("3: " +options);
	  
	    // 지도 생성
        map = new kakao.maps.Map(mapDiv, options);
        console.log("map 생성 : " + map);
		
		// 마커 생성 및 지도에 표시
        let markerPosition = new kakao.maps.LatLng(latitude, longitude);
        let marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map);

		// 인포윈도우 내용 설정
        let iwContent = '<div style="padding:5px;">' +
                '도서관명: ' + libraryName + '<br>' +
                '주소: ' + address + '<br>' +
                '전화번호: ' + libraryTel + '<br>' +
                '<a href="' + url + '" target="_blank">웹사이트</a>' +
                '</div>';
		
		// 인포윈도우 생성
        let infowindow = new kakao.maps.InfoWindow({
            content : iwContent
        });

		// 마커에 마우스오버 이벤트 추가
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker);
        });
		
		// 마커에 마우스아웃 이벤트 추가
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });
    }
});
