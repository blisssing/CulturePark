$(document).ready(function () {

    $('.check_btn').click(function () {

        var input_pw = $('input[name=input_pw]').val();
        var db_pw = "wlsgml";

        if (input_pw !== db_pw ) {
            alert("일치하지 않는 비밀번호입니다");
        } else if (input_pw===db_pw) {
            $('저장')
        }
    });

    $('.cancel_btn').click(function () {
        history.back();
    });


});