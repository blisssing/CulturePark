$(document).ready(function () {

    $('.btn_regist').click(function () {
        var company = $('#InputCompany').val();
        var name = $('#InputName').val();
        var email = $('#InputEmail').val();
        var phone = $('#InputPhone').val();
        var password_01 = $('#InputPassword').val();
        var password_02 = $('#RepeatPassword').val();
        var chk_list = $('input[name=chk_right]:checked');

        if (company.trim() === '') {
            alert("회사를 입력해주세요");
        } else if (name.trim() === '') {
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
        } else if (chk_list.length === 0) {
            alert("권한을 최소 한 개 이상 선택해주세요.");
            /*alert창 뜨면서 데이터가 유지되지않고 지워짐*/

        } else {
            alert("계정생성 성공!");
            /* alert창 뜨지않음 */
            createAccount(company, name, email, phone, password_01, position);

           /* clearValues();*/
        }
    });

    function createAccount(company,name,email,phoneNumber,pw,pos) {
        //Todo : DB에 값을 넣어주는 동작구현을 해줄 것
    }

    function chkPhone() {
        //Todo 올바른 휴대전화 입력 확인 기능 만들 것
    }

});


function clearValues() {
    $('#InputCompany').val('');
    $('#InputName').val('');
    $('#InputEmail').val('');
    $('#InputPhone').val('');
    $('#InputPassword').val('');
    $('#RepeatPassword').val('');
}
