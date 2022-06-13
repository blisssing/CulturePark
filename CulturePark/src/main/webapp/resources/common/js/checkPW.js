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
        return -1;
    } else if (pw.search('/\s/') !== -1) {
        return -2;
    } else if (num < 0 || eng < 0 || spe < 0) {
        return -3;
    } else {
        console.log('통과');
        return 1;
    }

}
// 키보드 입력에 따른 비밀번호 입력 상태 label에 출력
// $('input[name=password]').keyup(function () {
//     var pw1 = $('#Password').val();
//     var pw2 = $('#RepeatPassword').val();
//     var event_label = $('.event_pw');
//     if (pw1.trim() === '' || pw2.trim() === '') {
//         event_label.text('서로 다른 비밀번호입니다.');
//         event_label.removeClass('correctPw');
//         $('.event_pw').addClass('wrongPw1');
//     } else {
//         if (chkPW(pw1)===1 && chkPW(pw2)===1 && pw1===pw2) {
//             event_label.text("올바른 비밀번호입니다");
//             event_label.removeClass('wrongPw1');
//             event_label.removeClass('wrongPw2');
//             event_label.addClass('correctPw');
//         } else {
//             event_label.text('특수문자, 영어, 숫자를 포함한 8자 이상 20자 비밀번호를 설정해주세요.')
//             event_label.addClass('wrongPw2');
//
//         }
//
//     }
// });