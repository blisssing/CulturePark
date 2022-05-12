
$(document).ready(function () {
    // 섹션 이미지

    $('.img_list img').css('width', $('#slide_event').width());
    var img_height = $('.img_list img ').height();
    $('#slide_event').css('min-height', img_height);

    // $('.prom_list img').css('width', $('#slide_ex').width());
    // var ex_height = $('.prom_list img').height();
    // $('#slide_ex').css('min-height', ex_height);

    $(window).resize(function () {
        // console.log('이미지 높이 : '+$('.img_list img').height());
        // console.log('섹션 높이 : '+$('#slide_event').height());

        $('#slide_event').css('min-height', $('.img_list img').height());
        $('.img_list img').css('width', $('#slide_event').width());

    });

    //버튼 슬라이드 동작

    var imgs;
    var img_count;
    var img_position = 1;

    imgs = $('.img_box');
    img_count = imgs.children().length;


    $('#ev_prev').click(function () {
        prev();
    });

    $('#ev_next').click(function () {
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

    // 프로모션 버튼 슬라이드 동작

    var ex_prom_number=1;
    var mu_prom_number=1;


    $('.prom_prev').click(function (){
        slidePrev();
    });

    $('.prom_next').click(function () {
        slideNext();
    });

    function slideNext() {

        var window_width = $(window).width()    /* 윈도우크기*/
        var node = $('#' + nodename);           /* ul 변수*/

        var prom_img_count = node.children().length;
        var prom_img_position = 1;
        var prom_list_width =  $('#'+nodename + ' > li' ).width();

        if (window_width < 500) {
            var move_width = window_width;

        } else if (window_width<1200){
            var move_width = window_width;
        }

        if(window_width<1200){


        }else{
            var move_width = 1200;

            if(ex_prom_number===1&&nodename==='ex_prom') {
                node.animate({
                    left: '-=' + move_width + 'px'
                });
                ex_prom_number = 2;

            }
            if (mu_prom_number === 1 && nodename === 'mu_prom') {
                node.animate({
                    left: '-=' + move_width + 'px'
                });
                mu_prom_number = 2;
            }
        }




    }

    function slidePrev() {
        var window_width = $(window).width()
        var node = $('#' + nodename);

        if (window_width < 500) {
            var move_width = window_width;

        } else if (window_width<1200){
            var move_width = window_width;

        } else if (1200<=window_width) {
            var move_width = 1200;
        }




        if (ex_prom_number === 2 && nodename==='ex_prom') {
            node.animate({
                left:'+='+move_width+'px'
            })
            ex_prom_number=1;
        }

        if (mu_prom_number === 2 && nodename === 'mu_prom') {
            node.animate({
                left:'+='+move_width+'px'
            })
            mu_prom_number=1;
        }


    }



});


function setObj(obj) {
    nodename = obj.parentElement.parentElement.firstElementChild.id;
}