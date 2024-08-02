$(function() {
	
	// 나의 정보 수정
    $('#frmMyInfo')
        .attr("action", "/pages/modify")
        .attr("method", "post")
		// 폼 제출 이벤트에 대한 핸들러
        .on('submit', (e) => {
            if ($("input[name=password2]").val() != $("input[name=password]").val()) {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            } else {
                $("#frmMyInfo").submit();
                return true;
            }
        })
});
