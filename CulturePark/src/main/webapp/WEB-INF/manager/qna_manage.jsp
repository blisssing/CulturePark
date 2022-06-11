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


    <%-- css --%>
    <!-- Custom styles for this page -->
    <style><%@include file="/resources/common/vendor/datatables/dataTables.bootstrap4.min.css"%></style>
    <style><%@include file="/resources/manager/css/qna_manage.css"%></style>
    <style><%@include file="/resources/common/css/common_togglebtn.css"%></style>
    <style><%@include file="/resources/common/css/common_tableStyle.css"%></style>


    <title>qna manage</title>
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

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
                        <h6 class="m-0 font-weight-bold text-primary">QnA 관리</h6>
                        <hr>

                        <div class="div_top">

                            <div class="div_row">
                            <%--조회기간--%>
                            <div class="check_period_div_row1">
                                <span class="label">조회기간</span>
                            </div>

                            <div class="check_period_div_row2">
                                <div class="div_col_row1">
                                    <input type="button" class="btn_check" id="btn_today" value="당일">
                                    <input type="button" class="btn_check" id="btn_a_week" value="1주일">
                                    <input type="button" class="btn_check" id="btn_two_weeks" value="2주일">
                                    <input type="button" class="btn_check" id="btn_three_weeks" value="3주일">
                                </div>
                                <div class="div_col_row2">
                                    <input type="text" class="date_select" id="date_start" value="">
                                    <span class="wave">~</span>
                                    <input type="text" class="date_select" id="date_end" value="">
                                    <button class="fa-solid fa-magnifying-glass btn_period btn_btn btn"></button>
                                </div>
                            </div>
                            </div>

                            <p class="sectionLine_thin"></p>

                            <div class="div_row center_row">
                            <%--검색선택--%>
                            <div class="search_choice_div_row1">
                                <span class="label">검색 선택</span>
                            </div>
                            <div class="search_choice_div_row2">
                                <div class="div_col_row1">
                                    <select class="search_select" id="search_select">
                                        <option value="">선택</option>
                                        <option value="writer">글쓴이</option>
                                        <option value="title">제목</option>
                                    </select>
                                    <input type="text" class="search_text">
                                    <button class="fa-solid fa-magnifying-glass btn_search btn_btn btn"></button>
                                </div>
                            </div>
                            </div>

                        </div> <%--/div_top--%>

                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>seq</th>
                                    <th>장르</th>
                                    <th>제목</th>
                                    <th>글쓴이</th>
                                    <th>날짜</th>
                                    <th>기능</th>
                                    <th>활성화</th>
                                </tr>
                                </thead>
                                <tbody>
                                <form name="frm">

                                    <tr>
                                        <input type="hidden" class="comp_num" value="100">
                                        <input type="hidden" class="manager_num" value="100">
                                        <td class="seq">1</td>
                                        <td class="genre">전시</td>
                                        <td class="qna_title">티켓문의요~</td>
                                        <td class="qna_name">한진희</td>
                                        <td class="qna_date">2022.06.11</td>
                                        <td class="btn_section">
                                            <input type="button" class="re_btn" value="답변달기">
                                            <i class="fa-solid fa-trash-can del_btn" ></i>
                                        </td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <input type="hidden" class="comp_num" value="100">
                                        <input type="hidden" class="manager_num" value="100">
                                        <td class="seq">2</td>
                                        <td class="genre">전시</td>
                                        <td class="qna_title">전시문의합니다~</td>
                                        <td class="qna_name">김진아</td>
                                        <td class="qna_date">2022.05.11</td>
                                        <td class="btn_section">
                                            <input type="button" class="re_btn" value="답변달기">
                                            <i class="fa-solid fa-trash-can del_btn" ></i>
                                        </td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <input type="hidden" class="comp_num" value="100">
                                        <input type="hidden" class="manager_num" value="100">
                                        <td colspan="3" class="qna_title">
                                            <span class="re_label">답변</span>
                                            <span>전시문의합니다~</span>
                                        </td>
                                        <td class="qna_name">manager</td>
                                        <td class="qna_date">2022.05.11</td>
                                        <td class="btn_section">
                                            <input type="button" class="upd_btn" value="수정">
                                            <i class="fa-solid fa-trash-can del_btn" ></i>
                                        </td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <input type="hidden" class="comp_num" value="100">
                                        <input type="hidden" class="manager_num" value="100">
                                        <td class="seq">3</td>
                                        <td class="genre">뮤지엄</td>
                                        <td class="qna_title">환불합니다~</td>
                                        <td class="qna_name">홍민지</td>
                                        <td class="qna_date">2022.04.11</td>
                                        <td class="btn_section">
                                            <input type="button" class="re_btn" value="답변달기">
                                            <i class="fa-solid fa-trash-can del_btn" ></i>
                                        </td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <input type="hidden" class="comp_num" value="100">
                                        <input type="hidden" class="manager_num" value="100">
                                        <td class="seq">4</td>
                                        <td class="genre">뮤지엄</td>
                                        <td class="qna_title">결제내역문의합니다!!!</td>
                                        <td class="qna_name">한규진</td>
                                        <td class="qna_date">2022.03.11</td>
                                        <td class="btn_section">
                                            <input type="button" class="re_btn" value="답변달기">
                                            <i class="fa-solid fa-trash-can del_btn" ></i>
                                        </td>
                                        <td class="status">
                                            <label class="switch">
                                                <input type="checkbox" checked="checked">
                                                <span class="slider round"></span>
                                            </label>
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


<%-- datepicker --%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

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
<script src="/resources/manager/js/qna_manage.js"></script>

</body>

</html>