$(document).ready(function () {


    // 섹션 이미지

    $('.img_list img').css('width', $('.slide_section').width());
    var img_height = $('.img_list img ').height();
    $('.slide_section').css('min-height', img_height);

    $(window).resize(function () {

        // console.log('이미지 높이 : '+$('.img_list img').height());
        // console.log('섹션 높이 : '+$('.slide_section').height());

        $('.slide_section').css('min-height', $('.img_list img').height());
        $('.img_list img').css('width', $('.slide_section').width());

    });

    //버튼 슬라이드 동작

    var imgs;
    var img_count;
    var img_position = 1;

    imgs = $('.img_box');
    img_count = imgs.children().length;


    $('.btn_prev').click(function () {
        prev();
    });

    $('.btn_next').click(function () {
        next();
    });

    function prev() {

        var imgs_width = $('.img_list').width();

        if (1 < img_position) {
            imgs.animate({
                left: '+='+imgs_width+'px'
            });
            img_position--;
            $('#evt_chk_0' + img_position).prop("checked", true);
        }
    }

    function next() {

        var imgs_width = $('.img_list').width();

        if (img_count > img_position) {
            imgs.animate({
                left:'-='+imgs_width+'px'
            });
            img_position++;
            $('#evt_chk_0' + img_position).prop("checked", true);

        }
    }
});