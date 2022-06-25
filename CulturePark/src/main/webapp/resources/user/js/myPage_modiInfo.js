$(document).ready(function () {


    $('.modi_btn').click(function () {
        var first_pw = $('input[id=input_pw]').val();
        var second_pw = $('input[id=input_sc_pw]').val();
        var nickName = $('input[id=input_nick]').val();
        var birth_ = $('.birth').val();

        var birth = birthString(birth_)
        var gender = genderString();
        var phoneStr = phoneNumberString();

        // 수정 타입 확인 : 비밀번호 입력돼 있는지 안 돼 있는지.
        var modiType = pw_isEmpty(first_pw, second_pw);
        var result_pw_chk;
        var insult_result; //DB에 insert


        // 비밀번호를 변경하지 않는다면
        if (modiType === "modiType01") {
            insult_result=save_to_DB(1);
        // 비밀번호를 변경한다면
        } else if (modiType === "modiType02") {
            result_pw_chk= chk_pw_value(first_pw,second_pw);
            alert_text = $('.alert_text_02');

            if (result_pw_chk===-1) { // 1차 비밀번호 미입력
                alert_text.css('display', 'inline-block');
                alert_text.text("wrong1")
            } else if (result_pw_chk === -2) { // 2차 비밀번호 미입력
                alert_text.css('display', 'inline-block');
                alert_text.text("wrong2")
            } else if (result_pw_chk === -3) { // 비밀번호 불일치
                alert_text.css('display', 'inline-block');
                alert_text.text("wrong3")
            } else if (result_pw_chk === 1) { // 정상 변경
                alert_text.text("");
                insult_result=save_to_DB(2);
            }
        }

        // db에 insert한 결과가 실패라면 *
        if (insult_result === -1) {
            alert("failed");
            // 비정상적 수행 To do
        } else if (insult_result === 1) { // insert 결과가 성공이라면
            alert("success!");
            // 정상 수행 To do
        }
    })



    $('.cancel_btn').click(function () {
        location.href = "/home.do";
    });


});


    // 비밀번호 비어있는지 확인
    function pw_isEmpty(first_pw, second_pw) {
        if (first_pw.val().trim() ==='' && second_pw.val().trim() === '') {
            return "modiType01";
        } else {
            return "modiType02";
        }
    }


    // 올바른 비밀번호 입력 확인
    function chk_pw_value(first_pw, second_pw) {
        if (first_pw.val().trim() === '') {
            return -1;
        } else if (second_pw.val().trim() === '') {
            return -2;
        } else if (first_pw.val() !== second_pw.val()) {
            return -3;
        } else {
            return 1;
        }
    }

    function save_to_DB(num) {
        // 비밀번호를 제외한 값들 모두 db에 넣기
        if (num === 1) {
            // To do
            return 1;
        } else if (num === 2) { // 비밀번호를 포함한 값들 모두 db에 넣기
            // To do
            return 1;
        }
    }

    //생년월일
    function birthString(birth){

        if (birth.indexOf('-')) {
            var birthStr = birth.split('-');
            for (var i = 0; i < birth.length; i++) {
                var birth_item = birthStr[i];
                if (birth[i] == '0') {

                    var birth1= birth;

                } else if (birth[i] == '1') {

                    var birth2= birth;

                } else if (birth[i] == '2') {

                    var birth3= birth;

                }
            }
        }
        birth = birth1 + birth2 + birth3;

        return birth;
    }

    // 성별 
    function genderString(){
        var genderSelected = $('input[name=chk_gender]:checked').val();
        var gender;

        if(genderSelected === $('#chk_male').val()){
            gender = '남';
        }else {
            gender = '여';
        }
        return gender;
    }

    //폰번호
    function phoneNumberString() {
        var phNum_01 = $('input[id=tel1]:selected').val();
        var phNum_02 = $('input[id=tel2]').val();
        var phNum_03 = $('input[id=tel3]').val();

        var phone = phNum_01 +"-"+ phNum_02 +"-"+phNum_03;

        return phone;
    }

    function modi_except_pw(mb_nick, mb_name, birth, gender, phoneStr) {
        var except_pw_Data = {"mb_nick":mb_nick,"mb_name":mb_name, "mb_birth":birth, "mb_gender":gender, "mb_tel":phoneStr}
        $.ajax({
            type:"post",
            dataType:"JSON",
            data:JSON.stringify(except_pw_Data),
            cache:false,
            async:false,
            contentType: 'application/json; charset=utf-8',
            traditional:true, // 배열 및 리스트의 형태로 값을 넘기기 위해서는 반드시 해야 함
            url:"/culturePark/modiInfoProc.do",
            success: function (data) {
                console.log(data);
                ajax_result = data.result;
            }
        });
    }


    function modi_all(mb_email, mb_pw, mb_nick, mb_name, mb_birth, mb_gender, phoneStr) {
        var all_Data = {"mb_email": mb_email, "mb_pw":mb_pw, "mb_nick":mb_nick, "mb_name":phoneStr,
            "mb_birth":mb_birth, "mb_gender":mb_gender,"mb_tel":phoneStr}
        $.ajax({
            type:"post",
            dataType:"JSON",
            data:JSON.stringify(all_Data),
            cache:false,
            async:false,
            contentType: 'application/json; charset=utf-8',
            traditional:true, // 배열 및 리스트의 형태로 값을 넘기기 위해서는 반드시 해야 함
            url:"/culturePark/modiInfoProc.do",
            success: function (data) {
                console.log(data);
                ajax_result = data.result;
            }
        });

    }







