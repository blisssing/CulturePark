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
    $('#picker_month').datepicker({
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
        showWeek: true,


        onSelect: function (d) {
            getWeekPoint();
        }

    });

    $('#picker_year').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames:['일','월','화','수','목','금','토'],
        dayNamesShort:['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: false,
        yearSuffix: '년'
    });

    // 오늘/이번달/올해로 날짜 지정
    $('#picker_date').datepicker('setDate', 'today');
    $('#picker_month').datepicker('setDate', 'm');



    function checkSelector() {

        var val = $('.date_selector').val();

        if (val === 'day') {
            $('#datebox_day').css('display', 'inline-block');
            $('#datebox_month').css('display', 'none');
            $('#datebox_year').css('display','none');
            console.log(val);
        } else if (val === 'month') {
            $('#datebox_day').css('display', 'none');
            $('#datebox_month').css('display', 'inline-block');
            $('#datebox_year').css('display','none');
            console.log(val);
        } else if (val === 'year') {
            $('#picker_date').css('display', 'none');
            $('#datebox_month').css('display', 'none');
            $('#datebox_year').css('display','inline-block');
            console.log(val);
        }

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

    // 주 선택
    function getWeekPoint() {

        var chose_date = new Date($('.datepicker').datepicker({
            dateFormat: "yyyy/mm/dd"
        }).val()); // 선택한 날을 'yyyy/mm/dd' 데이터 포맷으로 가져오기

        var selectDay = chose_date.getDay(); // 요일 가져오기
        var selectDate = chose_date.getDate(); // 날짜 가져오기
        var today = new Date().getDate(); // 오늘 날짜 가져오기

        // [1. 선택된 날짜가 이전달 혹은 다음달과 연결돼 있는지 확인하여 선택한 날짜에 대당하는 주의 일요일 date 구하기]

        var select_month = chose_date.getMonth() +1; // 선택한 날짜의 Month
        var select_year = chose_date.getFullYear();  // 선택한 날짜의 Year


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
                console.log('1. 일요일의 날짜는 ' + weekSun + '입니다');
            } else{
                var weekSun = lastMonLastDate - lastMonLastDay;
                console.log('2. 일요일의 날짜는 ' + weekSun + '입니다');
            }
        } else {
            var weekSun = selectDate-selectDay;
        }

        // 토요일 구하기( 주의 끝 )
        var weekSat = selectDate+(6-selectDay);  // console.log(choseDay + '가 속한 주의 일요일 : ' + weekSun);

        // 구한 토요일의 값이 제대로 된 것인지 검증을 해야 함.

        // 검증 1 : 만약 선택한 날짜의 마지막 날이 '오늘' 이후의 날이라면 'weekSat'의 값을 오늘로 처리. 오늘 이후의 데이터를 받아올 필요가 없기 때문
        // 조건 1-1. 선택한 달과, 이번 달이 같아야 함
        // 조건 1-2. 오늘보다 weekSat의 값이 커야 함.
        if (  new Date ().getMonth() ===select_month &&  new Date(select_year, select_month, weekSat) > new Date(select_year, select_month, today)) {
            weekSat = today;
            console.log('토요일은 : ' + weekSat);
        } else if (thisMonLastDate < weekSat) {

        // 검증 2 : weekSat이 선택 달의 마지막 날짜보다 크다는 것은 한주가 다음달과 이어져 있다는 뜻.


            var movePoint = 6 - selectDay; // 토요일까지의 간격 : 움직여야 하는 거리
            var lastPoint = thisMonLastDay - selectDay; // 달력의 마지막 날짜와 선택한 날짜와의 거리
            var stepPoint = movePoint - lastPoint - 1; // 다음 달 달력의 시작과 토요일까지의 거리

            var weekSatSet = new Date(select_year, select_month, 1 + stepPoint); // 토요일에 해당하는 날짜의 정보

            // console.log('movePoint : ' + movePoint);
            // console.log('lastPoint :' + lastPoint);
            // console.log('stepPoint : ' + stepPoint);
        } // else if

        hoverWeek(weekSun, selectDate);

    }

    function hoverWeek(start, now) {

        for (i = start; i++; i <= now) {

            if ($('a .ui_state_default').text() === i) {
                console.log('수행'+ i);
            }


        }


    }

});