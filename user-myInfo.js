$('#frmMyInfo')
    .attr("action", "/pages/modify")
    .attr("method", "post")
    .on('submit', (e) => {
        e.preventDefault();

        const password = $("input[name=password]").val();
        const password2 = $("input[name=password2]").val();
        const userName = $("input[name=userName]").val();
        const userTel = $("input[name=userTel]").val();

        // 이름 유효성 검사
        if (userName.trim() === '') {
            alert('이름을 입력해주세요.');
            return false;
        }
        if (userName.length > 50) {
            alert('이름은 50자 이내로 입력해주세요.');
            return false;
        }

        // 전화번호 유효성 검사
        const telRegex = /^01[016789]-?[^0][0-9]{2,3}-?[0-9]{3,4}$/;
        if (!telRegex.test(userTel)) {
            alert('올바른 전화번호 형식이 아닙니다.');
            return false;
        }

        // 비밀번호 필드에 입력이 있을 때만 유효성 검사를 수행합니다.
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
                alert('비밀번호에 대문자를 포함해야 합니다.');
                return false;
            }

            if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)) {
                alert('비밀번호에 특수문자를 포함해야 합니다.');
                return false;
            }
        }

        // 모든 검증 통과 시 폼 제출
        e.target.submit();
        return true;
    });
