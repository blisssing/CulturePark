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
                <h1 class="h3 mb-2 text-gray-800">상품 관리</h1>
                <div class="icon_descript">
                    <div class="descript_wrap">
                        <span class="btn_Dicip_detail btn btn-primary btn-circle btn-sm fa-solid fa-cube"></span>
                        <span> 상품 정보 </span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Dicip_cancel btn btn-primary btn-circle btn-sm fa-solid fa-link"></span>
                        <span> 상품 페이지 이동 </span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Dicip_cancel btn btn-primary btn-circle btn-sm fa-solid fa-gift"></span>
                        <span> 프로모션 등록 </span>
                    </div>

                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">상품 목록</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>seq</th>
                                    <th>회사명</th>
                                    <th>상품명</th>
                                    <th>분야</th>
                                    <th>기간</th>
                                    <th>활성/비활성</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>seq</th>
                                    <th>회사명</th>
                                    <th>상품명</th>
                                    <th>분야</th>
                                    <th>기간</th>
                                    <th>활성/비활성</th>
                                    <th>기능</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="map" items="${mapList}" varStatus="status">
                                    <tr>
                                        <input type="hidden" class="pd_seq" value="${map.get("pd_seq")}">
                                        <input type="hidden" class="pt_seq" value="${map.get("pt_seq")}">
                                        <fmt:formatDate var="formatStartDate" value="${map.get('pd_startdate')}" pattern="yyyy-MM-dd"/>
                                        <fmt:formatDate var="formatCloseDate" value="${map.get('pd_closedate')}" pattern="yyyy-MM-dd"/>

                                        <td class="seq">${status.count}</td>
                                        <td class="comp_name">${map.get("pt_comp_name")}</td>
                                        <td class="pd_title">${map.get("pd_title")}</td>
                                        <td class="pd_genre1">${map.get("pd_genre1")}</td>
                                        <td class="pd_period">${formatStartDate}~${formatCloseDate}</td>
                                        <td class="pd_status">
                                            <label class="switch">
                                                <c:choose>
                                                    <c:when test="${map.get('pd_status') eq 'ACTIVE'}">
                                                        <input name="pd_status" type="checkbox" checked="checked">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input name="pd_status" type="checkbox">
                                                    </c:otherwise>
                                                </c:choose>
                                                <span class="slider round"></span>
                                            </label>
                                            <c:choose>
                                                <c:when test="${map.get('pd_status') eq 'ACTIVE'}">
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
                                                <button class="btn_pd_detail btn btn-primary btn-circle btn-sm fa-solid fa-cube"></button>
                                                <button class="btn_pd_link btn btn-primary btn-circle btn-sm fa-solid fa-link"></button>
                                                <button class="btn_comp_info btn btn-primary btn-circle btn-sm fa-solid fa-gift"></button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <%--요 청 정 보 모 달 --%>
                <div class="modal fade border-0 shadow-lg my-5" id="RequestInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"x
                     style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">요 청 정 보</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body" style="max-height: 600px; overflow: scroll;">
                                <div class="form-group">
                                    <div>
                                        <span>요청번호 : </span>
                                        <span id="request_code"></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">업체명</div>
                                    <div class="form-control form-control-user" id="comp_name"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">상품명</div>
                                    <div class="form-control form-control-user" id="pd_title"></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div class="form-head">분야</div>
                                        <div class="form-control form-control-user" id="pd_class_1" >전시</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-head">장르</div>
                                        <div class="form-control form-control-user" id="pd_class_2">퓨전</div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div class="form-head">시작일</div>
                                        <div class="form-control form-control-user" id="start_date" >2022.03.03</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-head">2차 분야</div>
                                        <div class="form-control form-control-user" id="end_date" >2022.06.02</div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div class="form-head">장소</div>
                                        <div class="form-control form-control-user" id="pd_place" >장소</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-head">연령</div>
                                        <div class="form-control form-control-user" id="pd_minAge">15세 이상</div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div class="form-head">썸네일</div>
                                        <a class="form-control form-control-user" id="pd_img1" >상품이미지1</a>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-head">메인 이미지</div>
                                        <a class="form-control form-control-user" id="pd_img2">상품이미지2</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">설명 파일 </div>
                                    <div class="form-control form-control-user" id="pd_description">설명 파일 첨부</div>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <button  class="btn_modal_agree btn btn-info btn-icon-split">
                                            <span class="icon text-white-50">

                                            </span>
                                    <span class="text">요청수락</span>
                                </button>
                                <button  class="btn_modal_disagree btn btn-warning btn-icon-split">
                                            <span class="icon text-white-50">

                                            </span>
                                    <span class="text">요청거절</span>
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
<script src="/resources/admin/js/pd_pdList.js"></script>
<script src="/resources/common/js/toggleBtn.js"></script>



</body>

</html>