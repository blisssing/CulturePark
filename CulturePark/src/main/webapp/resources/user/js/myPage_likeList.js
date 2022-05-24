$(document).ready(function () {

    $('#popup').hide();

    $('#all_view_btn').css('font-weight','bold');

    /*전체 탭*/
    $('#all_view_btn').on('click', function () {
        $('#exhibit_set').show();
        $('#museum_set').show();

        $(this).css('font-weight','bold');
        $('#exhibit_btn').css('font-weight','normal');
        $('#museum_btn').css('font-weight','normal');
    });

    /*전시 탭*/
    $('#exhibit_btn').on('click', function () {
        $('#exhibit_set').show();
        $('#museum_set').hide();

        $(this).css('font-weight','bold');
        $('#all_view_btn').css('font-weight','normal');
        $('#museum_btn').css('font-weight','normal');
    });

    /*뮤지엄 탭*/
    $('#museum_btn').on('click', function () {
        $('#museum_set').show();
        $('#exhibit_set').hide();

        $(this).css('font-weight','bold');
        $('#all_view_btn').css('font-weight','normal');
        $('#exhibit_btn').css('font-weight','normal');
    });


    /* 체크박스 전체 선택 (전시용) */
        $('#check_all_exhibit').click(function () {
            if ($("#check_all_exhibit").prop("checked")) {
                $(".check_one_exhibit").prop("checked", true);
            } else {
                $(".check_one_exhibit").prop("checked", false);
            }
        });

    /* 체크박스 전체 선택 (뮤지엄) */
    $('#check_all_museum').click(function () {
        if ($("#check_all_museum").prop("checked")) {
            $(".check_one_museum").prop("checked", true);
        } else {
            $(".check_one_museum").prop("checked", false);
        }
    });

    /* 체크박스 해제 시 전체 체크박스 해제 (전시용) */
        $("input[class=check_one_exhibit]").click(function () {
            var total = $("input[class=check_one_exhibit]").length;
            var checked = $("input[class=check_one_exhibit]:checked").length;

            if (total != checked) {
                $(".check_all_exhibit").prop("checked", false);
            } else {
                $(".check_all_exhibit").prop("checked", true);
            }
        });

    /* 체크박스 해제 시 전체 체크박스 해제 (뮤지엄용) */
    $("input[class=check_one_museum]").click(function () {
        var total = $("input[class=check_one_museum]").length;
        var checked = $("input[class=check_one_museum]:checked").length;

        if (total != checked) {
            $(".check_all_museum").prop("checked", false);
        } else {
            $(".check_all_museum").prop("checked", true);
        }
    });

/* --------------------------------- */

    /*  선택상품 삭제 */
    $('.delete_btn').click(function() {
        delete_check();
    /*    deleteBtn_exhibit();
        deleteBtn_museum();*/
    });
});



/* 전시 목록 삭제 */
function deleteBtn_exhibit() {
        $("input:checkbox[name='chk1']:checked").each(function (k, kVal) {
            console.log("kVal : " + kVal);
            let a = kVal.parentElement.parentElement;
            console.log('a : ' + a);
            $(a).remove();
        });
}

/* 뮤지엄 목록 삭제 */
function deleteBtn_museum() {

        $("input:checkbox[name='chk2']:checked").each(function (k, kVal) {
            console.log("kVal : " + kVal);
            let a = kVal.parentElement.parentElement;
            console.log('a : ' + a);
            $(a).remove();
        });
}


function delete_check() {

    var checked_cnt_1 = $('input:checkbox[name=chk1]:checked').length;
    var checked_cnt_2 = $('input:checkbox[name=chk2]:checked').length;
    var checked_cnt_total = checked_cnt_1 + checked_cnt_2;

    if (checked_cnt_total === 0) {
        alert("삭제할 항목을 선택해 주세요.");
    } else {
        deleteBtn_exhibit();
        deleteBtn_museum();
        alert('삭제 되었습니다.');
    }
}
