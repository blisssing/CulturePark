$(document).ready(function(){

    /*var body_size = $('.booking_body').css('width').replace(/[^0-9]/g, "");*/
    /*$('div.ui-datepicker').css('font-size', body_size/10/2);*/

    /*$.datepicker.setDefaults($.datepicker.regional['ko']);
*/
    $('#date_start').datepicker({
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
        maxDate:0,

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

    $('#date_end').datepicker({
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
        maxDate:0,
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


    /* 답변달기 modal */
    $('.re_btn').click(function(){

        $('#commentModal').modal({
            fadeDuration: 300,
            showClose:false
        });
    });

    /* 수정 modal */
    $('.upd_btn').click(function(){

        $('#updateModal').modal({
            fadeDuration: 300,
            showClose:false
        });
    });

    /* 삭제 modal */
    $('.del_btn').click(function(){
        eventRow = $(this).closest('tr');
        modal_now = $('#deleteModal');
        modal_now.modal({});
    });


    $('.comment_btn').click(function(){
        alert('등록되었습니다.')
    });

    $('.update_btn').click(function(){
        alert('수정되었습니다.')
    });


});



// 모달 닫기 기능
function closeModal(modal_now) {
    modal_now.modal('hide');
}

function reloadPage() {
    location.reload();
}