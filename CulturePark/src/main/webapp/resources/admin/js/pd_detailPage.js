$(document).ready(function () {

    $('.btn_down').click(function () {
        // Todo : 미완성 단계
        var path = $(this).val();
        $.ajax({
            type: 'post',
            data: {"path": path},
            datatype: 'text',
            url: 'downloadImg.ado',
            cache: false,
            async: false,
            success: function (data) {
                alert("정상실행");
            },
            error: function () {
                alert("비정상 실행");
            }
        });
    });



});