<%@ page import="kg.twojin.culturePark.common.vo.AdminVO" %>
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
    <title>CulturePark 관리자</title>
</head>

<%--<%
    // 권한 체크 방식
    AdminVO admin = (AdminVO) session.getAttribute("admin");
    String adminIs= admin.getAd_is();
    boolean chkIs = false;
    if (adminIs.contains("/")) {
        for (String isStr : adminIs.split("/")) {
            if (isStr.equals("super") || isStr.equals("product")) {
                chkIs = true;
            }
        }
    }

    if (!chkIs) {
%>

<script>location.href="/accessError.ado"</script>

<%
    }
%>--%>


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
                        <span class="btn_Dicip_detail btn btn-primary btn-circle btn-sm fa-solid fa-file-contract"></span>
                        <span>요청 정보</span>
                    </div>
                    <div class="descript_wrap">
                        <span class="btn_Dicip_cancel btn btn-primary btn-circle btn-sm fa-solid fa-user"></span>
                        <span>매니저 정보</span>
                    </div>
                </div>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">요청 목록</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>seq</th>
                                    <th>업체명</th>
                                    <th>계정</th>
                                    <th>분야</th>
                                    <th>상품명</th>
                                    <th>요청날짜</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>seq</th>
                                    <th>회사명</th>
                                    <th>계정</th>
                                    <th>분야</th>
                                    <th>상품명</th>
                                    <th>요청날짜</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                    <th>기능</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="productVO" items="${productList}" varStatus="varStatus">
                                    <fmt:formatDate var="formatRegDate" value="${productVO.pd_requestDate}" pattern="yyyy-MM-dd"/>
                                    <fmt:formatDate var="formatstartDate" value="${productVO.pd_startDate}" pattern="yyyy-MM-dd"/>
                                    <fmt:formatDate var="formatendDate" value="${productVO.pd_closeDate}" pattern="yyyy-MM-dd"/>
                                    <c:set value="${count+1}" var="count"/>
                                    <tr>

                                            <input type="hidden" class="pd_request_code" value="${productVO.pd_seq}" name="pd_seq">
                                            <input type="hidden" class="pd_timeType" value="${productVO.pd_timeType}" name="pd_timeType"/>
                                            <input type="hidden" class="pd_maxTicket" value="${productVO.pd_maxTicket}" name="pd_maxTicket"/>
                                            <input type="hidden" class="pd_typeStr" value="${productVO.pd_typeStr}" name="pd_typeStr"/>
                                            <input type="hidden" class="pd_openTime" value="${productVO.pd_openTime}" name="pd_openTime"/>
                                            <input type="hidden" class="pd_closeTime" value="${productVO.pd_closeTime}" name="pd_closeTime"/>
                                            <input type="hidden" class="pd_closeDay" value="${productVO.pd_closeDay}" name="pd_closeDay"/>
                                            <input type="hidden" class="pt_seq" value="${productVO.pt_seq}" name="pt_seq"/>
                                            <input type="hidden" class="pd_request_manager" value="${productVO.pd_request_manager}" name="pd_request_manager"/>
                                            <input type="hidden" class="pd_class2" value="${productVO.pd_genre2}"/>
                                            <input type="hidden" class="start_date" value="${formatstartDate}"/>
                                            <input type="hidden" class="end_date" value="${formatendDate}"/>


                                            <td class="seq">${count}</td>
                                            <td class="comp_name">${partnerList[varStatus.index].pt_comp_name}</td>
                                            <td class="manager_email">${productVO.pd_request_manager}</td>
                                            <td class="pd_class">${productVO.pd_genre1}</td>
                                            <td class="pd_title">${productVO.pd_title}</td>
                                            <td class="request_date">${formatRegDate}</td>
                                            <td class="pd_period">${formatstartDate}~${formatendDate}</td>
                                            <td class="request_status">${productVO.pd_status}</td>
                                            <td class="btn_section">
                                                <div class="btn_wrap">
                                                    <button type="button" class="btn_detail btn btn-primary btn-circle btn-sm fa-solid fa-file-contract"></button>
                                                    <button type="button" class="btn_manager_info btn btn-primary btn-circle btn-sm fa-solid fa-user"></button>
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
                            <div class="user modal-body" style="max-height: 500px; overflow: scroll;">
                                <form>

                                <div class="form-group">
                                    <div>
                                        <span>요청번호 : </span>
                                        <span id="request_code"></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">업체명</div>
                                    <div class="form-control form-control-user modal_content_div" id="comp_name"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">상품명</div>
                                    <div class="form-control form-control-user modal_content_div" id="pd_title"></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div class="form-head">분야</div>
                                        <div class="form-control form-control-user modal_content_div"  id="pd_class_1" ></div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-head">장르</div>
                                        <div class="form-control form-control-user modal_content_div" id="pd_class_2"></div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div class="form-head">시작일</div>
                                        <div class="form-control form-control-user modal_content_div" id="start_date" ></div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-head">종료일</div>
                                        <div class="form-control form-control-user modal_content_div" id="end_date" ></div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><%--Todo : 추가적으로 만들어줄 것!!--%>
                                        <div class="form-head">장소</div>
                                        <div class="form-control form-control-user modal_content_div" id="pd_place" >장소</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-head">연령</div>
                                        <div class="form-control form-control-user modal_content_div" id="pd_minAge">15세 이상</div>
                                    </div>
                                </div>

                                    <hr>
                                    <div class="form-head">연령</div>
                                    <div class="form-group row none_row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <div class="form-control form-control-user" id="type_none">구분없음</div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-control form-control-user modal_content_div" id="none_price"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row adult_row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <div class="form-control form-control-user" id="type_adult">성인</div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-control form-control-user modal_content_div" id="adult_price"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row teenager_row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <div class="form-control form-control-user" id="type_teenager">청소년</div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-control form-control-user modal_content_div" id="teenager_price"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row child_row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <div class="form-control form-control-user" id="type_child">아동</div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-control form-control-user modal_content_div" id="child_price"></div>
                                        </div>
                                    </div>
                                    <hr>
                                    <select class="pd_timeTypeSelect" name="chk_timeType" style="margin-bottom: 10px;">
                                        <option value="day">일별(day)</option>
                                        <option value="time">시간별(time)</option>
                                    </select>

                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <div class="form-head">하루 최대 판매량</div>
                                            <div class="form-control form-control-user modal_content_div" id="pd_dayTicket"></div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-head">스테이지별 최대 판매량</div>
                                            <div class="form-control form-control-user modal_content_div" id="pd_StageTicket"></div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <div class="form-head">오픈시간</div>
                                            <select class="form-control form-control-user" id="pd_openTime" disabled="disabled">
                                                <option value="0">00:00</option>
                                                <option value="1">01:00</option>
                                                <option value="2">02:00</option>
                                                <option value="3">03:00</option>
                                                <option value="4">04:00</option>
                                                <option value="5">05:00</option>
                                                <option value="6">06:00</option>
                                                <option value="7">07:00</option>
                                                <option value="8">08:00</option>
                                                <option value="9">09:00</option>
                                                <option value="10">10:00</option>
                                                <option value="11">11:00</option>
                                                <option value="12">12:00</option>
                                                <option value="13">13:00</option>
                                                <option value="14">14:00</option>
                                                <option value="15">15:00</option>
                                                <option value="16">16:00</option>
                                                <option value="17">17:00</option>
                                                <option value="18">18:00</option>
                                                <option value="19">19:00</option>
                                                <option value="20">20:00</option>
                                                <option value="21">21:00</option>
                                                <option value="22">22:00</option>
                                                <option value="23">23:00</option>
                                            </select>

                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-head">마감시간</div>
                                            <select class="form-control form-control-user" id="pd_closeTime" disabled="disabled">
                                                <option value="0">00:00</option>
                                                <option value="1">01:00</option>
                                                <option value="2">02:00</option>
                                                <option value="3">03:00</option>
                                                <option value="4">04:00</option>
                                                <option value="5">05:00</option>
                                                <option value="6">06:00</option>
                                                <option value="7">07:00</option>
                                                <option value="8">08:00</option>
                                                <option value="9">09:00</option>
                                                <option value="10">10:00</option>
                                                <option value="11">11:00</option>
                                                <option value="12">12:00</option>
                                                <option value="13">13:00</option>
                                                <option value="14">14:00</option>
                                                <option value="15">15:00</option>
                                                <option value="16">16:00</option>
                                                <option value="17">17:00</option>
                                                <option value="18">18:00</option>
                                                <option value="19">19:00</option>
                                                <option value="20">20:00</option>
                                                <option value="21">21:00</option>
                                                <option value="22">22:00</option>
                                                <option value="23">23:00</option>
                                            </select>
                                        </div>
                                    </div>

                                    <hr>

                                    <div class="form-group">
                                        <div class="form-head">휴관 요일  </div>
                                        <div class="form-control form-control-user">
                                            <input type="checkbox" class="chk_closeDay" name="chk_son" value="son" disabled="disabled">일
                                            <input type="checkbox" class="chk_closeDay" name="chk_mon" value="mon" disabled="disabled">월
                                            <input type="checkbox" class="chk_closeDay" name="chk_tue" value="tue" disabled="disabled">화
                                            <input type="checkbox" class="chk_closeDay" name="chk_wen" value="wen" disabled="disabled">수
                                            <input type="checkbox" class="chk_closeDay" name="chk_thu" value="thu" disabled="disabled">목
                                            <input type="checkbox" class="chk_closeDay" name="chk_fri" value="fri" disabled="disabled">금
                                            <input type="checkbox" class="chk_closeDay" name="chk_sat" value="sat" disabled="disabled">토
                                        </div>
                                    </div>

                                    <hr>

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

                                </form>
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

                <%--거 절 사 유 모 달 --%>
                <div class="modal fade border-0 shadow-lg my-5" id="SendRefuseReasonModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"x
                     style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">거 절 사 유</h1>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body" style="max-height: 600px; overflow: scroll;">
                                <div class="form-group">
                                    <textarea class="form-control form-control-user" id="pcl_comments">

                                    </textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn_final_refuse btn btn-info btn-icon-split">
                                            <span class="icon text-white-50">
                                                V
                                            </span>
                                    <span class="text">최 종 거 절</span>
                                </button>
                                <button  type="button" class="btn_modal_close btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                                    <span class="text">닫기</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <%--매 니 저 정 보 모 달 --%>
                <div class="modal fade border-0 shadow-lg my-5" id="ManagerInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"x
                     style="display: none">
                    <div class="modal-dialog">
                        <div class="modal-content ard-body p-0">
                            <div class="modal-header">
                                <h1 class="h4 text-gray-900 mb-4">매 니 저 정 보</h1>
                                <button class="btn_modal_close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="user modal-body" style="max-height: 600px; overflow: scroll;">
                                <div class="form-group">
                                    <div>
                                        <span>매니저코드 </span>
                                        <span id="manager_code"></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <div class="form-head">업체명</div>
                                    <div class="form-control form-control-user" id="comp_name_02"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">계정</div>
                                    <div class="form-control form-control-user" id="root_email"></div>
                                </div>
                                <div class="form-group">
                                    <div class="form-head">전화번호</div>
                                    <div class="form-control form-control-user" id="root_tel"></div>
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
<script src="/resources/admin/js/pd_createRequest.js"></script>
</body>
</html>