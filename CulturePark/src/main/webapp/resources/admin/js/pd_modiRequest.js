$(document).ready(function () {

    $('.btn_pd_info').click(function () {
        location.href="/pdDetail.ado"
    });

    $('.btn_request_info').click(function () {
        selectedRow = $(this).closest('tr');
        modal_now = $('#RequestInfoModal');
        modal_now.modal({});
    });

    $('.btn_manager_info').click(function () {
        selectedRow = $(this).closest('tr');
        modal_now = $('#ManagerInfoModal');
        modal_now.modal({});
    });

    //common

    $('.btn_close_modal').click(function () {
        closeModal(modal_now);
    });


    function closeModal(modal_now) {
        modal_now.modal('hide');
    }


});