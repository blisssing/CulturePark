/* 거절사유 팝업 */
function refuse_popup() {
    window.open("/refuse.mdo", "pd_refuse_pop", "width=500px, height=200px");
}

/* 관리자 정보 팝업 */
function adminInfo_popup() {
    window.open( "/adminInfo.mdo", "pd_adminInfo_pop", "width=500px, height=200px");
}


/* 요청하기 모달 */
$(document).ready(function () {

$('.requesting_btn').click(function () {
    eventData = $(this);
    eventRow = $(this).closest('tr');
    $('#RequestingModal').modal({});
});

});