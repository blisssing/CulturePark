
$(document).ready(function () {
    // 섹션 이미지


    $('.prom_list_m img').css('width', $('.slide_section_m').width());
    var m_img_height = $('.prom_list_m img').height();
    $('.slide_section_m').css('min-height', m_img_height);

    $(window).resize(function () {
        // console.log('이미지 높이 : '+$('.img_list img').height());
        // console.log('섹션 높이 : '+$('#slide_event').height());

        $('.slide_section_m').css('min-height', $('.prom_list_m img').height());
        $('.prom_list_m img').css('width', $('.slide_section_m').width());

    });

    //버튼 슬라이드 동작

    var ex_prom_number=1;
    var mu_prom_number=1;
    var prom_img_position_ex = 1;
    var prom_img_position_mu = 1;

    $('.prom_prev').click(function (){
        slidePrev();

        if (ex_prom_number === 1) {
            $('#ex_page_num').html("1");
            console.log('실행됨');
        }

        if (mu_prom_number=== 1) {
            $('#mu_page_num').html("1");
        }
    });

    $('.prom_next').click(function () {
        slideNext();

        if (ex_prom_number === 2) {
            $('#ex_page_num').html("2");
        }

        if (mu_prom_number=== 2) {
            $('#mu_page_num').html("2");
        }


    });

    function slideNext() {

        var window_width = $(window).width()    /* 윈도우크기*/
        var node = $('#' + nodename);           /* ul 변수*/
        console.log(node);

        var prom_img_count = node.children().length;
        var prom_list_width =  $('#'+nodename + ' > li' ).width();

        if(window_width<1200){
            console.log("현재 위치 : " + prom_img_position_ex);
            console.log("요소 갯수 : " + prom_img_count);
            console.log("리스트 길이 : " + prom_list_width);
            console.log('요소 이름 : ' + nodename);

            if (prom_img_count > prom_img_position_ex && nodename==='ex_prom_m') {
                node.animate({
                    left:'-='+prom_list_width+'px'
                })
                prom_img_position_ex++;

                $('#ex_chk_0' + prom_img_position_ex).prop("checked", true);
            } else if (prom_img_count > prom_img_position_mu && nodename==='mu_prom_m'){
                node.animate({
                    left:'-='+prom_list_width+'px'
                })
                prom_img_position_mu++;
                $('#mu_chk_0' + prom_img_position_mu).prop("checked", true);
            }

        } else{

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


        var window_width = $(window).width()    /* 윈도우크기*/
        var node = $('#' + nodename);           /* ul 변수*/


        var prom_img_count = node.children().length;
        var prom_list_width =  $('#'+nodename + ' > li' ).width();

        if(window_width<1200){
            console.log("현재 위치 : " + prom_img_position_ex);
            console.log("요소 갯수 : " + prom_img_count);
            console.log("리스트 길이 : " + prom_list_width);
            console.log('요소 이름 : ' + nodename);

            if (1 < prom_img_position_ex && nodename==='ex_prom_m') {
                node.animate({
                    left:'+='+prom_list_width+'px'
                })
                prom_img_position_ex--;
                $('#ex_chk_0' + prom_img_position_ex).prop("checked", true);
                $('#ex_page_num').html("1");


            } else if (1 < prom_img_position_mu && nodename==='mu_prom_m'){
                node.animate({
                    left:'+='+prom_list_width+'px'
                })
                prom_img_position_mu--;
                $('#mu_chk_0' + prom_img_position_mu).prop("checked", true);
            }


        } else{

            var move_width = 1200;

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


    }



});


function setObj(obj) {
    nodename = obj.parentElement.parentElement.firstElementChild.id;
}