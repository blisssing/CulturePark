$(document).ready(function() {

    var frm = $('#frm');

    var code = "";
    var mb_email = "";
    var chk_email_result = "";
    var chk_pw_result = "";
    var chk_nick_result = "";
    var chk_phone_result = "";
    var chk_agree_result = "";
    var ajax_result="";

    /* 이전 */

    $('.back').click(function(){
        window.history.back();
    });

    /* 체크박스 전체 선택 */
    $('.checkbox_all_p').click(function () {
        if ($(".checkbox_all_p").prop("checked")) {
            $(".checkbox_one").prop("checked", true);
            chk_agree_result = "able";
        } else {
            $(".checkbox_one").prop("checked", false);
            chk_agree_result = "disable";
        }
    });

    $('.checkbox_one').click(function () {

        var len = $('input[name=chk]:checked').length;
        console.log(len);

        if (len === 3) {
            $('.checkbox_all').prop("checked", true);
            chk_agree_result = "able";
        } else {
            $('.checkbox_all').prop("checked", false);
            chk_agree_result = "disable";
        }
    });

    // 버튼 동작

    // 1. 이메일 중복확인

    $('.id_confirm_btn').click(function () {
        mb_email = $('.id_value_1').val();

        if (validateEmail(mb_email)) {
            checkEmailExist(mb_email);
        } else {
            alert("잘못된 형식의 이메일입니다");
        }
    });

    $('.id_value_1').keydown(function () {
        chk_email_result = "";
    });

    // 2. 올바른 비밀번호 입력 확인

    $('.input_pw').keyup(function () {
        chk_pw_result = "disable";
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
            result_label.text("1차와 2차 비밀번호가 일치하지 않습니다");
            result_label.attr("style", "color:#FF0000");
        } else {
            var result_pw = chkPW(first_pw);
            if (result_pw === -1) {
                result_label.text("비밀번호는 8자이상 20자 이하로 설정해주세요");
                result_label.attr("style", "color:#FF0000");
                chk_pw_result = "disable";
            } else if (result_pw === -2) {
                result_label.text("비밀번호에는 공백이 들어갈 수 없습니다");
                result_label.attr("style", "color:#FF0000");
                chk_pw_result = "disable";
            } else if (result_pw === -3) {
                result_label.text("비밀번호에는 반드시 영문,특수문자,숫자를 포함시켜야 합니다");
                result_label.attr("style", "color:#FF0000");
                chk_pw_result = "disable";
            } else {
                chk_pw_result = "able";
                result_label.text("사용가능한 비밀번호입니다");
                result_label.attr("style", "color:#0067a3");
            }

        }
    });

    // 3. 닉네임 중복확인

    $('.nick_confirm_btn').click(function () {
        var mb_nick = $('.nick_value').val().trim();
        console.log(mb_nick);
        checkNickExist(mb_nick);
    });

    /* 인증번호 보내기*/
    $('.tel_authentication_btn').click(function () {
        var first_num = $('.tel_1').val();
        var second_num = $('.tel_2').val()
        var third_num = $('.tel_3').val();

        console.log(first_num)

        if (first_num=== '0') {
            alert("전화번호 첫번째 자리를 선택해주세요");
        } else if (second_num.trim()==='') {
            alert("전화번호 두 번째 자리를 입력해주세요");
        } else if (third_num.trim() === '') {
            alert("전화번호 세 번째 자리를 입력해주세요");
        } else {
            alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해 주십시오");

            var phone = first_num + second_num + third_num;

            $('.code_reSend_btn').prop("disabled", false);
            $('.authentication_code').prop("disabled", false);
            $('.code_ok_btn').prop("disabled", false);
            $('.tel_1').prop("disabled", true);
            $('.tel_3').prop("disabled", true);
            $('.tel_2').prop("disabled", true);

            // sendSMS(phone);
            code = "1234"; // 임시 코드

        }
    });

    /* 인증번호 확인 */
    $('.code_ok_btn').click(function () {
        var authen_code = $('.authentication_code').val();

        if (code === authen_code) {
            chk_phone_result = "able";
            alert("인증번호가 일치합니다");
        } else {
            chk_phone_result="disable"
            alert("인증번호가 불일치합니다. 확인해주시기 바랍니다");
        }

    });

    $('.join_btn').click(function () {

        var mb_email = $('.id_value_1').val();
        var mb_pw = $('.pw_value').val();
        var mb_nick = $('.nick_value').val();
        var mb_name = $('.name_value').val();
        var mb_birth = $('.jumin_value1').val();
        var mb_gender;

        var mb_jumin2 = $('.jumin_value2').val();

        if (mb_jumin2 === '1' || mb_jumin2 === '3') {
            mb_gender = "male";
        } else {
            mb_gender = "female";
        }


        var phoneStr = phoneNumberString();
        var result_create;


        if (chk_email_result !== 'able') {
            alert("이메일 중복확인을 해주시길 바랍니다");
        } else if (chk_pw_result !== 'able') {
            alert("비밀번호 기입을 확인해주시길 바랍니다")
        } else if (chk_nick_result !== 'able') {
            alert("닉네임 중복확인을 해주시길 바랍니다");
        } else if (checkOthers()!==1) {
            alert("입력을 정상적으로 해주시길 바랍니다");
        } else if (chk_phone_result !== 'able') {
            alert("인증번호를 먼저 확인해주시길 바랍니다");
        } else if (chk_agree_result !== 'able') {
            alert("동의를 모두 해주시길 바랍니다.")
        }  else {
            createAccount(mb_email, mb_pw, mb_nick, mb_name, mb_birth, mb_gender, phoneStr);
            if (ajax_result === 'success') {
                alert("생성 성공");
                location.href="/home.do";
            } else {
                alert("생성 실패");
            }
        }




    });

    function validateEmail(mb_email) {
        // 검증에 사용할 정규식 변수 regExp에 저장
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if (mb_email.match(regExp)!=null) {
            return true;
        } else {
            return false;
        }
    }

    function checkEmailExist(mb_email) {
        $.ajax({
            type: "post",
            dataType: "text",
            url:"/culturePark/chkEmail.do",
            async:false,
            cache:false,
            data:{mb_email:mb_email},
            success: function (data) {
                console.log(data);
                chk_email_result = data;
                if (chk_email_result === "able") {
                    alert("사용 가능한 주소입니다");
                } else {
                    alert("사용 불가능한 주소입니다");
                }
            },
        });
    }

    function checkNickExist(mb_nick) {
        $.ajax({
            type: "post",
            dataType: "text",
            url:"/culturePark/chkNickProc.do",
            async:false,
            cache:false,
            data:{mb_nick:mb_nick},
            success: function (data) {
                chk_nick_result = data;

                if (chk_nick_result === "able" && mb_nick != '') {
                    alert("사용 가능한 닉네임입니다");
                } else {
                    alert("사용 불가능한 닉네임입니다");
                }
            },

        });
    }

    function checkOthers() {
        if ($('.name_value').val().trim() === '') {
            return -2;
        } else if ($('.jumin_value1').val() === '' || $('.jumin_value2').val() === '') {
            return -1;
        } else {
            return 1;
        }
    }

    function phoneNumberString() {
        var first_num = $('.tel_1').val();
        var second_num = $('.tel_2').val()
        var third_num = $('.tel_3').val();

        var phone = first_num +"-"+ second_num +"-"+third_num;

        return phone;
    }

    function sendSMS(phone) {
        $.ajax({
            type: "post",
            dataType: "text",
            url: "/culturePark/chkPhone.do",
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


    function createAccount(mb_email, mb_pw, mb_nick, mb_name, mb_birth, mb_gender, phoneStr) {
        var all_Data = {"mb_email": mb_email, "mb_pw":mb_pw, "mb_nick":mb_nick, "mb_name":mb_name,
            "mb_birth":mb_birth, "mb_gender":mb_gender,"mb_tel":phoneStr}
        $.ajax({
            type:"post",
            dataType:"JSON",
            data:JSON.stringify(all_Data),
            cache:false,
            async:false,
            contentType: 'application/json; charset=utf-8',
            traditional:true, // 배열 및 리스트의 형태로 값을 넘기기 위해서는 반드시 해야 함
            url:"/culturePark/createUserProc.do",
            success: function (data) {
                console.log(data);
                ajax_result = data.result;
            }
        });
    }

});