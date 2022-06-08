$(document).ready(function () {

// Todo : 리뷰코드로 DB에서 링크를 얻어와서 버튼에 세팅해주는 코드를 만들어줄것

    $('.btn_movePage').click(function () {
        eventRow = $(this).closest('tr');
        var review_code = eventRow.children('.review_code').val();
        alert(review_code + ' 페이지로 이동!!');

    });

    $('.btn_user_info').click(function () {
        eventRow = $(this).closest('tr');
        modal_now = $('#UserInfoModal');

        var user_code = eventRow.children('.user_code').val();
        var user_email = eventRow.children('.user_email').text();


        $('#user_code').text(user_code);
        modal_now.modal({});
    });

    $('.btn_trash').click(function () {
        eventRow = $(this).closest('tr');
        modal_now = $('#ChkDeleteModal');

        modal_now.modal({});
    });

    $('.btn_finalDelete').click(function () {
        var insertText = $('#decideDelete').val();
        if (insertText.trim() === '리뷰를 삭제합니다') {
            alert("성공적으로 리뷰를 삭제했습니다!");
            eventRow.remove();
            modal_now.modal('hide');
        } else {
            return false;
            alert("문자열이 일치하지 않습니다!!");
        }
    });

    $('.btn_report').click(function () {
        alert('신고목록 페이지로 이동!!');
    });


    //common

    $('.btn_modal_close').click(function () {
        modal_now.modal('hide');
    });

    // toggle btn
    $('.switch input').click(function () {
        var this_switch = $(this);
        var this_row = this_switch.parent().parent();
        this_row.children('.toggle_p').toggle();
    });
});


