$(document).ready(function () {

    // 1. 화면 크기 조정에 따른 변화

        $(window).resize(function () {
            var width_size = window.outerWidth;
            var display_status = $('.sideMenu_mobile').css('display')

            if (width_size>=1200 && clickStatus == 0){
                $('.close_btn').click();
                clickStatus=1;
            }

        });

    // 2. 모바일 메뉴

        // 버튼 이동 : 마이 메뉴
            $('.mymenu_btn').click(function () {
                location.replace('마이페이지 초기 페이지 url을 입력해주세요');
            });

        // 버튼 이동 : 홈
            $('.home_btn').click(function () {
                location.replace('home.do');
            });


        // 버튼 이동 : 메뉴

            // 3. 상단 메뉴 토글 버튼과 기능 동일

        // 버튼 이동 : 마이티켓

            $('.myticket_btn').click(function () {
                location.replace('url 명령어를 입력해주세요. ')
            });



    // 3. 상단 메뉴 토글 버튼

        var clickStatus = 1;

        $('.open_btn').click(function () {
            $('.sideMenu_mobile').slideToggle();
            clickStatus=0;
        });

        $('.close_btn').click(function () {
            $('.sideMenu_mobile').slideToggle('hide');
            clickStatus=1;
        });
});