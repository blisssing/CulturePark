<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <style><%@include file="/resources/common/css/fontawesome/all.min.css"%></style>
    <!-- Custom styles for this template-->
    <style><%@include file="/resources/common/css/sb-admin-2.min.css"%></style>
    <style><%@include file="/resources/common/vendor/fontawesome-free/css/all.min.css"%></style>
    <style><%@include file="/resources/admin/css/ad_createAcount.css"%></style>

    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
    <title> CulturePark 관리자</title>
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="/WEB-INF/admin/common_head&side.jsp"%>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <%@include file="/WEB-INF/admin/comomn_topbar.jsp"%>

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="container">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                                <div class="col-lg-7">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4"> 프로모션 생성</h1>
                                        </div>
                                        <form class="user">
                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <input type="text" class="form-control form-control-user" id="FirstName"
                                                           placeholder="이름">
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control form-control-user" id="LastName"
                                                           placeholder="성">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-user" id="InputEmail"
                                                       placeholder="이메일">
                                            </div>
                                            <div class="form-group">
                                                <input type="phone" class="form-control form-control-user" id="InputPhone"
                                                       placeholder="010-xxxx-xxxx">
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <input type="password" class="form-control form-control-user"
                                                           id="InputPassword" placeholder="Password">
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="password" class="form-control form-control-user"
                                                           id="RepeatPassword" placeholder="Repeat Password">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user" id="Depart"
                                                       placeholder="부서">
                                            </div>
                                            <div class="form-group">
                                                <ul class="col-sm-6 chk_ul">
                                                    <div>권한</div>
                                                    <li class="chk_list"><input type="checkbox" name="chk_right" value="member">회원관리</li>
                                                    <li class="chk_list"><input type="checkbox" name="chk_right" value="manager">매니저관리</li>
                                                    <li class="chk_list"><input type="checkbox" name="chk_right" value="product">상품관리</li>
                                                    <li class="chk_list"><input type="checkbox" name="chk_right_super" value="super" id="chk_super">슈퍼</li>
                                                </ul>
                                            </div>
                                            <button  class="btn btn-primary btn-user btn-block btn_regist">등록하기</button>
                                        </form>
                                        <hr>

                                    </div>
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
        <%@include file="/WEB-INF/admin/common_footer.jsp"%>
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
<script src="/resources/admin/js/ad_createAd.js"></script>

</body>

</html>