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



    //생년월일 : 4자리 2자리 2자리로 끊어서 각 id에 셋팅하기

    //성별 : 라디오 박스 'male' 'female'과 비교하여 각각의 id에 cheked하기

    //전화번호 : 앞3자리 뒤4자리해서 각각 끊어서 넣고 나머지 가운데는 가운데 자리에 넣기
    //각 id에 맞게 셋팅하기

    $('.ok_button').click(function () {
        var mb_pw = $('#input_pw').val();

        // pwCheck(mb_pw);
        $.ajax({
            type: "post",
            url: "/myInfoPwCheckProc.do",
            data: {"mb_pw":mb_pw},
            datatype:"text",
            cache: false,
            async: false,
            success: function (data) {
                if (data == 'success') {
                    location.replace("/modiInfo.do");
                } else {
                    alert('비밀번호가 틀렸습니다.');
                }
            },
            error: function () {
                alert('실행오류!');
            }
        });

    });

});


function pwCheck(mb_pw) {
    console.log(mb_pw);

}

/* var frm = $('.frm');
 frm.attr("action","/modiInfo.do");
 frm.submit();*/
/*값을 전부다 가져갈때, 비동기가 아닐때 사용 (새로고침해서 새롭게 화면을 구성하게되므로 속도가 느리고 데이터 낭비됨) */


// 비밀번호 일치 불일치 확인
/*function pw_chk(input_pw, db_pw) {
var successUrl = "modiInfo.do";

if (input_pw !== db_pw ) {
alert("일치하지 않는 비밀번호입니다");
} else if (input_pw===db_pw) {
content.load(successUrl);
}
}*/

