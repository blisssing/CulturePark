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
    <style><%@include file="/resources/common/css/fontawesome/all.min.css"%></style>

    <!-- Custom styles for this template-->
    <style><%@include file="/resources/common/css/sb-admin-2.min.css"%></style>
    <style><%@include file="/resources/common/vendor/fontawesome-free/css/all.min.css"%></style>

    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

    <%-- css --%>
    <!-- Custom styles for this page -->
    <style><%@include file="/resources/common/vendor/datatables/dataTables.bootstrap4.min.css"%></style>
    <style><%@include file="/resources/manager/css/pd_ex.css"%></style>



    <title>manager exhibition management</title>
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <style>


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
                                <h5 class="m-0 font-weight-bold text-primary">전시 관리</h5>
                            </div>

                            <div class="div2">
                                <div class="label_en">exhibition management</div>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>작품명</th>
                                        <th>운영기간</th>
                                        <th>상태</th>
                                        <th>기능</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${productList}" var="product" varStatus="varStatus">
                                        <fmt:formatDate var="formatstartDate" value="${product.pd_startDate}" pattern="yyyy-MM-dd"/>
                                        <fmt:formatDate var="formatendDate" value="${product.pd_closeDate}" pattern="yyyy-MM-dd"/>
                                    <tr>
                                        <input type="hidden" class="pt_seq" value="${product.pt_seq}"/>
                                        <input type="hidden" class="pd_seq" value="${product.pd_seq}"/>
                                        <input type="hidden" class="pd_genre1" value="${product.pd_genre1}"/>
                                        <input type="hidden" class="pd_request_code" value="${product.pd_seq}" name="pd_seq">
                                        <input type="hidden" class="pd_timeType" value="${product.pd_timeType}" name="pd_timeType"/>
                                        <input type="hidden" class="pd_maxTicket" value="${product.pd_maxTicket}" name="pd_maxTicket"/>
                                        <input type="hidden" class="pd_typeStr" value="${product.pd_typeStr}" name="pd_typeStr"/>
                                        <input type="hidden" class="pd_openTime" value="${product.pd_openTime}" name="pd_openTime"/>
                                        <input type="hidden" class="pd_closeTime" value="${product.pd_closeTime}" name="pd_closeTime"/>
                                        <input type="hidden" class="pd_closeDay" value="${product.pd_closeDay}" name="pd_closeDay"/>
                                        <input type="hidden" class="pd_request_manager" value="${product.pd_request_manager}" name="pd_request_manager"/>
                                        <input type="hidden" class="start_date" value="${formatstartDate}"/>
                                        <input type="hidden" class="end_date" value="${formatendDate}"/>
                                        <input type="hidden" class="pd_tag" value="${product.pd_tag}"/>
                                        <td class="tr_seq">${varStatus.count}</td>
                                        <td class="pd_title">${product.pd_title}</td>
                                        <td class="pd_period">${formatstartDate}~${formatendDate}</td>
                                        <td class="pd_status">
                                            <label class="switch">
                                                <c:choose>
                                                    <c:when test="${product.pd_status eq 'ACTIVE'}">
                                                        <input name="pd_status" type="checkbox" checked="checked">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input name="pd_status" type="checkbox">
                                                    </c:otherwise>
                                                </c:choose>
                                                <span class="slider round"></span>
                                            </label>
                                            <c:choose>
                                                <c:when test="${product.pd_status eq 'ACTIVE'}">
                                                    <p class="toggle_p">활성화</p>
                                                    <p class="toggle_p" style="display:none;">비활성</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="toggle_p" style="display: none">활성화</p>
                                                    <p class="toggle_p">비활성</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <button type="button" class="btn_adminInfo">담당자 정보</button>
                                            <button type="button" class="td_update_btn">수정</button>
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

