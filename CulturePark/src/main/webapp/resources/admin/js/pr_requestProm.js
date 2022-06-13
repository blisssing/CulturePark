$(document).ready(function () {


    $('.btn_sendRequest').click(function () {

        var select = $('input[name=slc_page]:selected').val();
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();

        if (select === '0' || start_date === '' || end_date === '') {
            alert('요청을 실패했습니다. 정상적으로 값을 입력하였는지 확인해주세요');
        } else {
            alert('요청이 성공적으로 수행되었습니다');
        }
    });

    $('.btn_back').click(function () {
        history.back();
    });


    $('#start_date').datepicker({
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
        minDate:7,

        onSelect: function (d) {
            if ($('#start_date').val() >= $('#end_date').val()) {
                console.log('선택 문제 있음');
            } else {
                console.log('선택 문제 없음');
            }


        },
    });

    $('#end_date').datepicker({
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
        minDate: 14,
        onSelect: function (d) {
            if ($('#start_date').val() >= $('#end_date').val()) {
                console.log('선택 문제 있음');
            } else {
                console.log('선택 문제 없음');
            }


        },
    });


});