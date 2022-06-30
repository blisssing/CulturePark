$(document).ready(function() {

    /* 이전 */
    $('.back').click(function(){
        window.history.back();
    });

    $('.ok_btn').click(function(){
        /*location.href="/login.do";*/
        window.close();
    })
    /* 로그인 버튼 */

    $('.login_btn').click(function() {
       window.close();
       window.opener.location.href="/login.do";
    })


    /* 키보드 입력 이벤트 핸들러 */

    $('#find_jumin_value').keyup(function (e) {
        var input_wrap = $('#find_jumin_value');
        var length = input_wrap.val().length;
        var btn_wrap = $('#id_ok_btn');

        if (length === 6) {
            btn_wrap.focus();
        }
        /*console.log(length);*/
    });


    /* 아이디 찾기 체크 */
/*    $(".find_id_ok_btn").click(function() {
        var inserted_name = $('#find_name_value').val();
        var inserted_jumin = $('#find_jumin_value').val();

        var result_chk_insert = chkInsert();

        if (result_chk_insert) { //true일때
            chkMemberIs(inserted_name, inserted_jumin);
        } else {
            //Todo : 비정상 실행 결과
        }
    });*/


    /* 아이디 찾기 */
    $('.find_id_ok_btn').click(function(){
    var mb_name = $('#find_name_value').val();
    var mb_birth = $('#find_jumin_value').val();
    var json = {"mb_name": mb_name, "mb_birth": mb_birth};

    chkInsert();
    console.log("함수 전 동작확인");
    findIdFunction(json);
    console.log("js동작확인!!!");
    })
});

/* 아이디 찾기 함수 */
function findIdFunction(obj) {
    $.ajax({
        type:"POST",
        url:"/culturePark/findIdProc.do",
        data: JSON.stringify(obj) ,
        datatype:"text",
        cache:false,
        async:false,
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            if (data === 'success') {
                console.log(data);
                window.open("/findIdResult.do","member_find_id_result", "width=600px, height=300px")
                /*location.href = "/findIdResult.do";*/
            } else {
                console.log("failed",data);
                location.href= "/login.do";
            }
        },
        error: function () {
            alert('실행오류!!');
        },
    });
}

/* 유효성 */
function chkInsert() {
    if($("#find_name_value").val().trim() !=='' && $("#find_jumin_value").val().trim() !== '' ){
        return true;
    }else{
        if($("#find_name_value").val().trim() === ''){
            alert('이름을 입력해주세요');
            $("#find_name_value").focus();

        }else if($("#find_jumin_value").val().trim() === ''){
            alert('주민번호를 입력해주세요');
            $("#find_jumin_value").focus();
        }
        return false;
    }
}

/* 1. 검증  */
/*    function chkMemberIs(inserted_name, inserted_jumin) {
        if(checkDBValues(inserted_name, inserted_jumin)===1) { //성공창
            // To do : 파라미터 값을 넘겨주기
            window.open("/findIdResult.do?a=1", "member_find_id_result", "width=600px, height=300px");
        }else {
            window.open("/findIdResult.do?a=2", "member_find_id_result", "width=600px, height=300px");
        }
    }*/

/* 2. DB 값 조회 및 비교 */
/*   function checkDBValues(inserted_name, inserted_jumin) {
       // To do : DB에 들어가서 값을 조회하는 코드 작성해주기
       return 1;
   }*/
