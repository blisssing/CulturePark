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
            getWeekStart();
        },
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
        yearSuffix: '년'
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

    function getWeekStart() {
        var chose_date = new Date($('.datepicker').datepicker({
            dateFormat: "yyyy/mm/dd"
        }).val());


        
        var endDay = chose_date.getDay();
        var endDate = chose_date.getDate();


        console.log(endDay);


        if()



    }


});