function uploadFile() {

    //https://nofall.tistory.com/entry/Ajax를-이용한-file-upload-download//

    let formData = new FormData(); // 업로드 할 파일 저장 객체

    // input 태그의 name을 이용하여 input의 value 값(업로드 할 파일들)을 가져와서 저장
    // let inputTag = document.getElementsByName("fileupload");
    // let inputTag2 = $("input[name='fileupload']");

    // input 태그의 id를 이용하여 input의 value 값(업로드 할 파일들)을 가져와서 저장
    let fileupload = $("#fileupload");

    // 불필요한 데이터까지 가져올 필요가 없어서 가져올 데이터만 변수 선언(each 문에 사용)
    let files = fileupload[0].files;

    // console.log(files);

    $(files).each(function (i, file) { // 여러 개의 파일을 업로드할 때 formData에 저장
        formData.append("uploadfile", file);

    });

    // 위 each 문과 같은 기능의 for문
    // for(let i=0; i<files.length; i++){
    //     formData.append("uploadfile", fileupload[0].files[i]);
    // }


    console.log(formData);
    jQuery.ajax({
        url : "/uploadAjax",
        type : "POST",
        processData : false ,
        contentType : false ,
        data : formData ,
        success : function (response) {
            alert("파일 업로드 성공");
            //response에 컨트롤러에서 return 받은 list를 저장


            // 업로드 성공한 파일 다운로드
            let temp = "";
            // each
            $(response).each(function (i, filename){
                temp += "<li><a href='/downloadAjax/" + filename + "'>" + filename + "</a></li>"; // href를 Controller url과 맵핑시켜줌
            });

            ulTag.append(temp); // 성능을 위해 밖에서 append 시켜주기

        }
    });

}