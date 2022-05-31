$(document).ready(function() {

    /* 이전 */
    $('.back').click(function(){
        window.history.back();
    });

    /* 아이디 찾기 체크 */
    $(".find_id_ok_btn").click(function() {
        var inserted_name = $('#find_name_value').val();
        var inserted_jumin = $('#find_jumin_value').val();

        var result_chk_insert = chkInsert();

        if (result_chk_insert) {
            chkMemberIs(inserted_name, inserted_jumin);
        } else {
            //Todo : 비정상 실행 결과
        }

    });



    function chkInsert() {
        if($("#find_name_value").val() == "true" && $("#find_jumin_value").val() == "true" ){

            return true;
        }else{
            if($("#find_name_value").val() != "true"){
                alert('이름을 입력해주세요');

            }else if($("#find_jumin_value").val() != "true"){
                alert('주민번호를 입력해주세요');
            }
            return false;
        }
    }

    /* 1. 검증  */
    function chkMemberIs(inserted_name, inserted_jumin) {
        if(checkDBValues(inserted_name, inserted_jumin)===1) { //성공창
            // To do : 파라미터 값을 넘겨주기
            window.open("/findIdResult.do?a=1", "member_find_id_result", "width=600px, height=300px, left=100, top=50");
        }else {
            window.open("/findIdResult.do?a=2", "member_find_id_result", "width=600px, height=300px");
        }
    }

    /* 2. DB 값 조회 및 비교 */
    function checkDBValues(inserted_name, inserted_jumin) {
        // To do : DB에 들어가서 값을 조회하는 코드 작성해주기
        return 1;

    }


    /* 비밀번호 찾기 체크 */
    $(".find_pw_ok_btn").click(function() {

      /* 좋은거 */
      /*  var tel1 = $(".tel_1").val();
        var tel2 = $(".tel_2").val();
        var tel3 = $(".tel_3").val();

        var intTel = parseInt(tel1);*/
        // ctrl+ shift + enter


        if($(".find_name_value").val() == "true" && $(".find_email_value").val() == "true" &&
           $(".tel_1").val() == "true" && $(".tel_2").val() == "true" && $(".tel_3").val() == "true"){
            return;
        }else{
            if($(".find_name_value").val() != "true"){
                alert('이름을 입력해주세요');
            }
            if($(".find_email_value").val() != "true"){
                alert('이메일을 입력해주세요');
            }
            if($(".tel_1").val() != "true"){
                alert('휴대폰 번호를 입력해주세요');
            }
            if($(".tel_2").val() != "true"){
                alert('휴대폰 번호를 입력해주세요');
            }
            if($(".tel_3").val() != "true"){
                alert('휴대폰 번호를 입력해주세요');
            }
            if($(".input_value").val() != "true"){
                alert('인증번호를 입력해주세요');
            }
            return false
        }
    });


    /* 라디오 박스 체크시 셋팅 */
    $('.email_radio').on('click',function() {

        /*좋은거*/
        $('.phone_set').css('display', 'none');
        $('.email_set').css('display', 'flex');

        /*  $('.email_set').show();
        $('.phone_set').hide();*/
    });

    $('.phone_radio').on('click',function(){

        /* $('.phone_set').show();
        $('.email_set').hide();*/

        /* 좋은거*/
        $('.phone_set').css('display', 'flex');
        $('.email_set').css('display', 'none');


    });

    


    /* 확인 클릭시 팝업 */

    /* Id */
    $('.find_id_ok_btn').click(function() {


    });

    /* Pw */
    $('.find_pw_ok_btn').click(function() {

    });



});