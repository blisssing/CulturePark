<%@ page import="kg.twojin.culturePark.common.vo.ProductVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="kor">

<head>

    <%
        ProductVO productVO = null;
        try {
            productVO = (ProductVO) request.getSession().getAttribute("productVO");
        } catch (Exception e) {

        }

        if (productVO != null) {
        String typeStr = productVO.getPd_typeStr();
        String [] typeList = typeStr.split("/");
            boolean noneBool = false;
            boolean adultBool = false;
            boolean teenagerBool = false;
            boolean childrenBool = false;
            int nonePrice = 0;
            int adultPrice = 0;
            int teenagerPrice = 0;
            int childrenPrice = 0;

            for (String type : typeList) {
                String [] typeAry =type.split(":");
                switch (typeAry[0]) {
                    case "adult":
                        adultBool = true;
                        adultPrice = Integer.parseInt(typeAry[1]);
                        continue;
                    case "teenager":
                        teenagerBool = true;
                        teenagerPrice = Integer.parseInt(typeAry[1]);
                        continue;
                    case "child":
                        childrenBool = true;
                        childrenPrice  = Integer.parseInt(typeAry[1]);
                        continue;
                    default:
                        noneBool = true;
                        nonePrice = Integer.parseInt(typeAry[1]);
                        break;
                }


            }



    %>

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

    <style>
        <%@ include file="/resources/admin/css/common_tableStyle.css" %>
    </style>
    <style>
        <%@ include file="/resources/admin/css/pd_detailPage.css" %>
    </style>


    <style>
        .btn_print {
            position: absolute;
            top: 15px;
            right: 10px;
        }

        .td_1, table > tr > td {
            text-align: right;
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

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">

                            <div class="card-body">
                                <div class="p-5">
                                    <div class="text-left">
                                        <h1 class="h4 text-gray-900 mb-4">?????? ??????</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <div class="context_head">?????????</div>
                                                <div class="form-control form-control-user" id="CompanyName">
                                                    ${partner.pt_comp_name}
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="context_head">????????????</div>
                                                <div class="form-control form-control-user" id="CompanyCode">
                                                    ${partner.pt_seq}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <div class="context_head">??????????????? ??????</div>
                                                <div class="form-control form-control-user" id="RootMail">
                                                    ${manager.mg_email}
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="context_head">????????? ??????</div>
                                                <div class="form-control form-control-user" id="RootCode">
                                                    ${manager.mg_seq}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="context_head">??????</div>
                                            <div class="form-control form-control-user" id="ProductTitle">
                                                ${product.pd_title}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="context_head">??????</div>
                                            <div class="form-control form-control-user" id="ProductPlace">
                                                ${product.pd_place}
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <div class="context_head">??????</div>
                                                <div class="form-control form-control-user" id="ProductClass">
                                                    ${product.pd_genre1}
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="context_head">??????</div>
                                                <div class="form-control form-control-user" id="ProductGenre">
                                                    <c:if test="${product.pd_genre2} neq null">
                                                        ${product.pd_genre2}
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <div class="context_head">?????????</div>
                                                <div class="form-control form-control-user" id="ProductStartDate">
                                                    <fmt:formatDate var="formatstartDate" value="${productVO.pd_startDate}" pattern="yyyy-MM-dd"/>
                                                    ${formatstartDate}
                                                </div>???
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="context_head">?????????</div>
                                                <div class="form-control form-control-user" id="ProductEndDate">
                                                    <fmt:formatDate var="formatcloseDate" value="${productVO.pd_closeDate}" pattern="yyyy-MM-dd"/>
                                                    ${formatcloseDate}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row2">
                                                <table class="table" id="table2">
                                                    <thead>
                                                    <tr>
                                                        <th class="center" colspan="2">?????? ??????</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td class="td_0"><input type="checkbox"
                                                                                class="chkbox no_distinction" name="chk" disabled="disabled"
                                                                                <%if(noneBool){%>
                                                                                checked="checked"
                                                                                <%}%>
                                                                                >????????????
                                                        </td>
                                                        <td class="td_1"><input type="text" class="price"
                                                                                disabled="disabled">
                                                            <%=nonePrice%>???

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="td_0"><input type="checkbox" class="chkbox chk_adult"
                                                                                name="chk" disabled="disabled"
                                                            <%if(adultBool){%>
                                                                                checked="checked"
                                                            <%}%>>??????
                                                        </td>
                                                        <td class="td_1"><input type="text" class="price"
                                                                                disabled="disabled" value="<%=adultPrice%>">???
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="td_0"><input type="checkbox"
                                                                                class="chkbox chk_teenager" name="chk"
                                                                                disabled="disabled" <%if(teenagerBool){%>
                                                                                checked="checked"
                                                            <%}%>>?????????
                                                        </td>
                                                        <td class="td_1"><input type="text" class="price"
                                                                                disabled="disabled" value="<%=teenagerPrice%>">???
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="td_0"><input type="checkbox"
                                                                                class="chkbox chk_children" name="chk"
                                                                                disabled="disabled" <%if(childrenBool){%>
                                                                                checked="checked"
                                                            <%}%>>?????????
                                                        </td>
                                                        <td class="td_1"><input type="text" class="price"
                                                                                disabled="disabled" value="<%=childrenPrice%>">???
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row2">
                                                <table class="table" id="table4">
                                                    <thead>
                                                    <tr>
                                                        <th class="center" colspan="2">??????</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td class="list" colspan="2"><span>????????? ??????</span></td>
                                                        <td><span>?????? 1 </span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="list" colspan="2">?????? max</td>
                                                        <td><input type="text" class="tck tck_day tck_max inputText"
                                                                   disabled="disabled" value="${product.pd_maxTicket}">

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="list" colspan="2">???????????????</td>
                                                        <td><input type="text"
                                                                   class="tck tck_time tck_openTime inputText"
                                                                   disabled="disabled"
                                                                   value="${product.pd_openTime}:00">

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="list" colspan="2">???????????????</td>
                                                        <td><input type="text"
                                                                   class="tck tck_time tck_closeTime inputText"
                                                                   disabled="disabled"
                                                                   value="${product.pd_closeTime}:00">

                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <div class="context_head">?????????</div>
                                                <button type="button" class="btn btn-primary btn-user btn-block" value="
                                                <%=productVO.getPd_thumbnail_PATH()%>">????????????
                                                </button>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="context_head">?????????</div>
                                                <button type="button" class="btn btn-primary btn-user btn-block " value="<%=productVO.getPd_descript_PATH()%>">????????????
                                                </button>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="context_head">???????????????</div>
                                            <button class="btn btn-primary btn-user btn-block" value="<%=productVO.getPd_mainImg_PATH()%>">????????????</button>
                                        </div>


                                    </form>


                                </div>
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

</body>

<%
} else {
%>

<script>
    location.href = "/accessError.ado";
</script>
<%
    }
%>
</html>