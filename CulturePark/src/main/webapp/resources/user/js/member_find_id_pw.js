$(document).ready(function() {

    /* 아이디 체크 */
    $("#id_ok_btn").click(function() {
    if($("#find_name_value").val() == "true" && $("#find_jumin_value").val() == "true" ){
        /*alert($('#sm_id').val()+"님 환영합니다. 선택해주셔서 감사합니다 :)");*/
    }else{
      /*  if(!$("#find_name_value").prop("checked")){
            $("label[for=agreement1]").text("동의 해주시기 바랍니다.");
            $("label[for=agreement1]").css("color","red");
        }
        if(!$("#agreement2").prop("checked")) {
            $("label[for=agreement2]").text("동의 해주시기 바랍니다.");
            $("label[for=agreement2]").css("color","red");
        }*/
        if($("#find_name_value").val() != "true"){
           alert($('.find_name_value').text("이름를 입력해주세요 :)"));
            $(".find").css("color", "red");
        }
        if($("#find_jumin_value").val() != "true"){
            alert($('.find_jumin_value').text("주민번호를 입력해주세요 :)"));
            $(".successIdChk").css("color", "red");
        }
        return false
    }
});

    /* 비밀번호 체크 */








});