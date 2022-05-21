$(document).ready(function () {
    $('#back_btn').click(function () {
        console.log("수행 빽!")
        history.back();
    });

    $('#close_btn').click(function () {
        console.log("수행!")
        window.open('','_self').close();
    });

});