<%--세부사항 모달 --%>
<div class="modal fade border-0 shadow-lg my-5" id="RequestingModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
    style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content ard-body p-0">
            <div class="modal-header">
                <h2 class="h4 text-gray-900 mb-4">수정 페이지</h2>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>

            <div class="user modal-body" style="max-height: 400px; overflow: scroll;">


            <%------------ 1. 유형 구분 -------------%>
                <div class="section_div">
                    <div class="section_label">유형 구분</div>
                </div>

                <div class="row_all">
                <%--기존 --%>
                <div class="row1">
                    <table class="table" id="table1">
                        <thead>
                            <tr>
                                <th class="center" colspan="2">기존</th>
                            </tr>
                        </thead>

                        <tbody>
                        <tr class="chk_row">
                            <td class="td_0"><input disabled="disabled" value="none" type="checkbox" name="pd_ticketType" class="chkbox pd_ticketType no_distinction" id="bf_type_none">구분없음
                            </td>
                            <td class="td_1"><input type="text" id="bf_none_price" class="price nonDistinc_price"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled="disabled"/>원</td>
                        </tr>


                        <tr class="chk_row">
                            <td class="td_0"><input disabled="disabled" value="adult"type="checkbox" name="pd_ticketType" class="chk_type chkbox pd_ticketType chk_adult" id="bf_type_adult">성인
                            </td>
                            <td class="td_1"><input type="text" id="bf_adult_price"class="price adult_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled="disabled"/>원</td>
                        </tr>

                        <tr class="chk_row">
                            <td class="td_0"><input disabled="disabled" value="teenager" type="checkbox" name="pd_ticketType" class="chk_type chkbox pd_ticketType chk_teenager"id="bf_type_teenager">청소년
                            </td>
                            <td class="td_1"><input type="text" id="bf_teenager_price" class="price teenager_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled="disabled"/>원</td>
                        </tr>

                        <tr class="chk_row">
                            <td class="td_0"><input disabled="disabled" value="child" type="checkbox" name="pd_ticketType"  class="chk_type chkbox pd_ticketType chk_children" id="bf_type_children">어린이</td>
                            <td class="td_1"><input type="text" id="bf_child_price" class="price children_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled="disabled"/>원</td>
                        </tr>
                        </tbody>

                    </table>
                </div>

                <%-- 요청 --%>
                <div class="row2">
                    <table class="table" id="table2">

                        <thead>
                            <tr>
                                <th class="center" colspan="2">요청</th>
                            </tr>
                        </thead>

                        <tbody>
                        <tr class="chk_row">
                            <td class="td_0"><input value="none" type="checkbox" name="af_pd_ticketType" class="chkbox pd_ticketType no_distinction" id="af_type_none">구분없음
                            </td>
                            <td class="td_1"><input disabled="disabled" type="text" id="af_none_price" class="price nonDistinc_price"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />원</td>
                        </tr>


                        <tr class="chk_row">
                            <td class="td_0"><input  value="adult"type="checkbox" name="af_pd_ticketType" class="af_chk_type chkbox af_pd_ticketType chk_adult" id="af_type_adult">성인
                            </td>
                            <td class="td_1"><input disabled="disabled" type="text" id="af_adult_price"class="price af_select_price adult_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />원</td>
                        </tr>

                        <tr class="chk_row">
                            <td class="td_0"><input value="teenager" type="checkbox" name="af_pd_ticketType" class="af_chk_type chkbox af_pd_ticketType chk_teenager"id="af_type_teenager">청소년
                            </td>
                            <td class="td_1"><input disabled="disabled" type="text" id="af_teenager_price" class="price af_select_price teenager_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>원</td>
                        </tr>

                        <tr class="chk_row">
                            <td class="td_0"><input  value="child" type="checkbox" name="af_pd_ticketType"  class="af_chk_type chkbox af_pd_ticketType chk_children" id="af_type_children">어린이</td>
                            <td class="td_1"><input disabled="disabled" type="text" id="af_child_price" class="price af_select_price children_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />원</td>
                        </tr>
                        </tbody>

                    </table>
                </div>
            </div>

                <%-------------- 2. 티켓 타입 ---------------%>
                <div class="section_div">
                    <div class="section_label">티켓 타입</div>
                </div>

                <div class="row_all">
                    <%--기존--%>
                    <div class="row1">
                        <table class="table" id="table3">

                            <thead>
                            <tr>
                                <th class="center" colspan="2">기존</th>
                            </tr>
                            </thead>

                            <tbody>

                            <tr>
                                <td colspan="2">타입선택</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <select class="pd_timeTypeSelect choice" name="chk_timeType" disabled="disabled">
                                        <option value="day" selected="selected">일별(day)</option>
                                        <option value="time">시간대별(time)</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td   colspan="2">하루 최대 판매량</td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" id="bf_day_max" class="tck day_max" disabled="disabled"></td>
                            </tr>

                            <tr>
                                <td colspan="2">스테이지 최대 판매량</td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" id="bf_stage_max" class="stage_max tck" disabled="disabled"></td>
                            </tr>

                            <tr>
                                <td colspan="2">오픈시간대</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <select name="bf_pd_openTime" id="bf_pd_openTime" class="tck_pd_openTime tck" disabled="disabled">
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
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">마감시간대</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <select name="bf_pd_closeTime" id="bf_pd_closeTime" class="tck_pd_closeTime tck" disabled="disabled">
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
                                </td>
                            </tr>

                            </tbody>

                        </table>
                    </div>

                    <%--요청--%>
                    <div class="row2">
                        <table class="table" id="table4">

                            <thead>
                            <tr>
                                <th class="center" colspan="2">요청</th>
                            </tr>
                            </thead>

                            <tbody>

                            <tr>
                                <td colspan="2">타입선택</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <select class="pd_timeTypeSelect choice" name="chk_timeType" id="af_pd_timeTypeSelect">
                                        <option value="none" selected="selected">선택</option>
                                        <option value="day">일별(day)</option>
                                        <option value="time">시간대별(time)</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">하루 최대 판매량 </td>
                            </tr>
                            <tr>
                                <td colspan="2"><input disabled="disabled" type="text" id="af_day_max" class="tck day_max tck_day inputText"/></td>
                            </tr>

                            <tr>
                                <td colspan="2">스테이지 최대 판매량</td>
                            </tr>
                            <tr>
                                <td colspan="2"><input disabled="disabled" type="text" id="af_stage_max" class="stage_max tck"/></td>
                            </tr>

                            <tr>
                                <td colspan="2">오픈시간대</td>
                            </tr>
                            <tr>
                                <td colspan="2"><select disabled="disabled" id="af_pd_openTime" class="tck_pd_openTime tck tck_time inputText">
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
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">마감시간대</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <select id="af_pd_closeTime" disabled="disabled" class="tck_pd_closeTime tck tck_time inputText" >
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
                                </td>
                            </tr>

                            </tbody>

                        </table>
                    </div>

                </div>

                <%-------------- 3. 기타 설정 ---------------%>
                <%--여기서부터 테이블 1개--%>
                                <%------------- 휴관요일 -------------%>
                                <%--테이블 1개--%>
                                    <div class="section_div_no_row">
                                        <div class="section_label">휴관 요일</div>

                                        <div class="row0">
                                        <table class="table" id="table6">
                                            <tr>
                                                <td colspan="2" class="chkbox_day">
                                                    <input type="checkbox" class="chkbox chkLabel" value="sun" name="day_chkbox">일

                                                    <input type="checkbox" class="chkbox chkLabel" value="mon"
                                                           name="day_chkbox">월
                                                    <input type="checkbox" class="chkbox chkLabel" value="tue"
                                                           name="day_chkbox">화
                                                    <input type="checkbox" class="chkbox chkLabel" value="wed"
                                                           name="day_chkbox">수
                                                    <input type="checkbox" class="chkbox chkLabel" value="thu"
                                                           name="day_chkbox">목
                                                    <input type="checkbox" class="chkbox chkLabel" value="fri"
                                                           name="day_chkbox">금
                                                    <input type="checkbox" class="chkbox chkLabel" value="sat"
                                                           name="day_chkbox">토
