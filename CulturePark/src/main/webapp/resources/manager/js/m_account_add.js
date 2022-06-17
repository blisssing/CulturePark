$(document).ready(function () {

    $('.btn_regist').click(function () {
        var email = $('#InputEmail').val();
        var password_01 = $('#InputPassword').val();
        var password_02 = $('#RepeatPassword').val();
        var name = $('#InputName').val();
        var tel = $('#InputTel').val();
        var chk_list = $('input[name=chk_right]:checked');

        var frm = $('#frm');

       if(email.trim() === '') {
            alert("이메일을 입력해주세요.");
       }else if (password_01.trim() === '' || password_01.length < 12) {
           alert("비밀번호를 12자 이상 입력해주세요");
       } else if (password_02.trim() === '' || password_02.length < 12) {
           alert("비밀번호 재입력을 12자 이상 입력해주세요");
       } else if (password_01 !== password_02) {
           alert("비밀번호와 재입력이 일치하지 않습니다");
       } else if (name.trim() === '') {
            alert("이름을 입력해주세요.");
       } else if (tel.trim() === '') {
            alert("휴대전화를 입력해주세요.");
       } else if (chk_list.length === 0) {
            alert("권한을 최소 한 개 이상 선택해주세요.");
            /*alert창 뜨면서 데이터가 유지되지않고 지워짐*/
       } else {

           var chkPw = chkPW(password_01);

           if (chkPw === -1) {
               alert("8자 이상 20자 미만의 비밀번호를 입력해주시길 바랍니다.");
           } else if (chkPw === -2) {
               alert("비밀번호에 공백은 입력 불가능합니다.")
           } else if (chkPw === -3) {
               alert("비밀번호 숫자와 영어 그리고 특수문자가 최소 1개 이상");
           } else {
               alert("계정생성 성공!");
               frm.attr("action", "/login.mdo");
               frm.submit();
           }
       }

    });

});


function clearValues() {
    $('#InputCompany').val('');
    $('#InputName').val('');
    $('#InputEmail').val('');
    $('#InputPhone').val('');
    $('#InputPassword').val('');
    $('#RepeatPassword').val('');
}
