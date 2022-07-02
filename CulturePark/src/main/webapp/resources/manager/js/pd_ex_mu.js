/* 거절사유 팝업 */
function refuse_popup() {
    window.open("/refuse.mdo", "pd_refuse_pop", "width=500px, height=200px");
}

/* 관리자 정보 팝업 */
function adminInfo_popup() {
    window.open( "/adminInfo.mdo", "pd_adminInfo_pop", "width=500px, height=200px");
}


/* 요청하기 모달 */
$(document).ready(function () {

    var pd_first_genre;
    var pd_second_genre;
    var pd_title;

    var pd_place;
    var pd_minAge;

    var pd_timeType;
    var pd_maxTicket;


    var pd_thumbnail_PATH;
    var pd_descript_PATH;
    var pd_mainImg_PATH;
    var pd_tag;
    var pd_closeDay='';
    var pd_openTime;
    var pd_closeTime;

    var pd_startDate;
    var pd_closeDate;


    var chk_mode1=0;
    var chk_mode2=0;



    $('.td_update_btn').click(function () {
        eventData = $(this);
        eventRow = $(this).closest('tr');
        $('#RequestingModal').modal({});
    });

    // 진희
    $('#choice2').change(function () {
        var selected_val = $('#choice2 option:selected').val();
        console.log(selected_val);

        if (selected_val === 'day') {
            $('.tck_day').attr('disabled', false);
            $('.tck_time').attr('disabled', true);
            $('.tck_timeStage').attr('disabled', true);
        } else if (selected_val === 'time') {
            $('.tck_day').attr('disabled', true);
            $('.tck_timeStage').attr('disabled', false);
            $('.tck_time').attr('disabled', false);
        } else {
            $('.tck').attr('disabled', true);
        }
    });

    $('.first_select').change(function () {
        var first_val = $('.genre_select').val();
        if (first_val === 'museum') {
            $('.second_select').prop('disabled', true);
        } else {
            $('.second_select').prop('disabled', false);
        }

    });


    $('.no_distinction').change(function () {

        if ($(this).prop('checked')) {
            $('.chk_type').prop('checked', false);
            $('.chk_type').closest('tr').children('.td_1').children('.price').prop('disabled', true);
            $(this).closest('tr').children('.td_1').children('.price').prop('disabled', false);
        } else {
            $(this).closest('tr').children('.td_1').children('.price').prop('disabled', true);
        }
    });


    $('.chk_type').change(function () {
        if ($(this).prop("checked")) {
            $('.no_distinction').prop('checked', false);
            $('.no_distinction').closest('tr').children('.td_1').children('.price').prop('disabled', true);
            $(this).closest('tr').children('.td_1').children('.price').prop('disabled', false);
        } else {
            $(this).closest('tr').children('.td_1').children('.price').prop('disabled', true);
        }

        var checkedPart = $(this);

        if (checkedPart.val() === 'none'&& $(this).prop('checked')) {

        }

    });

    $('.tck').change(function () {
        var open = parseInt($('.open_tck').val());
        var close = parseInt($('.close_tck').val());
        console.log(open+","+close);
        if (open >= close) {
            alert("오픈 시간은 마감시간보다 빨라야 합니다.");
            $(this).find("option:eq(0)").prop("selected", true);
        }
    });

    $('.datePicker').change(function () {

        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();

        console.log(startDate);
        console.log(endDate);

        if (new Date(startDate) > new Date(endDate) ) {
            alert("시작날짜는 종료날짜의 이후로 설정될 수 없습니다");
            $('.datePicker').val('');
        }

    });

    // Datepicker

    $('#startDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames:['일','월','화','수','목','금','토'],
        dayNamesShort:['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: false,
        yearSuffix: '년',
        changeYear:true,
        changeMonth: true,
        minDate:0
    });

    $('#endDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames:['일','월','화','수','목','금','토'],
        dayNamesShort:['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: false,
        yearSuffix: '년',
        changeYear:true,
        changeMonth: true,
        minDate:0
    });


    $('.regist_btn').click(function () {
        var resultChk= chkValues();

        if (resultChk == -1) {
            return;
        }

        // 값 기입하기

        // 장르
        pd_first_genre = $('.first_select').val();

        if (pd_first_genre === 'exhibition') {
            chk_mode1 = 1;
            pd_second_genre = $('.second_select').val();
        } else {
            chk_mode1 = 2;
        }

        // 작품명
        pd_title = $('.pd_name_text').val();

        // 장소 , 최소 연령

        pd_place = $('.pd_place').val();
        pd_minAge = $('input[name=slc_age]:selected').val();



        // 티켓 연령 유형
        var typeChkList =$('input[name=pd_ticketType]:checked');
        var jsonData
        var typeStr = "";
        typeChkList.each(function () {
            var type = $(this).val()
            if (type ==='adult') {
                var price =$('.adult_price').val();
                typeStr += type + ":" + price+"/";
            } else if (type === 'teenager') {
                var price =$('.teenager_price').val();
                typeStr += type + ":" + price+"/";
            } else if (type === 'child') {
                var price =$('.children_price').val();
                typeStr += type + ":" + price+"/";
            } else {
                var price =$('.nonDistinc_price').val();
                typeStr += type + ":" + price+"/";
            }
        });


        // 티켓 타입

        pd_timeType = $('#choice2').val();

        if (pd_timeType === 'day') {
            chk_mode2 = 1;
            pd_maxTicket = $('.tck_day').val();
        } else if(pd_timeType === 'time') {
            chk_mode2 =2;
            pd_maxTicket = $('.tck_timeStage').val();
            pd_openTime = $('.open_tck').val();
            pd_closeTime = $('.close_tck').val();

        }

        // 첨부파일

        pd_thumbnail_PATH = $('.pd_thumbnail').val();
        pd_descript_PATH = $('.pd_descript').val();
        pd_mainImg_PATH =$('.pd_mainImg').val();

        pd_tag = $('input[name=pd_tag]').val();

        // 휴관요일

        var checkedList = $('input[name=day_chkbox]:checked');
        pd_closeDay = "";

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

        // 운영 기간

        pd_startDate = $('#startDate').val();
        pd_closeDate = $('#endDate').val()


        var jsonObj = new Object();


        if (chk_mode1 === 1) {
            // jsonObj.pd_chkMode1 = 1;
            jsonObj.pd_genre1 = pd_first_genre;
            jsonObj.pd_genre2 = pd_second_genre;
        } else if (chk_mode1 === 2) {
            // jsonObj.pd_chkMode1 = 2;
            jsonObj.pd_genre1 = pd_first_genre;
        }

        if (chk_mode2 === 1) {
            // jsonObj.pd_chkMode2 = 1;
            jsonObj.pd_timeType = 'day';
            jsonObj.pd_maxTicket = pd_maxTicket;
        } else if (chk_mode2 === 2) {
            // jsonObj.pd_chkMode2 = 2;
            jsonObj.pd_timeType = 'time';
            jsonObj.pd_maxTicket = pd_maxTicket;
            jsonObj.pd_openTime = pd_openTime;
            jsonObj.pd_closeTime = pd_closeTime;
        }

        jsonObj.pd_title = pd_title;
        jsonObj.pd_place = pd_place;
        jsonObj.pd_minAge = pd_minAge;
        jsonObj.pd_thumbnail_PATH = pd_thumbnail_PATH;
        jsonObj.pd_descript_PATH = pd_descript_PATH;
        jsonObj.pd_mainImg_PATH = pd_mainImg_PATH;

        jsonObj.pd_tag = pd_tag;
        jsonObj.pd_closeDay = pd_closeDay;
        jsonObj.pd_typeStr = typeStr;
        jsonObj.pd_startDate = pd_startDate;
        jsonObj.pd_closeDate = pd_closeDate;

        $.ajax({
            type:"post",
            data: JSON.stringify(jsonObj),
            datatype:"json",
            contentType: "application/json; charset=utf-8",
            url:"/requestNewProduct.mdo",
            cache:false,
            async:false,
            traditional:true,
            success: function (data) {
                alert("정상 수행!");
                if (data == 1) {
                    location.replace("/index.mdo");
                } else {
                    console.log('비정상수행');
                }
            },
            error: function () {
                alert("비정상 수행");
            }

        });


    });

    // 장싱입력 검사

    function chkValues() {

        // 장르 선택

        if ($('.first_select').val() === 'none') {
            alert("1차 장르를 선택해주세요!");
            return -1;
        } else if ($('.first_select').val() === 'exhibition' && $('.second_select').val() === 'none') {
            alert("2차 장르를 선택해주세요");
            return -1;
        }

        // 제목 기입

        if ($('.pd_name_text').val().trim() === '') {
            alert("작품명을 기입해주세요");
            return -1;
        }

        // 유형별 금액 입력

        var type_checked = $('input[name=pd_ticketType]:checked');

        if (type_checked.length === 0) {
            alert("티켓 유형을 최소 1개 선택해주세요");
            return -1;
        } else {

            $('input[name=pd_ticketType]:checked').each(function () {
                console.log('확인 : ' + $(this).val());
                var price;
                if ($(this).val() === 'adult') {
                    price = $('.adult_price');
                } else if ($(this).val() === 'teenager') {
                    price = $('.teenager_price');
                } else if ($(this).val() === 'child') {
                    price = $('.children_price');
                } else {
                    price = $('.nonDistinc_price');
                }

                console.log('확인 2 : ' + price.val());
                if (price.val() === '') {
                    alert($(this).val()+ "의 금액을 입력해주세요!");
                    return -1;
                }
            });
        }

        // 첨부 파일 확인

        if ($('.pd_descript').val() === '' || $('.pd_thumbnail').val() === '') {
            alert("첨부파일을 선택해주세요!");
            return -1;
        }

        var chkList = $('.chkLabel');

        if (chkList.length === 0) {
            alert("날짜를 선택해주세요!");
            return -1;
        }

        // 태그 확인

        if ($('.tag > input').val() === '')
        {
            alert("태그를 기입해주세요!");
            return -1;
        }

        if ($('#endDate').val() === '' || $('#startDate').val() === '') {
            alert("날짜를 선택해주세요!");
            return -1;
        }

        // 휴관 요일

        console.log('모두 정상 입력!!');
        return 1;


    }
            $('.cancel_btn').click(function(){
                $('.modal').modal('hide');
            });
});