<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <style>
        <%@include file="/resources/common/css/fontawesome/all.min.css" %>
    </style>

    <!-- Custom styles for this template-->
    <style>
        <%@include file="/resources/common/css/sb-admin-2.min.css" %>
    </style>
    <style>
        <%@include file="/resources/common/vendor/fontawesome-free/css/all.min.css" %>
    </style>

    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

    <%-- css --%>
    <!-- Custom styles for this page -->
    <style>
        <%@include file="/resources/common/vendor/datatables/dataTables.bootstrap4.min.css" %>
    </style>
    <style>
        <%@include file="/resources/manager/css/pd_create.css" %>
    </style>


    <title>manager new Request</title>
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="/WEB-INF/manager/common_head&side.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%@include file="/WEB-INF/manager/common_topbar.jsp" %>

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <div class="card shadow mb-4">

                  <div class="card-header py-3">
                        <div class="div1">
                            <h5 class="m-0 font-weight-bold text-primary">?????? ??????</h5>
                        </div>
                        <div class="div2">
                            <div class="label_en">create Product</div>
                        </div>
                    </div>

                    <div class="card-body">

                        <div class="section_div">
                            <div class="section_label">?????? ??????</div>
                        </div>

                        <div class="section_div_top">

                            <div class="top_section">
                                <div class="genre_section">
                                    <div class="genre_label_section">??????</div>

                                    <div class="div_row">
                                        <div class="genre_label">1??? ??????</div>
                                        <select class="genre_select first_select">
                                            <option value="none">??????</option>
                                            <option value="?????????" selected="selected">??????</option>
                                            <option value="?????????">?????????</option>
                                        </select>
                                    </div>

                                    <div class="div_row">
                                        <div class="genre_label">2??? ??????</div>
                                        <select class="genre_select second_select">
                                            <option value="none">??????</option>
                                            <option value="??????">??????</option>
                                            <option value="??????">??????</option>
                                            <option value="??????">??????</option>
                                            <option value="??????">??????</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="pd_name_section">
                                    <div class="pd_name_label">?????????</div>
                                    <input type="text" class="pd_name_text">
                                </div>

                                <div class="sectionType1">
                                    <div class="label_type1">??????</div>
                                    <input type="text" class="pd_place inputType1">
                                </div>

                                <div class="sectionType1">
                                    <div class="label_type1">?????? ??????</div></div>
                                    <select name="slc_age" class="pd_minAge inputType1">
                                        <option name="slc_age" value="-1" selected>?????? ?????????</option>
                                        <option name="slc_age" value="12">??? 12??? ??????</option>
                                        <option name="slc_age" value="15">??? 15??? ??????</option>
                                        <option name="slc_age" value="19">??? 19??? ??????</option>
                                    </select>

                                </div>


                            </div>

                            <div class="section_div">
                                <div class="section_label">?????? ??????</div>
                            </div>

                            <div class="row_all">

                                <%-- ?????? --%>
                                <div class="row2">
                                    <table class="table" id="table2">


                                        <tbody>
                                        <tr class="chk_row">
                                            <td class="td_0"><input value="none" type="checkbox" name="pd_ticketType" class="chkbox pd_ticketType no_distinction">????????????
                                            </td>
                                            <td class="td_1"><input type="text" class="price nonDistinc_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled="disabled">???</td>
                                        </tr>


                                        <tr class="chk_row">
                                            <td class="td_0"><input value="adult"type="checkbox" name="pd_ticketType" class="chk_type chkbox pd_ticketType chk_adult">??????
                                            </td>
                                            <td class="td_1"><input type="text" class="price adult_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled="disabled">???</td>
                                        </tr>

                                        <tr class="chk_row">
                                            <td class="td_0"><input value="teenager" type="checkbox" name="pd_ticketType" class="chk_type chkbox pd_ticketType chk_teenager"
                                            >?????????
                                            </td>
                                            <td class="td_1"><input type="text"  class="price teenager_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled="disabled">???</td>
                                        </tr>

                                        <tr class="chk_row">
                                            <td class="td_0"><input value="child" type="checkbox" name="pd_ticketType"  class="chk_type chkbox pd_ticketType chk_children"
                                            >?????????
                                            </td>
                                            <td class="td_1"><input type="text" class="price children_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled="disabled">???</td>
                                        </tr>
                                        </tbody>

                                    </table>
                                </div>
                            </div>

                            <%-------------- 2. ?????? ?????? ---------------%>
                            <div class="section_div">
                                <div class="section_label">?????? ??????</div>
                            </div>

                            <div class="row_all">

                                <%--??????--%>
                                <div class="row2">
                                    <table class="table" id="table4">

                                        <tbody>

                                        <tr>
                                            <td colspan="2">????????????</td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <select class="choice" id="choice2" name="choice">
                                                    <option value="">??????</option>
                                                    <option value="day" id="request_day" name="choice">??????(day)</option>
                                                    <option value="time" id="request_time" name="choice">????????????(time)
                                                    </option>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">??? ?????? max</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text" class="tck tck_day inputText"
                                                                   disabled="disabled"></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">???????????? ?????? max</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text" class="tck tck_timeStage inputText"
                                                                   disabled="disabled"></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">???????????????</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <select class="open_tck tck tck_time inputText" disabled="disabled">
                                                    <option class="-1" value="none">??????</option>
                                                    <option value="0">00:00</option>
                                                    <option value="1">01:00</option>
                                                    <option value="2">02:00</option>
                                                    <option value="3">03:00</option>
                                                    <option value="4">04:00</option>
                                                    <option value="5">05:00</option>
                                                    <option value="6">06:00</option>
                                                    <option value="7">07:00</option>
                                                    <option value="8">08:00</option>
                                                    <option value="9">09:00</option>
                                                    <option value="10">10:00</option>
                                                    <option value="11">11:00</option>
                                                    <option value="12">12:00</option>
                                                    <option value="13">13:00</option>
                                                    <option value="14">14:00</option>
                                                    <option value="15">15:00</option>
                                                    <option value="16">16:00</option>
                                                    <option value="17">17:00</option>
                                                    <option value="18">18:00</option>
                                                    <option value="19">19:00</option>
                                                    <option value="20">20:00</option>
                                                    <option value="21">21:00</option>
                                                    <option value="22">22:00</option>
                                                    <option value="23">23:00</option>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">???????????????</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <select class="close_tck tck tck_time inputText" disabled="disabled">
                                                    <option value="none">??????</option>
                                                    <option value="0">00:00</option>
                                                    <option value="1">01:00</option>
                                                    <option value="2">02:00</option>
                                                    <option value="3">03:00</option>
                                                    <option value="4">04:00</option>
                                                    <option value="5">05:00</option>
                                                    <option value="6">06:00</option>
                                                    <option value="7">07:00</option>
                                                    <option value="8">08:00</option>
                                                    <option value="9">09:00</option>
                                                    <option value="10">10:00</option>
                                                    <option value="11">11:00</option>
                                                    <option value="12">12:00</option>
                                                    <option value="13">13:00</option>
                                                    <option value="14">14:00</option>
                                                    <option value="15">15:00</option>
                                                    <option value="16">16:00</option>
                                                    <option value="17">17:00</option>
                                                    <option value="18">18:00</option>
                                                    <option value="19">19:00</option>
                                                    <option value="20">20:00</option>
                                                    <option value="21">21:00</option>
                                                    <option value="22">22:00</option>
                                                    <option value="23">23:00</option>
                                                </select>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>

                            <%-------------- 3. ?????? ?????? ---------------%>
                            <%--??????????????? ????????? 1???--%>

                            <div class="section_div_no_row">
                                <div class="section_label">?????? ??????</div>

                                <div class="row0">
                                    <table class="table" id="table5">

                                        <tr class="list1">
                                            <td class="label">?????????</td>
                                            <td class="file_padding"><input class="pd_thumbnail" name="pd_thumbnail" type="file"></td>
                                        </tr>

                                        <tr class="list2">
                                            <td class="label">?????? ?????????</td>
                                            <td class="file_padding"><input class="pd_mainImg" name="pd_mainImg" type="file"></td>
                                        </tr>

                                        <tr class="list2">
                                            <td class="label">????????????</td>
                                            <td class="file_padding"><input class="pd_descript" name="pd_descript" type="file"></td>
                                        </tr>

                                        <tr class="list3">
                                            <td colspan="2" class="label">??????</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="tag"><input type="text" name="pd_tag"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>


                            <%------------- ???????????? -------------%>
                            <%--????????? 1???--%>
                            <div class="section_div_no_row">
                                <div class="section_label">??????</div>

                                <div class="row0">
                                    <table class="table">
                                        <tr>
                                            <td colspan="2" class="chkbox_day">
                                                <input class="datePicker" id="startDate"/>
                                            </td>
                                            <td colspan="2" class="chkbox_day">
                                                <input class="datePicker" id="endDate"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="section_div_no_row">
                                <div class="section_label">?????? ??????</div>

                                <div class="row0">
                                    <table class="table" id="table6">
                                        <tr>
                                            <td colspan="2" class="chkbox_day">
                                                <input type="checkbox" class="chkbox chkLabel" value="sun" name="day_chkbox">???

                                                <input type="checkbox" class="chkbox chkLabel" value="mon"
                                                       name="day_chkbox">???
                                                <input type="checkbox" class="chkbox chkLabel" value="tue"
                                                       name="day_chkbox">???
                                                <input type="checkbox" class="chkbox chkLabel" value="wed"
                                                       name="day_chkbox">???
                                                <input type="checkbox" class="chkbox chkLabel" value="thu"
                                                       name="day_chkbox">???
                                                <input type="checkbox" class="chkbox chkLabel" value="fri"
                                                       name="day_chkbox">???
                                                <input type="checkbox" class="chkbox chkLabel" value="sat"
                                                       name="day_chkbox">???
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                            </div>


                            <div class="btn_section">
                                <button href="#" class="btn_Disagree2 btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                                    <span class="text cancel_btn">????????????</span>
                                </button>

                                <button class="btn_Agree2 btn btn-success btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-check"></i>
                                            </span>
                                    <span class="text regist_btn">????????????</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@include file="/WEB-INF/manager/common_footer.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">??</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>


    <!-- Bootstrap core JavaScript-->
    <script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>

    <script src="/resources/common/js/bootstrap/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/resources/common/js/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/common/js/common/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/common/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/common/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/common/js/demo/datatables-demo.js"></script>

    <%--ui--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <script src="/resources/common/js/jquery-ui.js"></script>


    <%-- script --%>
    <script src="/resources/manager/js/pd_create.js"></script>


</body>

</html>
