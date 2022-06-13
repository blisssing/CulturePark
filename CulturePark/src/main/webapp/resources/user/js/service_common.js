$(document).ready(function () {


    // 빠른 메뉴 고정
    var quickOffset = $('.quickContainer').offset();
    var quickOffset2 = $('.quick_wrap').offset();
    $(window).scroll(function () {
        if (window.innerWidth < 1200) {
            if ($(document).scrollTop() > quickOffset.top) {
                $('.quickContainer').addClass("quick_menu_fix");
            } else {
                $('.quickContainer').removeClass("quick_menu_fix");
            }
        } else {

            if ($(document).scrollTop() > quickOffset2.top) {
                $('.quick_wrap').addClass('quick_menu_side');
            } else {
                $('.quick_wrap').removeClass('quick_menu_side');
            }


        }

    });



});
