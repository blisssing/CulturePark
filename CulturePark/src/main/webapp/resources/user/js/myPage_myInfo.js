$(document).ready(function () {


    // 1. 비밀번호 검증
    content = $('#content');
    input_pw = $('input[name=input_pw]');
    db_pw = "wlsgml"; // 임시 DB값 비밀번호. 실사용할 땐 전역변수로 사용하지 말 것


//1. 비밀번호 확인

    // 버튼 클릭
    $('.check_btn').click(function () {
        pw_chk(input_pw.val(), db_pw);
    });

    // 엔터 키 이벤트
    input_pw.keydown(function (e) {
        if (e.keyCode === 13) { // 13 : Enter
            pw_chk(input_pw.val(), db_pw );
        }
    });

    $('.cancel_btn').click(function () {
        history.back();
    });



});


// 비밀번호 일치 불일치 확인
function pw_chk(input_pw, db_pw) {
    var successUrl = "modiInfo.do";

    if (input_pw !== db_pw ) {
        alert("일치하지 않는 비밀번호입니다");
    } else if (input_pw===db_pw) {
        content.load(successUrl);
    }
}

