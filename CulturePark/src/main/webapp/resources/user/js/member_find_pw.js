$(document).ready(function() {

    /* 이전 */
    $('.back').click(function () {
        window.history.back();
    });

    /* 로그인 버튼 */
    /*  $('.login_btn').click(function () {
          window.opener.location.href = "/login.do";
          window.close();
      })*/



    //동작방식 다름. 메일 인증번호 보내기 구현.
    //admin > Manager_PartnerRequestController > agreePartnerRequest


    /* 라디오 박스 체크시 셋팅 (이메일) */
    $('.email_radio').on('click', function () {

        //이름, 이메일, 인증번호,
        $('.email_set').css('display', 'flex');
        $('.phone_set').css('display', 'none');

        $('.code_send_email').css('display', 'flex');
        $('.code_send_phone').css('display', 'none');

    });

    /* 라디오 박스 체크시 셋팅 (핸드폰) */
    $('.phone_radio').on('click', function () {

        //이름, 휴대폰, 인증번호,
        $('.phone_set').css('display', 'flex');
        $('.email_set').css('display', 'none');

        $('.code_send_phone').css('display', 'flex');
        $('.code_send_email').css('display', 'none');
    });


    /* 키보드 입력 이벤트 핸들러 */
    $('#find_code_value').keyup(function (e) {

        var input_wrap = $('#find_code_value');
        var length = input_wrap.val().length;
        var btn_wrap = $('#pw_ok_btn');

        if (length === 6) {
            btn_wrap.focus();
        }
        console.log(length);
    });

    //라디오박스 클릭시
    $('.email_radio').click(function(){

        $('#find_name_value').val("");
        $('#find_email_value').val("");
        $('#authentication_code').val("");
    });

    //핸드폰 클릭시
    $('.phone_radio').click(function(){

        $('#find_name_value').val("");
        $('#find_phone_value_1').val("");
        $('#find_phone_value_2').val("");
        $('#find_phone_value_3').val("");
        $('#authentication_code').val("");
    });


    /* 값 처리  */
    $(".find_pw_ok_btn").click(function () {

        var radio_select = $('input[name="type_chk"]:checked').val();
        // 이메일
       /* if ($('input[name=type_chk]).val() === 'email') {*/
        if(radio_select === 'email'){

            var name_val = $('#find_name_value').val(); //이름
            var email_val = $('#find_email_value').val(); //이메일
            var code_val = $('#authentication_code').val();
            var json = {"mb_name": name_val, "mb_email": email_val, "code_val":code_val};

            chkInsertEmail();
            findPwFunc(json);

        // 핸드폰
        } else if (radio_select === 'phone') {
            var name_val = $('#find_name_value').val(); //이름

            var tel1_val = $('#find_phone_value_1').val();
            var tel2_val = $('#find_phone_value_2').val();
            var tel3_val = $('#find_phone_value_3').val();

            var phone = tel1_val+'-'+ tel2_val+'-'+tel3_val; //번호


            var json = {"mb_name": name_val, "mb_tel": phone};

            chkInsertTel();
            findPwFunc(json);
        }
    });


    /* 인증번호 보내기 (email) */
    $('.code_send_email').click(function () {


        var email = $('#find_email_value').val();



        if (email.trim() === '') {
            alert("이메일을 입력해주세요");

        } else {
            alert("인증코드 발송이 완료되었습니다.\n이메일에서 인증코드를 확인해 주십시오");


            $('input[name=code_send_email]').attr('value', '재발송');

            $('.code_send_email').prop("disabled", false);
            $('.code_send_ok_phone').prop("disabled", false);
            $('#find_email_value').prop("disabled", true);

            // sendSMSm(email);
            code = "1234"; // 임시 코드
        }
    });

    /* 인증번호 보내기 (phone) */
    $('.code_send_phone').click(function () {


        var first_num = $('.tel_1').val();
        var second_num = $('.tel_2').val()
        var third_num = $('.tel_3').val();

        console.log(first_num)

        if (first_num === '0') {
            alert("전화번호 첫번째 자리를 선택해주세요");
        } else if (second_num.trim() === '') {
            alert("전화번호 두 번째 자리를 입력해주세요");
        } else if (third_num.trim() === '') {
            alert("전화번호 세 번째 자리를 입력해주세요");
        } else {
            alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해 주십시오");

            var phone = first_num + second_num + third_num;

            $('input[name=code_send_phone]').attr('value', '재발송');

            $('.code_send_phone').prop("disabled", false);
            $('.code_send_ok_phone').prop("disabled", false);
            $('.tel_1').prop("disabled", true);
            $('.tel_3').prop("disabled", true);
            $('.tel_2').prop("disabled", true);

            // sendSMS(phone);
            code = "1234"; // 임시 코드
        }
    });




    /* 인증번호 확인 */
    $('.code_chk_ok').click(function () {

        var input_email = $('#find_email_value').val();

        var first_num = $('.tel_1').val();
        var second_num = $('.tel_2').val()
        var third_num = $('.tel_3').val();
        var phone = first_num + second_num + third_num;

        if(input_email != null){

            var chk_email_result;
            var authen_code_m = $('.authentication_code').val();

            if (code === authen_code_m) {
                chk_email_result = "able";
                alert("인증되었습니다.");
            } else {
                chk_email_result = "disable"
                alert("인증코드가 틀렸습니다. 다시 인증해주세요");
            }

        } else if (phone != null){

            var chk_phone_result;
            var authen_code_p = $('.authentication_code').val();

            if (code === authen_code_p) {
                chk_phone_result = "able";
                alert("인증되었습니다.");
            } else {
                chk_phone_result = "disable"
                alert("인증번호가 틀렸습니다. 다시 인증해주세요");
            }
        }

    });

    //새 비밀번호 확인
    $('.input_pw').keyup(function () {
        var newPw_check = "disable";

        var first_pw = $('.pw_value').val().trim();
        var sec_pw = $('.rePw_value').val().trim();
        var result_label = $('.pw_check');

        if (first_pw === '') {
            result_label.text("1차 비밀번호를 입력해주세요");
            result_label.attr("style", "color:#FF0000");
        } else if (sec_pw === '') {
            result_label.text("2차 비밀번호를 입력해주세요");
            result_label.attr("style", "color:#FF0000");
        } else if (first_pw !== sec_pw) {
            result_label.text("비밀번호가 일치하지 않습니다");
            result_label.attr("style", "color:#FF0000");
        } else {
            var result_pw = chkPW(first_pw);

            if (result_pw === -1) {
                result_label.text("비밀번호는 8자이상 20자 이하로 설정해주세요");
                result_label.attr("style", "color:#FF0000");
                newPw_check = "disable";
            } else if (result_pw === -2) {
                result_label.text("비밀번호에는 공백이 들어갈 수 없습니다");
                result_label.attr("style", "color:#FF0000");
                newPw_check = "disable";
            } else if (result_pw === -3) {
                result_label.text("비밀번호에는 반드시 영문,특수문자,숫자를 포함시켜야 합니다");
                result_label.attr("style", "color:#FF0000");
                newPw_check = "disable";
            } else {
                newPw_check = "able";
                result_label.text("사용가능한 비밀번호입니다");
                result_label.attr("style", "color:#0067a3");
            }
        }
    });



    $('.new_ok_btn').click(function () {

        /*var newPw_check = $('.new_ok_btn').val();*/

       /* if (newPw_check.equals("able")) {*/

    if ($('.pw_value').val().trim() !== '' && $('.rePw_value').val().trim() !== '') {

        alert('비밀번호가 변경되었습니다. 다시 로그인해주세요.');
        window.close();
        window.opener.location.href = "/login.do";


    } else {
        if ($('.pw_value').val().trim() === '') {
            alert('새 비밀번호를 입력해주세요');
            $('.pw_value').focus();
        } else if ($('.rePw_value').val().trim() === '') {
            alert('새 비밀번호를 재입력 해주세요');
            $(".rePw_value").focus();
        }
        return false;
    }
    });


    $('.new_cancel_btn').click(function () {
        window.close();
        window.opener.location.href = "/home.do";
    });

    $('.fail_ok_btn').click(function () {
        window.close();
        window.opener.location.href = "/findPw.do";
    });


})


