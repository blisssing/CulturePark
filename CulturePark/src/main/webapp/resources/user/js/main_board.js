$(document).ready(function () {

    // 사이즈 조정

        $('.board_section').css('min-height', $('.board_content').css('height'));
        $('.board_list').css('max-width', $('.board_section').css('width'));
        $('.board_info').css('max-width', $('.board_section').css('width'));



        // 창크기 조절
        $(window).resize(function () {
            $('.board_section').css('min-height', $('.board_content').css('height'));
            $('.board_list').css('max-width', $('.board_section').css('width'));
            $('.board_info').css('max-width', $('.board_section').css('width'));
        });


    // board 버튼 이동

    var boardBox;

    var board_cnt;
    var board_position = 1;


    boardBox = $('.board_box');
    board_cnt = $('.board_list').length;

    $('.btn_prev').click(function () {
        board_prev(this.id);
    });

    $('.btn_next').click(function () {
        board_next(this.id);
    });

    function board_prev(obj) {
        var board_width = $('.board_list').width();

        if (obj === 'review_prev') {
            if (board_position > 1) {
                boardBox.animate({
                    left:'+='+board_width+'px'
                });
                board_position--;
            }
        }
    }
    function board_next(obj) {
        var board_width = $('.board_list').width();
        if (obj === 'review_next') {
            if (board_position < board_cnt) {
                boardBox.animate({
                    left:'-='+board_width+'px'
                });
                console.log('수행 완료');
                board_position++;
            }
        }
    }



});