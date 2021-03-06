<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
    <!-- Custom styles for this page -->
    <style>
        <%@include file="/resources/common/vendor/datatables/dataTables.bootstrap4.min.css" %>
    </style>

    <style>
        <%@include file="/resources/common/vendor/fontawesome-free/css/all.min.css" %>
    </style>

    <style><%@ include file="/resources/admin/css/common_tableStyle.css"%></style>

    <style>
        .modal-header {
            padding: 1rem 1rem 0 1rem;
        }

        .table {
            border-left: 0.5px solid #e3e6f0;
            border-right: 0.5px solid #e3e6f0;
            margin-bottom: 0;
        }

        .h4 {
            font-size:1.1rem !important;
            margin: 5px 0 20px 200px !important;
        }

        .card-body {
            font-size:0.9rem;
        }

        .card-header {
            display: flex !important;
            justify-content: space-between !important;
        }

        .text-primary {
            color: dimgray !important;
            font-weight: lighter !important;
            font-size:1.2rem !important;
        }

        .card-header .requesting_btn {
            font-size: 0.9rem;
            color: dimgray;
            background-color: white;
            border: white;
            border-bottom: 2px solid lightgray;
            border-right: 2px solid lightgray;
            padding: 6px 8px;
            border-radius: 1rem;
        }


        .status_btn , .adminInfo_btn {
            color: #858796;
            font-weight: bold;
            cursor: pointer;
        }

        .modal-content{
            width: 110%;
        }


        .section_label {
            font-size:1rem;
            margin:15px 0;
            font-weight: 100;
        }

        .row_all {
            display: flex;
            width: 100%;
            margin-bottom: 40px;
        }

        .row1 , .row2 {
            border-right: 1px solid #e3e6f0;
            border-bottom: 1px solid #e3e6f0;
        }

        .row1 {
            width:50%;
        }

        .row2 {
            width:50%;
        }


        .modal > .table {
            display: flex;
            flex-direction: column;
        }

        .modal > thead {
            display: flex;
            flex-direction: column;
        }
        .modal > th {
            display: flex;
        }

        .modal > tr {
            display: flex;
        }

        .td_0 {
            width: 30%;
            font-size: 1rem;
        }

        .modal > .table td, .table th {
            padding:0.5rem;
        }

        .td_1 {
            width:40%;
            font-size:0.9rem;
        }

        .td_1 > input {
            width: 80%;
            margin-right:4px;
        }

        .btn_Agree2 {
            background-color: #81c995;
        }

        .btn_Disagree2 {
            background-color: lightgray;
        }

        .chkbox {
            margin-right: 5px;
        }

        .chkLabel {
            margin-left: 15px;
        }


        .choice {
            width: 95%;
        }

        .file_padding input {
            padding: 5px 5px 40px 5px;
        }


        .modal-footer {
            margin: 30px 0 50px 0px;
            bottom: 0;
            right: 0;
            left: 0;
        }


        .btn-danger {
            border-color: white;
        }

        .btn-success {
            border-color: white;
        }


        .row0 {
            border-bottom: 1px solid #e3e6f0;
            margin-bottom: 40px;
        }

        .tck_max , .tck_openTime , .tck_closeTime {
            width: 95%;
            height: 27px;
        }



    </style>

    <title>CulturePark ?????????</title>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="/WEB-INF/admin/common_head&side.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%@include file="/WEB-INF/admin/comomn_topbar.jsp" %>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">?????? ??????</h1>
                <div class="icon_descript">
                    <div class="descript_wrap">
                        <span class="btn_Dicip_detail btn btn-primary btn-circle btn-sm fa-solid fa-cube"></span>
                        <span> ?????? ?????? </span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Dicip_cancel btn btn-primary btn-circle btn-sm fa-solid fa-file-pen"></span>
                        <span> ?????? ?????? </span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Dicip_cancel btn btn-primary btn-circle btn-sm fa-solid fa-user"></span>
                        <span> ????????? ?????? </span>
                    </div>

                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">?????? ??????</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>seq</th>
                                    <th>?????????</th>
                                    <th>?????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                    <th>??????</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>seq</th>
                                    <th>?????????</th>
                                    <th>?????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                    <th>??????</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${productList}" var="product" varStatus="status">
                                    <fmt:formatDate var="formatRequestDate" value="${product.get('pmr_requestdate')}" pattern="yyyy-MM-dd"/>
                                    <tr>
                                        <input type="hidden" class="pd_seq" value="${product.get("pd_seq")}">
                                        <input type="hidden" class="pmr_seq" value="${product.get("pmr_seq")}">
                                        <input type="hidden" class="pt_seq" value="${product.get("pt_seq")}">
                                        <input type="hidden" class="mg_seq" value="${product.get('mg_seq')}">
                                        <input type="hidden" class="pd_typeStr" value="${product.get('pd_typestr')}">
                                        <input type="hidden" class="pd_timeType" value="${product.get('pd_timetype')}">
                                        <input type="hidden" class="pd_openTime" value="${product.get('pd_opentime')}">
                                        <input type="hidden" class="pd_closetime" value="${product.get('pd_closetime')}">
                                        <input type="hidden" class="pd_timeType" value="${product.get('pd_tag')}">
                                        <input type="hidden" class="pd_maxTicket" value="${product.get('pd_maxticket')}">
                                        <input type="hidden" class="pd_closeDay" value="${product.get('pd_closeday')}">

                                        <td class="seq">${status.count}</td>
                                        <td class="comp_name">${product.get("pt_comp_name")}</td>
                                        <td class="pd_title">${product.get("pd_title")}</td>
                                        <td class="request_date">${formatRequestDate}</td>
                                        <td class="handle_date">
                                            <c:if test="${product.containsKey('pmr_processdate')}">
                                                <fmt:formatDate var="formatProcessDate" value="${product.get('pmr_requestdate')}" pattern="yyyy-MM-dd"/>
                                                ${formatProcessDate}
                                            </c:if>
                                        </td>
                                        <td class="request_status">${product.get('pmr_status')}</td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-cube"></button>
                                                <button class="btn_request_info btn btn-primary btn-circle btn-sm fa-solid fa-file-pen"></button>
                                                <button class="btn_manager_info btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <%--??? ??? ??? ??? ??? ??? --%>
                <div class="modal fade border-0 shadow-lg my-5" id="RequestInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h2 class="h4 text-gray-900 mb-4">?????? ?????????</h2>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">??</span>
                                </button>
                            </div>

                            <div class="user modal-body" style="max-height: 500px; overflow-y: scroll;">


                                <%------------ 1. ?????? ?????? -------------%>
                                <div class="section_div">
                                    <div class="section_label">?????? ??????</div>
                                </div>

                                <div class="row_all">
                                    <%--?????? --%>
                                    <div class="row1">
                                        <table class="table" id="table1">

                                            <thead>
                                            <tr>
                                                <th class="center" colspan="2">??????</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <tr>
                                                <td class="td_0"><input type="checkbox"  id="bf_chk_none" class="chkbox no_distinction" name="chk" disabled="disabled">????????????</td>
                                                <td class="td_1"><input type="text"  id="bf_none_price" class="price" disabled="disabled">???</td>
                                            </tr>


                                            <tr>
                                                <td class="td_0"><input type="checkbox" id="bf_chk_adult" class="chkbox chk_adult " name="chk" disabled="disabled">??????</td>
                                                <td class="td_1"><input type="text" id="bf_adult_price" class="price" disabled="disabled">???</td>
                                            </tr>

                                            <tr>
                                                <td class="td_0"><input type="checkbox" id="bf_chk_teenager" class="chkbox chk_teenager" name="chk" disabled="disabled">?????????</td>
                                                <td class="td_1"><input type="text" id="bf_teenager_price" class="price" disabled="disabled">???</td>
                                            </tr>

                                            <tr>
                                                <td class="td_0"><input type="checkbox" id="bf_chk_child" class="chkbox chk_children" name="chk" disabled="disabled">?????????</td>
                                                <td class="td_1"><input type="text" id="bf_child_price" class="price" disabled="disabled">???</td>
                                            </tr>
                                            </tbody>

                                        </table>
                                    </div>

                                    <%-- ?????? --%>
                                    <div class="row2">
                                        <table class="table" id="table2">

                                            <thead>
                                            <tr>
                                                <th class="center" colspan="2">??????</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <tr>
                                                <td class="td_0"><input type="checkbox" id="af_chk_none"  class="chkbox no_distinction" name="chk" disabled="disabled">????????????</td>
                                                <td class="td_1"><input type="text" id="af_none_price" class="price" disabled="disabled">???</td>
                                            </tr>


                                            <tr>
                                                <td class="td_0"><input type="checkbox" id="af_chk_adult" class="chkbox chk_adult" name="chk" disabled="disabled">??????</td>
                                                <td class="td_1"><input type="text" id="af_adult_price"  class="price" disabled="disabled">???</td>
                                            </tr>

                                            <tr>
                                                <td class="td_0"><input type="checkbox"  id="af_chk_teenager" class="chkbox chk_teenager" name="chk" disabled="disabled">?????????</td>
                                                <td class="td_1"><input type="text"  id="af_teenager_price" class="price" disabled="disabled">???</td>
                                            </tr>

                                            <tr>
                                                <td class="td_0"><input type="checkbox" id="af_chk_child" class="chkbox chk_children" name="chk" disabled="disabled">?????????</td>
                                                <td class="td_1"><input type="text" id="af_child_price"  class="price" disabled="disabled">???</td>
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
                                    <div class="row1">
                                        <table class="table" id="table3">

                                            <thead>
                                            <tr>
                                                <th class="center" colspan="2">??????</th>
                                            </tr>
                                            </thead>

                                            <tbody>

                                            <tr class="list1">
                                                <td colspan="2">????????????</td>
                                            </tr>
                                            <tr class="list1">
                                                <td colspan="2">
                                                    <select class="choice" id="choice1" name="choice" disabled="disabled">
                                                        <option value="">??????</option>
                                                        <option value="day">??????(day)</option>
                                                        <option value="time">????????????(time)</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr class="list2">
                                                <td colspan="2">?????? max</td>
                                            </tr>
                                            <tr class="list2">
                                                <td colspan="2"><input id="bf_ticketMax" type="text" class="tck_max" disabled="disabled"></td>
                                            </tr>

                                            <tr class="list3">
                                                <td colspan="2">???????????????</td>
                                            </tr>
                                            <tr class="list3">
                                                <td colspan="2"><input id="bf_openTime" type="text" class="tck_openTime" disabled="disabled"></td>
                                            </tr>

                                            <tr class="list4">
                                                <td colspan="2">???????????????</td>
                                            </tr>
                                            <tr class="list4">
                                                <td colspan="2"><input id="bf_closeTime" type="text" class="tck_closeTime" disabled="disabled"></td>
                                            </tr>

                                            </tbody>

                                        </table>
                                    </div>

                                    <%--??????--%>
                                    <div class="row2">
                                        <table class="table" id="table4">

                                            <thead>
                                            <tr>
                                                <th class="center" colspan="2">??????</th>
                                            </tr>
                                            </thead>

                                            <tbody>

                                            <tr>
                                                <td class="list" colspan="2">????????????</td>
                                            </tr>
                                            <tr class="list">
                                                <td colspan="2">
                                                    <select class="choice" id="choice2" name="choice" disabled="disabled">
                                                        <option value="">??????</option>
                                                        <option value="day" id="request_day" name="choice">??????(day)</option>
                                                        <option value="time" id="request_time" name="choice">????????????(time)</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="list" colspan="2">?????? max</td>
                                            </tr>
                                            <tr class="list">
                                                <td colspan="2"><input id="af_ticketMax" type="text" class="tck tck_day tck_max inputText" disabled="disabled"></td>
                                            </tr>

                                            <tr>
                                                <td class="list" colspan="2">???????????????</td>
                                            </tr>
                                            <tr class="list">
                                                <td colspan="2"><input id="af_openTime" type="text" class="tck tck_time tck_openTime inputText" disabled="disabled"></td>
                                            </tr>

                                            <tr>
                                                <td class="list" colspan="2">???????????????</td>
                                            </tr>
                                            <tr class="list">
                                                <td colspan="2"><input id="af_closeTime" type="text" class="tck tck_time tck_closeTime inputText" disabled="disabled"></td>
                                            </tr>

                                            </tbody>

                                        </table>
                                    </div>

                                </div>

                                    <div class="section_div_no_row">
                                        <div class="section_label">?????? ??????</div>

                                        <div class="row0">
                                            <table class="table" id="table5">
                                                <tr class="list3">
                                                    <td colspan="2" class="label">??????</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="tag"><input type="text" id="af_pd_tag" name="pd_tag" readonly="readonly"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                <%------------- ???????????? -------------%>
                                <%--????????? 1???--%>
                                <div class="section_div_no_row">
                                    <div class="section_label">?????? ??? ?????? ??????</div>

                                    <div class="row0">
                                        <table class="table" id="table6">
                                            <tr>
                                                <td colspan="2" class="chkbox_day">
                                                    <input type="checkbox" id="bf_sunday" class="chkbox" id="sunday" name="chkbox" disabled="disabled">???
                                                    <input type="checkbox" id="bf_monday" class="chkbox chkLabel" id="monday" name="chkbox" disabled="disabled">???
                                                    <input type="checkbox" id="bf_tuesday" class="chkbox chkLabel" id="tuesday" name="chkbox" disabled="disabled">???
                                                    <input type="checkbox" id="bf_wednesday" class="chkbox chkLabel" id="wednesday" name="chkbox" disabled="disabled">???
                                                    <input type="checkbox" id="bf_thursday" class="chkbox chkLabel" id="thursday" name="chkbox" disabled="disabled">???
                                                    <input type="checkbox" id="bf_friday" class="chkbox chkLabel" id="friday" name="chkbox" disabled="disabled">???
                                                    <input type="checkbox" id="bf_saturday" class="chkbox chkLabel" id="saturday" name="chkbox" disabled="disabled">???
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                    <div class="section_div_no_row">
                                        <div class="section_label">?????? ??? ?????? ??????</div>

                                        <div class="row0">
                                            <table class="table">
                                                <tr>
                                                    <td colspan="2" class="chkbox_day">
                                                        <input type="checkbox" class="chkbox" id="af_sunday" name="chkbox" disabled="disabled">???
                                                        <input type="checkbox" class="chkbox chkLabel" id="af_monday" name="chkbox" disabled="disabled">???
                                                        <input type="checkbox" class="chkbox chkLabel" id="af_tuesday" name="chkbox" disabled="disabled">???
                                                        <input type="checkbox" class="chkbox chkLabel" id="af_wednesday" name="chkbox" disabled="disabled">???
                                                        <input type="checkbox" class="chkbox chkLabel" id="af_thursday" name="chkbox" disabled="disabled">???
                                                        <input type="checkbox" class="chkbox chkLabel" id="af_friday" name="chkbox" disabled="disabled">???
                                                        <input type="checkbox" class="chkbox chkLabel" id="af_saturday" name="chkbox" disabled="disabled">???
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>


                            </div>

                            <div class="modal-footer">
                                <button href="#" class="btn_close_modal btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                                    <span class="text cancel_btn">????????????</span>
                                </button>

                                <button class="btn_refuse btn btn-warning btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-xmark"></i>
                                            </span>
                                    <span class="text refuse_request_btn">????????????</span>
                                </button>

                                <button class="btn_Agree2 btn btn-success btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-check"></i>
                                            </span>
                                    <span class="text update_btn">????????????</span>
                                </button>
                            </div>

                        </div>
                    </div>
                </div>

                <%--??? ??? ??? ??? ??? ??? ???--%>
                <div class="modal fade  border-0 shadow-lg my-5" id="ManagerInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
                     style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">????????? ??????</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">??</span>
                                </button>

                            </div>
                            <form class="user modal-body" style="max-height: 600px; overflow: scroll">
                                <div class="form-group">
                                    <span class="head_comp_name"></span>  #<span class="head_comp_num"></span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">???????????????</div>
                                    <div type="text" class="form-control form-control-user" id="RootManagerName"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">??????</div>
                                    <div type="text" class="form-control form-control-user" id="ManagerName"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">?????????</div>
                                    <div type="email" class="form-control form-control-user" id="ManagerEmail"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">????????????</div>
                                    <div type="phone" class="form-control form-control-user" id="ManagerPhone"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">??????</div>
                                    <div type="phone" class="form-control form-control-user" id="ManagerRight"></div>
                                </div>
                            </form>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">??????</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%--?????? ?????? ??????--%>


                <div class="modal fade" id="ReasonModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="reasonAsk">?????? ??????</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">??</span>
                                </button>
                            </div>
                            <div class="user modal-body">
                                <div class="form-group">
                                    <div class="form-head">????????? ???????????????</div>
                                    <input type="text" class="form-control form-control-user" id="refuseReason"></input>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">??????</button>
                                <button class="btn_finalDisAgree btn btn-primary" >??????</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="/WEB-INF/admin/common_footer.jsp" %>
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
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/admin/js/pd_modiRequest.js"></script>
<script src="/resources/common/js/toggleBtn.js"></script>



</body>

</html>