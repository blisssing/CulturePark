$(document).ready(function () {


    $('.btn_Disagree').click(function () {
        eventData = $(this);
        eventRow = $(this).closest('tr');
        $('#DisagreeModal').modal({});

    });

    $('.btn_finalDisagree').click(function () {
        eventRow.remove();
        $('#DisagreeModal').modal('hide');
    });

    $('.btn_Agree').click(function () {
        eventRow = $(this).closest('tr');
        $('#AgreeModal').modal({});
    });


    $('.btn_finalAgree').click(function () {
        var seq = eventRow.children(".td_seq");
        var com = eventRow.children('.td_com');
        var present = eventRow.children('.td_present');
        var email = eventRow.children('.td_email');
        var type = eventRow.children('.td_type');

        //Todo : 행에서 삭제하고 DB에 등록해주는 메서드를 작성할 것


        //Todo : 동작수행이 끝나면 모달을 닫아주고 테이블에서 해당 row 삭제

        eventRow.remove();
        $('#AgreeModal').modal('hide');
    });




});