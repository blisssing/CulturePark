$(document).ready(function () {
    $('.content_container').load("/getMaininfo.do");

    $('#btn_mainInfo').click(function () {
        $('.content_container').load("/getMaininfo.do");
    });

    $('#btn_extraInfo').click(function () {
        $('.content_container').load("/getExtrainfo.do");
    });

    $('#btn_reviewInfo').click(function () {
        $('.content_container').load("/getReviewinfo.do");
    });

    $('#btn_price_detail').click(function () {
        window.open("getPriceDetail.do", "Price_Detail");
    });


    // 상단 바 고정
    var topBar = $(".buttonContainer").offset();

    $(window).scroll(function () {
        var docScrollY = $(document).scrollTop();
        var barThis = $(".buttonContainer");

        if (docScrollY > topBar.top) {
            barThis.addClass("button_bar_fix");
        } else {
            barThis.removeClass("button_bar_fix");
        }
    });

    // 캘린더 토글 버튼

    $('#date_toggle').click(function () {

        if ($('#btn_date_top').css('display') === 'none') {
            $('#btn_date_top').css('display', 'block');
            $('#btn_date_bottom').css('display', 'none');
            $('#datepicker').slideToggle();
        } else {
            $('#btn_date_top').css('display', 'none');
            $('#btn_date_bottom').css('display', 'block');
            $('#datepicker').slideToggle();
        }
    });

    $('#round_toggle').click(function () {

        if ($('#btn_round_top').css('display') === 'none') {
            $('#btn_round_top').css('display', 'block');
            $('#btn_round_bottom').css('display', 'none');
            $('#round_content').slideToggle();
        } else {
            $('#btn_round_top').css('display', 'none');
            $('#btn_round_bottom').css('display', 'block');
            $('#round_content').slideToggle();
        }
    });


});