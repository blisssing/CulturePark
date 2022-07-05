$(document).ready(function () {

    modalNow = "";


    $('.btn_adminInfo').click(function () {
        var thisRow = $(this).closest('tr');
        var pd_seq = thisRow.children('.pd_seq').val();
        adminInfo_popup(pd_seq);
    });

    function adminInfo_popup(pd_seq) {
        $.ajax({
            type: "post",
            data: {"pd_seq":pd_seq},
            datatype:"text",
            url: "/getAdminInfo.mdo",
            async: false,
            cache: false,
            success: function (data) {
                window.open("openAdminInfoPop.mdo");
            },
        })
    }


    $('.td_update_btn').click(function () {
        var thisRow = $(this).closest('tr');
        var typeStr = thisRow.children('.pd_typeStr').val();
        console.log(typeStr)

        settingBeforeValue(thisRow);
        modalNow = $('#RequestingModal');
        modalNow.modal({});
    });

    function settingBeforeValue(eventRow) {
        var typeStr = eventRow.children('.pd_typeStr').val();
        setTypeInfo(typeStr);
        var pd_timeType = eventRow.children('.pd.timeType').val();
        var pd_maxTicket = eventRow.children('.pd_maxTicket').val();
        var pd_openTime = eventRow.children('.pd_openTime').val();
        var pd_closeTime = eventRow.children('.pd_closeTime').val();


        if (pd_timeType === 'day') {
            $('.pd_timeTypeSelect option:eq(0)').prop("selected", true);
            setDayInfo( pd_maxTicket)
        } else {
            $('.pd_timeTypeSelect option:eq(1)').prop("selected", true);
            setTimeInfo( pd_maxTicket, pd_openTime, pd_closeTime);
        }


    }

    function setTypeInfo(str) {
        var splitList = str.split('/');
        var cloneList;

        for (var i = 0; i < splitList.length - 1; i++) {
            cloneList = splitList[i].split(':');
            var key = cloneList[0];
            var value = cloneList[1];

            console.log("key :  " + key);
            console.log("value : " + value);
            if ( key=== 'none') {
                $('#bf_none_price').val(value);
            } else if (key === 'adult') {
                $('#bf_adult_price').val(value);
            } else if (key === 'teenager') {
                $('#bf_teenager_price').val(value);
            } else if (key === 'children') {
                $('#bf_child_price').val(value);
            }
        }
    }

    function setTimeInfo(pd_maxTicket, pd_openTime, pd_closeTime) {
        $('#bf_stage_max').val(pd_maxTicket);
        $('#bf_pd_openTime').val(pd_openTime);
        $('#bf_pd_closeTime').val(pd_closeTime);
    }

    function setDayInfo(pd_maxTicket) {
        $('#bf_day_max').val(pd_maxTicket);
    }




});