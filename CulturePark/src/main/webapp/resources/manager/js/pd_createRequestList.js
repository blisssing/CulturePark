$(document).ready(function () {
    var modal_now = "";

    $('.btn_refuseReason').click(function () {
        var thisRow = $(this).closest('tr');
        var pdr_seq = thisRow.children('.pdr_seq').val();

        $.ajax({
            type: "post",
            data: {"pdr_seq": pdr_seq},
            datatype:"text",
            url: "/getProductRequestLog.mdo",
            async: false,
            cache:false,
            success: function (data) {
                data = JSON.parse(data);
                var result = data.result;
                var ad_email = data.ad_email;
                var ad_tel = data.ad_tel;
                var pcl_comments = data.pcl_comments;

                if (result === 'success') {
                    openReasonModal(ad_email, ad_tel, pcl_comments);
                } else {
                    alert("데이터를 불러오는 데에 실패했습니다");
                }
            },
            error: function () {
                alert("동작실패!!");
            }
        });

        function openReasonModal(ad_email,ad_tel,pcl_comments) {

            $('#AdminEmail').text(ad_email);
            $('#AdminTel').text(ad_tel);
            $('#RefuseReasonTextbox').val(pcl_comments);
            $('#RefuseReasonTextbox').attr('readonly', "readonly");

            modal_now = $('#RefuseReasonModal');
            modal_now.modal({});
        }


    });

    $('.close_btn').click(function () {
        $('.modal_content_div').remove;
        modal_now.modal('hide');
    });

    $('.btn_detail').click(function () {
        eventRow = $(this).closest('tr');
        modal_now = $('#RequestInfoModal');

        var pd_timeType = eventRow.children('.pdr_timeType').val();
        var pd_openTime = eventRow.children('.pdr_openTime').val();
        var pd_closeTime = eventRow.children('.pdr_closeTime').val();
        var str = eventRow.children('.pdr_typeStr').val();
        var pd_closeDay = eventRow.children('.pdr_closeDay').val();

        $('#pd_title').text(eventRow.children('.pdr_title').text());
        $('#pd_class_1').text(eventRow.children('.pdr_genre1').val());

        var pd_class2 = eventRow.children('.pdr_genre2').val();

        if (pd_class2.trim() === '' || pd_class2.trim() === null) {
            $('#pd_class_2').text('');
        } else {
            $('#pd_class_2').text(pd_class2);
        }

        $('#start_date').text(eventRow.children('.pdr_startDate').val());
        $('#end_date').text(eventRow.children('.pdr_closeDate').val());
        $('#pd_place').text(eventRow.children('.pdr_place').val());

        var min_age = eventRow.children('.pdr_minAge').val();

        if (min_age < 0) {
            $('#pd_minAge').text("전체 이용가");
        } else{
            $('#pd_minAge').text(min_age + "세 이용가");
        }


        if (pd_timeType === 'day') {
            $('#pd_dayTicket').text($('input[name=pd_maxTicket]').val());
            $('.pd_timeTypeSelect option:eq(0)').prop("selected", true);
        } else {
            $('#pd_StageTicket').text($('input[name=pd_maxTicket]').val());
            $('.pd_timeTypeSelect option:eq(1)').prop("selected", true);
        }

        $('#pd_openTime').val(pd_openTime).prop('selected', true);
        $('#pd_closeTime').val(pd_closeTime).prop('selected', true);

        getTypeInfo(str);
        getCloseDay(pd_closeDay);

        modal_now.modal({});
    });

    function getTypeInfo(str) {
        var splitList = str.split('/');
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