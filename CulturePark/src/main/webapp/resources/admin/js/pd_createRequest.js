$(document).ready(function () {

    $('.btn_detail').click(function () {
        eventRow = $(this).closest('tr');
        modal_now = $('#RequestInfoModal');

        modal_now.modal({});
    });

    $('.btn_modal_agree').click(function () {
        alert("요청 수락");
        closeModal(modal_now);
        //Todo : Status 상태 바꿔주기
    });


    $('.btn_modal_disagree').click(function () {
        alert("요청 거절");
        closeModal(modal_now);
        //Todo : Status 상태 바꿔주기
    });
    $('.btn_manager_info').click(function () {
        eventRow = $(this).closest('tr');
        var comp_code = eventRow.children('.comp_code');

        modal_now = $('#ManagerInfoModal');
        modal_now.modal({});
    });



    $('.btn_modal_close').click(function () {
        closeModal(modal_now);
    });

    function closeModal(modal_now) {
        modal_now.modal('hide');

    }


});