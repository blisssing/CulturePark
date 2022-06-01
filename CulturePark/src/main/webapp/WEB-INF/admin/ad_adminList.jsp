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
  <style><%@include file="/resources/common/css/fontawesome/all.min.css"%></style>
  <!-- Custom styles for this template-->
  <style><%@include file="/resources/common/css/sb-admin-2.min.css"%></style>
  <!-- Custom styles for this page -->
  <style><%@include file="/resources/common/vendor/datatables/dataTables.bootstrap4.min.css"%></style>

  <style><%@include file="/resources/common/vendor/fontawesome-free/css/all.min.css"%></style>

  <style><%@include file="/resources/admin/css/ad_adminList.css"%></style>

  <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>


  <title>CulturePark 관리자</title>
  <%--<link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">--%>

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
        <h1 class="h3 mb-2 text-gray-800">관리자 관리</h1>
        <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
          For more information about DataTables, please visit the <a target="_blank"
                                                                     href="https://datatables.net">official DataTables documentation</a>.</p>
        <div class="icon_descript">
         <div class="descript_wrap">
            <span class="btn btn-primary btn-sm btn-circle">M</span><span>정보수정</span>
          </div>
          <div class="descript_wrap">
            <span class="btn btn-primary btn-sm btn-circle">M</span><span>권한관리</span>
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
                  <th>이름</th>
                  <th>부서</th>
                  <th>이메일</th>
                  <th>생성일</th>
                  <th>기능</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                  <th>이름</th>
                  <th>부서</th>
                  <th>이메일</th>
                  <th>생성일</th>
                  <th>기능</th>
                </tr>
                </tfoot>
                <tbody>
                  <tr>
                    <td class="name">한진희</td>
                    <td class="depart">A</td>
                    <td class="email">taran@gmail.com</td>
                    <td class="create_date">2022.02.02</td>
                    <td class="btn_section">
                      <div class="btn_wrap">
                        <button class="btn_modi_info btn btn-primary btn-sm btn-circle">M</button>
                        <button class="btn_modi_right btn btn-primary btn-sm btn-circle">R</button>
                        <button class="btn_delete_data btn btn-primary btn-circle btn-sm fas fa-trash"></button>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="name">김진아</td>
                    <td class="depart">A</td>
                    <td class="email">blisssing@gmail.com</td>
                    <td class="create_date">2021.01.01</td>
                    <td class="btn_section">
                      <div class="btn_wrap">
                        <button class="btn_modi_info btn btn-primary btn-sm btn-circle">M</button>
                        <button class="btn_modi_right btn btn-primary btn-sm btn-circle">R</button>
                        <button class="btn_delete_data btn btn-primary btn-circle btn-sm fas fa-trash"></button>
                      </div>
                    </td>
                  </tr>

                </tbody>
              </table>
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

<!-- Page level plugins -->
<script src="/resources/common/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/common/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/common/js/demo/datatables-demo.js"></script>

</body>

</html>