$(document).ready(function () {

    $('#exhibit_btn').on('click', function() {
        $('#exhibit_set').show();
        $('#museum_set').hide();
    });


    $('#museum_btn').on('click', function() {
        $('#museum_set').show();
        $('#exhibit_set').hide();
    });

});
