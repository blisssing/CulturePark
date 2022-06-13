$(document).ready(function () {

    startDatePickerSet();
    endDatePickerSet();

});


function startDatePickerSet() {

    $.datepicker.setDefaults($.datepicker.regional['ko']);
    from = $('#startPicker').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: false,
        yearSuffix: '년'
    })
        .on("change", function () {
            to.datepicker("option", "minDate", getDate(this));//종료일의 minDate 지정
        });
}



function endDatePickerSet() {
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    to = $('#endPicker').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: false,
        yearSuffix: '년',
        maxDate: 0
    })
        .on("change", function () {
            from.datepicker("option", "maxDate", getDate(this));
        });
}



function getDate(element) {
    var date;
    try {
        date = $.datepicker.parseDate(dateFormat, element.value);
        if (element.id == 'from') {
            date.setDate(date.getDate() + 1);//종료일은 시작보다 하루 이후부터 지정할 수 있도록 설정
        } else {
            date.setDate(date.getDate() - 1);//시작일은 종료일보다 하루 전부터 지정할 수 있도록 설정
        }
    } catch (error) {
        date = null;
    }
    return date;

}

/*onClose: function( selectedDate ) {
    // 종료일(endDate) datepicker가 닫힐때
    // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정

    $("#endPicker").datepicker( "option", "maxDate", selectedDate );
}
});
}*/
