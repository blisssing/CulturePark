<%@ page import="java.util.List" %>
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

<%-- 권한체크 임시로 주석처리
<%
    String logStatus = (String) session.getAttribute("isLogOn");
    boolean resultCheck= false;

    if (logStatus.contains("/")) {
        String [] is_ary = logStatus.split("/");
        for (int i = 0; i < is_ary.length; i++) {
            String ad_is = is_ary[i];
            if (ad_is.equals("manager")||ad_is.equals("super")) {
                resultCheck = true;
                break;
            }
        }
    }
    if (resultCheck) {
%>
<script type="text/javascript">
    location.href="/culturePark/all/accessError.ado";
</script>
<%
    }
%>
--%>

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
                        <span class="btn_comp_info btn btn-primary btn-sm btn-circle fa-solid fa-building"></span>
                        <span>회사 정보</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_mg_info btn btn-primary btn-circle btn-sm fa-solid fa-user"></span>
                        <span>매니저 정보</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></span>
                        <span>매니저 삭제</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_delete_manager btn btn-primary btn-circle btn-sm fa-solid fa-cube"></span>
                        <span>담당 상품</span>
                    </div>

                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">매니저 목록</h6>
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
                                <tfoot>
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
                                </tfoot>
                                <tbody>
                                    <c:forEach var="managerVO" items="managerList" varStatus="managerStatus">
                                        <c:set var="count" value="${count+1}"/>
                                        <tr>
                                            <form name="frm">
                                            <input type="hidden" class="comp_num" value="${managerVO.comp_seq}">
                                            <input type="hidden" class="manager_num" value="${managerVO.mg_seq}">
                                            <td class="seq">${count}</td>
                                            <td class="comp">투진컴퍼니</td>
                                            <td class="name">${managerVO.mg_name}</td>
                                            <td class="email">${managerVO.mg_email}</td>
                                            <td class="phone">${managerVO.mg_tel}</td>
                                            <td class="right">${managerVO.mg_is}</td>
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
                                                    <button class="btn_comp_info btn btn-primary btn-sm btn-circle fa-solid fa-building"></button>
                                                    <button class="btn_mg_info btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
                                                    <button class="btn_delete_manager btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></button>
                                                    <button class="btn_pd_info btn btn-primary btn-circle btn-sm fa-solid fa-cube"></button>
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

                <%-- 회 사 정 보  모 달 --%>
                <div class="modal fade border-0 shadow-lg my-5" id="CompanyInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
                            style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">업 체 정 보</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body" style="max-height: 600px; overflow: scroll;">
                                <div class="form-group">
                                    <span>업체번호 : </span>
                                    <span id="CompanySeq">#12</span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">업체명</div>
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
                                    <div class="form-control form-control-user" id="ProductType"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">승인날짜</div>
                                    <div class="form-control form-control-user" id="AgreementDate"></div>
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
                                <button href="#" class="btn_modal_close btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                                    <span class="text">닫기</span>
                                </button>

                            </div>
                        </div>
                    </div>
                </div>

                <%-- 매 니 저 정 보 모 달  --%>
                <div class="modal fade  border-0 shadow-lg my-5" id="ManagerInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
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
                                    <span class="head_comp_name"></span>  #<span class="head_comp_num"></span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">루트매니저</div>
                                    <div type="text" class="form-control form-control-user" id="RootManagerName"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">이름</div>
                                    <div type="text" class="form-control form-control-user" id="ManagerName"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">이메일</div>
                                    <div type="email" class="form-control form-control-user" id="ManagerEmail"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">전화번호</div>
                                    <div type="phone" class="form-control form-control-user" id="ManagerPhone"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">권한</div>
                                    <div type="phone" class="form-control form-control-user" id="ManagerRight"></div>
                                </div>
                            </form>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 삭 제 모 달 -->
                <div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteLavel">파트너 삭제</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <form class="user modal-body">정말로 삭제하시길 원한다면 입력칸에 '파트너를 삭제합니다'를 입력해주세요
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
<script src="/resources/admin/js/mg_managerList.js"></script>



<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>



</body>

</html>