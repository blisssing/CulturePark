
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%--https://velog.io/@rudwnd33/TIL-11월-27일--%>
    <title>TEST</title>
</head>
<body>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>



    <input class="pd_thumbnail" name="pd_thumbnail" type="file">
    <input class="pd_descript" name="pd_descript" type="file">
    <input class="pd_mainImg" name="pd_mainImg" type="file">
    <input class="upload_btn" type="button" value="전송"/>
    <input class="upload_files" type="button" value="여러 개 전송"/>

    <input class="download_btn" type="button" value="받기"/>

</body>

<script>
    $(document).ready(function () {
        $('.upload_btn').click(function () {
            var form = $('.pd_thumbnail')[0].files[0];
            var data = {pd_seq: 1, pd_title:"testTitle"};

            // var form = $('.pd_thumbnail');

            // var data = new Object();
            //
            // data.pd_seq = 1;
            // data.pd_title = "testTitle";

            var formData = new FormData();
            formData.append('file', form);
            formData.append('key', new Blob([JSON.stringify(data)], {type:"application/json"}));
            console.log(form);
            console.log(formData);

            $.ajax({
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                type:"post",
                data: formData,
                url: "/uploadFile.mdo",

                success: function (result) {
                    alert("전송 성공!")
                },
                error: function () {
                    alert("전송 실패!");
                }
            })

        });

        $('.download_btn').click(function () {

            var pt_file = "20220712/d5e0ba78-9dc0-45e4-8b8b-ab9f89f5ae1c.png";
            var pr_comp_name = "투진"


            location.href = "testDownload.mdo";

            // $.ajax({
            //     type:"POST",
            //     dataType: "text",
            //     data: {"pt_file": pt_file, "pr_comp_name" : pr_comp_name},
            //     async: true,
            //     cache: false,
            //     traditional: true,
            //     url:"/testDownload.mdo",
            //     done: function (data) {
            //         data.
            //     },
            //     error: function () {
            //         console.log("실패");
            //     }
            //
            // });



        });

        $('.upload_files').click(function () {

            var thumbNail =$('.pd_thumbnail')[0].files[0];
            var descript = $('.pd_descript')[0].files[0];
            var mainImg = $('.pd_mainImg')[0].files[0];

            var formData2 = new FormData();

            formData2.append('thumb', thumbNail);
            formData2.append('descript', descript);
            formData2.append('main', mainImg);


            console.log(thumbNail);
            console.log(descript);
            console.log(mainImg);

            $.ajax({
                type:"POST",
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                url: "/uploadFiles.mdo",
                data: formData2,
                async:false,
                cache:false,

                success: function (result) {
                    alert("전송 성공!")
                },
                error: function () {
                    alert("전송 실패!");
                }
            })

        });



    });
</script>
</html>
