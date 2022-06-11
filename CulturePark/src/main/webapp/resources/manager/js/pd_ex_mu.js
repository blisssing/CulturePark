/* 거절사유 팝업 */
function refuse_popup() {
    window.open("/refuse.mdo", "pd_refuse_pop", "width=500px, height=200px");
}

/* 관리자 정보 팝업 */
function adminInfo_popup() {
    window.open( "/adminInfo.mdo", "pd_adminInfo_pop", "width=500px, height=200px");
}


/* 요청하기 모달 */
$(document).ready(function () {

    $('.requesting_btn').click(function () {
        eventData = $(this);
        eventRow = $(this).closest('tr');
        $('#RequestingModal').modal({});

    });


    // 진희
    $('#choice2').change(function () {
        var selected_val = $('#choice2 option:selected').val();
        console.log(selected_val);

        if (selected_val === 'day') {
            $('.tck_day').attr('disabled', false);
            $('.tck_time').attr('disabled', true);
        } else if (selected_val === 'time') {
            $('.tck_day').attr('disabled', true);
            $('.tck_time').attr('disabled', false);
        } else {
            $('.tck').attr('disabled', true);
        }
    });

      /* /!* day 선택시 오픈,마감시간 비활성화 *!/
        $('#request_day').click(function(){
            $(".tck_openTime").attr("disabled",false); //입력불가
            $(".tck_closeTime").attr("disabled",false);
        });

        /!* time 선택시 오픈,마감시간 활성화 *!/
        $('#request_time').click(function(){
            $(".tck_openTime").attr("disabled",false);
            $(".tck_closeTime").attr("disabled",false);
        });*/



    // 진희 주석처리
            // $(document).on("change", "select[name=choice]", function(){
            //     var value = $(this).find("option:selected").val();
            //     var inputText = $(this).closest('.selectBox').find('.inputText');
            //     var flag = false;
            //     if (value == 0) {
            //         flag = true;
            //         $(inputText).val('');
            //     }
            //
            //     $(inputText).attr("disabled", flag);
            // });


           /* $('#choice2').on('input change', function () {
                if ($(this).val() == '#request_day') {
                    $('.tck_openTime').attr('disabled', false);
                    $(".tck_closeTime").attr("disabled",false);
                }
                else if ($(this).val() == '#request_time') {
                    $('.tck_openTime').attr('disabled', true);
                    $(".tck_closeTime").attr("disabled", true);
                }
            });
    */

            $('.btn_Agree2').click(function(){
               alert('변경되었습니다.');
            });

            $('.cancel_btn').click(function(){
                $('.modal').modal('hide');
            });
});