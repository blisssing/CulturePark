$(document).ready(function () {
    var body_size = $('.booking_body').css('width').replace(/[^0-9]/g, "");
    $('div.ui-datepicker').css('font-size', body_size/10/2);

    $(window).resize(function () {
        // console.log('수행 확인');
        resizeDatePicker();
    });



// 데이트 피커
    // 초기 선택 날짜 셋팅
    $('.schedule_date').text(getToday());
    // 데이터 피커
    $('#datepicker').datepicker({
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
        minDate:0,
        onSelect: function (d) {
            var chose_date = new Date($('#datepicker').datepicker({
                dateFormat: "yyyy/mm/dd"
            }).val());
            var day = chose_date.getDay();
            var year = chose_date.getFullYear();
            var month = chose_date.getMonth() + 1;
            var date = chose_date.getDate();

            var dayList = new Array('일','월','화','수','목','금','토');
            var day_kor =  dayList[day];

            var today_str = year+'.'+month+'.'+date+'('+day_kor+')';

            // $('.schedule_date').text(today_str);
            nextLevel();
        },
    });

});


function resizeDatePicker() {
    var body_size = $('.booking_body').css('width').replace(/[^0-9]/g, "");
    // console.log(body_size);
    // console.log(date_size);
    $('div.ui-datepicker').css('font-size', body_size/10/2);
}

function nextLevel() {
    location.href='book02.do';
}



