$(document).ready(function () {


    $('.btn_pd_detail').click(function () {
        eventRow = $(this).closest('tr');
        var comp_code = eventRow.children('.comp_code');
        var pd_code = eventRow.children('.pd_code');

        modal_now = $('#PdDetailModal');
    });



    function closeModal(modal_now) {
        modal_now.modal('hide');
    }

});