$(document).ready(function () {

    $('.btn_user_info').click(function () {
        selectedRow = $(this).closest('tr');
        modal_now = $('#UserInfoModal');

        modal_now.modal({});
    });

    $('.btn_refund').click(function () {
        selectedRow = $(this).closest('tr');
        modal_now = $('#RefundModal');

        modal_now.modal({});
        var result_chk = canRefund();
    });


    $('.btn_final_refund').click(function () {
        alert("환불처리가 완료됐습니다");
        modal_now.modal('hide');
    });

    $('.btn_strong_refund').click(function () {
        alert("강제환불처리가 완료됐습니다");
        modal_now.modal('hide');
    });

    $('.btn_modal_close').click(function () {
        modal_now.modal('hide');
    });



    // Todo : 환불 가능한지 판단해주는 코드를 작성해줄 것
    function canRefund(paymentDate, ticketDate) {

        var now;

        if (paymentDate === ticketDate) {
            return true;
        } else if (now - 7 > paymentDate) {
            return true;
        } else if (paymentDate > ticketDate) {
            return false
        }

        return true;

    }

});