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
    <!-- Custom styles for this page -->
    <style>
        <%@include file="/resources/common/vendor/datatables/dataTables.bootstrap4.min.css" %>
    </style>

    <style>
        <%@include file="/resources/common/vendor/fontawesome-free/css/all.min.css" %>
    </style>

    <style><%@include file="/resources/admin/css/mg_mgRequest.css"%></style>



    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>


    <title>CulturePark 관리자</title>

    <%--<link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">--%>

    <%--파일 다운로드--%>
<%--    https://www.delftstack.com/ko/howto/javascript/javascript-download/--%>

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
                <h1 class="h3 mb-2 text-gray-800">판매자 관리</h1>

                <div class="icon_descript">
                    <div class="descript_wrap">
                        <span class="btn_More_info btn btn-primary btn-sm btn-circle fas fa-check"></span>
                        <span>요청확인</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Disagree btn btn-primary btn-sm btn-circle">X</span>
                        <span>요청거절</span>
                    </div>
                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">파트너 요청 목록</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>num</th>
                                    <th>회사</th>
                                    <th>대표</th>
                                    <th>이메일</th>
                                    <th>구분</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>num</th>
                                    <th>회사</th>
                                    <th>대표</th>
                                    <th>이메일</th>
                                    <th>구분</th>
                                    <th>기능</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <form name="frm">
                                    <tr>
                                        <td class="td_seq">
                                            1
                                        </td>
                                        <td class="td_com">
                                            피크닉
                                        </td>
                                        <td class="td_present">
                                            동산주
                                        </td>
                                        <td class="td_email">
                                            picknic@gmail.com
                                        </td>
                                        <td class="td_type">
                                            전시
                                        </td>
                                        <td class="td_func">
                                            <button class="btn_More_info btn btn-primary btn-sm btn-circle fas fa-check"></button>
                                            <button class="btn_Disagree btn btn-primary btn-sm btn-circle">X</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_seq">
                                            2
                                        </td>
                                        <td class="td_com">
                                            공원
                                        </td>
                                        <td class="td_present">
                                            주산동
                                        </td>
                                        <td class="td_email">
                                            nickpick@gmail.com
                                        </td>
                                        <td class="td_type">
                                            뮤지엄
                                        </td>
                                        <td class="td_func">
                                            <button class="btn_More_info btn btn-primary btn-sm btn-circle fas fa-check"></button>
                                            <button class="btn_Disagree btn btn-primary btn-sm btn-circle">X</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_seq">
                                            3
                                        </td>
                                        <td class="td_com">
                                            쥬라기공원
                                        </td>
                                        <td class="td_present">
                                            크아앙
                                        </td>
                                        <td class="td_email">
                                            picknic@gmail.com
                                        </td>
                                        <td class="td_type">
                                            뮤지엄
                                        </td>
                                        <td class="td_func">
                                            <button class="btn_More_info btn btn-primary btn-sm btn-circle fas fa-check"></button>
                                            <button class="btn_Disagree btn btn-primary btn-sm btn-circle">X</button>
                                        </td>
                                    </tr>
                                </form>

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
        <%@include file="/WEB-INF/admin/common_footer.jsp" %>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<%--모달--%>

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

<%--거절 모달 --%>
    <div class="modal fade" id="DisagreeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="askLabel">정말로 거절하겠습니까??</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">정말로 요청을 거절하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <button class="btn_check_Disagree btn btn-primary" >확인</button>
                </div>
            </div>
        </div>
    </div>

<%--거절 사유 모달--%>
    <div class="modal fade" id="ReasonModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reasonAsk">거절 사유</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="user modal-body">
                    <div class="form-group">
                        <div class="form-head">사유를 적어주시오</div>
                        <input type="text" class="form-control form-control-user" id="refuseReason"></input>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <button class="btn_finalDisAgree btn btn-primary" >확인</button>
                </div>
            </div>
        </div>
    </div>

<%--동의 모달--%>
    <div class="modal fade" id="AgreeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="agreeAsk">정말로 수락하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">정말로 요청을 수락하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <button class="btn_finalAgree btn btn-primary" >수락</button>
                </div>
            </div>
        </div>
    </div>

<%--세부사항 모달 --%>
    <div class="modal fade card border-0 shadow-lg my-5" id="DetailModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ard-body p-0">
                <div class="modal-header">
                    <h1 class="h4 text-gray-900 mb-4">요청 세부 내역</h1>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="user modal-body">
                    <div class="form-group">
                        <div class="form-head">회사명</div>
                        <div class="form-control form-control-user" id="CompanyName"></div>
                    </div>
                    <div class="form-group">
                        <div class="form-head">사업자명</div>
                        <div class="form-control form-control-user" id="PresentName"></div>
                    </div>
                    <div class="form-group">
                        <div class="form-head">사업자번호</div>
                        <div class="form-control form-control-user" id="CompanyNum"></div>
                    </div>
                    <div class="form-group">
                        <div class="form-head">전화번호</div>
                        <div class="form-control form-control-user" id="PhoneNumber"></div>
                    </div>
                    <div class="form-group">
                        <div class="form-head">이메일</div>
                        <div class="form-control form-control-user" id="CompanyEmail"></div>
                    </div>
                    <div class="form-group">
                        <div class="form-head">유형</div>
                        <div class="form-control form-control-user" id="ProdoctType"></div>
                    </div>
                    <div class="form-group">
                        <div class="button_wrap">
                            <a href="#" class="btn_file btn btn-info btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fa-regular fa-file"></i>
                                            </span>
                                <span class="text">첨부파일 다운로드</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn_Agree2 btn btn-success btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-check"></i>
                                            </span>
                        <span class="text">수락하기</span>
                    </button>
                    <button href="#" class="btn_Disagree2 btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                        <span class="text">거절하기</span>
                    </button>

                </div>
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
<script src="/resources/admin/js/ad_adminList.js" type="text/javascript"></script>
<script src="/resources/admin/js/mg_requestList.js"type="text/javascript"></script>




</body>


</html>