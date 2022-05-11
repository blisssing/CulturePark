$(document).ready(function () {

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

        console.log('---------------')
        console.log('시작 ')
        console.log('ul의 너비는 ' + $('.img_box').width());
        console.log('이미지의 크기는 '+imgs_width);
        console.log('이미지의 count는 '+img_count);
        console.log('이미지의 위치는' + img_position);
        if (1 < img_position) {
            imgs.animate({
                left: '+='+imgs_width+'px'
            });
            img_position--;
        }

        console.log('---------------')

        console.log('이미지의 크기는 '+imgs_width);
        console.log('이미지의 count는 '+img_count);
        console.log('이미지의 위치는' + img_position);

    }

    function next() {

        var imgs_width = $('.img_list').width();

        console.log('---------------')
        console.log('시작 ')
        console.log('이미지의 크기는 '+imgs_width);
        console.log('이미지의 count는 '+img_count);
        console.log('이미지의 위치는' + img_position);

        if (img_count > img_position) {
            console.log('실행1');
            imgs.animate({
                left:'-='+imgs_width+'px'
            });

            img_position++;


        }

        console.log('---------------')

        console.log('이미지의 크기는 '+imgs_width);
        console.log('이미지의 count는 '+img_count);
        console.log('이미지의 위치는' + img_position);

    }






});