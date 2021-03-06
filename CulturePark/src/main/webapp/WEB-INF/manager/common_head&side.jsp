<%@ page pageEncoding="UTF-8" %>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">CulturePark</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        판매자 관리
    </div>


    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link" href="charts.html">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>수익률</span></a>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-folder"></i>
            <span>작품 관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar" style="">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">관리 목록</h6>
                <a class="collapse-item" href="/productList.mdo?class=exhibition">전시</a>
                <a class="collapse-item" href="/productList.mdo?class=museum">뮤지엄</a>
                <h6 class="collapse-header">생성</h6>
                <a class="collapse-item" href="pdCreate.mdo">신규 요청</a>
                <a class="collapse-item" href="pdCreateRequestList.mdo">요청 내역</a>

            </div>
        </div>
    </li>


    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="qnaManage.mdo">
            <i class="fa-solid fa-clipboard-question"></i>
            <span>QnA 관리</span>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+</span>
        </a>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages" aria-controls="collapseTwo">
            <i class="fa-solid fa-user-group"></i>
            <span>매니저 계정관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar" style="">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">관리 목록</h6>
                <a class="collapse-item" href="mAccountList.mdo">계정 목록</a>
                <h6 class="collapse-header">생성</h6>
                <a class="collapse-item create_account_manager" href="mAccountAdd.mdo">계정 생성</a>

            </div>
        </div>
    </li>


    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->

