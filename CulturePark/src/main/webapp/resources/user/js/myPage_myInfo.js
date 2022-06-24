$(document).ready(function () {


    // 1. 비밀번호 검증
    content = $('#content');
    input_pw = $('input[name=mb_pw]');
    /*db_pw = "wlsgml";*/ // 임시 DB값 비밀번호. 실사용할 땐 전역변수로 사용하지 말 것


    //1. 비밀번호 확인

    // 버튼 클릭
    /*   $('.ok_btn').click(function () {
           pw_chk(input_pw.val(), db_pw);
       });*/


    // 엔터 키 이벤트
 /*   input_pw.keydown(function (e) {
        if (e.keyCode === 13) { // 13 : Enter
            pw_chk(input_pw.val(), db_pw);
        }
    });*/

    $('.cancel_btn').click(function () {
        history.back();
    });


    //확인버튼 클릭시 (pwCheck)
    $('.ok_button').click(function () {
        var mb_pw = $('#input_pw').val();

        var exist_pw = "";
        var mb_pw = $('#input_pw').val();
        /* var input_pw = $('.inputPw').val();*/
        var existPw = "";

        innerLoginPw(mb_pw);

        if (existPw === 'success') {
            alert("올바른 비밀번호입니다.");
        }else {
            alert("존재하지않는 비밀번호입니다. 다시 입력해주세요.");
            $('.inputPw').focus();
        }
    });
});


function innerLoginPw(mb_pw){
    $.ajax({
        type: "post",
        url: "/myInfoLoginProc.do",
        data: {"mb_pw": mb_pw},
        datatype: "text",
        cache: false,
        async: false,
        success:function(data) {
            existPw = data;
            /*location.href="";*/
            /* var frm = $('.frm');
             frm.attr("action","/modiInfo.do");
             frm.submit();*/
            /*값을 전부다 가져갈때, 비동기가 아닐때 사용 (새로고침해서 새롭게 화면을 구성하게되므로 속도가 느리고 데이터 낭비됨) */
        }
    });
}

// 비밀번호 일치 불일치 확인
/*function pw_chk(input_pw, db_pw) {
var successUrl = "modiInfo.do";

if (input_pw !== db_pw ) {
alert("일치하지 않는 비밀번호입니다");
} else if (input_pw===db_pw) {
content.load(successUrl);
}
}*/

