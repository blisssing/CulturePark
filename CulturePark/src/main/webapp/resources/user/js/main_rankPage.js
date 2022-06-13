$(document).ready(function () {
    // tab Menu

    $('#total_btn').click(function () {

    });

    $('#exhibit_btn').click(function () {

    });

    $('#museum_btn').click(function () {

    });

    $('.date_selector').change(function () {
        checkSelector();
    });


    // 데이터 피커 셋팅

    // 일별 선택
    $('#picker_date').datepicker({
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
        minDate:"-6M",
        maxDate:0,
        onSelect: function (d) {
        }
    });

    // 월별 선택
    $('#picker_week').datepicker({
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
        minDate:"-6M",
        maxDate:0,
        onSelect: function (d) {
            getWeekPoint(getSelectedInfo(d));

        },
        beforeShow: function () {
            setTimeout("hoverWeek()", 100);
        },
        onUpdateDatepicker: function () {
            setTimeout("hoverWeek()", 100);
        }

    });

    // 월별 선택
    // $('#picker_month').datepicker({
    //     dateFormat: 'yy-mm-dd',
    //     prevText: '이전 달',
    //     nextText: '다음 달',
    //     monthNames: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    //     monthNamesShort: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    //     dayNames:['일','월','화','수','목','금','토'],
    //     dayNamesShort:['일','월','화','수','목','금','토'],
    //     dayNamesMin: ['일','월','화','수','목','금','토'],
    //     showMonthAfterYear: false,
    //     yearSuffix: '년',
    //     changeYear:true,
    //     changeMonth:true
    // });

    // 오늘/이번달/올해로 날짜 지정
    $('#picker_date').datepicker('setDate', 'today');

    // 버튼 확인
    function checkSelector() {

        var val = $('.date_selector').val();

        if (val === 'day') {
            $('#datebox_day').css('display', 'inline-block');
            $('#datebox_week').css('display', 'none');
            $('#datebox_month').css('display','none');
            console.log(val);
        } else if (val === 'week') {
            $('#datebox_day').css('display', 'none');
            $('#datebox_week').css('display', 'inline-block');
            $('#datebox_month').css('display','none');
            console.log(val);
        } else if (val === 'month') {
            $('#datebox_day').css('display', 'none');
            $('#datebox_week').css('display', 'none');
            $('#datebox_month').css('display','inline-block');
            console.log(val);
        }

    }

    // 주 선택
    function getWeekPoint(obj) {

        // var chose_date = new Date($('.datepicker').datepicker({
        //     dateFormat: "yyyy/mm/dd"
        // }).val()); // 선택한 날을 'yyyy/mm/dd' 데이터 포맷으로 가져오기


        var selectDay = obj.getDay(); // 요일 가져오기
        var selectDate = obj.getDate(); // 날짜 가져오기
        var today = new Date().getDate(); // 오늘 날짜 가져오기

        // [1. 선택된 날짜가 이전달 혹은 다음달과 연결돼 있는지 확인하여 선택한 날짜에 대당하는 주의 일요일 date 구하기]

        var select_month = obj.getMonth() +1; // 선택한 날짜의 Month
        var select_year = obj.getFullYear();  // 선택한 날짜의 Year


        // 현재 년&월
        var thisYear = new Date().getFullYear();
        var thisMonth = new Date().getMonth()+1;


        var thisMonFirst =  new Date(select_year, select_month-1, 1); //선택 달의 첫 날
            var thisMonFirstDate = thisMonFirst.getDate(); // 선택 달의 첫 날짜
            var thisMonFirstDay = thisMonFirst.getDay(); // 날짜의 요일

        var thisMonLast =  new Date(select_year, select_month, 0); // 선택 달의 마지막 날
            var thisMonLastDate = thisMonLast.getDate(); // 마지막 날짜
            var thisMonLastDay = thisMonLast.getDay(); // 날짜의 요일

        var nextMonFirst = new Date(select_year, select_month, 1); // 다음 달의 첫날
            var nextMonFirstDate = nextMonFirst.getDate(); // 다음 달의 첫 날짜
            var nextMonFirstDay = thisMonFirst.getDay();   // 날짜의 요일

        var lastMonLast = new  Date(select_year, select_month - 1, 0); // 이전달의 마지막 날
            var lastMonLastDate = lastMonLast.getDate(); // 이전달의 마지막 날짜
            var lastMonLastDay = lastMonLast.getDay(); // 이전달의 마지막 날 요일

            // -1. 선택한 날짜 - 7을 해서 1(일)보다 작다면 이전 달과 연결시켜야 한다.
            // -2. 만약 달력의 첫날이 일요일이라면 이전 달과 연결시킬 필요가 없으므로 if 문으로 확인한다
            // -3. 1번과 2번 두 가지 모두 해당사하잉 없으면 달력 중간에 있으므로 else 문을 통해 weekSun 값을 처리한다.

        if (selectDate - 7 <1) {
            if (thisMonFirstDay === 0) {
                var weekSun = thisMonFirstDate;
                sundayInfo = new Date(select_year, select_month, weekSun);
            } else{
                var weekSun = lastMonLastDate - lastMonLastDay;
                sundayInfo = new Date(select_year, select_month - 1, weekSun);
            }
        } else {
            var weekSun = selectDate-selectDay;
            sundayInfo = new Date(select_year, select_month, weekSun);
        }

        // 토요일 구하기( 주의 끝 )
        var weekSat = selectDate+(6-selectDay);  // console.log(choseDay + '가 속한 주의 일요일 : ' + weekSun);

        // 구한 토요일의 값이 제대로 된 것인지 검증을 해야 함.

        // 검증 1 : 만약 선택한 날짜의 마지막 날이 '오늘' 이후의 날이라면 'weekSat'의 값을 오늘로 처리. 오늘 이후의 데이터를 받아올 필요가 없기 때문
        // 조건 1-1. 선택한 달과, 이번 달이 같아야 함
        // 조건 1-2. 오늘보다 weekSat의 값이 커야 함.

        console.log('weekSun : ' + weekSun);
        if (select_month === thisMonth && weekSat > today) {
            console.log('동작수행1');
            weekSat = today;
            satInfo = new Date(select_year, select_month, weekSat);
        } else if (thisMonLastDate < weekSat) {
            // 검증 2 : weekSat이 선택 달의 마지막 날짜보다 크다는 것은 한주가 다음달과 이어져 있다는 뜻.
            console.log('동작수행2');
            var movePoint = 6 - selectDay; // 토요일까지의 간격 : 움직여야 하는 거리
            var lastPoint = thisMonLastDay - selectDay; // 달력의 마지막 날짜와 선택한 날짜와의 거리
            var stepPoint = movePoint - lastPoint - 1; // 다음 달 달력의 시작과 토요일까지의 거리
            satInfo = new Date(select_year, select_month, 1 + stepPoint); // 토요일에 해당하는 날짜의 정보
            weekSat = satInfo.getDate();
        } else {
            satInfo = new Date(select_year, select_month, weekSat);
        }


        var sunStr = sundayInfo.getFullYear() + '/' + sundayInfo.getMonth() + '/' + sundayInfo.getDate();
        var satStr = satInfo.getFullYear() + '/' + satInfo.getMonth() + '/' + satInfo.getDate();

        $('#picker_week').val(sunStr + '~' + satStr);

    }
});

