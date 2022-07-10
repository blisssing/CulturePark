$(document).ready(function() {

    /* 이전 */
    $('.back').click(function () {
        window.history.back();
    });

    /* 아이디 기억하기 */
    //https://gbsb.tistory.com/99

    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $(".mb_email").val(key);

    if ($(".mb_email").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }

    $(".checkbox_save_id").change(function () { // 체크박스에 변화가 있다면,
        if ($(".checkbox_save_id").is(":checked")) { // ID 저장하기 체크했을 때,
            setCookie("key", $(".mb_email").val(), 7); // 7일 동안 쿠키 보관
        } else { // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });

    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $(".mb_email").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
        if ($(".checkbox_save_id").is(":checked")) { // ID 저장하기를 체크한 상태라면,
            setCookie("key", $(".mb_email").val(), 7); // 7일 동안 쿠키 보관
        }
    });


    /* 로그인 */
    $('.login_btn_p').click(function () {
        var mb_email = $('.p_id_value').val();
        var mb_pw = $('.p_pw_value').val();
        var json = {"mb_email": mb_email, "mb_pw": mb_pw};
        loginFunction(json);
    });

    $('.login_btn_m').click(function () {
        var mb_email = $('.m_id_value').val();
        var mb_pw = $('.m_pw_value').val();
        var json = {"mb_email": mb_email, "mb_pw": mb_pw};
        loginFunction(json);
    });


    /* 카카오 API 로그인 */

    /* var kakaoInfo = '${kakaoInfo}';

     if(kakaoInfo !== "") {
         var data = JSON.parse('kakaoInfo');

         alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
         alert(
             "user : \n" + "email : "
             + data['email']
             + "\n nickname : "
             + data['nickname']);
     }
 });*/

    /* 로그인 */
    function loginFunction(obj) {
        $.ajax({
            type: "POST",
            url: "/loginProc.do",
            data: JSON.stringify(obj),
            datatype: "text",
            cache: false,
            async: false,
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                if (data === 'success') {
                    location.href = "/home.do";
                } else {
                    console.log(data);
                    alert('일치하지 않는 비밀번호입니다');
                }
            },
            error: function () {
                alert('실행오류!!');
            },
        });
    }


    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1) end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }

});

    /* 카카오 API */
    //https://tyrannocoding.tistory.com/61
    //https://velog.io/@ohjs813/Spring-%EC%B9%B4%EC%B9%B4%EC%98%A4-%EB%A1%9C%EA%B7%B8%EC%9D%B8-REST-API

    //카카오로그인
/*
    function kakaoLogin() {

        $.ajax({
            url: '/kakaoLogin',
            type: 'POST',
            async: false,
            dataType: 'text',
            success: function (res) {
                location.href = res;
            }
        });

    }
*/


