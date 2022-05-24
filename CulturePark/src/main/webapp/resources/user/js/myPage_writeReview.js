/* 별점 */
var starRating = function(){
    var $star = $(".star-input"),
        $result = $star.find("output>b");

    $(document)
        .on("focusin", ".star-input>.input",
            function(){
                $(this).addClass("focus");
            })

        .on("focusout", ".star-input>.input", function(){
            var $this = $(this);
            setTimeout(function(){
                if($this.find(":focus").length === 0){
                    $this.removeClass("focus");
                }
            }, 100);
        })

        .on("change", ".star-input :radio", function(){
            $result.text($(this).next().text());
        })
        .on("mouseover", ".star-input label", function(){
            $result.text($(this).text());
        })
        .on("mouseleave", ".star-input>.input", function(){
            var $checked = $star.find(":checked");
            if($checked.length === 0){
                $result.text("0");
            } else {
                $result.text($checked.next().text());
            }
        });
};

starRating();

$(document).ready(function(){

/* 모달 */
$('#btn_price_detail').click(function () {

    console.log("수행 모달 ");
    $('.modal').modal({
        fadeDuration: 300,
        showClose:false
    });
    // $('.modal').fadeIn();
    // window.open("getPriceDetail.do", "Price_Detail");
});

$('.modal_content').click(function () {
    $('.modal_container').fadeOut();
});


/* alert */
$('.m_upload_btn').click(function() {
    alert('소중한 리뷰를 남겨주셔서 감사합니다.');
    });

$('.upload_btn').click(function() {
    alert('소중한 리뷰를 남겨주셔서 감사합니다.');
    });


});

/*function regist() {

    //파일 확장자 확인
    var file = $("#file").val();
    file = file.slice( file.indexOf(".") + 1 ).toLowerCase();

    if(file != "jpg" && file !="png" && file != "bmp" && file != null) {
        alert("이미지 파일(jpg, png, bmp)만 등록 가능합니다");
        $("#file").val(""); //file태그가 가지고 있는 파일을 비우고 함수종료
        return false;
    } else if(user_id == '' /!* false *!/) {
        alert("로그인이 필요한 서비스 입니다");
        return false;
    }*/


/*    //ajax폼전송의 핵심 FormData객체 생성
    var formData = new FormData();
    var fileData = $("#file");
    var user_id = $("#user_id").val();
    console.log(user_id);

    var r_title = $("#r_title").val();
    var r_content = $("#r_content").val();
    formData.append("file", $("#file")[0].files[0]); //file이름으로  파일정보를 폼에 저장
    formData.append("user_id", user_id);
    formData.append("r_title", r_title);
    formData.append("r_content", r_content);
    formData.append("user_nick", star);*/