// 호버할 경우 하이라이트 표시 해주기
function hoverWeek() {

    $('.ui-datepicker-calendar tr').each(function () {
        // if ($(this).parent().get(0).tagName === 'TBODY') {

            $(this).mouseover(function () {
                $(this).find('a').css({
                    'background':'#ffffcc',
                    'border':'1px solid #dddddd'
                });
                $(this).find('a').removeClass('ui-state-default');
                $(this).css('background', '#ffffcc');
            });

            $(this).mouseout(function () {
                $(this).css('background', '#ffffff');
                $(this).find('a').css('background' ,"");
                $(this).find('a').addClass('ui-state-default');
            });
        // } // if out
    });
}

function getSelectedInfo(obj) {
    var arr = obj.split("-");
    var arr_year = arr[0];
    var arr_month = arr[1];
    var arr_date = arr[2];

    var selectedCal = new Date(arr_year, arr_month -1, arr_date);

    return selectedCal;
}

function getToday() {
    var today = new Date();

    var year=today.getFullYear();
    var month=today.getMonth()+1;
    var date = today.getDate();
    var day = today.getDay();
    var dayList = new Array('일','월','화','수','목','금','토');
    var day_kor =  dayList[day];

    var today_str = year+'.'+month+'.'+date+'('+day_kor+')';

    return today_str;
}



