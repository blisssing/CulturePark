<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="kor">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <%-- https://hianna.tistory.com/456 --%>
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
    <style><%@ include file="/resources/admin/css/mg_partnerList.css"%></style>

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

                <div class="icon_descript">
                    <div class="descript_wrap">
                        <span class="btn_ad_info btn btn-primary btn-sm btn-circle fa-solid fa-user-tie"></span>
                        <span>승인자 정보</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_delete_partner btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></span>
                        <span>파트너 취소</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_search_manager btn btn-primary btn-circle btn-sm fa-solid fa-magnifying-glass"></span>
                        <span>매니저 목록 조회</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_createPd btn btn-primary btn-circle btn-sm fa-solid fa-store"></span>
                        <span>상품 목록</span>
                    </div>
                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">파트너 목록</h6>
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
                                    <th>전화번호</th>
                                    <th>승인일</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>seq</th>
                                    <th>회사</th>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>전화번호</th>
                                    <th>승인일</th>
                                    <th>기능</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${partnerList}" var="partnerVO" varStatus="status">
                                    <c:set value="${count+1}" var="count"/>
                                    <fmt:formatDate var="formatRegDate" value="${partnerVO.pt_agreeDate}" pattern="yyyy-MM-dd"/>
                                    <tr>
                                        <form name="frm">
                                            <input class="comp_num" type="hidden" value="${partnerVO.pt_seq}"/>
                                            <input class="ad_seq" type="hidden" value="${partnerVO.ad_seq}"/>
                                            <td class="seq">${count}</td>
                                            <td class="comp">${partnerVO.pt_comp_name}</td>
                                            <td class="name">${partnerVO.pt_ceo_name}</td>
                                            <td class="email">${partnerVO.pt_email}</td>
                                            <td class="phone">${partnerVO.pt_phone}</td>
                                            <td class="create_date">${formatRegDate}</td>
                                            <td class="btn_section">
                                                <div class="btn_wrap">
                                                    <button type="button" class="btn_ad_info btn btn-primary btn-sm btn-circle fa-solid fa-user-tie"></button>
                                                    <button type="button" class="btn_delete_partner btn btn-primary btn-circle btn-sm fa-solid fa-user-minus"></button>
                                                    <button class="btn_search_manager btn btn-primary btn-circle btn-sm fa-solid fa-magnifying-glass"></button>
                                                    <button class="btn_createPd btn btn-primary btn-circle btn-sm fa-solid fa-store"></button>
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

                <%-- 어 드 민 정 보  모 달 --%>
                <div class="modal fade  border-0 shadow-lg my-5" id="AdminInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">담 당 자 정 보</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body">

                                <div class="form-group">
                                    <div class="form-head">담당자ID</div>
                                    <div class="form-control form-control-user" id="AdminEmail"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">담당자 이름</div>
                                    <div class="form-control form-control-user" id="AdminName"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">전화번호</div>
                                    <div class="form-control form-control-user" id="AdminTel"></div>
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

                <%-- 매 니 저 생 성 모 달  --%>
                <div class="modal fade  o-hidden border-0 shadow-lg my-5" id="CreateModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content ">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">루트 매니저 생성</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>

                            </div>
                            <form class="modal-body">
                                <div class="form-group">
                                    <span class="head_comp_name"></span>  #<span class="head_comp_num"></span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="ManagerName"
                                           placeholder="매니저 이름">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="ManagerEmail">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="ManagerPhone"
                                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">


                                </div>

                            </form>
                            <div class="modal-footer">

                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                <button class="btn btn-primary btn-block btn_createDone">생성하기</button>
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
<script src="/resources/common/js/checkPW.js"></script>
<script src="/resources/admin/js/mg_partnerList.js"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>



</body>

</html>