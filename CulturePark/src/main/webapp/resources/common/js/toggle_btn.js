$(document).ready(function () {

    var clickStatus = 1;

    $('.open_btn').click(function () {
        $('.sideMenu_mobile').slideToggle();
        clickStatus=0;
    });

    $('.close_btn').click(function () {
            $('.sideMenu_mobile').slideToggle('hide');
            clickStatus=1;
    });


    $(window).resize(function () {
        var width_size = window.outerWidth;
        var display_status = $('.sideMenu_mobile').css('display')

        if (width_size>=1200 && clickStatus == 0){
            $('.open_btn').click();
            clickStatus=1;
        }

    });

});