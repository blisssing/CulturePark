$(document).ready(function() {

    /* 이전 */
    $('.back').click(function(){
        window.history.back();
    });

    /* 체크박스 전체 선택 */
    $('.checkbox_all_p').click(function () {
        if ($(".checkbox_all_p").prop("checked")) {
            $(".checkbox_one").prop("checked", true);
        } else {
            $(".checkbox_one").prop("checked", false);
        }
    });

    /* 체크박스 해제 시 전체 체크박스 해제 (전시용) */
    $("input[class=checkbox_one]").click(function () {
        var total = $("input[class=checkbox_one]").length;
        var checked = $("input[class=checkbox_one]:checked").length;

        if (total != checked) {
            $(".checkbox_all_p").prop("checked", false);
        } else {
            $(".checkbox_all_p").prop("checked", true);
        }
    });

});