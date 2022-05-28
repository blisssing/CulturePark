$(document).ready(function () {

    $('input[name="guide_chk"]').change(function () {

        var checked = $('input[name="guide_chk"]:checked').val();

        if (checked === 'mobile') {
            $('.guide_pc').css('display', 'none');
            $('.guide_m').css('display', 'block')
        } else if (checked === 'pc') {
            $('.guide_pc').css('display', 'block');
            $('.guide_m').css('display', 'none')
        }


    });

});