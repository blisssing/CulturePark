$(document).ready(function () {


    $('.btn_movePage').click(function () {
        eventRow = $(this).closest('tr');
        var review_code = eventRow.children('.review_code').val();
        alert('페이지 이동 review code : ' + review_code);

    });

    $('.btn_user_info').click(function () {
        eventRow = $(this).closest('tr');
        modal_now = $('#UserInfoModal');

        var user_code = eventRow.children('.user_code').val();
        $('#user_code').text(user_code);

        openModal(modal_now);

    });


    $('.btn_trash').click(function () {
        eventRow = $(this).closest('tr');

    });

    $('.btn_reason').click(function () {
        eventRow = $(this).closest('tr');
        var report_code = eventRow.children('.report_code').val();
        modal_now = $('#ReportDetail');
        openModal(modal_now);
        $('#report_code').text(report_code);

    });





    $('.btn_modal_close').click(function () {
        closeModal(modal_now);
    });


    function closeModal(modal_now) {
        modal_now.modal('hide');
    }

    function openModal(modal_now) {
        modal_now.modal({});
    }
});