/* 비밀번호 유효성검사 */
function chkPW(pw) {
    // pw =('선택자').val() 혹은 .text()의 형태로 값을 넣을 것
    // 두 비밀번호가 일치할 경우 비밀번호 정규식 검사
    var num = pw.search(/[0-9]/g); // 숫자가 들어가 있는지
    var eng = pw.search(/[a-z]/ig);// 영문이 들어가 있는지
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); // 특수문자가 들어가있느닞

    if (pw.length < 8 || pw.length > 20) {
        return -1;
    } else if (pw.search('/\s/') !== -1) {
        return -2;
    } else if (num < 0 || eng < 0 || spe < 0) {
        return -3;
    } else {
        console.log('통과');
        return 1;
    }

}


/* 라디오타입 이메일 유효성*/
function chkInsertEmail() {

    if ($("#find_name_value").val().trim() !== ''
        && $("#find_email_value").val().trim() !== ''
        && $("#authentication_code").val().trim() !== '') {
        return true;

    } else {
        if ($("#find_name_value").val().trim() === '') {
            alert('이름을 입력해주세요');
            $("#find_name_value").focus();
        } else if ($("#find_email_value").val().trim() === '') {
            alert('이메일을 입력해주세요');
            $("#find_email_value").focus();
        } else if ($("#authentication_code").val().trim() === '') {
            alert('인증코드를 입력해주세요');
            $("#authentication_code").focus();
        }
        return false;
    }
}

