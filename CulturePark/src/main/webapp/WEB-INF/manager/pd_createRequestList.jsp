<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="kor">

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


    <title>manager exhibition management</title>
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
                        <div class="div1">
                            <h5 class="m-0 font-weight-bold text-primary">생성</h5>
                        </div>

                        <div class="div2">
                            <div class="label_en">요청 내역</div>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>작품명</th>
                                    <th>요청 날짜</th>
                                    <th>상태</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>번호</th>
                                    <th>작품명</th>
                                    <th>요청 날짜</th>
                                    <th>상태</th>
                                    <th>기능</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${productRequestList}" var="item">
                                    <c:set var="count" value="${count+1}"></c:set>
                                    <fmt:formatDate var="formatRegDate" value="${item.pdr_requestDate}" pattern="yyyy-MM-dd"/>
                                    <fmt:formatDate var="formatstartDate" value="${item.pdr_startDate}" pattern="yyyy-MM-dd"/>
                                    <fmt:formatDate var="formatendDate" value="${item.pdr_closeDate}" pattern="yyyy-MM-dd"/>
                                    <tr>
                                        <input type="hidden" class="pdr_seq" value="${item.pdr_seq}"/>
                                        <input type="hidden" class="pdr_timeType" value="${item.pdr_timeType}"/>
                                        <input type="hidden" class="pdr_genre1" value="${item.pdr_genre1}"/>
                                        <input type="hidden" class="pdr_genre2" value="${item.pdr_genre2}"/>
                                        <input type="hidden" class="pdr_tag" value="${item.pdr_tag}"/>
                                        <input type="hidden" class="pdr_closeDay" value="${item.pdr_closeDay}"/>
                                        <input type="hidden" class="pdr_thumbnail_PATH" value="${item.pdr_thumbnail_PATH}"/>
                                        <input type="hidden" class="pdr_descript_PATH" value="${item.pdr_descript_PATH}"/>
                                        <input type="hidden" class="pdr_mainImg_PATH" value="${item.pdr_mainImg_PATH}"/>
                                        <input type="hidden" class="pdr_typeStr" value="${item.pdr_typeStr}"/>
                                        <input type="hidden" class="pdr_request_manager" value="${item.pdr_request_manager}"/>
                                        <input type="hidden" class="pdr_startDate" value="${formatstartDate}"/>
                                        <input type="hidden" class="pdr_closeDate" value="${formatendDate}"/>
                                        <input type="hidden" class="pdr_openTime" value="${item.pdr_openTime}"/>
                                        <input type="hidden" class="pdr_closeTime" value="${item.pdr_closeTime}"/>
                                        <input type="hidden" name="pd_maxTicket" class="pdr_maxTicket" value="${item.pdr_maxTicket}"/>
                                        <input type="hidden"  class="pdr_place" value="${item.pdr_place}"/>
                                        <input type="hidden"  class="pdr_minAge" value="${item.pdr_minAge}"/>
                                        <td class="td_seq">${count}</td>
                                        <td class="pdr_title">${item.pdr_title}</td>
                                        <td class="pdr_requestDate">${formatRegDate}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${item.pdr_status == 'REFUSE'}">
                                                    <a class="btn_refuseReason">거절</a> </td>
                                                </c:when>
                                                <c:otherwise>
                                                    승인
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="adminInfo_btn" onclick="adminInfo_popup()">
                                            <button type="button" class="btn_detail btn btn-primary btn-circle btn-sm fa-solid fa-file-contract"></button>
                                        </td>
                                    </tr>
                                </c:forEach>
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

<%--거절 사유 모달 --%>
<div class="modal fade border-0 shadow-lg my-5" id="RefuseReasonModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="display: none">
    <div class="modal-dialog">
        <div class="modal-content ard-body p-0">
            <div class="modal-header">
                <h1 class="h4 text-gray-900 mb-4">거절 사유</h1>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="user modal-body" style="max-height: 500px; overflow: scroll;">
                <div class="form-group">
                    <div class="form-head">담당자 이메일</div>
                    <div class="form-control form-control-user" id="AdminEmail"></div>
                </div>
                <div class="form-group">
                    <div class="form-head">담당자 전화번호</div>
                    <div class="form-control form-control-user" id="AdminTel"></div>
                </div>

                <hr>

                <div class="form-group">
                    <div class="form-head">거절사유 </div>
                    <textarea readonly="readonly" class="form-control form-control-user" id="RefuseReasonTextbox"></textarea>
                </div>

            </div>
            <div class="modal-footer">
                <button href="#" class="close_btn btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                    <span class="text">닫기</span>
                </button>

            </div>
        </div>
    </div>
</div>

<%--요청 정보 모달 --%>

<div class="modal fade border-0 shadow-lg my-5" id="RequestInfoModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"x
     style="display: none">
    <div class="modal-dialog">
        <div class="modal-content ard-body p-0">
            <div class="modal-header">
                <h1 class="h4 text-gray-900 mb-4">요 청 정 보</h1>
                <button class="close_btn" type="button" data-dismiss="modal" aria-label="Close">
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
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <div class="form-head">장소</div>
                            <div class="form-control form-control-user modal_content_div" id="pd_place" ></div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-head">연령</div>
                            <div class="form-control form-control-user modal_content_div" id="pd_minAge"></div>
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
                    <select class="pd_timeTypeSelect" name="chk_timeType" style="margin-bottom: 10px;" disabled="disabled">
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
                </form>
            </div>
            <div class="modal-footer">
                <button  class="close_btn btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                    <span class="text">닫기</span>
                </button>

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
<script src="/resources/manager/js/pd_createRequestList.js"></script>
</body>

</html>