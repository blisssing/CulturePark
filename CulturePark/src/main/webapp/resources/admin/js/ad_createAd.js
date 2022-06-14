$(document).ready(function () {

    $('.btn_regist').click(function () {
        var name = $('#InputName').val();
        var email = $('#InputEmail').val();
        var phone = $('#InputPhone').val();
        var password_01 = $('#InputPassword').val();
        var password_02 = $('#RepeatPassword').val();
        var department = $('#Depart').val();

        var chk_list = $('input[name=ad_is]:checked');

        var frm = $('#frm');

        if (name.trim() === '') {
            alert("이름을 입력해주세요");
        } else if (email.trim() === '') {
            alert("이메일을 입력해주세요.");
        } else if (phone.trim() === '') {
            alert("휴대전화를 입력해주세요.");
        }else if (password_01.trim() === '') {
            alert("비밀번호를 입력해주세요");
        } else if (password_02.trim() === '') {
            alert("비밀번호 재입력을 입력해주세요");
        } else if (password_01 !== password_02) {
            alert("비밀번호와 재입력이 일치하지 않습니다");
        } else if (department.trim() === '') {
            alert("부서를 입력해주세요");
        } else if (chk_list.length === 0) {
            alert("권한을 최소 한 개 이상 선택해주세요.");
        } else {

            var chkPw = chkPW(password_01);

            if (chkPw===-1) {
                alert('8자 이상 20자 미만의 비밀번호를 입력해주시길 바랍니다.');
            } else if (chkPw === -2) {
                alert("비밀번호에 공백은 입력 불가능합니다.")
            } else if (chkPw === -3) {
                alert("비밀번호 숫자와 영어 그리고 특수문자가 최소 1개 이상");
            } else {
                alert("통과");
                frm.attr("action","/createAdProc.ado");
                frm.submit();
            }

        }


    });

    function createAccount(name,email,phoneNumber,pw,depart,pos) {

    }


});