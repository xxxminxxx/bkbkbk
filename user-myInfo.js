$('#frmMyInfo')
    .attr("action", "/pages/modify")
    .attr("method", "post")
    .on('submit', (e) => {
        e.preventDefault();

        const password = $("input[name=password]").val();
        const password2 = $("input[name=password2]").val();

        // 비밀번호 필드에 입력이 있을 때만 유효성 검사
        if (password || password2) {
            if (password !== password2) {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }

            if (password.length < 8) {
                alert('비밀번호는 8자 이상이어야 합니다.');
                return false;
            }

            if (!/[A-Z]/.test(password)) {
                alert('대문자를 포함해야 합니다.');
                return false;
            }

            if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)) {
                alert('특수문자를 포함해야 합니다.');
                return false;
            }
        }

        // 모든 검증 통과 시 폼 제출
        e.target.submit();
        return true;
    });
