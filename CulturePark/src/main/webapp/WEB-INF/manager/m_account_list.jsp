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
    <style><%@include file="/resources/common/vendor/fontawesome-free/css/all.min.css"%></style>

    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

    <%-- css --%>
    <!-- Custom styles for this page -->
    <style><%@include file="/resources/common/vendor/datatables/dataTables.bootstrap4.min.css"%></style>
    <style><%@include file="/resources/manager/css/m_account_list.css"%></style>
    <style><%@include file="/resources/common/css/common_togglebtn.css"%></style>
    <style><%@include file="/resources/common/css/common_tableStyle.css"%></style>


    <title>manager account list</title>
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="/WEB-INF/manager/common_head&side.jsp"%>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <%@include file="/WEB-INF/manager/common_topbar.jsp"%>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">매니저 계정관리</h6>


                        <div class="icon_descript">

                            <div class="descript_wrap">
                                <span class="btn btn-primary btn-circle btn-sm fa-solid fa-cube"></span>
                                <span>담당 상품</span>
                            </div>
                            <div class="descript_wrap">
                                <span class="btn_update btn btn-primary btn-circle btn-sm fa-solid fa-user"></span>
                                <span>매니저 수정</span>
                            </div>
                            <div class="descript_wrap">
                                <span class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></span>
                                <span>매니저 삭제</span>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>seq</th>
                                    <th>회사</th>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>휴대전화</th>
                                    <th>권한</th>
                                    <th>활성</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tbody>
                                <form name="frm">
                                    <tr>
                                        <input type="hidden" class="comp_num" value="100">
                                        <input type="hidden" class="manager_num" value="100">
                                        <td class="seq">1</td>
                                        <td class="comp">투진컴퍼니</td>
                                        <td class="name">한진희</td>
                                        <td class="email">taran@gmail.com</td>
                                        <td class="phone">01098888888</td>
                                        <td class="right">root</td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="toggle_p">활성화</p>
                                            <p class="toggle_p" style="display:none;">비활성</p>
                                        </td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-cube"></button>
                                                <button class="btn_update_manager btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                                <button class="btn_delete_manager btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></button>

                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <input type="hidden" class="comp_num" value="200">
                                        <input type="hidden" class="manager_num" value="300">
                                        <td class="seq">2</td>
                                        <td class="comp">진투컴퍼니</td>
                                        <td class="name">김진아</td>
                                        <td class="email">jinah@gmail.com</td>
                                        <td class="phone">01044448888</td>
                                        <td class="right">root</td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="toggle_p">활성화</p>
                                            <p class="toggle_p" style="display:none;">비활성</p>
                                        </td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-cube"></button>
                                                <button class="btn_update_manager btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                                <button class="btn_delete_manager btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <input type="hidden" class="comp_num" value="400">
                                        <input type="hidden" class="manager_num" value="100">
                                        <td class="seq">3</td>
                                        <td class="comp">지민컴퍼니</td>
                                        <td class="name" id="3">홍민지</td>
                                        <td class="email">jinah@gmail.com</td>
                                        <td class="phone">01022228888</td>
                                        <td class="right">normal</td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="toggle_p">활성화</p>
                                            <p class="toggle_p" style="display:none;">비활성</p>
                                        </td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-cube"></button>
                                                <button class="btn_update_manager btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                                <button class="btn_delete_manager btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <input type="hidden" class="comp_num" value="600">
                                        <input type="hidden" class="manager_num" value="100">
                                        <td class="seq">5</td>
                                        <td class="comp">진규컴퍼니</td>
                                        <td class="name">한규진</td>
                                        <td class="email">jinah@gmail.com</td>
                                        <td class="phone">01022229999</td>
                                        <td class="right">normal</td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="toggle_p">활성화</p>
                                            <p class="toggle_p" style="display:none;">비활성</p>
                                        </td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-cube"></button>
                                                <button class="btn_update_manager btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                                <button class="btn_delete_manager btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></button>
                                            </div>
                                        </td>
                                    </tr>
                                </form>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>



                <%-- 수 정 모 달  --%>
                <div class="modal fade  border-0 shadow-lg my-5" id="UpdateModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
                     style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">매니저 정보</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>

                            </div>
                            <form class="user modal-body" style="max-height: 600px; overflow: scroll">
                                <div class="form-group">
                                    <span class="head_man_name"></span>  #<span class="head_man_num"></span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">이름</div>
                                    <input type="text" class="form-control form-control-user" id="ManagerName">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">이메일</div>
                                    <input type="email" class="form-control form-control-user" id="ManagerEmail">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">전화번호</div>
                                    <input type="phone" class="form-control form-control-user" id="ManagerPhone">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">권한</div>
                                    <select class="authority" id="authority" name="authority">
                                        <option value="">선택</option>
                                        <option value="샘플1">샘플1</option>
                                        <option value="샘플2">샘플2</option>
                                        <option value="샘플3">샘플3</option>
                                    </select>
                                </div>
                            </form>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                <button class="btn btn-secondary update_btn" type="button" data-dismiss="modal">수정</button>
                            </div>
                        </div>
                    </div>ㅁ
                </div>




                <!-- 삭 제 모 달 -->
                <div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteLavel">매니저 삭제</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <form class="user modal-body">정말로 삭제하시길 원한다면 입력칸에 '매니저를 삭제합니다'를 입력해주세요
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="decideDelete"
                                           placeholder="입력해주세요">
                                </div>
                            </form>

                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                <button class="btn_finalDelete btn btn-primary" >삭제</button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="/WEB-INF/manager/common_footer.jsp"%>
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


<%-- script --%>
<script src="/resources/manager/js/m_account_list.js"></script>


</body>

</html>