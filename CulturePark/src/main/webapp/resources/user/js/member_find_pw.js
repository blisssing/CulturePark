$(document).ready(function(){

    /* 이전 */
    $('.back').click(function(){
        window.history.back();
    });

    /* 라디오 박스 체크시 셋팅 (이메일) */
    $('.email_radio').on('click',function() {

        /*좋은거*/
        $('.phone_set').css('display', 'none');
        $('.email_set').css('display', 'flex');

        /*  $('.email_set').show();
        $('.phone_set').hide();*/

    });

    /* 확인 버튼 클릭 시 */
    $(".find_pw_ok_btn").click(function () {

        var inserted_name = $('#find_name_value');
        var inserted_code = $('#find_code_value');

        // 이메일
        if($('input[name=type_chk]:checked').val()==='이메일'){
            var inserted_email = $('#find_jumin_value');
            var result_chk_insert = chkInsertEmail();

            if (result_chk_insert) {
                chkMemberIsEmail(inserted_name, inserted_email, inserted_code);
            } else {
                //Todo : 비정상 실행 결과
            }
        } else{
            // 휴대전화를 위한
            var inserted_tel1 = $('#find_phone_value_1');
            var inserted_tel2 = $('#find_phone_value_2');
            var inserted_tel3 = $('#find_phone_value_3');

            var result_chk_insert = chkInsertTel();

            if (result_chk_insert) {
                chkMemberIsTel(inserted_name, inserted_tel1, inserted_tel2, inserted_tel3, inserted_code);
            } else {
                //Todo : 비정상 실행 결과
            }
        }

    });

        /* 좋은거 */
        /*  var tel1 = $(".tel_1").val();
          var tel2 = $(".tel_2").val();
          var tel3 = $(".tel_3").val();

          var intTel = parseInt(tel1);*/
        // ctrl+ shift + enter


    /* 라디오 박스 체크시 셋팅 (핸드폰) */
    $('.phone_radio').on('click',function() {

        /* 좋은거*/
        $('.phone_set').css('display', 'flex');
        $('.email_set').css('display', 'none');

        /* $('.phone_set').show();
        $('.email_set').hide();*/
    });


    function chkInsertEmail() {

        if ($("#find_name_value").val().trim() !== ''
            && $("#find_email_value").val().trim() !== ''
            && $("#find_code_value").val().trim() !== '') {
            return true;

        } else {
            if ($("#find_name_value").val().trim() === '') {
                alert('이름을 입력해주세요');
                $("#find_name_value").focus();
            } else if ($("#find_email_value").val().trim() === '') {
                alert('이메일을 입력해주세요');
                $("#find_email_value").focus();
            } else if ($("#find_code_value").val().trim() === '') {
                alert('인증코드를 입력해주세요');
                $("#find_code_value").focus();
            }
            return false;
        }
    }

    // func for email

    /* 1. 검증 */
    function chkMemberIsEmail(inserted_name, inserted_email, inserted_code) {
        if (checkDBValuesEmail(inserted_name, inserted_email, inserted_code) === 1) { // 성공창
            // To do : 파라미터 값을 넘겨주기
            window.open("/findPwResult.do?a=1", "member_find_pw_result", "width=600px, height=300px")
        } else {
            window.open("/findPwResult.do?a=2", "member_find_pw_result", "width=600px, height=300px")
        }
    }

    /* 2. DB 값 조회 및 비교 */
    function checkDBValuesEmail(inserted_name, inserted_email, inserted_code) {
        // To do : DB에 들어가서 값을 조회하는 코드 작성해주기
        return 1;
    }

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

    //

    function chkInsertTel() {

        if ($("#find_name_value").val().trim() !== ''
            && $("#find_phone_value_1").val().trim() !== ''
            && $("#find_phone_value_2").val().trim() !== ''
            && $("#find_phone_value_3").val().trim() !== ''
            && $("#find_code_value").val().trim() !== '') {
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
                $("#find_email_value").focus();
            } else if ($("#find_code_value").val().trim() === '') {
                alert('인증코드를 입력해주세요');
                $("#find_phone_value_3").focus();
            }
            return false;
        }
    }

    /* 1. 검증 */
    function chkMemberIsTel(inserted_name, inserted_tel1, inserted_tel2, inserted_tel3, inserted_code) {

        if (checkDBValuesTel(inserted_name, inserted_tel1, inserted_tel2, inserted_tel3, inserted_code) === 1) { // 성공창
            // To do : 파라미터 값을 넘겨주기
            window.open("/findPwResult.do?a=1", "member_find_pw_result", "width=600px, height=300px")
        } else {
            window.open("/findPwResult.do?a=2", "member_find_pw_result", "width=600px, height=300px")
        }
    }

    /* 2. DB 값 조회 및 비교 */
    function checkDBValuesTel(inserted_name, inserted_tel1, inserted_tel2, inserted_tel3, inserted_code) {
        // To do : DB에 들어가서 값을 조회하는 코드 작성해주기
        return 1;
    }

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



});


    /* 로그인 버튼 */

    $('.login_btn').click(function() {
        window.opener.location.href="/login.do";
        window.close();
    })

    /* 확인 버튼 */

    $('.ok_btn').click(function(){
        window.close();
    })






