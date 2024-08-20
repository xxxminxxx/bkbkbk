$('#submitBook').submit(function(e){
    e.preventDefault();

    let selectedText = $('#doName option:selected').text();
    let selectedText2 = $('#localCode option:selected').text();
    if(selectedText == '시/도 선택' || selectedText =='') {
        Swal.fire({
            title: '알림',
            text: '시/도를 선택해주세요.',
            icon: 'warning',
            confirmButtonText: '확인',
            confirmButtonColor: '#3085d6'
        });
        return false;
    }

    if(selectedText2 == '구/군 선택' || selectedText2 == '') {
        Swal.fire({
            title: '알림',
            text: '구/군을 선택해주세요.',
            icon: 'warning',
            confirmButtonText: '확인',
            confirmButtonColor: '#3085d6'
        });
        return false;
    };
    openLoading();
    setTimeout(function(){
        $('#submitBook')[0].submit(); // 5초 후 폼을 직접 제출
    }, 1500);
});

function openLoading() {
    //화면 높이와 너비
    let maskHeight = $(document).height();
    let maskWidth = window.document.body.clientWidth;
    //출력할 마스크 설정
    let mask ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    // 로딩 이미지 주소 및 옵션
    let loadingImg ='';
    loadingImg += "<div id=\"loadingImg\" style=\"\n" +
        "    position: absolute;\n" +
        "    top: 60%;\n" +
        "    left: 50%;\n" +
        "    transform: translate(-50%, -50%);\n" +
        "    width: auto;\n" +
        "    z-index: 99999999;\n" +
        "\">\n" +
        "    <dotlottie-player src=\"https://lottie.host/eb94876c-48d1-4f67-9c64-8b4639831ee9/UQHGguuYGA.json\" background=\"transparent\" speed=\"1\" style=\"width: 300px; height: 300px;\" loop autoplay></dotlottie-player>\n"+
        "</div>";

    loadingImg += "</div>";

    //레이어 추가
    $('body')
        .append(mask)
        .append(loadingImg)
    //마스크의 높이와 너비로 전체 화면을 채우기
    $('#mask').css({
        'width' : maskWidth,
        'height': maskHeight,
        'opacity' :'0.3'
    });
    //마스크 표시
    $('#mask').show();
    //로딩 이미지 표시
    $('#loadingImg').show();
}

$(function() {
    // URL에서 쿼리 파라미터 추출
    const query = window.location.search;
    const param = new URLSearchParams(query);
    const doName = param.get('doName');
    const localCode = param.get('localCode');

    // 도(시/도) 선택 드롭다운에 변경 이벤트 리스너 추가
    $('.doSelect').on('change', fetchGuguns);

    // 페이지 진입 시 이미 선택된 도시 표기
    $('#doName').val(doName).trigger("change");

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
                success: function (response) {
                    let gugunSelect = $('.gugunSelect');
                    // 구/군 선택 드롭다운 초기화
                    gugunSelect.html('<option value="" selected disabled>구/군 선택</option>');
                    // 받아온 구/군 목록으로 드롭다운 옵션 생성
                    response.forEach(function (gugun) {
                        gugunSelect.append($('<option>', {
                            value: gugun.localCode,
                            text: gugun.city
                        }));
                    });
                    // 이미 선택된 구가 있으면 selected 상태로 설정
                    $('#localCode').val(localCode).trigger("change");
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
        let latitude = parseFloat(row.cells[5].textContent);
        let longitude = parseFloat(row.cells[6].textContent);
        let localCode = row.cells[7].textContent;
        let libraryCode = row.cells[8].textContent;

        // 지도를 표시할 div 요소 가져오기 및 표시 설정
        let mapDiv = document.getElementById('map');
        mapDiv.style.display = 'block';

        //지도 옵션 설정
        let options = {
            center: new kakao.maps.LatLng(latitude, longitude),
            level: 3
        };

        // 지도 생성
        map = new kakao.maps.Map(mapDiv, options);

        // 마커 생성 및 지도에 표시
        let markerPosition = new kakao.maps.LatLng(latitude, longitude);
        let marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map);

        // 인포윈도우 내용 설정
        let iwContent = '<div style="padding:5px; width:300px;">' + 
            '도서관명: ' + libraryName + '<br>' + 
            '주소: ' + address + '<br>' + 
            '전화번호: ' + libraryTel + '<br>' + 
            '<a href="' + url + '" target="_blank" style="color: orange; text-decoration: none;">바로가기</a>' + 
            '</div>';
        
        // 인포윈도우 생성
        let infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: true,
            width: 300
        });

        // 인포윈도우를 즉시 열기
        infowindow.open(map, marker);

        // 지도에 클릭 이벤트 추가 (인포윈도우 닫기)
        kakao.maps.event.addListener(map, 'click', function() {
            infowindow.close();
        });

        // 마커에 클릭 이벤트 추가 (인포윈도우 토글)
        kakao.maps.event.addListener(marker, 'click', function() {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
        });
    }
});