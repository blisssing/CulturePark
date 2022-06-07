$(document).ready(function () {

    $('.btn_user_info').click(function () {
        selectedRow = $(this).closest('tr');
        modal_now = $('#UserInfoModal');

        modal_now.modal({});
    });

    $('.btn_answer').click(function () {
        selectedRow = $(this).closest('tr');
        modal_now = $('#QuestionDetailModal');

        modal_now.modal({});
    });



    //common

    $('.btn_modal_close').click(function () {
        modal_now.modal('hide');
    });

});