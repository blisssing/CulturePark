// 1. 이 파일은 반드시 jquery 이후에 호출해줄 것
// 2. 이 파일은 반드시 chkPW 메서드를 필요로 하는 js 파일보다 선행 호출시켜줄 것
// ex
    //<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
    //... 중략 ...
    // <script src="/resources/common/js/checkPW.js"></script>
    // <script src="/resources/admin/js/ad_adminList.js" type="text/javascript"></script>
function chkPW(pw) {
    // pw =('선택자').val() 혹은 .text()의 형태로 값을 넣을 것
    // 두 비밀번호가 일치할 경우 비밀번호 정규식 검사
    var num = pw.search(/[0-9]/g); // 숫자가 들어가 있는지
    var eng = pw.search(/[a-z]/ig);// 영문이 들어가 있는지
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); // 특수문자가 들어가있느닞

    if (pw.length < 8 || pw.length > 20) {
        alert("8자리 ~ 20자리 이내로 입력해주세요");
        return false;
    } else if (pw.search('/\s/') !== -1) {
        alert('비밀번호는 공백없이 입력해주세요!')
        return false;
    } else if (num < 0 || eng < 0 || spe < 0) {
        alert("영문 숫자, 특수문자를 혼합하여 입력해주세요.");
        return false;
    } else {
        console.log('통과');
        return true;
    }

}