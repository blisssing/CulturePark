$(document).ready(function () {


    $('.btn_pd_detail').click(function () {
        eventRow = $(this).closest('tr');
        var comp_code = eventRow.children('.comp_code');
        var pd_code = eventRow.children('.pd_code');

        modal_now = $('#PdDetailModal');
    });


    $('.btn_pd_detail').click(function () {
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
            contentType: 'application/json; charset=utf-8',
            url: '/pdDetailProc.ado',
            success: function () {
                location.href = "/pdDetail.ado";
            },
            error: function () {
                alert("실행 실패");
            },
        });


    });

    $('input[name=pd_status]').change(function () {
        eventRow = $(this).closest('tr');
        var pd_seq = eventRow.children('.pd_seq').val();
        var pd_genre1 = eventRow.children('.pd_genre1').val();

        var status = "";
        if ($(this).is(":checked")) {
            status = "ACTIVE"
        } else {
            status = "INACTIVE";
        }

        console.log(pd_seq + "/" + pd_genre1 + "/" + status);
        var jsonObj = new Object();
        jsonObj.pd_seq = pd_seq;
        jsonObj.pd_genre1 = pd_genre1;
        jsonObj.pd_status = status;

        $.ajax({
            type: "POST",
            data: JSON.stringify(jsonObj),
            dataType:"json",
            async: false,
            cache: false,
            contentType: "application/json; charset=utf-8",
            url: "/changePdStatus.mdo",
            success: function (data) {
                console.log(data);
                console.log(JSON.parse(data.result));
                if (data.result === true) {
                    alert("변경사항이 정상적으로 적용됐습니다");
                }
            },
            error: function () {
                alert("실행 오류")
            },
        })

    });



    function closeModal(modal_now) {
        modal_now.modal('hide');
    }

});