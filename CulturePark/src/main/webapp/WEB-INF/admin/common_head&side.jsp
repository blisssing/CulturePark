<%@ page pageEncoding="UTF-8" %>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/index.ado">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">CulturePark </div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item">
        <a class="nav-link" href="index.html">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>대시보드</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        계정 관리
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>유저관리</span>
        </a>

        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">유저관리</h6>
                <a class="collapse-item" href="../common/buttons.html">회원조회</a>
                <a class="collapse-item" href="../common/buttons.html">고객문의</a>
                <a class="collapse-item" href="../common/buttons.html">블랙리스트</a>
<%--                <a class="collapse-item" href="cards.html">Cards</a>--%>
            </div>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>Manager 관리</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Manager 관리</h6>
                <a class="collapse-item" href="../common/buttons.html">파트너요청관리</a>
                <a class="collapse-item" href="../common/buttons.html">파트너 목록</a>
                <a class="collapse-item" href="../common/buttons.html">생성대기</a>
                <%--                <a class="collapse-item" href="cards.html">Cards</a>--%>
            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-wrench"></i>
            <span>Admin 관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Admin 관리</h6>
                <a class="collapse-item" href="/adminList.ado">계정관리</a>
                <a class="collapse-item" href="/createAd.ado">계정생성</a>
                <a class="collapse-item" href="utilities-animation.html">권한관리</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        상품관리
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item active">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false"
           aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>상품관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">상품관리</h6>
                <a class="collapse-item" href="login.html">요청리스트</a>
                <a class="collapse-item" href="register.html">생성대기리스트</a>
                <a class="collapse-item" href="forgot-password.html">진행 중 리스트</a>

                <div class="collapse-divider"></div>
                <h6 class="collapse-header">프로모션 관리</h6>
                <a class="collapse-item" href="forgot-password.html">등록</a>
                <a class="collapse-item" href="forgot-password.html">수정</a>
                <a class="collapse-item" href="forgot-password.html">대기목록</a>
                <a class="collapse-item" href="forgot-password.html">요청관리</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link" href="charts.html">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
    </li>

    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="../common/tables.html">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->

