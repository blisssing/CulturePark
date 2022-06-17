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

    <style>
        <%@include file="/resources/admin/css/ad_adminList.css" %>
    </style>

    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>


    <title>CulturePark 관리자</title>

    <%--<link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">--%>

</head>

<body id="page-top">

<%
    if (session.getAttribute("isLogOn") == null) {
%>

<script type="text/javascript">
    location.href="/culturePark/all/loginForm.ado";
</script>

<%
} else{
%>

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
                <h1 class="h3 mb-2 text-gray-800">관리자 관리</h1>
                <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                    For more information about DataTables, please visit the <a target="_blank"
                                                                               href="https://datatables.net">official
                        DataTables documentation</a>.</p>
                <div class="icon_descript">
                    <div class="descript_wrap">
                        <span class="btn btn-primary btn-sm btn-circle">M</span><span>정보수정</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_delete_data btn btn-primary btn btn-primary btn-circle btn-sm fas fa-trash"></span><span>삭제</span>
                    </div>


                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">관리자 목록</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>이름</th>
                                    <th>부서</th>
                                    <th>이메일</th>
                                    <th>생성일</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>번호</th>
                                    <th>이름</th>
                                    <th>부서</th>
                                    <th>이메일</th>
                                    <th>생성일</th>
                                    <th>기능</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="admin" items="${adminList}" varStatus="status">
                                    <tr>
                                        <fmt:formatDate var="formatRegDate" value="${admin.ad_createDate}" pattern="yyyy-MM-dd"/>
                                        <c:set var="count" value="${count + 1}"/>
                                        <form name="frm" class="frm">
                                            <input name="ad_seq" type="hidden" class="seq" value="${admin.ad_seq}">
                                            <input name="" type="hidden" class="tel" value="${admin.ad_tel}">
                                            <input name="" type="hidden" class="is" value="${admin.ad_is}">
                                            <input name="" type="hidden" class="date" value="${admin.ad_createDate}">
                                            <td class="num">${count}</td>
                                            <td class="name">${admin.ad_name}</td>
                                            <td class="depart">${admin.ad_depart}</td>
                                            <td class="email">${admin.ad_email}</td>
                                            <td class="create_date">
                                                    ${formatRegDate}
                                            </td>
                                            <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button type="button" class="btn_modi_info btn btn-primary btn-sm btn-circle">M</button>
                                                <button type="button" class="btn_delete_data btn btn-primary btn-circle btn-sm fas fa-trash"></button>
                                            </div>
                                        </td>
                                        </form>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <%--    수 정 모 달      --%>
                <div class="modal fade o-hidden border-0 shadow-lg my-5" id="modifyModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content ard-body p-0">
                                    <div class="modal-header">
                                        <h1 class="h4 text-gray-900 mb-4">관리자 정보 변경</h1>
                                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                        <div class="user modal-body" style="max-height: 500px; overflow: scroll;">
                            <form class="modal_frm" name="modal_frm">
                                <input type="hidden" name="ad_email" class="modal_ad_email"/>
                                <input type="hidden" name="ad_name" class="modal_ad_name"/>
                                <input type="hidden" name="ad_seq" class="modal_ad_seq"/>
                                        <div class="form-group">
                                            <div class="context_head">관리자 이름</div>
                                            <div class="form-control form-control-user" id="AdminName"></div>
                                        </div>
                                        <div class="form-group">
                                            <div class="context_head">관리자 메일</div>
                                            <div class="form-control form-control-user" id="InputEmail"></div>
                                        </div>
                                        <div class="form-group">
                                            <div class="context_head">전화번호</div>
                                            <input name="ad_tel" type="text" class="form-control form-control-user" id="InputPhone"
                                                   placeholder="010-xxxx-xxxx">
                                        </div>
                                        <div class="context_head">비밀번호 변경</div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <input name="ad_pw" type="password" class="form-control form-control-user"
                                                       id="InputPassword" placeholder="Password">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="password" class="form-control form-control-user"
                                                       id="RepeatPassword" placeholder="Repeat Password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input name="ad_depart" type="text" class="form-control form-control-user" id="Depart"
                                                   placeholder="부서">
                                        </div>
                                        <div class="form-group">
                                            <ul class="col-sm-6 chk_ul">
                                                <div>권한</div>
                                                <li class="chk_list"><input type="checkbox" name="check_is" value="member"  class="chk_normal" id="chk_member">회원관리</li>
                                                <li class="chk_list"><input type="checkbox" name="check_is" value="manager" class="chk_normal" id="chk_manager">매니저관리</li>
                                                <li class="chk_list"><input type="checkbox" name="check_is" value="product" class="chk_normal" id="chk_product">상품관리</li>
                                                <li class="chk_list"><input type="checkbox" name="check_is" value="super" id="chk_super">슈퍼</li>
                                            </ul>
                                        </div>

                                    <div class="modal-footer">
                                                <button class="btn btn-secondary btn-user btn-block" type="button" data-dismiss="modal">취소</button>
                                                <button class="btn btn-primary btn-user btn-block btn_modiDone">수정완료</button>
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>

                </div>

                <!-- 삭 제 모 달 -->
                <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" style="display: none">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteLavel">관리자 삭제</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <form class="user modal-body">정말로 삭제하시길 원한다면 입력칸에 '관리자를 삭제합니다'를 입력해주세요
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="decideDelete"
                                           placeholder="입력해주세요">
                                </div>
                            </form>

                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <button class="btn_finalDelete btn btn-primary" >삭제하기</button>
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
<%
    }
%>
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
                    <span aria-hidden="true">×</span>
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
<script src="/resources/common/js/checkPW.js"></script>
<script src="/resources/admin/js/ad_adminList.js" type="text/javascript"></script>

</body>

</html>