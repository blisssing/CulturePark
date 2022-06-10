$(document).ready(function () {

    $('.btn_request_info').click(function () {

        eventRow = $(this).closest('tr');
        modal_now = $('#RequestInfoModal');
        modal_now.modal({});

    });



    //common

    function closeModal(modal_now) {
        modal_now.modal('hide');
    }

});