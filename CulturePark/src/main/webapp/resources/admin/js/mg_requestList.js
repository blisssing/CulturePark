$(document).ready(function () {

    //세부사항

    $('.btn_More_info').click(function () {
        eventData = $(this);
        eventRow = $(this).closest('tr');
        $('#DetailModal').modal({});
    });


    // 세부사항 거절
    $('.btn_Disagree2').click(function () {

        $('#DetailModal').modal('hide');
        $('#DisagreeModal').modal({});
    });

    // 리스트에서 거절
    $('.btn_Disagree').click(function () {
        eventData = $(this);
        eventRow = $(this).closest('tr');
        $('#DetailModal').modal('hide');
        $('#DisagreeModal').modal({});
    });

    // 중간 확인
    $('.btn_check_Disagree').click(function () {
        // eventRow.remove();
        $('#DisagreeModal').modal('hide');
        $('#ReasonModal').modal({});
    });

    // 사유 모달 및 최종 거절

    $('.btn_finalDisAgree').click(function () {
        var text = $('#refuseReason').val();

        if (chk_reason(text)) {
            removeRow(eventRow);
            $('#ReasonModal').modal('hide');
        } else {
            console.log('실행취소');
        }

    });

    function removeRow(row) {
        row.remove();
    }


    function chk_reason(text) {
        if (text.trim().length <10) {
            alert('최소 10글자 이상 기입하시길 바랍니다');
            return false;
        } else {
            return true;
        }

    }


    // 동의
    $('.btn_Agree').click(function () {
        $('#DetailModal').modal('hide');
        eventRow = $(this).closest('tr');
        $('#AgreeModal').modal({});
    });

    $('.btn_Agree2').click(function () {
        $('#DetailModal').modal('hide');
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