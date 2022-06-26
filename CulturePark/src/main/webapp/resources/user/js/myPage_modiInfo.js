$(document).ready(function () {


    $('.modi_btn').click(function () {
        // var birth_ = $('input[name=mb_birth]').val();
        // var birth = birthString(birth_)

        var first_pw = $('input[id=input_pw]');
        var second_pw = $('input[id=input_sc_pw]');
        var nickName = $('input[id=input_nick]').val();
        var mb_seq = $('input[id=mb_seq]').val();
        var gender = genderString();
        var phoneStr = phoneNumberString();

        //var nickChk = "none";
        // Todo : 중복확인 기능 만들어줄 것
           var nickChk = true;

        // 수정 타입 확인 : 비밀번호 입력돼 있는지 안 돼 있는지.
        var modiType = pw_isEmpty(first_pw, second_pw);
        var result_pw_chk;
        var insult_result; //DB에 insert

        if (nickName.trim() === '') {
            alert("닉네임을 입력해주세요");
            $('input[id=input_nick]').focus();
            return;
        } else if ($('#tel2').val().trim() === '' || $('#tel3').val().trim() === '') {
            alert("전화번호를 입력해주세요");
            return;
        } else if (nickChk === 'none') {
            alert("중복확인을 해주세요");
            return;
        } else {
            if (modiType === "modiType01") {
                modi_except_pw(mb_seq, nickChk, gender, phoneStr);
            } else {
                var resultPwChk = chkPW(first_pw);

                if (resultPwChk === -1) {
                    alert(" 비밀번호를 8자 이상 20자 미만으로 입력해 주십시오");
                } else if (resultPwChk === -2) {
                    alert(" 비밀번호는 공백 없이 입력하셔야 됩니다");
                } else if (resultPwChk === -3) {
                    alert(" 비밀번호는 특수문자, 영문, 숫자를 최소 1회 입력해야 합니다");
                } else {
                    modi_all()
                }
            }

        }
    })


    $('.nick_confirm_btn').click(function () {
        var mb_nick = $('.nick_value').val().trim();
        console.log(mb_nick);
        checkNickExist(mb_nick);
    });


    $('.cancel_btn').click(function () {
        location.href = "/myPage.do";
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
        var phNum_01 = $('#tel1').val();
        var phNum_02 = $('input[id=tel2]').val()+'';
        var phNum_03 = $('input[id=tel3]').val()+'';

        var phone = phNum_01 +"-"+ phNum_02 +"-"+phNum_03;
        console.log(phone);

        return phone;
    }

    function modi_except_pw(mb_seq,mb_nick, mb_gender, phoneStr) {
        var except_pw_Data = {"mb_seq":mb_seq,"mb_nick":mb_nick, "mb_gender":mb_gender, "mb_tel":phoneStr}

        $.ajax({
            type:"post",
            dataType:"JSON",
            data:JSON.stringify(except_pw_Data),
            cache:false,
            async:false,
            contentType: 'application/json; charset=utf-8',
            traditional:true, // 배열 및 리스트의 형태로 값을 넘기기 위해서는 반드시 해야 함
            url:"/culturePark/modiInfoProcWithoutPW.do",
            success: function (data) {
                console.log(data);
                if (data == 1) {
                    alert("수정완료!");
                    location.replace("/myPage.do");
                } else {
                    alert("수정 실패!");
                }
            }
        });
    }


    function modi_all(mb_seq, mb_pw, mb_nick, mb_gender, phoneStr) {
        var all_Data = {"mb_seq": mb_seq, "mb_pw":mb_pw, "mb_nick":mb_nick
                        , "mb_gender":mb_gender, "mb_tel":phoneStr }
        $.ajax({
            type:"post",
            dataType:"JSON",
            data:JSON.stringify(all_Data),
            cache:false,
            async:false,
            contentType: 'application/json; charset=utf-8',
            traditional:true, // 배열 및 리스트의 형태로 값을 넘기기 위해서는 반드시 해야 함
            url:"/culturePark/modiInfoProcWithPW.do",
            success: function (data) {
                console.log(data);
                if(data == 1){
                    alert("수정 완료!");
                    location.replace("/myPage.do")
                }else{
                    alert("수정 실패!");
                }
            }
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

                if (chk_nick_result === "able") {
                    alert("사용 가능한 닉네임입니다");
                } else {
                    alert("사용 불가능한 닉네임입니다");
                }
            },

        });
    }







