$(document).ready(function () {

    $('.btn_request_info').click(function () {

        eventRow = $(this).closest('tr');
        modal_now = $('#RequestInfoModal');
        modal_now.modal({});
    });

    $('.btn_accept_request').click(function () {

        var request_status = eventRow.children('.request_status');

        if (request_status.text() === '처리대기') {
            console.log(request_status.text());
            alert('요청을 처리하기 시작합니다.');
        } else if (request_status.text() === '처리중') {
            alert('이미 처리가 진행 중인 요청입니다');
        } else {
            alert('이미 처리가 완료된 요청입니다.')
        }
    });

    $('.btn_disagree').click(function () {
        closeModal(modal_now);

        modal_now = $('#RefuseRequestModal');
        modal_now.modal({});
    });







    //common

    $('.btn_modal_close').click(function () {
        closeModal(modal_now);
    });

    function closeModal(modal_now) {
        modal_now.modal('hide');
    }

});