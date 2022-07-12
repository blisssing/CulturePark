$(document).ready(function () {

    //세부사항

    $('.btn_More_info').click(function () {
        eventData = $(this);
        eventRow = $(this).closest('tr');
        $('#CompanyName').text(eventRow.children('.pt_comp_name').text());
        $('#PresentName').text(eventRow.children('.pt_ceo_name').text());
        $('#CompanyNum').text(eventRow.children('.pt_ceo_number').val());
        $('#PhoneNumber').text(eventRow.children('.pt_phone').val());
        $('#CompanyEmail').text(eventRow.children('.pt_email').text());
        $('#file_path').val(eventRow.children('.pt_file').val());
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

    // 첨부파일 다운로드

    $('#file_path').click(function () {
        var fileName= eventRow.children('.pt_file').val();
        var pt_seq = eventRow.children('.pt_seq').val();

        var obj = new Object();
        obj.pt_seq = pt_seq;
        obj.pt_file = fileName;

        $.ajax({
            type:"POST",
            dataType: "json",
            data: JSON.stringify(obj),
            contentType: "application/json; charset=UTF-8",
            async: false,
            cache: false,
            traditional: true,
            url:"",
            success: function () {

            },
            error: function () {

            }


        });

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
        eventRow = $(this).closest('tr');

        if (!eventRow.children('.pt_status') === '처리대기') {
            alert("이미 처리가 완료된 요청입니다!!");
        } else {
            $('#DetailModal').modal('hide');
            $('#AgreeModal').modal({});
        }


    });

    $('.btn_Agree2').click(function () {
        if (! eventRow.children('.pt_status').text()==='처리대기') {
            alert("이미 처리가 완료된 요청입니다!!");
        } else {
            $('#DetailModal').modal('hide');
            $('#AgreeModal').modal({});
        }
    });


    $('.btn_finalAgree').click(function () {
        var pt_seq = eventRow.children(".pt_seq").val();
        var pt_email = eventRow.children('.pt_email').text();
        var pt_comp_name = eventRow.children('.pt_comp_name').text();
        var pt_ceo_name = eventRow.children('.pt_ceo_name').text();
        var pt_ceo_number = eventRow.children('.pt_ceo_number').val();
        var pt_file = eventRow.children('.pt_file').val();
        var pt_phone = eventRow.children('.pt_phone').val();
        var pt_createDate = eventRow.children('.pt_createDate').text();
        var pt_status = eventRow.children('.pt_status').text();
        var pt_register_name = eventRow.children('.pt_register_name').text()

        //Todo : ajax작성

        var json = {"pt_seq": pt_seq,"pt_email":pt_email,"pt_comp_name":pt_comp_name,
                    "pt_ceo_name":pt_ceo_name , "pt_ceo_number":pt_ceo_number,"pt_file":pt_file,
                    "pt_phone":pt_phone,"pt_createDate":pt_createDate,"pt_status":pt_status,
                    "pt_register_name":pt_register_name};

        console.log(json);

        $.ajax({
            type:"post",
            datatype:"json",
            data: JSON.stringify(json),
            async:false,
            cache:false,
            url:"agreePartnerRequest.ado",
            contentType:"application/json; charset=utf-8",
            success: function (data) {

            },
            error: function () {

            }
        })

        //Todo : 동작수행이 끝나면 모달을 닫아주고 테이블에서 해당 row 삭제

        eventRow.remove();
        $('#AgreeModal').modal('hide');
    });




});