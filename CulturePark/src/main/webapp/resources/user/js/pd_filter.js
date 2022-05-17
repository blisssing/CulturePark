$(document).ready(function () {


// 장르 필터

    // 전체 선택시 요소 체크박스 해제
    $('.gre_total').click(function () {
        $("input[name=chk_genre]").prop("checked", false);
    });

    // 요소 선택시 전체 체크박스 해제
    $("input[name=chk_genre]").click(function () {

        var total = $("input[name=chk_genre]").length;
        var checked = $("input[name=chk_genre]:checked").length;

        if (total === checked) {
            $("input[name=chk_genre]").prop("checked", false);
            $(".gre_total").prop("checked", true);
        } else if (total !== checked) {
            $(".gre_total").prop("checked", false);
        }

    });


// 지역 필터

    // 전체 선택시 요소 체크박스 해제
    $('input[name=chk_region_total]').click(function () {
        $("input[name=chk_region]").prop("checked", false);
    });

    // 요소 선택시 전체 체크박스 해제
    $("input[name=chk_region]").click(function () {
        var total = $("input[name=chk_region]").length;
        var checked = $("input[name=chk_region]:checked").length;

        if (total === checked) {
            $("input[name=chk_region]").prop("checked", false);
            $("input[name=chk_region_total]").prop("checked", true);
        } else {
            $("input[name=chk_region_total]").prop("checked", false);
        }
    });

// 검색어 필터

    $(".keyword_box select").change(function () {
        var val = $('.key_select').val();
        if (val === 'title') {
            $('.search_tag_row').hide();
        } else if (val === 'tag'){
            $('.search_tag_row').show();
        }
    });







});