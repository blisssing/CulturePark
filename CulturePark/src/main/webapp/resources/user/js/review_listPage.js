$(document).ready(function () {




    $('.gallery_btn').click(function () {
        $('.section_ver_01').css('display', 'flex');
        $('.section_ver_02').css('display', 'none');
    });

    $('.list_btn').click(function () {
        $('.section_ver_01').css('display', 'none');
        $('.section_ver_02').css('display', 'flex');
    });


    $(window).resize(function () {
        if (window.outerWidth < 500) {
            $('.section_ver_01').css('display', 'flex');
            $('.section_ver_02').css('display', 'none');
        }
    });


});

function checkDisplay() {



}


function goBoard(obj) {

}