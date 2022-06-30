$(document).ready(function() {

/* 이전 */
$('.back').click(function(){
    window.history.back();
});

/* 아이디 기억하기 */
 /*   var log_memory;
    $('.save_id').click(function () {
        if ($(".save_id").prop("checked")) {
            log_memory = "checked";
        } else {
            log_memory = "notChecked";
        }
        return log_memory;
    });*/

/* 로그인 */
    $('.login_btn_p').click(function () {
        var mb_email = $('.p_id_value').val();
        var mb_pw = $('.p_pw_value').val();
        var json = {"mb_email": mb_email, "mb_pw": mb_pw};
        loginFunction(json);
    });

    $('.login_btn_m').click(function(){
        var mb_email = $('.m_id_value').val();
        var mb_pw = $('.m_pw_value').val();
        var json = {"mb_email": mb_email, "mb_pw": mb_pw};
        loginFunction(json);
    });

});

    /* 로그인 */
    function loginFunction(obj) {
        $.ajax({
            type:"POST",
            url:"/loginProc.do",
            data: JSON.stringify(obj) ,
            datatype:"text",
            cache:false,
            async:false,
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

