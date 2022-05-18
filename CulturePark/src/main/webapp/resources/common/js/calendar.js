$(document).ready(function () {

    // 초기 선택 날짜 셋팅
        $('#date_selected').text(getToday());

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

            $('#date_selected').text(today_str);
        },
    });




});

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

function dateToggle() {

}