$(document).ready(function() {

    var frm = $('#frm');
    var code = "";
    var mb_email = "";
    var chk_email_result = "";
    var chk_authenByPhone_result ="disable";
    var chk_agree_result = "";
    var insertResult;

    // 이전
    $('.back').click(function () {
        window.history.back();
    });

    $('.code_reSend').hide();


    // 인증발송 버튼
    var code2 = "";
    var timer = null;
    var isRunning = false;
    var timer_status;


    // 인증시간   * https://developer0809.tistory.com/149*/
    $(".tel_authentication_btn").click(function () {
        timer_status=0;
        if ($(this).val() ==='재발송') {
            timer_status = 1;
        }


        $('.code_send').hide();
        $('.code_reSend').show();
        
        /*ajax 주석 풀면 아래 2가지 삭제하기*/
        $('.authentication_code').attr("disabled", false);
        $('.code_ok_btn').attr("disabled", false);

        var phone1 = $('.tel_1').val();
        var phone2 = $('.tel_2').val();
        var phone3 = $('.tel_3').val();
        var fullPhone = phone1 + phone2 + phone3;

        console.log(fullPhone);

        code2="1234";
/*        $.ajax({
            type: "POST",
            url: "/telCheck.do",
            datatype: "text",
            data: {"phone": fullPhone}, //controller로 넘어감 key값으로 넘어감:변수에 담겨짐
            cache: false,
            success: function (data) {

                if (data == "error") {
                    alert("휴대폰 번호가 올바르지 않습니다.")
                    $(".tel").attr("autofocus", true);
                } else {
                    alert("인증번호가 발송됐습니다");
                    $(".tel").attr("readonly", true);
                    $('.code_send').hide();
                    $('.code_reSend).show();
                    $('.authentication_code').attr("disabled", false);
                    $('.code_ok_btn').attr("disabled", false);
                    code2 = data;
                }
            }
        });*/

        if (code2 !== 'error') {
            var display = $('#timeLimit');
            var leftSec = 180;

            if (isRunning) {
                clearInterval(timer);
                display.html("");
                startTimer(leftSec,display);
            } else {
                startTimer(leftSec, display);
            }
        }

    });

    function startTimer(count, display) {

        var minutes, seconds;
        timer = setInterval(function () {
            if(timer_status === 1) {
                console.log('여기 확인하고 있음!!');
                count = 180;
                timer_status = 0;
            }
                minutes = parseInt(count / 60, 10);
                seconds = parseInt(count % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.html(minutes + ":" + seconds);

                // 타이머 끝
                if (--count < 0 || timer_status===-1) {
                    clearInterval(timer);
                    display.html("00:00");
                    $('.code_ok_btn').attr("disabled", "disabled");
                    isRunning = false;
                    code2 = "disableCode";
                    timer_status = 0;
                } else {

                }

        }, 1000);
        isRunning = true;
    }

    // 확인 클릭시
    $('.code_ok_btn').click(function (){
        /*시간멈춤*/
        timer_status=-1;

        // Todo :  사용자가 입력한 코드와 Controller 가 반환해준 코드가 같은지 비교해 해줘야 함.
        //  이때 - 제한 시간이 지났을 경우 아무리 코드를 입력해도, 인증 실패가 떠야 함.
        //  code2 : 컨트롤러가 반환한 코드
        //  insertedCode : 사용자가 입력한 코드

        var insertedCode = $('.authentication_code').val();

        console.log(code2);
        console.log(insertedCode);

        if (code2 === "disableCode") {
            alert("시간 만료된 코드입니다");
        } else if (insertedCode===code2){
            alert('인증 성공!');
            chk_authenByPhone_result="able";
        } else {
            alert("인증 실패!!");
        }

    });


    // 재발송 클릭시
    $('.code_reSend').click(function(){
        $('.authentication_code').clear();
        $('.authentication_code').focus();
    })

    $('.tel').keyup(function () {
        chk_authenByPhone_result = "disable";
    });


    // 체크박스 전체 선택
    $('.checkbox_all').click(function () {
        if ($(".checkbox_all").prop("checked")) {
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


    //이메일 중복 확인 및 유효성 검사
    $('.id_confirm_btn').click(function () {

        var valId = $('#email_val').val();
        console.log(valId);

        function validateEmail(mb_email) {
            // 검증에 사용할 정규식 변수 regExp에 저장
            var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

            if (mb_email.match(regExp)!==null) {
                return true;
            } else {
                return false;
            }
        }

        if (validateEmail(valId)) {
            $.ajax({
                type: "post",
                url: "/emailCheck.do", //통신할 url
                data: {"email": valId}, //전송할 데이타   email이란 이름으로 input값의 email을 넣는다.
                datatype: "text",
                cache: false,
                async: false,
                success: function (data) { //성공시 반환 데이터 data에는 controller에서 담아준 error값이 담겨있다.
                    if (data === "error") {
                        alert("중복된 이메일입니다. 다시 입력해주세요.");
                        $('#email_val').focus();
                    } else {
                        alert("올바른 이메일입니다.");
                        chk_email_result = "able";
                        $('.pw_value').focus();
                    }
                }
            });

        } else {
            alert("올바르지 않은 이메일 형식입니다. 다시 입력해주세요.");
        }
    });

    // 중복확인 후 다시 이메일 입력할 경우, 중복결과 변수 값을 초기화시킴.
    $('#email_val').keydown(function () {
        chk_email_result = "disable";
    });

    //회원가입 버튼 클릭 시 유효성 검사
    $('.join_btn').click(function () {

        console.log('확인1');

        var idCheck = $('.id_confirm_btn').prop("N");

        var pt_email = $('#email_val').val();
        var pt_comp_name = $('#comp_val').val();
        var pt_ceo_name = $('#ceo_name_val').val();
        var pt_ceo_number = $('#ceo_number_val').val();
        var pt_file = $('#file_val')[0].files[0];
        var pt_register_name = $('#register_name_val').val();

        var valTel1 = $('#tel_1').val();
        var valTel2 = $('#tel_2').val();
        var valTel3 = $('#tel_3').val();

        var pt_phone = valTel1+valTel2+valTel3;

        var valChkAll = $('#chkAll').val();


        /*  if (valPw === null || valPw === undefined || valPw === "") {
                      alert('패스워드 확인을 입력해주세요.');
                      $('#pw_val').focus();
                      return;
                  }
                  if (valPw != valRePw) {
                      alert('패스워드와 패스워드 확인이 같지않습니다.');
                      $('#rePw_val').val("");
                      $('#pw_val').val("");
                      $('#pw_val').focus();
                      return;
                  }*/
        if (pt_email === null || pt_email === undefined || pt_email === "") {
            alert('이메일을 입력해주세요.');
            $('#email_val').focus();
        } else if (pt_comp_name === null || pt_comp_name === undefined || pt_comp_name === "") {
            alert('업체명을 입력해주세요.');
            $('#comp_val').focus();
        } else if (pt_ceo_name === null || pt_ceo_name === undefined || pt_ceo_name === "") {
            alert('사업자명을 입력해주세요.');
            $('#ceo_name_val').focus();

        } else if (pt_ceo_number === null || pt_ceo_number === undefined || pt_ceo_number === "") {
            alert('사업자번호를 입력해주세요.');
            $('#ceo_number_val').focus();

        } else if (pt_file === null || pt_file === undefined || pt_file === "") {
            alert('파일을 업로드 해주세요.');
            $('#file_val').focus();

            // pt_register_name
        } else if (pt_register_name === null || pt_register_name === undefined || pt_register_name === "") {
            alert("신청자 이름을 입력해주세요");
            $('#register_name_val').focus();
        } else if (valTel1 === null || valTel1 === undefined || valTel1 === "") {
            alert('전화번호를 입력해주세요.');
            $('#tel_1').focus();

        } else if (valTel2 === null || valTel2 === undefined || valTel2 === "") {
            alert('전화번호를 입력해주세요.');
            $('#tel_2').focus();
        } else if (valTel3 === null || valTel3 === undefined || valTel3 === "") {
            alert('전화번호를 입력해주세요.');
            $('#tel_3').focus();
        } else if (chk_agree_result == "disable") {
            console.log('약관체크');
            alert('약관을 체크해주세요.');
        } else  {

            if (chk_authenByPhone_result === "able" &&
                chk_agree_result === "able" &&
                chk_email_result === "able") {
                insertPartnerAjax(pt_email, pt_comp_name, pt_ceo_name,
                                  pt_ceo_number, pt_file, pt_phone, pt_register_name);
            }

        }
    }); //회원가입클릭시


});

function insertPartnerAjax(pt_email, pt_comp_name, pt_ceo_name, pt_ceo_number, pt_file, pt_phone, pt_register_name) {
//여러값을 넣을때 json을 사용. key:value의 형태로 넣음. controller에서는 void로 반환값 없지만,

    var itemSet={"pt_email":pt_email, "pt_comp_name":pt_comp_name, "pt_ceo_name":pt_ceo_name,
        "pt_ceo_number":pt_ceo_number, "pt_phone":pt_phone, "pt_register_name":pt_register_name};

    var formData = new FormData();
    formData.append('file',pt_file);
    formData.append('key', new Blob([JSON.stringify(itemSet)], {type:"application/json"}));

    $.ajax({
        type:"post",
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        url:"/partnerRequestProc.do",
        async:false,
        cache:false,
        data: formData,
        success:function (a) { //controller의 writer.print(json)의 결과가 반환됨.
            if (a === "success") {
                alert("성공");
            } else {
                alert("실패");
            }

        },
        error: function () {
            alert("신청이 실패되었습니다");
        }



    });
}





/*******************************************************/
    // Todo : 올바른 비밀번호 입력인지 검증해주는 코드 작성
    /*$('#rePw_val').keyup(function () {

    var pw1 = $("#pw_val").val();
    var pw2 = $("#rePw_val").val();

    chkPW(pw1);

    if (pw1 != "" || pw2 != "" || pw1 === 1) {

    if (pw1 == pw2) {
        $("#alert-success").show();
        $("#alert-success").css("color", "green");
        $("#alert-danger").hide();
        $("submit").removeAttr("disabled");
    } else {
        $("#alert-success").hide();
        $("#alert-danger").show();
        $("#alert-danger").css("color", "red");
        $("submit").removeAttr("disabled");
    }
    }
    })
    */

    // Todo : ajax 비동기 데이터 전달방식 활용을 위한 function 작성 예시. 책과 인터넷 참고 하면서 controller와 어떻게 연결되는지 참고.
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

    /* Todo 3. 인증번호 보내기*/
    /*$('.tel_authentication_btn').click(function () {
    var first_num = $('.tel_1').val();
    var second_num = $('.tel_2').val()
    var third_num = $('.tel_3').val();

    var phone = first_num + second_num + third_num;

    /!* console.log(first_num)*!/*/

    // Todo : 값을 제대로 입력햇는지 확인 . true 안의 조건식을 완성해줄 것.
    /*  if (first_num = '') {
    alert("전화번호 첫번째 자리를 선택해주세요");
    } else if (second_num == '') {
    alert("전화번호 두 번째 자리를 입력해주세요");
    } else if (third_num == '') {
    alert("전화번호 세 번째 자리를 입력해주세요");
    } else {
    alert("인증번호 발송이 완료되었습니다. \n 휴대폰에서 인증번호를 확인해 주십시오");
    sendSms(phone);
    }*/

    // Todo : 인자값으로 받은 전화번호에 문자 메세지를 보내주는 기능 만들어줄 것. 반드시 ajax 비동기 전달 방식 사용.
    //  hint : 인터넷에 ajax 데이터 전송 방식이라고 검색하면 나오며, 교재에도 있음.
    /* function sendSms(phone) {

        $("#requestBtn").on("click", function() {
            // POST 방식으로 서버에 HTTP Request를 보냄.

            $.post("/examples/media/request_ajax.php",

                { name: "홍길동", grade: "A" },  // 서버가 필요한 정보를 같이 보냄.

                function(data, status) {

                    $("#text").html(data + "<br>" + status); // 전송받은 데이터와 전송 성공 여부를 보여줌.

                }
            );
        });
    }

    // 위에서 정의한 기능을 사용.
    sendSms(phone);
    $(".authentication_code").attr("disabled", false);
    $(".tel").attr("readonly", true);*/


    // Todo 4 : Todo 3 작업을 마친 후 반환받은 코드와 입력된 인증코드를 비교해주는 기능을 작성해줄 것.
    /*  $('.code_ok_btn').click(function () {
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

    //Todo : 입력값들 제대로 기입돼 있는지 확인해주는 조건문 마무리 해주고 DB에 insert 작업 마무리 해주기
    /*        $('.join_btn').click(function () {

    if (chk_email_result === 'disable ') {

    } else if (chk_pw_result === 'disable') {

    } else if (chk_agree_result === 'disable') {

    }

    // Todo : insert 해주는 ajax 비동기 데이터 전달 구간
    function createData() {

    }

    });*/