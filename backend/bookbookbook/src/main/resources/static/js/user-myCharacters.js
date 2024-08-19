$(function() {
    // 각 단계를 클릭할 경우
    $('.character-item').click(function(){
        // 클릭한 item의 단계
        var stage = $(this).attr('data-stage');
        // 클릭한 item의 잠금 상태
        var currentVisible = $(this).attr('data-visible');

        // data-visible = true인 경우 잠금 상태 X
        if (currentVisible === 'true') {
            // 해당 주소로 이동
            window.location.href = `/pages/user-myCharactersDetail?stage=${stage}`;
        }
    }); // end of .character-item
});