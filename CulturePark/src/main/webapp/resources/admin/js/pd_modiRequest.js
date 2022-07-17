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

    $('.btn_request_info').click(function () {
        selectedRow = $(this).closest('tr');
        var pmr_seq = selectedRow.children('.pmr_seq').val();

        $.ajax({
            type:'post',
            datatype: 'text',
            data: {"pmr_seq":pmr_seq},
            async: false,
            cache: false,
            url: '/pmrInfo.ado',
            success: function (data) {
                console.log("성공");
                var typeStr = data.pd_typestr;
                var maxTicket = data.pd_maxticket;
                var openTime = data.pd_opentime;
                var closeTime = data.pd_closetime;
                var timeType = data.pd_timetype;
                var tag = data.pd_tag;
                var closeDay = data.pd_closeday;
                settingPmrInfo(typeStr, maxTicket, openTime, closeTime, timeType, tag, closeDay);
                typeStr = $('.pd_typeStr').val();
                maxTicket=  $('.pd_maxTicket').val();
                openTime = $('.pd_openTime').val();
                closeTime = $('.pd_closetime').val();
                timeType = $('.pd_timeType').val();
                tag = $('.pd_tag').val();
                closeDay = $('.pd_closeDay').val();
                settingPdInfo(typeStr, maxTicket, openTime, closeTime, timeType, tag, closeDay);
            }

        })


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

    $('.btn_refuse').click(function () {
        closeModal(modal_now);
        modal_now = $('#ReasonModal');
        modal_now.modal({});
    });

    $('.btn_finalDisAgree').click(function () {

        var pmr_seq = eventRow.children('.pmr_seq').val();
        var pt_seq = eventRow.children('.pt_seq').val();
        var pml_comments = $('#refuseReason').val();

        var jsonObj = new Object();

        jsonObj.pmr_seq = pmr_seq;
        jsonObj.pt_seq = pt_seq;
        jsonObj.pml_comments = pml_comments;

        $.ajax({
            type:'post',
            datatype: 'json',
            data: JSON.stringify(jsonObj),
            async: false,
            cache: false,
            traditional: true,
            url: '/refusePmr.ado',
            success: function (data) {

            },
            error: function () {
                alert("잘못된 동작");
            }
        });


    });


    function closeModal(modal_now) {
        modal_now.modal('hide');
    }

    function settingPmrInfo(typeStr, maxTicket, openTime, closeTime, timeType,tag, closeDay) {

        var typeList =typeStr.split('/');
        for (var i = 0; i < typeList.length; i++) {
            var typeAry = typeList[i].split(':');

            var typeKey = typeAry[0];
            var typeVal = typeAry[1];
            console.log('i : ' + i);
            console.log(typeKey);
            console.log(typeVal);

            switch (typeKey) {
                case 'adult':
                    $('#af_chk_adult').prop('checked', true);
                    $('#af_adult_price').val(typeVal);
                    break;
                case 'teenager':
                    $('#af_chk_teenager').prop('checked', true);
                    $('#af_teenager_price').val(typeVal);
                    break;
                case 'child':
                    $('#af_chk_child').prop('checked', true);
                    $('#af_child_price').val(typeVal);
                    break;
                case 'none':
                    $('#af_chk_none').prop('checked', true);
                    $('#af_none_price').val(typeVal);
                    break;
            }

        }

        if (timeType === 'day') {
            $('#choice2').val('day').prop('selected', true);
        } else {
            $('#choice2').val('time').prop('selected', true);
        }

        $('#af_ticketMax').val(maxTicket);

        if (openTime !== 0 || openTime !== undefined) {
            $('#af_openTime').val(openTime+ ":00" );
            $('#af_closeTime').val(closeTime+ ":00");
        }

        var closeAry = closeDay.split('/');

        for (var i = 0; i < closeAry.length; i++) {
            var close = closeAry[i];

            switch (close) {

                case 'sun':
                    $('#af_sunday').prop('checked', true);
                    break;
                case 'mon':
                    $('#af_monday').prop('checked', true);
                    break;
                case 'tue':
                    $('#af_tuesday').prop('checked', true);
                    break;
                case 'wen':
                    $('#af_wednesday').prop('checked', true);
                    break;
                case 'thu':
                    $('#af_thursday').prop('checked', true);
                    break;
                case 'fri':
                    $('#af_friday').prop('checked', true);
                    break;
                case 'sat':
                    $('#af_saturday').prop('checked', true);
                    break;
            }

        }

        $('#af_pd_tag').val(tag);

    }

    function settingPdInfo(typeStr, maxTicket, openTime, closeTime, timeType, tag, closeDay) {
        var typeList =typeStr.split('/');
        for (var i = 0; i < typeList.length; i++) {
            var typeAry = typeList[i].split(':');
            var typeKey = typeAry[0];
            var typeVal = typeAry[1];

            switch (typeKey) {
                case 'adult':
                    $('#bf_chk_adult').prop('checked', true);
                    $('#bf_adult_price').val(typeVal);
                    break;
                case 'teenager':
                    $('#bf_chk_teenager').prop('checked', true);
                    $('#bf_teenager_price').val(typeVal);
                    break;
                case 'child':
                    $('#bf_chk_child').prop('checked', true);
                    $('#bf_child_price').val(typeVal);
                    break;
                case 'none':
                    $('#bf_chk_none').prop('checked', true);
                    $('#bf_none_price').val(typeVal);
                    break;
            }

        }

        if (timeType === 'day') {
            $('#choice1').val('day').prop('selected', true);
        } else {
            $('#choice1').val('time').prop('selected', true);
        }

        $('#bf_ticketMax').val(maxTicket);

        if (openTime !== 0 || openTime !== undefined) {
            $('#bf_openTime').val(openTime+ ":00" );
            $('#bf_closeTime').val(closeTime+ ":00");
        }

        var closeAry = closeDay.split('/');

        for (var i = 0; i < closeAry.length; i++) {
            var close = closeAry[i];

            switch (close) {

                case 'sun':
                    $('#bf_sunday').prop('checked', true);
                    break;
                case 'mon':
                    $('#bf_monday').prop('checked', true);
                    break;
                case 'tue':
                    $('#bf_tuesday').prop('checked', true);
                    break;
                case 'wen':
                    $('#bf_wednesday').prop('checked', true);
                    break;
                case 'thu':
                    $('#bf_thursday').prop('checked', true);
                    break;
                case 'fri':
                    $('#bf_friday').prop('checked', true);
                    break;
                case 'sat':
                    $('#bf_saturday').prop('checked', true);
                    break;
            }

        }

        $('#af_pd_tag').val(tag);
    }


});