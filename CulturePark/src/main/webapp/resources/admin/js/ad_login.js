$(document).ready(function () {

    $('.btn_login').click(function () {
        var email = $('input[name=ad_email]').val();
        var pw = $('input[name=ad_pw]').val();
        var frm = $('#frm');

        if (email.trim() === '') {
            alert("이메일을 입력해주세요.");
        } else if (pw.trim() === '') {
            alert("비밀번호를 입력해주세요");
        } else {
            frm.attr("action", "/culturePark/admin/loginProc.ado");
            frm.submit();
        }

    });

});
