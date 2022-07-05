$(document).ready(function () {

    var eventRow = "";

    $('.td_update_btn').click(function () {
        eventRow = $(this).closest('tr');
        settingBefore(eventRow);







    });

    function settingBefore(eventRow) {
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
        console.log(str);

        for (var i = 0; i < splitList.length - 1; i++) {
            cloneList = splitList[i].split(':');
            var key = cloneList[0];
            var value = cloneList[1];
            if ( key=== 'none') {
                $('#bf_none_price').text(value);
            } else if (key === 'adult') {
                $('#bf_adult_price').text(value);
            } else if (key === 'teenager') {
                $('#bf_teenager_price').text(value);
            } else if (key === 'children') {
                $('#bf_child_price').text(value);
            }
        }
    }

    function setTimeInfo(pd_maxTicket, pd_openTime, pd_closeTime) {
        $('#bf_stage_max').text(pd_maxTicket);
        $('#bf_pd_openTime').text(pd_openTime);
        $('#bf_pd_closeTime').text(pd_closeTime);
    }

    function setDayInfo(pd_maxTicket) {
        $('#bf_day_max').text(pd_maxTicket);
    }




});