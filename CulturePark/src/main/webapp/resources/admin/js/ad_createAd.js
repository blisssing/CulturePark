$(document).ready(function () {

    $('.btn_regist').click(function () {
        var last_name = $('#LastName').val();
        var first_name = $('#FirstName').val();
        var email = $('#InputEmail').val();
        var phone = $('#InputPhone').val();
        var password_01 = $('#InputPassword').val();
        var password_02 = $('#RepeatPassword').val();
        var department = $('#Depart').val();

        var chk_list = $('input[name=chk_right]:checked');


        if (last_name.trim() === '') {
            alert("성을 입력해주세요");
        } else if (first_name.trim() === '') {
            alert("이름을 입력해주세요.");
        } else if (email.trim() === '') {
            alert("이메일을 입력해주세요.");
        } else if (phone.trim() === '') {
            alert("휴대전화를 입력해주세요.");
        }else if (password_01.trim() === '' || password_01.length < 12) {
            alert("비밀번호를 12자 이상 입력해주세요");
        } else if (password_02.trim() === '' || password_02.length < 12) {
            alert("비밀번호 재입력을 12자 이상 입력해주세요");
        } else if (password_01 !== password_02) {
            alert("비밀번호와 재입력이 일치하지 않습니다");
        } else if (department.trim() === '') {
            alert("부서를 입력해주세요");
        } else if (chk_list.length === 0) {
            alert("권한을 최소 한 개 이상 선택해주세요.")
        } else {
            createAccount(last_name, first_name, email, phone, password_01
                , department, position);
        }


    });

    function createAccount(lastName,firstName,email,phoneNumber,pw,depart,pos) {
        //Todo : DB에 값을 넣어주는 동작구현을 해줄 것
    }

    function chkPhone() {
        //Todo 올바른 휴대전화 입력 확인 기능 만들 것
    }

});