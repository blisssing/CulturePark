$(document).ready(function(){


/* 이전 */
$('.back').click(function(){
    window.history.back();
});

/* 라디오 박스 체크시 셋팅 */
$('.email_radio').on('click',function() {

    /*좋은거*/
    $('.phone_set').css('display', 'none');
    $('.email_set').css('display', 'flex');

    /*  $('.email_set').show();
    $('.phone_set').hide();*/
});

$('.phone_radio').on('click',function(){

    /* $('.phone_set').show();
    $('.email_set').hide();*/

    /* 좋은거*/
    $('.phone_set').css('display', 'flex');
    $('.email_set').css('display', 'none');

});

/* **************** 이메일로 찾을떄 ************* */
    

$(".find_pw_ok_btn").click(function() {
    var inserted_name = $('#find_name_value')
    var inserted_email = $('#find_jumin_value')
    var inserted_code = $('#find_code_value')

    var result_chk_insert = chkInsert();

    if (result_chk_insert) {
        chkMemberIs(inserted_name, inserted_email, inserted_code);
    } else {
        //Todo : 비정상 실행 결과
    }
});

function chkInsert() {
    if($("#find_name_value").val().trim() !== ''
        && $("#find_email_value").val().trim() !== ''
        && $("#find_code_value").val().trim() !== '') {
        return true;
    }else {
        if($("#find_name_value").val().trim() === ''){
            alert('이름을 입력해주세요');
            $("#find_name_value").focus();
        }else if($("#find_email_value").val().trim() === ''){
            alert('이메일을 입력해주세요');
            $("#find_email_value").focus();
        }else if($("#find_code_value").val().trim() === ''){
            alert('인증코드를 입력해주세요');
            $("#find_code_value").focus();
        }
        return false;
    }
}

    /* 1. 검증 */
    function chkMemberIs(inserted_name, inserted_email, inserted_code) {
        if (checkDBValues(inserted_name, inserted_email, inserted_code) === 1) { // 성공창
            // To do : 파라미터 값을 넘겨주기
            window.open("/findPwResult.do?a=1", "member_find_pw_result", "width=600px, height=300px")
        } else {
            window.open("/findPwResult.do?a=2", "member_find_pw_result", "width=600px, height=300px")
        }
    }

    /* 2. DB 값 조회 및 비교 */
    function checkDBValues(inserted_name, inserted_email, inserted_code){
        // To do : DB에 들어가서 값을 조회하는 코드 작성해주기
        return 1;
    }

    /* 키보드 입력 이벤트 핸들러 */
    $('#find_code_value').keyup(function(e) {
        var input_wrap = $('#find_code_value');
        var length = input_wrap.val().length;
        var btn_wrap = $('#pw_ok_btn');

        if (length === 6) {
            btn_wrap.focus();
        }
        console.log(length);
    });

    /* 좋은거 */
    /*  var tel1 = $(".tel_1").val();
      var tel2 = $(".tel_2").val();
      var tel3 = $(".tel_3").val();

      var intTel = parseInt(tel1);*/
    // ctrl+ shift + enter



    /* **************** 전화번호로 찾을떄 ************* */

    /* 수정할 차례 */

    $(".find_pw_ok_btn").click(function() {
        var inserted_name = $('#find_name_value')
        var inserted_email = $('#find_jumin_value')
        var inserted_code = $('#find_code_value')

        var result_chk_insert = chkInsert();

        if (result_chk_insert) {
            chkMemberIs(inserted_name, inserted_email, inserted_code);
        } else {
            //Todo : 비정상 실행 결과
        }
    });

    function chkInsert() {
        if($("#find_name_value").val().trim() !== ''
            && $("#find_email_value").val().trim() !== ''
            && $("#find_code_value").val().trim() !== '') {
            return true;
        }else {
            if($("#find_name_value").val().trim() === ''){
                alert('이름을 입력해주세요');
                $("#find_name_value").focus();
            }else if($("#find_email_value").val().trim() === ''){
                alert('이메일을 입력해주세요');
                $("#find_email_value").focus();
            }else if($("#find_code_value").val().trim() === ''){
                alert('인증코드를 입력해주세요');
                $("#find_code_value").focus();
            }
            return false;
        }
    }

    /* 1. 검증 */
    function chkMemberIs(inserted_name, inserted_email, inserted_code) {
        if (checkDBValues(inserted_name, inserted_email, inserted_code) === 1) { // 성공창
            // To do : 파라미터 값을 넘겨주기
            window.open("/findPwResult.do?a=1", "member_find_pw_result", "width=600px, height=300px")
        } else {
            window.open("/findPwResult.do?a=2", "member_find_pw_result", "width=600px, height=300px")
        }
    }

    /* 2. DB 값 조회 및 비교 */
    function checkDBValues(inserted_name, inserted_email, inserted_code){
        // To do : DB에 들어가서 값을 조회하는 코드 작성해주기
        return 1;
    }

    /* 키보드 입력 이벤트 핸들러 */
    $('#find_code_value').keyup(function(e) {
        var input_wrap = $('#find_code_value');
        var length = input_wrap.val().length;
        var btn_wrap = $('#pw_ok_btn');

        if (length === 6) {
            btn_wrap.focus();
        }
        console.log(length);
    });




    /* 이거는 수정해야함 */

    if($(".find_name_value").val() == "true" && $(".find_email_value").val() == "true" &&
        $(".tel_1").val() == "true" && $(".tel_2").val() == "true" && $(".tel_3").val() == "true"){
        return;
    }else{
        if($(".find_name_value").val() != "true"){
            alert('이름을 입력해주세요');
        }
        if($(".find_email_value").val() != "true"){
            alert('이메일을 입력해주세요');
        }
        if($(".tel_1").val() != "true"){
            alert('휴대폰 번호를 입력해주세요');
        }
        if($(".tel_2").val() != "true"){
            alert('휴대폰 번호를 입력해주세요');
        }
        if($(".tel_3").val() != "true"){
            alert('휴대폰 번호를 입력해주세요');
        }
        if($(".input_value").val() != "true"){
            alert('인증번호를 입력해주세요');
        }
        return false
    }
});
    



/* - - - - - - - - - - - - - - - - - - - - */


    /* 로그인 버튼 */

    $('.login_btn').click(function() {
        window.opener.location.href="/login.do";
        window.close();
    })

    /* 확인 버튼 */

    $('.ok_btn').click(function(){
        window.close();
    })






