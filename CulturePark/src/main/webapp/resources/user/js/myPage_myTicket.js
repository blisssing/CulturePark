$(document).ready(function(){

    $('#all_view_btn').css('font-weight','bold');

    /*전체 탭*/
        $('#all_view_btn').on('click', function () {
            $('#exhibit_set').show();
            $('#museum_set').show();
            $('.label_museum').prop('display', 'inline-block');
            $('.sectionLineDouble').prop('display', 'inline-block');
            $('.label_exhibit').prop('display', 'inline-block');

            $(this).css('font-weight','bold');
            $('#exhibit_btn').css('font-weight','normal');
            $('#museum_btn').css('font-weight','normal');
        });

    /*전시 탭*/
        $('#exhibit_btn').on('click', function () {
            $('#exhibit_set').show();
            $('#museum_set').hide();
            $('.label_exhibit').prop('display', 'inline-block');
            $('.label_museum').prop('display', 'none');
            $('.sectionLineDouble').prop('display', 'none');

            $(this).css('font-weight','bold');
            $('#all_view_btn').css('font-weight','normal');
            $('#museum_btn').css('font-weight','normal');
        });

    /*뮤지엄 탭*/
        $('#museum_btn').on('click', function () {
            $('#museum_set').show();
            $('#exhibit_set').hide();
            $('.label_museum').prop('display', 'inline-block');
            $('.label_exhibit').prop('display', 'none');
            $('.sectionLineDouble').prop('display', 'none');

            $(this).css('font-weight','bold');
            $('#all_view_btn').css('font-weight','normal');
            $('#exhibit_btn').css('font-weight','normal');
        });

    // 슬라이드 액션
        $('.booking_admission_content_toggle').hide();

        /* 마이티켓 -> 상세보기 -> 입장안내 슬라이드 토글 */
        $( 'button.booking_admission_btn' ).click( function() {
            $( '.booking_admission_content_toggle' ).slideToggle();
        });

    // 페이지 이동 기능

        /*상세보기 페이지 -> 예매취소 안내창 띄우기*/
        $('.booking_cancel_btn').click(function() {
           /* console.log("버튼 실행 확인");*/
            location.replace('/viewCancel.do');
        });

        /*예매취소 안내창에서 -> 아니오 클릭시 상세보기 페이지로 다시 이동*/
        $('.cancel_no_btn').click(function() {
            location.replace('viewDetail.do');
         });

    // 경고 알림 기능

        /* 예매취소 안내창에서 -> 예 클릭시 삭제안내 alert */
        $('.cancel_yes_btn').click(function(){
            alert('취소되었습니다.\n'+'환불은 카드사 사정에 따라 3~4일 소요됩니다.');
        });

});

/* ---------------------------------------------------------*/

/* 1. 상세보기 팝업 */
function viewDetail() {
    window.open("/viewDetail.do", "myPage_viewDetail", "width=400px, height=500px, left=100, top=50");
}


/* 2. 티켓보기 팝업 */
function viewTicket() {
    window.open("/viewTicket.do", "myPage_viewTicket", "width=350px, height=450px, left=50, top=100");
}






