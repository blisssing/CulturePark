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
        .rv_title {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
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
                <h1 class="h3 mb-2 text-gray-800">리뷰 관리</h1>
                <div class="icon_descript">
                    <div class="descript_wrap">
                        <span class="btn_Dicip_detail btn btn-primary btn-circle btn-sm fa-solid fa-list"></span>
                        <span>리뷰 이동</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Dicip_detail btn btn-primary btn-circle btn-sm fa-solid fa-bullhorn"></span>
                        <span>신고 사유</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Dicip_cancel btn btn-primary btn-circle btn-sm fa-solid fa-trash"></span>
                        <span>삭제</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Dicip_detail btn btn-primary btn-circle btn-sm fa-solid fa-user"></span>
                        <span>작성자 정보</span>
                    </div>
                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">리뷰 목록</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>seq</th>
                                    <th>게시물이름</th>
                                    <th>작성자</th>
                                    <th>신고자</th>
                                    <th>게시날짜</th>
                                    <th>신고날짜</th>
                                    <th>처리여부</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>seq</th>
                                    <th>게시물이름</th>
                                    <th>작성자</th>
                                    <th>신고자</th>
                                    <th>게시날짜</th>
                                    <th>신고날짜</th>
                                    <th>처리여부</th>
                                    <th>기능</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <form name="frm">
                                    <tr>
                                        <input type="hidden" class="pd_code" value="50">
                                        <input type="hidden" class="user_code" value="51">
                                        <input type="hidden" class="review_code" value="52">
                                        <input type="hidden" class="report_code" value="52">
                                        <td class="seq">1</td>
                                        <td class="rv_title">사울레이터 : 창문을 통해 어렴풋이는 개뿔</td>
                                        <td class="user_email">taran0913@gmail.com</td>
                                        <td class="reporter_email">taran0913@naver.com</td>
                                        <td class="review_date">2022.01.02</td>
                                        <td class="report_date">2022.01.02</td>
                                        <td class="report_status">
                                            <select class="select_status">
                                                <option name="slc_status">1</option>
                                                <option name="slc_status">2</option>
                                                <option name="slc_status">3</option>
                                            </select>
                                        </td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_movePage btn btn-primary btn-circle btn-sm fa-solid fa-list"></button>
                                                <button class="btn_reason btn btn-primary btn-circle btn-sm fa-solid fa-bullhorn"></button>
                                                <button class="btn_trash btn btn-primary btn-circle btn-sm fa-solid fa-trash"></button>
                                                <button class="btn_user_info btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <input type="hidden" class="pd_code" value="50">
                                        <input type="hidden" class="user_code" value="51">
                                        <input type="hidden" class="review_code" value="52">
                                        <input type="hidden" class="report_code" value="52">
                                        <td class="seq">1</td>
                                        <td class="rv_title">사울레이터 : 창문을 통해 어렴풋이는 개뿔</td>
                                        <td class="user_email">taran0913@gmail.com</td>
                                        <td class="reporter_email">taran0913@naver.com</td>
                                        <td class="review_date">2022.01.02</td>
                                        <td class="report_date">2022.01.02</td>
                                        <td class="report_status">
                                            <select class="select_status">
                                                <option name="slc_status">1</option>
                                                <option name="slc_status">2</option>
                                                <option name="slc_status">3</option>
                                            </select>
                                        </td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_movePage btn btn-primary btn-circle btn-sm fa-solid fa-list"></button>
                                                <button class="btn_reason btn btn-primary btn-circle btn-sm fa-solid fa-bullhorn"></button>
                                                <button class="btn_trash btn btn-primary btn-circle btn-sm fa-solid fa-trash"></button>
                                                <button class="btn_user_info btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <input type="hidden" class="pd_code" value="50">
                                        <input type="hidden" class="user_code" value="51">
                                        <input type="hidden" class="review_code" value="52">
                                        <input type="hidden" class="report_code" value="52">
                                        <td class="seq">1</td>
                                        <td class="rv_title">사울레이터 : 창문을 통해 어렴풋이는 개뿔</td>
                                        <td class="user_email">taran0913@gmail.com</td>
                                        <td class="reporter_email">taran0913@naver.com</td>
                                        <td class="review_date">2022.01.02</td>
                                        <td class="report_date">2022.01.02</td>
                                        <td class="report_status">
                                            <select class="select_status">
                                                <option name="slc_status">1</option>
                                                <option name="slc_status">2</option>
                                                <option name="slc_status">3</option>
                                            </select>
                                        </td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_movePage btn btn-primary btn-circle btn-sm fa-solid fa-list"></button>
                                                <button class="btn_reason btn btn-primary btn-circle btn-sm fa-solid fa-bullhorn"></button>
                                                <button class="btn_trash btn btn-primary btn-circle btn-sm fa-solid fa-trash"></button>
                                                <button class="btn_user_info btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <input type="hidden" class="pd_code" value="50">
                                        <input type="hidden" class="user_code" value="51">
                                        <input type="hidden" class="review_code" value="52">
                                        <input type="hidden" class="report_code" value="52">
                                        <td class="seq">1</td>
                                        <td class="rv_title">사울레이터 : 창문을 통해 어렴풋이는 개뿔</td>
                                        <td class="user_email">taran0913@gmail.com</td>
                                        <td class="reporter_email">taran0913@naver.com</td>
                                        <td class="review_date">2022.01.02</td>
                                        <td class="report_date">2022.01.02</td>
                                        <td class="report_status">
                                            <select class="select_status">
                                                <option name="slc_status">1</option>
                                                <option name="slc_status">2</option>
                                                <option name="slc_status">3</option>
                                            </select>
                                        </td>
                                        <td class="btn_section">
                                            <div class="btn_wrap">
                                                <button class="btn_movePage btn btn-primary btn-circle btn-sm fa-solid fa-list"></button>
                                                <button class="btn_reason btn btn-primary btn-circle btn-sm fa-solid fa-bullhorn"></button>
                                                <button class="btn_trash btn btn-primary btn-circle btn-sm fa-solid fa-trash"></button>
                                                <button class="btn_user_info btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                            </div>
                                        </td>
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
                                    <span id="user_code"></span>
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

                <%--신 고 사 유 모 달--%>

                <div class="modal fade border-0 shadow-lg my-5" id="ReportDetail" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"x
                     style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">신 고 사 유</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body" style="max-height: 600px; overflow: scroll;">
                                <div class="form-group">
                                    <span>신고 번호 : </span>
                                    <span id="report_code"></span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">신고자 주소</div>
                                    <div class="report_email form-control form-control-user"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">닉네임</div>
                                    <input class="form-control form-control-user" id="report_nick">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">신고날짜</div>
                                    <div class="form-control form-control-user" id="report_date"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">신고사유</div>
                                    <div class="form-control form-control-user" id="report_reason"></div>
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

                <%--삭 제 확 인 모 달--%>

                <div class="modal fade" id="ChkDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteLavel">리뷰 삭제</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <form class="user modal-body">정말로 삭제하시길 원한다면 입력칸에 '리뷰를 삭제합니다'를 입력해주세요
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

<script src="/resources/admin/js/rv_reportPage.js"></script>


</body>

</html>