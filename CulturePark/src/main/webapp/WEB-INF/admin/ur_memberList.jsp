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
        .btn_report {
            border: none;
            background-color: white;
        }
        th {
            white-space: nowrap;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 20px;
            vertical-align:middle;
        }

        /* Hide default HTML checkbox */
        .switch input {display:none;}

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }


        .slider:before {
            position: absolute;
            content: "";
            height: 13px;
            width: 13px;
            left: 2px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }


        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }

        p {
            margin:0px;
            display:inline-block;
            font-size:0.8rem;
            font-weight:bold;
        }
    </style>



    <title>CulturePark 관리자</title>

    <%--<link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">--%>

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
                <h1 class="h3 mb-2 text-gray-800">유저 관리</h1>

                <div class="icon_descript">
                    <div class="descript_wrap">
                        <span class="btn_mg_info btn btn-primary btn-circle btn-sm fa-solid fa-user-gear"></span>
                        <span>정보 수정</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-key"></span>
                        <span>임시비밀번호 발급</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_delete_manager btn btn-primary btn-circle btn-sm fa-solid fa-list"></span>
                        <span>결제 정보</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_delete_manager btn btn-primary btn-circle btn-sm fa-solid fa-user-xmark"></span>
                        <span>유저 징계</span>
                    </div>

                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>seq</th>
                                    <th>이메일</th>
                                    <th>별명</th>
                                    <th>이름</th>
                                    <th>휴대전화</th>
                                    <th>가입날짜</th>
                                    <th>신고</th>
                                    <th>상태</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>seq</th>
                                    <th>이메일</th>
                                    <th>별명</th>
                                    <th>이름</th>
                                    <th>휴대전화</th>
                                    <th>가입날짜</th>
                                    <th>신고</th>
                                    <th>상태</th>
                                    <th>기능</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="userVO" items="${memberVOList}">
                                    <c:set var="count" value="${count + 1}"/>
                                    <fmt:formatDate var="formatRegDate" value="${userVO.mb_createDate}" pattern="yyyy-MM-dd"/>
                                    <tr>
                                        <form name="frm">
                                            <input type="hidden" class="user_num" value="${userVO.mb_seq}">
                                            <td class="seq">${count}</td>
                                            <td class="email">${userVO.mb_email}</td>
                                            <td class="nick">${userVO.mb_nick}</td>
                                            <td class="name">${userVO.mb_name}</td>
                                            <td class="phone">${userVO.mb_tel}</td>
                                            <td class="joinDate">${formatRegDate}</td>
                                            <td class="report"><button class="btn_report">0</button></td>
                                            <td class="status">
                                                <label class="switch">
                                                    <c:choose>
                                                        <c:when test="${userVO.mb_status=='ACTIVE'}">
                                                            <input type="checkbox" checked="checked" value="active" name="btn_active">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="checkbox" value="inactive" name="btn_active">
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <span class="slider round"></span>
                                                </label>
                                                <c:choose>
                                                    <c:when test="${userVO.mb_status=='ACTIVE'}">
                                                        <p class="toggle_p">활성화</p>
                                                        <p class="toggle_p" style="display:none;">비활성</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="toggle_p" style="display: none">활성화</p>
                                                        <p class="toggle_p">비활성</p>
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                            <td class="btn_section">
                                                <div class="btn_wrap">
                                                    <button class="btn_modi_info btn btn-primary btn-circle btn-sm fa-solid fa-user-gear"></button>
                                                    <button class="btn_temp_key btn btn-primary btn-circle btn-sm fa-solid fa-key"></button>
                                                    <button class="btn_buy_list btn btn-primary btn-circle btn-sm fa-solid fa-list"></button>
                                                    <button class="btn_dicip btn btn-primary btn-circle btn-sm fa-solid fa-user-xmark"></button>
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

                <%-- 유 저 정 보  모 달 --%>
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
                                    <span>유저번호번호 : </span>
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

                <!-- 임 시 키 모 달 -->
                <div class="modal fade" id="TempKeyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">임시 비밀번호 발급</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body">
                                유저에게 임시 비밀번호를 지급할 것입니까?
                            </div>

                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <button class="btn_finalTempKey btn btn-primary" >발급하기</button>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- 징 계 모 달 --%>
                <div class="modal fade" id="DicipModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">유 저 징 계</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body">
                                <div class="form-group">
                                    <span>유저 Email : </span>
                                    <span class="userEmail"></span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <span class="form-head">징계사유</span>
                                    <span>
                                            <select class="select_dicip">
                                                <option name="slc_dicip" value="case1" >사유1</option>
                                                <option name="slc_dicip" value="case2">사유2</option>
                                                <option name="slc_dicip" value="direct" selected="selected">직접입력</option>
                                            </select>
                                        </span>
                                    <input class="form-control form-control-user" id="DicipReason" style="margin-top: 10px;">
                                </div>
                                <div class="form-group">
                                    <div class="form-head">징계수위</div>
                                    <select id="SelectLevel" class="form-control form-control-user">
                                        <option name="slc_level" value="one">1일 정지</option>
                                        <option name="slc_level" value="three">3일 정지</option>
                                        <option name="slc_level" value="sept">7일 정지</option>
                                        <option name="slc_level" value="thirty">30일 정지</option>
                                        <option name="slc_level" value="inf">영구 정지</option>
                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <button class="btn_finalDicip btn btn-primary" >결정하기</button>
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
<script src="/resources/common/js/toggleBtn.js"></script>
<script src="/resources/admin/js/ur_memberList.js"></script>




<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>



</body>

</html>