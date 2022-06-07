$(document).ready(function () {

    $('.btn_Dicip_detail').click(function () {
        selectedRow = $(this).closest('tr');
        modal_now = $('#DicipDetailModal');


        modal_now.modal({});
    });

    $('.btn_Dicip_cancel').click(function () {
        selectedRow = $(this).closest('tr');

        var selectedUsrCode = selectedRow.children('.user_code');
        selectedRow.remove();

    });



    // common

    $('.btn_modal_close').click(function () {
        modal_now.modal('hide');
    });

});