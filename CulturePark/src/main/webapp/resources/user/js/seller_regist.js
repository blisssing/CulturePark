$(document).ready(function() {

    var frm = $('#frm');
    var code = "";
    var mb_email = "";
    var chk_email_result = "";
    var chk_pw_result = "";
    var chk_agree_result = "";

    /* 이전 */
    $('.back').click(function () {
        window.history.back();
    });

    $('.tel_authentication_btn').click(function () {
        $('.authentication_code').attr("disabled", false);
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

    //휴대폰 번호 인증
    var code2 = "";
    $(".tel_authentication_btn").click(function () {
        alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
        var phone1 = $('.tel_1').val();
        var phone2 = $('.tel_2').val();
        var phone3 = $('.tel_3').val();
        var fullPhone = phone1 + phone2 + phone3;


        console.log(fullPhone);

        $.ajax({
            type: "POST",
            url: "/telCheck.do",
            datatype: "text",
            data:{"phone":fullPhone},
            cache: false,
            success: function (data) {
                if (data == "error") {
                    alert("휴대폰 번호가 올바르지 않습니다.")
                    $(".tel").attr("autofocus", true);
                } else {
                    $(".authentication_code").attr("disabled", false);
                    $(".tel").attr("readonly", true);
                    code2 = data;
                }
            }
        });
    });


    // Todo 1. 이메일 중복확인
    //  hint :  인터넷에서 퍼온 이메일 정규식 검증 코드를 활용해볼 것 ==> validateEmail(str).
    //  hint2 : ajax 비동기 전달 방식을 통해 데이터를 controller에 전달할 것.
    $('.id_confirm_btn').click(function () {
    });

    function validateEmail(str) {
        // 검증에 사용할 정규식 변수 regExp에 저장
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if (str.match(regExp) != null) {
            return true;
        } else {
            return false;
        }
    }

    // 중복확인 후 다시 이메일 입력할 경우, 중복결과 변수 값을 초기화시킴.
    $('.id_value_1').keydown(function () {
        chk_email_result = "disable";
    });

    // Todo 2. 올바른 비밀번호 입력인지 검증해주는 코드 작성
    $('.input_pw').keyup(function () {
    });
});


    // Todo 1 : ajax 비동기 데이터 전달방식 활용을 위한 function 작성 예시. 책과 인터넷 참고 하면서 controller와 어떻게 연결되는지 참고.
    /* function ajaxFunction('인자값') {
         $.ajax({
             type: "{post 혹은 get 중 선택}",
             dataType: "{데이터의 타입 ex : text}",
             url: "{전송할 url 기입 ex : joinProc.do}",
             cache: {캐시를 남기지 않으면 false 남기면 true},
             data: {{파라미터 이름 ex : paramName }: {파라미터 값 ex : '인자값'}},
             success: function (data) {  <<- url 전송 성공시 실행되는 코드
                 if (data == "error") {
                     alert("실패!");
                 } else {
                     code = data;
                 }
             }
         });
     }*/

 /*   function ajaxFunction(selTelChk) {
        $.ajax({
            type: "get",
            dataType: "text",
            url: "telCheck?tel="+tel,
            cache: false,
            data: {joinTelChk: selTelChk},
            success: function (data) {
                if (data == "error") {
                    alert("실패하였습니다.");
                } else {
                    alert("인증완료 하였습니다.")
                    code2 = data;
                }
            }
        });
    }
*/
        /*/!* Todo 3. 인증번호 보내기*!/
        $('.tel_authentication_btn').click(function () {
            var first_num = $('.tel_1').val();
            var second_num = $('.tel_2').val()
            var third_num = $('.tel_3').val();

            var phone = first_num + second_num + third_num;

            /!* console.log(first_num)*!/

            // Todo : 값을 제대로 입력햇는지 확인 . true 안의 조건식을 완성해줄 것.
            if (first_num = '') {
                alert("전화번호 첫번째 자리를 선택해주세요");
            } else if (second_num == '') {
                alert("전화번호 두 번째 자리를 입력해주세요");
            } else if (third_num == '') {
                alert("전화번호 세 번째 자리를 입력해주세요");
            } else {
                alert("인증번호 발송이 완료되었습니다. \n 휴대폰에서 인증번호를 확인해 주십시오");
                sendSms(phone);*/


      /*          // Todo : 인자값으로 받은 전화번호에 문자 메세지를 보내주는 기능 만들어줄 것. 반드시 ajax 비동기 전달 방식 사용.
                //  hint : 인터넷에 ajax 데이터 전송 방식이라고 검색하면 나오며, 교재에도 있음.
                function sendSms(phone) {

                        $("#requestBtn").on("click", function() {
                            // POST 방식으로 서버에 HTTP Request를 보냄.

                            $.post("/examples/media/request_ajax.php",

                                { name: "홍길동", grade: "A" },  // 서버가 필요한 정보를 같이 보냄.

                                function(data, status) {

                                    $("#text").html(data + "<br>" + status); // 전송받은 데이터와 전송 성공 여부를 보여줌.

                                }
                            );
                        });
                }*/

              /*  // 위에서 정의한 기능을 사용.
                sendSms(phone);
                $(".authentication_code").attr("disabled", false);
                $(".tel").attr("readonly", true);
*/

                // Todo : 인증번호 발송이 완료되면 인증번호 입력, 재발송, 확인 버튼을 활성화시켜주는 코드 작성해줄 것.
/*
            }
        });*/

        /* 인증번호 확인 */
       /* // Todo 4 : Todo 3 작업을 마친 후 반환받은 코드와 입력된 인증코드를 비교해주는 기능을 작성해줄 것.
        $('.code_ok_btn').click(function () {
            if ($(".authentication_code").val() == code2) { // true에 올바른 조건식을 넣어줄 것.
                alert("인증번호가 일치합니다");
                $("#phoneDoubleChk").val("true");
                $(".authentication_code").attr("disabled",true);
            } else {
                alert("인증번호가 불일치합니다. 확인해주시기 바랍니다");
                $("#phoneDoubleChk").val("false");
                $(this).attr("autofocus",true);
            }
        });*/

        //Todo 5 : 입력값들 제대로 기입돼 있는지 확인해주는 조건문 마무리 해주고 DB에 insert 작업 마무리 해주기
/*        $('.join_btn').click(function () {

            if (chk_email_result === 'disable ') {

            } else if (chk_pw_result === 'disable') {

            } else if (chk_agree_result === 'disable') {

            }

            // Todo : insert 해주는 ajax 비동기 데이터 전달 구간
            function createData() {

            }

        });*/

