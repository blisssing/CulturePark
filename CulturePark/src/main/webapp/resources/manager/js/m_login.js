$(document).ready(function () {

    $('.login_btn').click(function () {
        var email = $('#InputEmail').val();
        var pw = $('#InputPassword').val();
        var loginType = $('input[name=loginType]:checked').val();
        console.log("로그인 타입 :" + loginType)
        if (loginType === 'partner') {
            $.ajax({
                type: "post",
                data: {"pt_pw": pw, "pt_email": email},
                url: "/loginProc.mdo",
                async: false,
                cache: false,
                success: function (data) {

                    if (data === 'success') {
                        alert("파트너 로그인 성공");
                    } else {
                        alert("파트너 로그인 실패")
                    }
                },
                error: function () {
                    alert("파트너 작동 실패");
                }

            });
        } else {
            $.ajax({
                type: "post",
                data: {"mg_pw": pw, "mg_email": email},
                url: "/loginProc.mdo",
                async: false,
                cache: false,
                success: function (data) {

                    if (data === 'success') {
                        alert("파트너 로그인 성공");
                    } else {
                        alert("파트너 로그인 실패")
                    }
                },
                error: function () {
                    alert("파트너 작동 실패");
                }
            })
        }


    });

});