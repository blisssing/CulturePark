$(document).ready(function () {

    $('.btn_detail').click(function () {

        // clearDetail();

        eventRow = $(this).closest('tr');
        modal_now = $('#RequestInfoModal');
        modal_now.modal({});


        var pd_seq = eventRow.children('.pd_request_code').val();
        var pd_timeType = eventRow.children('.pd_timeType').val();
        var pd_openTime = eventRow.children('.pd_openTime').val();
        var pd_closeTime = eventRow.children('.pd_closeTime').val();
        var str = eventRow.children('.pd_typeStr').val();
        var pd_closeDay = eventRow.children('.pd_closeDay').val();

        $('#request_code').text(pd_seq);
        $('#comp_name').text(eventRow.children('.comp_name').text());
        $('#pd_title').text(eventRow.children('.pd_title').text());

        if (pd_timeType === 'day') {
            $('#pd_dayTicket').text($('input[name=pd_maxTicket]').val());
            $('.pd_timeTypeSelect option:eq(0)').prop("selected", true);
        } else {
            $('#pd_StageTicket').text($('input[name=pd_maxTicket]').val());
            $('.pd_timeTypeSelect option:eq(1)').prop("selected", true);
        }

        $('#pd_openTime').val(pd_openTime).prop('selected', true);
        $('#pd_closeTime').val(pd_closeTime).prop('selected', true);

        console.log(pd_closeDay);

        getTypeInfo(str);
        getCloseDay(pd_closeDay);

    });

    $('.btn_modal_agree').click(function () {

        var request_status = $('.request_status').text();

        if (request_status !== 'AGREE') {

            alert("요청 수락");
            var jsonObj = createJsonData();

            var pcl_status = 'agree';
            jsonObj.pcl_status = pcl_status;

            var pcl_comments = 'none';
            jsonObj.pcl_comments = pcl_comments;

            $.ajax({
                type: "POST",
                data: JSON.stringify(jsonObj),
                datatype: "JSON",
                contentType: "application/json; charset=utf-8",
                url: "/agreeCreateProduct.ado",
                cache: false,
                async: false,
                traditional: true,
                success: function (data) {
                    var resultStr = data
                    if (resultStr === 'success') {
                        console.log('등록완료!');
                        closeModal(modal_now);
                    } else {
                        console.log('등록실패!!');
                    }
                },
                error: function () {
                    alert("실행 실패!!");
                }
            });
        } else {
            alert("이미 허가된 요청입니다!!");

        }


        //Todo : Status 상태 바꿔주기
    });

    $('.btn_modal_disagree').click(function () {

        var request_status = eventRow.children('.request_status').text();

        if (request_status.toUpperCase() === 'REFUSED') {
            alert("이미 거절된 요청입니다");
            closeModal(modal_now);
        } else if (request_status.toUpperCase() === 'AGREE') {
            alert("이미 승인된 요청입니다!");
            closeModal(modal_now);
        } else {
            closeModal(modal_now);
            modal_now = $('#SendRefuseReasonModal');
            modal_now.modal({});
        }
    });

    $('.btn_final_refuse').click(function () {

        var jsonObj=createJsonData();

        var pcl_status = 'REFUSED';
        jsonObj.pcl_status = pcl_status;

        var pcl_comments = $('#pcl_comments').val();
        jsonObj.pcl_comments = pcl_comments;

        $.ajax({
            type: 'post',
            url: 'refuseCreateProduct.ado',
            datatype: 'json',
            data: JSON.stringify(jsonObj),
            contentType: 'application/json; charset=utf-8',
            async: false,
            cache: false,
            traditional: true,
            success: function (data) {
                var result = data;
                if (result === 'sucess') {
                    alert("요청 거절 성공");
                    location.reload();
                } else {
                    alert("요청 거절 실패!!");
                }

            },
            error: function () {
                alert("동작실패");
            }

        });

    });

    function createJsonData() {

        var jsonObj = new Object();
        var pdr_seq = eventRow.children('.pd_request_code').val();
        var ad_seq = $('#ad_seq').val();

        var pt_seq = eventRow.children('.pt_seq').val();

        jsonObj.pdr_seq = pdr_seq;
        jsonObj.ad_seq = ad_seq;
        jsonObj.pt_seq = pt_seq;

        return jsonObj;
    }


    $('.btn_manager_info').click(function () {
        eventRow = $(this).closest('tr');
        var pt_seq = eventRow.children('.pt_seq').val();
        var pd_request_manager = eventRow.children('.pd_request_manager').val();

        jsonObj.pt_seq = pt_seq;
        jsonObj.mg_email = pd_request_manager;

        $.ajax({
            type:"post",
            datatype: "json",
            data: JSON.stringify(jsonObj),
            contentType: "application/json; charset=utf-8",
            url:"/getManagerInfo.ado"
        })


        modal_now = $('#ManagerInfoModal');
        modal_now.modal({});
    });



    $('.btn_modal_close').click(function () {
        // clearDetail();
        location.reload();
    });


    $('.pd_timeTypeSelect').change(function () {
        var selectedVal = $(this).val();
        if (selectedVal === 'day') {
            $('#pd_StageTicket').prop('disabled', true);
            $('#pd_dayTicket').prop('disabled', false);
            $('#pd_openTime').prop('disabled', true);
            $('#pd_closeTime').prop('disabled', true);
        } else {
            $('#pd_StageTicket').prop('disabled', false);
            $('#pd_dayTicket').prop('disabled', true);
            $('#pd_openTime').prop('disabled', false);
            $('#pd_closeTime').prop('disabled', false);
        }

    });

    function closeModal(modal_now) {
        modal_now.modal('hide');

    }

    function clearDetail() {
        $('.modal_content_div').text('');
        $('.pd_closeDay').prop('checked', false);
    }

    function getTypeInfo(str) {
        var splitList = str.split('/');
        var keyList = new Array();
        var cloneList;
        console.log(str);

        for (var i = 0; i < splitList.length - 1; i++) {
            cloneList = splitList[i].split(':');
            var key = cloneList[0];
            var value = cloneList[1];
            if ( key=== 'none') {
                $('#none_price').text(value);
            } else if (key === 'adult') {
                $('#adult_price').text(value);
            } else if (key === 'teenager') {
                $('#teenager_price').text(value);
            } else if (key === 'children') {
                $('#child_price').text(value);
            }

            if ($('#none_price').text() === '') {
                $('.none_row').css('display','none');
            } else {
                $('.none_row').css('display','flex');
            }

            if ($('#adult_price').text() === '') {
                $('.adult_row').css('display', 'none');
            } else {
                $('.adult_row').css('display', 'flex');
            }
            if ($('#teenager_price').text() === '') {
                $('.teenager_row').css('display', 'none');
            } else {
                $('.teenager_row').css('display', 'flex');
            }
            if ($('#child_price').text() === '') {
                $('.child_row').css('display', 'none');
            } else {
                $('.child_row').css('display', 'flex');
            }

        }


    }

    function getCloseDay(closeDay) {
        var splitList = closeDay.split('/');

        for (var i = 0; i < splitList.length; i++) {
            var value = splitList[i];
            console.log(value);
            if (value === 'son') {
                $('input[name=chk_son]').attr('checked', 'checked');
            } else if (value === 'mon') {
                $('input[name=chk_mon]').attr('checked', 'checked');
            } else if (value === 'tue') {
                console.log('화요일!!');
                $('input[name=chk_tue]').attr('checked', 'checked');
            } else if (value === 'wed') {
                $('input[name=chk_wen]').attr('checked', 'checked');
            } else if (value === 'thu') {
                console.log('목요일!');
                $('input[name=chk_thu]').attr('checked', 'checked');
            } else if (value === 'fri') {
                $('input[name=chk_fri]').attr('checked', 'checked');
            } else {
                $('input[name=chk_sat]').attr('checked', 'checked');
            }
        }
    }





});