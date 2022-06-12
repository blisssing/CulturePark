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

  <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

  <%-- css --%>
  <!-- Custom styles for this page -->
  <style><%@include file="/resources/common/vendor/datatables/dataTables.bootstrap4.min.css"%></style>
  <style><%@include file="/resources/manager/css/pd_create.css"%></style>



  <title>manager new Request</title>
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
              <h5 class="m-0 font-weight-bold text-primary">신규 요청</h5>
            </div>

            <div class="div2">
              <div class="label_en">create Product</div>
            </div>
          </div>

          <div class="card-body">

                      <div class="section_div">
                        <div class="section_label">작품 정보</div>
                      </div>

                  <div class="section_div_top">

                    <div class="top_section">
                      <div class="genre_section">
                        <div class="genre_label_section">장르</div>

                        <div class="div_row">
                          <div class="genre_label">1차 선택</div>
                            <select class="genre_select">
                              <option>선택</option>
                              <option value="genre_exhibition">전시</option>
                              <option value="genre_museum">뮤지엄</option>
                            </select>
                        </div>

                        <div class="div_row">
                          <div class="genre_label">2차 선택</div>
                            <select class="genre_select">
                              <option>선택</option>
                              <option value="ex_photo">사진</option>
                              <option value="ex_painting">그림</option>
                              <option value="ex_installation">설치</option>
                              <option value="ex_experience">체험</option>
                            </select>
                       </div>
                      </div>

                      <div class="pd_name_section">
                        <div class="pd_name_label">작품명</div>
                        <input type="text" class="pd_name_text">
                      </div>
                    </div>

                      <div class="section_div">
                        <div class="section_label">유형 구분</div>
                      </div>

                    <div class="row_all">

                      <%-- 요청 --%>
                      <div class="row2">
                        <table class="table" id="table2">


                          <tbody>
                          <tr>
                            <td class="td_0"><input type="checkbox" class="chkbox no_distinction" name="chk">구분없음</td>
                            <td class="td_1"><input type="text" class="price">원</td>
                          </tr>


                          <tr>
                            <td class="td_0"><input type="checkbox" class="chkbox chk_adult" name="chk">성인</td>
                            <td class="td_1"><input type="text" class="price">원</td>
                          </tr>

                          <tr>
                            <td class="td_0"><input type="checkbox" class="chkbox chk_teenager" name="chk">청소년</td>
                            <td class="td_1"><input type="text" class="price">원</td>
                          </tr>

                          <tr>
                            <td class="td_0"><input type="checkbox" class="chkbox chk_children" name="chk">어린이</td>
                            <td class="td_1"><input type="text" class="price">원</td>
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

                      <%--요청--%>
                      <div class="row2">
                        <table class="table" id="table4">

                          <tbody>

                          <tr>
                            <td colspan="2">타입선택</td>
                          </tr>

                          <tr>
                            <td colspan="2">
                              <select class="choice" id="choice2" name="choice">
                                <option value="">선택</option>
                                <option value="day" id="request_day" name="choice">일별(day)</option>
                                <option value="time" id="request_time" name="choice">시간대별(time)</option>
                              </select>
                            </td>
                          </tr>

                          <tr>
                            <td colspan="2">티켓 max</td>
                          </tr>
                          <tr>
                            <td colspan="2"><input type="text" class="tck tck_day inputText" disabled="disabled"></td>
                          </tr>

                          <tr>
                            <td colspan="2">오픈시간대</td>
                          </tr>
                          <tr>
                            <td colspan="2"><input type="text" class="tck tck_time inputText" disabled="disabled"></td>
                          </tr>

                          <tr>
                            <td colspan="2">마감시간대</td>
                          </tr>
                          <tr>
                            <td colspan="2"><input type="text" class="tck tck_time inputText" disabled="disabled"></td>
                          </tr>

                          </tbody>

                        </table>
                      </div>

                    </div>

                    <%-------------- 3. 기타 설정 ---------------%>
                    <%--여기서부터 테이블 1개--%>

                    <div class="section_div_no_row">
                      <div class="section_label">기타 설정</div>

                      <div class="row0">
                        <table class="table" id="table5">

                          <tr class="list1">
                            <td class="label">썸네일</td>
                            <td class="file_padding"><input type="file"></td>
                          </tr>

                          <tr class="list2">
                            <td class="label">설명파일</td>
                            <td class="file_padding"><input type="file"></td>
                          </tr>

                          <tr class="list3">
                            <td colspan="2" class="label">태그</td>
                          </tr>
                          <tr>
                            <td colspan="2" class="tag">#태그1 #태그2 #태그3</td>
                          </tr>
                        </table>
                      </div>
                    </div>


                    <%------------- 휴관요일 -------------%>
                    <%--테이블 1개--%>
                    <div class="section_div_no_row">
                      <div class="section_label">휴관 요일</div>

                      <div class="row0">
                        <table class="table" id="table6">
                          <tr>
                            <td colspan="2" class="chkbox_day">
                              <input type="checkbox" class="chkbox" id="sunday" name="chkbox">일
                              <input type="checkbox" class="chkbox chkLabel" id="monday" name="chkbox">월
                              <input type="checkbox" class="chkbox chkLabel" id="tuesday" name="chkbox">화
                              <input type="checkbox" class="chkbox chkLabel" id="wednesday" name="chkbox">수
                              <input type="checkbox" class="chkbox chkLabel" id="thursday" name="chkbox">목
                              <input type="checkbox" class="chkbox chkLabel" id="friday" name="chkbox">금
                              <input type="checkbox" class="chkbox chkLabel" id="saturday" name="chkbox">토
                            </td>
                          </tr>
                        </table>
                      </div>

                    </div>


                    <div class="btn_section">
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
                      <span class="text regist_btn">등록하기</span>
                    </button>
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



</body>

</html>
