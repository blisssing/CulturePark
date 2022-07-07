$(document).ready(function () {

    modalNow = "";
    thisRow = "";

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

    // 활성 비활성

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
                if (data.result === 1) {
                    alert("변경사항이 정상적으로 적용됐습니다");
                }
            },
            error: function () {
                alert("실행 오류")
            },
        })

    });


    //


    $('.td_update_btn').click(function () {
        thisRow = $(this).closest('tr');
        var typeStr = thisRow.children('.pd_typeStr').val();
        console.log(typeStr)

        settingBeforeValue(thisRow);
        modalNow = $('#RequestingModal');
        modalNow.modal({});
    });

    $('input[name=af_pd_ticketType]').change(function () {
        var selectedVal = $(this).val();

        if (selectedVal === 'none') {
            $('.af_pd_ticketType').prop('checked', false);
            $('.af_select_price').prop('disabled', true);


            if ($(this).prop('checked')) {
                $('#af_none_price').prop('disabled', false);
            } else {
                $('#af_none_price').prop('disabled', true);
                $('.af_chk_type').prop('disabled', false);
            }



        } else {
            $('#af_type_none').prop('checked', false);
            $('#af_none_price').prop('disabled', true);

            if (selectedVal === 'adult') {
                if ($(this).prop('checked')) {
                    $('#af_adult_price').prop('disabled', false);
                    console.log('여기 실행 1');
                } else {
                    console.log('여기 실행 2');
                    $('#af_adult_price').prop('disabled', true);
                }
            } else if (selectedVal === 'teenager') {
                if ($(this).prop('checked')) {
                    $('#af_teenager_price').prop('disabled', false);
                } else {
                    $('#af_teenager_price').prop('disabled', true);
                }
            } else if (selectedVal === 'child') {
                if ($(this).prop('checked')) {
                    $('#af_child_price').prop('disabled', false);
                } else {
                    $('#af_child_price').prop('disabled', true);
                }
            }
        }



    });

    $('#af_pd_timeTypeSelect').change(function () {

        var pd_timeType = $(this).val();
        console.log(pd_timeType);

        if (pd_timeType === 'none') {
            $('#af_day_max').prop('disabled', true);
            $('#af_pd_openTime').prop('disabled', true);
            $('#af_pd_closeTime').prop('disabled', true);
            $('#af_stage_max').prop('disabled', true);
        } else if (pd_timeType==='day') {
            console.log('여기 수행');
            $('#af_day_max').prop('disabled', false);
            $('#af_pd_openTime').prop('disabled', true);
            $('#af_pd_closeTime').prop('disabled', true);
            $('#af_stage_max').prop('disabled', true);
        } else {
            $('#af_day_max').prop('disabled', true);
            $('#af_pd_openTime').prop('disabled', false);
            $('#af_pd_closeTime').prop('disabled', false);
            $('#af_stage_max').prop('disabled', false);
        }

    });

    $('.btn_Agree2').click(function () {

        var checkResult =checkType1();

        if (checkResult !== -1) {



            var typeStr = "";
            var chk_mode="";
            var pd_maxTicket = "";
            var pd_openTime = "";
            var pd_closeTime = "";
            var pd_thumbnail_PATH = "";
            var pd_descript_PATH = "";
            var pd_mainImg_PATH = "";
            var pd_tag = "";
            var pd_closeDay = "";


            // 유형 기입
            var typeList = $('input[name=af_pd_ticketType]:checked');

            typeList.each(function () {
                var type = $(this).val()
                if (type ==='adult') {
                    var price =$('.af_adult_price').val();
                    typeStr += type + ":" + price+"/";
                } else if (type === 'teenager') {
                    var price =$('.af_teenager_price').val();
                    typeStr += type + ":" + price+"/";
                } else if (type === 'child') {
                    var price =$('.af_child_price').val();
                    typeStr += type + ":" + price+"/";
                } else {
                    var price =$('.af_none_price').val();
                    typeStr += type + ":" + price+"/";
                }
            });

            // 티켓 타입

            var ticketType = $('#af_pd_timeTypeSelect').val();

            if (ticketType === 'day') {
                chk_mode = 1;
                pd_maxTicket = $('#af_day_max').val();
            } else if(pd_timeType === 'time') {
                chk_mode =2;
                pd_maxTicket = $('#af_stage_max').val();
                pd_openTime = $('#af_pd_openTime').val();
                pd_closeTime = $('#af_pd_closeTime').val();
            }


            pd_thumbnail_PATH = $('.pd_thumbnail').val();
            pd_descript_PATH = $('.pd_descript').val();
            pd_mainImg_PATH =$('.pd_mainImg').val();

            pd_tag = $('#af_pd_tag').val();


            var checkedList = $('input[name=day_chkbox]:checked');
            if (checkedList.length === 0) {
                pd_closeDay = 'none';
            } else {
                checkedList.each(function () {
                    if (pd_closeDay === '') {
                        pd_closeDay += $(this).val();
                    } else {
                        pd_closeDay += "/"+$(this).val();
                    }
                });
            }


            var jsonObj = new Object();

            jsonObj.pd_seq = thisRow.children('.pd_seq').val();
            jsonObj.pd_genre1 = thisRow.children('.pd_genre1').val();

            if (chk_mode === 1) {
                // jsonObj.pd_chkMode2 = 1;
                jsonObj.pd_timeType = 'day';
                jsonObj.pd_maxTicket = pd_maxTicket;
            } else if (chk_mode === 2) {
                // jsonObj.pd_chkMode2 = 2;
                jsonObj.pd_timeType = 'time';
                jsonObj.pd_maxTicket = pd_maxTicket;
                jsonObj.pd_openTime = pd_openTime;
                jsonObj.pd_closeTime = pd_closeTime;
            }


            jsonObj.pd_typeStr = typeStr;
            jsonObj.pd_tag = pd_tag;
            jsonObj.pd_closeDay = pd_closeDay;

            jsonObj.pd_thumbnail_PATH = pd_thumbnail_PATH;
            jsonObj.pd_descript_PATH = pd_descript_PATH;
            jsonObj.pd_mainImg_PATH = pd_mainImg_PATH;

            console.log(JSON.stringify(jsonObj));

            $.ajax({
                type:"POST",
                datatype: "json",
                data: JSON.stringify(jsonObj),
                contentType: "application/json; charset=tuf-8",
                cache: false,
                async: false,
                traditional: true,
                success: function (data) {

                },
                error: function () {
                    alert("실행 오류!");
                }
            })



        }

    });

    // 입력갑 확인
    function checkType1() {
        var type_checked = $('input[name=af_pd_ticketType]:checked');

        if (type_checked.length === 0) {
            alert("티켓 유형을 최소 1개 선택해주세요");
            return -1;
        } else {
            type_checked.each(function () {
                console.log('확인 : ' + $(this).val());

                var type = $(this).val()

                if (type ==='adult') {
                    var price =$('.af_adult_price').val();
                } else if (type === 'teenager') {
                    var price =$('.af_teenager_price').val();
                } else if (type === 'child') {
                    var price =$('.af_child_price').val();
                } else {
                    var price =$('.af_none_price').val();
                }

                if (price === '') {
                    alert($(this).val()+ "의 금액을 입력해주세요!");
                    return -1;
                }
            });
        }





    }


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

        var pd_tagStr = eventRow.children('.pd_tag').val();
        $('#bf_pd_tag').val(pd_tagStr);

        var pd_closeDay = $('.pd_closeDay').val();
        setPdCloseDay(pd_closeDay);





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
        $('#bf_pd_openTime').val(pd_openTime).prop('selected', true);
        $('#bf_pd_closeTime').val(pd_closeTime).prop('selected', true);
    }

    function setDayInfo(pd_maxTicket) {
        $('#bf_day_max').val(pd_maxTicket);
    }

    function setPdCloseDay(pd_closeDay) {


        var closeStr = pd_closeDay.split('/');

        for (var str in closeStr) {

            if (closeStr[str] === 'son') {
                $('input[name=chk_son]').attr('checked', 'checked');
            } else if (closeStr[str] === 'mon') {
                $('input[name=chk_mon]').attr('checked', 'checked');
            } else if (closeStr[str] === 'tue') {
                $('input[name=chk_tue]').attr('checked', 'checked');
            } else if (closeStr[str] === ' wen') {
                $('input[name=chk_wen]').attr('checked', 'checked');
            } else if (closeStr[str] === 'thu') {
                $('input[name=chk_thu]').attr('checked', 'checked');
            } else if (closeStr[str] === 'fri') {
                $('input[name=chk_fri]').attr('checked', 'checked');
            } else if (closeStr[str] === 'sat') {
                $('input[name=chk_sat]').attr('checked', 'checked');
            }
        }

    }




});