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

    <style><%@ include file="/resources/admin/css/common_tableStyle.css"%></style>


    <style>
        .btn_print {
            position: absolute;
            top: 15px;
            right: 10px;
        }
    </style>

    <title>CulturePark 관리자</title>

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
                <h1 class="h3 mb-2 text-gray-800">결제 관리</h1>


                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">환불내역목록</h6>
                        <button class="btn_print btn btn-primary btn-icon-split">출력하기</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>seq</th>
                                    <th>업체명</th>
                                    <th>이름</th>
                                    <th>회원이메일</th>
                                    <th>처리날짜</th>
                                    <th>처리인</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>seq</th>
                                    <th>업체명</th>
                                    <th>이름</th>
                                    <th>회원이메일</th>
                                    <th>처리날짜</th>
                                    <th>처리인</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <form name="frm">
                                    <tr>
                                        <input type="hidden" class="pd_code" value="50">
                                        <input type="hidden" class="user_code" value="51">
                                        <input type="hidden" class="refund_code" value="52">
                                        <td class="seq">1</td>
                                        <td class="comp_name">피크닉</td>
                                        <td class="pd_period">사울레이터 : 창문을 통해 어렴풋이</td>
                                        <td class="user_email">taran0913@gmail.com</td>
                                        <td class="ticket_date">2022.01.02</td>
                                        <td class="ticket_status">taran0913</td>
                                    </tr>
                                    <tr>
                                        <input type="hidden" class="pd_code" value="50">
                                        <input type="hidden" class="user_code" value="51">
                                        <input type="hidden" class="refund_code" value="52">
                                        <td class="seq">1</td>
                                        <td class="comp_name">피크닉</td>
                                        <td class="pd_period">사울레이터 : 창문을 통해 어렴풋이</td>
                                        <td class="user_email">taran0913@gmail.com</td>
                                        <td class="ticket_date">2022.01.02</td>
                                        <td class="ticket_status">taran0913</td>
                                    </tr>
                                    <tr>
                                        <input type="hidden" class="pd_code" value="50">
                                        <input type="hidden" class="user_code" value="51">
                                        <input type="hidden" class="refund_code" value="52">
                                        <td class="seq">1</td>
                                        <td class="comp_name">피크닉</td>
                                        <td class="pd_period">사울레이터 : 창문을 통해 어렴풋이</td>
                                        <td class="user_email">taran0913@gmail.com</td>
                                        <td class="ticket_date">2022.01.02</td>
                                        <td class="ticket_status">taran0913</td>

                                    </tr>
                                    <tr>
                                        <input type="hidden" class="pd_code" value="50">
                                        <input type="hidden" class="user_code" value="51">
                                        <input type="hidden" class="refund_code" value="52">
                                        <td class="seq">1</td>
                                        <td class="comp_name">피크닉</td>
                                        <td class="pd_period">사울레이터 : 창문을 통해 어렴풋이</td>
                                        <td class="user_email">taran0913@gmail.com</td>
                                        <td class="ticket_date">2022.01.02</td>
                                        <td class="ticket_status">taran0913</td>
                                    </tr>
                                </form>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <%--유 저 정 보 모 달 --%>
                <div class="modal fade border-0 shadow-lg my-5" id="UserInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"x
                     style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">유 저 정 보</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body" style="max-height: 600px; overflow: scroll;">
                                <div class="form-group">
                                    <span>유저번호 : </span>
                                    <span id="UserSeq">#12</span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">이메일</div>
                                    <input class="userEmail form-control form-control-user">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">이름</div>
                                    <input class="form-control form-control-user" id="UserName">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">닉네임</div>
                                    <input class="form-control form-control-user" id="UserNick">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">전화번호</div>
                                    <input class="form-control form-control-user" id="UserTel">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">가입날짜</div>
                                    <div class="form-control form-control-user" id="JoinDate"></div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button  class="btn_modal_close btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                                    <span class="text">닫기</span>
                                </button>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade border-0 shadow-lg my-5" id="RefundModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"x
                     style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">결 제 정 보</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body" style="max-height: 600px; overflow: scroll;">
                                <div class="form-group">
                                    <span>결제번호 : </span>
                                    <span class="payment_code">#12</span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">이메일</div>
                                    <input class="userEmail form-control form-control-user">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">티켓날짜</div>
                                    <div class="form-control form-control-user" id="TicketDate"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">결제날짜</div>
                                    <div class="form-control form-control-user" id="PaymentDate"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">환불가능여부</div>
                                    <div class="form-control form-control-user" id="CanRefund"></div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button  class="btn_final_refund btn btn-info btn-icon-split">
                                            <span class="icon fa-solid fa-receipt">
                                            </span>
                                    <span class="text">환불하기</span>
                                </button>
                                <button  class="btn_strong_refund btn btn-warning btn-icon-split">
                                            <span class="icon fa-solid fa-receipt">
                                            </span>
                                    <span class="text">강제환불하기</span>
                                </button>
                                <button  class="btn_modal_close btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                                    <span class="text">닫기</span>
                                </button>

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
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

<script src="/resources/admin/js/pm_refundList.js"></script>



</body>

</html>