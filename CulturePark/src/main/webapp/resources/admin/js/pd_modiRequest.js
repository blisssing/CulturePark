$(document).ready(function () {

    var eventRow = '';


    $('.btn_pd_info').click(function () {
        eventRow= $(this).closest('tr');

        var pd_seq=eventRow.children('.pd_seq').val();
        var pt_seq=eventRow.children('.pt_seq').val();

        var jsonObj = new Object();
        jsonObj.pd_seq = pd_seq;
        jsonObj.pt_seq = pt_seq;

        $.ajax({
            type: 'post',
            data: JSON.stringify(jsonObj),
            datatype: 'json',
            async: false,
            cache: false,
            traditional: true,
            url: '/pdDetail.ado',
        });

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