$(document).ready(function () {

    $('.login_btn').click(function () {
        var email = $('#InputEmail').val();
        var pw = $('#InputPassword').val();
        var loginType = $('input[name=loginType]:checked').val();
            $.ajax({
                type: "post",
                data: {"mg_pw": pw, "mg_email": email},
                url: "/loginProc.mdo",
                async: false,
                cache: false,
                success: function (data) {

                    if (data === 'success') {
                        location.replace("/index.mdo");
                    } else if (data === 'wrongPW') {
                        alert("일치하지 않는 비밀번호입니다");
                    } else {
                        alert("존재하지 않는 이메일입니다");
                    }
                },
                error: function () {
                    alert("작동실패");
                }

            });


    });

});