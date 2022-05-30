$(document).ready(function () {

    // 1. 화면 크기 조정에 따른 변화

        $(window).resize(function () {
            var width_size = window.outerWidth;
            var display_status = $('.sideMenu_mobile').css('display')

            if (width_size>=1200 && clickStatus === 0){ // 펼친 상태면 닫아줌
                side_slideUp();
            }

            if (width_size >= 1200 && my_clickStatus === 0) {
                mySide_slideUp();
            }



        });

    // 2. 모바일 메뉴

        // 버튼 이동 : 홈
        $('.home_btn').click(function () {
            location.replace('home.do');
        });

        // 버튼 이동 : 로그인
            $('.login_btn').click(function () {
                location.replace("login.do")
            });


        // 버튼 이동 : 마이페이지
            $('.myPage_btn').click(function () {
                location.replace('myPage.do');
            });

            // 3. 상단 메뉴 토글 버튼과 기능 동일

        // 버튼 이동 : 마이티켓

            $('.myticket_btn').click(function () {
                location.replace('myTicket.do')
            });



    // 3. 토글 버튼

        var clickStatus = 1;
        var my_clickStatus = 1;

        $('.sideMenu_btn').click(function () {
            console.log('슬라이드메뉴 버튼 실행');
            side_slideDown();
        });

        $('.sideMenu_close_btn').click(function () {
            side_slideUp();
        });


        $('.mySide_btn').click(function () {
            mySlide_slideDown();
        });

        $('.my_close_btn').click(function () {
            mySide_slideUp();
        });




    function side_slideUp() {
        $('.sideMenu_mobile').slideToggle('hide');
        clickStatus=1; // 닫힌 상태
    }

    function side_slideDown() {
        $('.sideMenu_mobile').slideToggle();
        clickStatus=0; // 펼친 상태
    }

    function mySide_slideUp() {
        $('.myMenu_mobile').slideToggle('hide');
        my_clickStatus = 1;
    }

    function mySlide_slideDown() {
        $('.myMenu_mobile').slideToggle();
        my_clickStatus = 0;
    }

});