<%--                                                    <input type="checkbox" class="chkbox" id="sunday" name="chkbox">일--%>
<%--                                                    <input type="checkbox" class="chkbox chkLabel" id="monday" name="chkbox">월--%>
<%--                                                    <input type="checkbox" class="chkbox chkLabel" id="tuesday" name="chkbox">화--%>
<%--                                                    <input type="checkbox" class="chkbox chkLabel" id="wednesday" name="chkbox">수--%>
<%--                                                    <input type="checkbox" class="chkbox chkLabel" id="thursday" name="chkbox">목--%>
<%--                                                    <input type="checkbox" class="chkbox chkLabel" id="friday" name="chkbox">금--%>
<%--                                                    <input type="checkbox" class="chkbox chkLabel" id="saturday" name="chkbox">토--%>
                                                </td>
                                            </tr>
                                        </table>
                                        </div>

                                      </div>
                    </div>

                <div class="modal-footer">
                    <button href="#" class="btn_Disagree2 btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                X
                                            </span>
                        <span class="text cancel_btn">취소하기</span>
                    </button>

                    <button class="btn_Agree2 btn btn-success btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-check"></i>
                                            </span>
                        <span class="text update_btn">변경하기</span>
                    </button>
                </div>

        </div>
    </div>
</div> <%--/모달끝--%>


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


<%-- script --%>
<script src="/resources/manager/js/pd_ex_mu.js"></script>
<script src="/resources/common/js/toggleBtn.js"></script>



</body>

</html>