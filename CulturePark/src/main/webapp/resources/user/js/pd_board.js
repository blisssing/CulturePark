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



});