$(document).ready(function () {
    //원래 화면 크기로 재조정
    window.resizeTo(400, 500);

    //마이티켓으로 이동
    $('#btn_myTicket').click(function () {
        var url = "viewTicket.do";
        window.open(url);
    });

    //닫기 버튼
    $('#btn_close').click(function () {
        // 닫기
        winClose();
    });


});

function winClose() {
    window.open('','_self').close();
}