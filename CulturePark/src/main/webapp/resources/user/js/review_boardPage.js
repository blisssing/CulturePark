$(document).ready(function () {

    $('.thumb_btn').click(function () {
        thumbUp();
    });

    $('.list_btn').click(function () {
        location.href='/reviewPage.do';
    });


});


function thumbUp() {
    var thumb_point =  parseInt($('#thumb_point').text());



    if (true) {// DB 에 좋아요 기록이 없을 경우
        $('.fa-regular').toggleClass('fa-solid');
        $('.fa-regular').css('color', 'blue');
        $('.thumb_point').text(thumb_point+1);
    } else {    // DB에 좋아요 기록이 있을 경우
        $('.fa-solid').toggleClass('.fa-regular');
        $('.fa-regular').css('color', 'none');
        $('.thumb_point').text(thumb_point-1);
    }



}