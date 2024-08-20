$(function(){
    $('#frmMyInfo')
        .attr("action", "/pages/modify")
        .attr("method", "post")
        .on('submit', (e) => {
            e.preventDefault();

            // 폼 필드 값 가져오기
            const password = $("input[name=password]").val();
            const password2 = $("input[name=password2]").val();
            const userName = $("input[name=userName]").val();
            const userTel = $("input[name=userTel]").val();

            // 이름 유효성 검사
            if (userName.trim() === '') {
                Swal.fire({
                    title: '알림',
                    text: '이름을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (userName.length > 50) {
                Swal.fire({
                    title: '알림',
                    text: '이름은 50자 이내로 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }

            // 전화번호 유효성 검사
            const telRegex = /^01[016789]-?[^0][0-9]{2,3}-?[0-9]{3,4}$/;
            if (!telRegex.test(userTel)) {
                Swal.fire({
                    title: '알림',
                    text: '올바른 전화번호 형식이 아닙니다.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }

            // 비밀번호 유효성 검사 (비밀번호 필드에 입력이 있을 때만 수행)
            if (password || password2) {
                // 비밀번호 일치 여부 확인
                if (password !== password2) {
                    Swal.fire({
                        title: '알림',
                        text: '비밀번호가 일치하지 않습니다.',
                        icon: 'warning',
                        confirmButtonText: '확인'
                    });
                    return false;
                }

                // 비밀번호 유효성 검사
                if (!isValidPassword(password)) {
                    Swal.fire({
                        title: '알림',
                        html: '비밀번호는 다음 조건을 만족해야 합니다<br><br>' +
                            '• 최소 8자 이상<br><br>'+
                            '• 대문자, 특수문자 포함',
                        icon: 'warning',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
            }

            // 모든 검증 통과 시 폼 제출
            e.target.submit();
            return true;
        });
});

// 비밀번호 유효성 검사 함수
function isValidPassword(password) {
    // 최소 8자 이상
    if (password.length < 8) return false;

    // 대문자 포함
    if (!/[A-Z]/.test(password)) return false;

    // 특수문자 포함
    if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)) return false;

    return true;
}