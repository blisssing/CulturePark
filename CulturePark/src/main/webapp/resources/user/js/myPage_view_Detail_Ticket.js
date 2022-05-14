/* 상세보기 팝업 */
function viewDetail() {
    window.open("/viewDetail.do", "myPage_viewDetail", "width=500, height=700, left=100, top=50");
}


/* 이전 화살표 뒤로가기 :  모바일 구현하기  */
/*$( document ). ready(function() {
    $('.fa-arrow-left').load("/WEB-INF/user/myPage_myTicket.jsp");
})*/



/* 마이티켓 -> 상세보기 -> 입장안내 슬라이드 토글 */
$( document ).ready( function() {
    $( 'button.booking_admission_btn' ).click( function() {
        $( '.booking_admission_content_toggle' ).slideToggle();
    });
});


/* 취소 alert */



/* 예매취소 팝업 */
/*function bookingCancel(){
    window.open("myPage_viewCancel", "myPage_viewCancel","width=400, height=600, left=50, top=100");
}*/



/* 티켓보기 팝업 */
function viewTicket() {
    window.open("/viewTicket.do", "myPage_viewTicket", "width=400, height=600, left=50, top=100");
}