/* 라디오타입 번호 유효성 */
function chkInsertTel() {

    if ($("#find_name_value").val().trim() !== ''
        && $("#find_phone_value_1").val().trim() !== ''
        && $("#find_phone_value_2").val().trim() !== ''
        && $("#find_phone_value_3").val().trim() !== ''
        && $("#authentication_code").val().trim() !== '') {
        return true;
    } else {
        if ($("#find_name_value").val().trim() === '') {
            alert('이름을 입력해주세요');
            $("#find_name_value").focus();
        } else if ($("#find_phone_value_1").val().trim() === '') {
            alert('전화번호를 입력해주세요');
            $("#find_phone_value_1").focus();
        } else if ($("#find_phone_value_2").val().trim() === '') {
            alert('전화번호를 입력해주세요');
            $("#find_phone_value_2").focus();
        } else if ($("#find_phone_value_3").val().trim() === '') {
            alert('전화번호를 입력해주세요');
            $("#find_phone_value_3").focus();
        } else if ($("#authentication_code").val().trim() === '') {
            alert('인증코드를 입력해주세요');
            $("#authentication_code").focus();
        }
        return false;
    }
}

//json
function findPwFunc(obj){
    $.ajax({
        type:"POST",
        url:"/culturePark/findPwProc.do",
        data: JSON.stringify(obj),
        datatype:"JSON",
        cache:false,
        async:false,
        contentType: 'application/json; charset=utf-8',
        success: function (data){
            if(data == 'success'){
                    console.log("success");
                    window.open("/findPwResult.do", "member_find_pw_newPw", "width:600px, height:300px")
            } else{
                    console.log("failed");
                    window.open("/findPwResult.do", "member_find_pw_newPw", "width:600px, height:300px")
            }
        },
        error: function(){
            alert('실행오류!!');
        },
    });
}

//인증코드
function sendSMSm(email){
    $.ajax({
        type: "post",
        dataType: "text",
        url: "/culturePark/chkEmailSms.do",
        cache: false,
        data: {email: email},
        success: function (data) {
            if (data == "error") {
                alert("휴대전화 번호가 올바르지 않습니다");
            } else {
                code = data;
            }
        }
    });
}

//인증번호
function sendSMS(phone) {
    $.ajax({
        type: "post",
        dataType: "text",
        url: "/culturePark/chkPhoneSms.do",
        cache: false,
        data: {phone: phone},
        success: function (data) {
            if (data == "error") {
                alert("휴대전화 번호가 올바르지 않습니다");
            } else {
                code = data;
            }
        }
    });
}


    /* 1. 검증 */
   /* function chkMemberIsEmail(inserted_name, inserted_email, inserted_code) {
        if (checkDBValuesEmail(inserted_name, inserted_email, inserted_code) === 1) { // 성공창
            // To do : 파라미터 값을 넘겨주기
            window.open("/findPwResult.do?a=1", "member_find_pw_result", "width=600px, height=300px")
        } else {
            window.open("/findPwResult.do?a=2", "member_find_pw_result", "width=600px, height=300px")
        }
    }*/


    /* 1. 검증 */
   /* function chkMemberIsTel(inserted_name, inserted_tel1, inserted_tel2, inserted_tel3, inserted_code) {

        if (checkDBValuesTel(inserted_name, inserted_tel1, inserted_tel2, inserted_tel3, inserted_code) === 1) { // 성공창
            // To do : 파라미터 값을 넘겨주기
            window.open("/findPwResult.do?a=1", "member_find_pw_result", "width=600px, height=300px")
        } else {
            window.open("/findPwResult.do?a=2", "member_find_pw_result", "width=600px, height=300px")
        }
    }*/

    /* 2. DB 값 조회 및 비교 */
    /*function checkDBValuesTel(inserted_name, inserted_tel1, inserted_tel2, inserted_tel3, inserted_code) {
        // To do : DB에 들어가서 값을 조회하는 코드 작성해주기
        return 1;
    }
*/











