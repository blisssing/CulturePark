$(document).ready(function () {

    /*전체 탭*/
    $('#all_view_btn').on('click', function() {
        $('#exhibit_set').show();
        $('#museum_set').show();
    });

    /*전시 탭*/
    $('#exhibit_btn').on('click', function() {
        $('#exhibit_set').show();
        $('#museum_set').hide();
    });

    /*뮤지엄 탭*/
    $('#museum_btn').on('click', function() {
        $('#museum_set').show();
        $('#exhibit_set').hide();
    });

});
