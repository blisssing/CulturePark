$(document).ready(function () {

    $('.modi_btn').click(function () {
        var first_pw = $('input[name=input_pw]');
        var second_pw = $('input[name=input_sc_pw]');
        var nickName = $('input[name=input_nick]').text();
        var gender = $('input[name=chk_gender]:checked').val();
        var phNum_01 = $('input[name=ph_01]:selected').val();
        var phNum_02 = $('input[name=ph_02]').val();
        var phNum_03 = $('input[name=ph_03]').val();
        // 수정 타입 확인 : 비밀번호 입력돼 있는지 안 돼 있는지.
        var modiType = pw_isEmpty(first_pw, second_pw);
        var result_pw_chk;
        var insult_result;

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

        // db에 insert한 결과가 실패라면
        if (insult_result === -1) {
            // 비정상적 수행 To do
        } else if (insult_result === 1) { // insert 결과가 성공이라면
            alert("success!");
            // 정상 수행 To do
        }
    });

    $('.cancel_btn').click(function () {
        location.href = "/myInfo.do";
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
});