<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Left sidebar menu start -->
<div class="ttr-sidebar">
    <div class="ttr-sidebar-wrapper content-scroll">
        <!-- sidebar menu start -->
        <nav class="ttr-sidebar-navi">
            <ul>
                <li>
                    <a href="./home.jsp" class="ttr-material-button ${pageContext.request.requestURI == "/QuanLyKho/home.jsp" ? "link--active":""}">
                        <span class="ttr-icon"><i class="fa fa-home"></i></span>
                        <span class="ttr-label">Dashborad</span>
                    </a>
                </li>
                <li>
                    <a href="./ds-kho" class="ttr-material-button ${pageContext.request.requestURI == "/QuanLyKho/dsKho.jsp" ? "link--active":""}">
                        <span class="ttr-icon"><i class="fa fa-list"></i></span>
                        <span class="ttr-label">Quản lý kho</span>
                    </a>
                </li>
                <li>
                    <a href="./ds-ke" class="ttr-material-button ${pageContext.request.requestURI == "/QuanLyKho/dsKe.jsp" ? "link--active":""}">
                        <span class="ttr-icon"><i class="fa fa-list"></i></span>
                        <span class="ttr-label">Quản lý kệ</span>

                    </a>
                </li>
                <li>
                    <a href="./dsSanPham.jsp" class="ttr-material-button ${pageContext.request.requestURI == "/QuanLyKho/dsSanPham.jsp" ? "link--active":""}">
                        <span class="ttr-icon"><i class="fa fa-product-hunt"></i></span>
                        <span class="ttr-label">Quản lý sản phẩm</span>
                    </a>
                </li>
                <li>
                    <a href="review.html" class="ttr-material-button">
                        <span class="ttr-icon"><i class="fa fa-credit-card"></i></span>
                        <span class="ttr-label">Tạo phiếu</span>
                        <span class="ttr-arrow-icon"><i class="fa fa-angle-down"></i></span>
                    </a>
                    <ul>
                        <li>
                            <a href="mailbox.html" class="ttr-material-button"><span class="ttr-label">Phiếu nhập kho</span></a>
                        </li>
                        <li>
                            <a href="mailbox-compose.html" class="ttr-material-button"><span class="ttr-label">Phiếu xuất kho</span></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="ttr-material-button">
                        <span class="ttr-icon"><i class="fa fa-user"></i></span>
                        <span class="ttr-label">Quản lý tài khoản</span>
                    </a>
                </li>
                <li class="ttr-seperate"></li>
            </ul>
            <!-- sidebar menu end -->
        </nav>
        <!-- sidebar menu end -->
    </div>
</div>
<!-- Left sidebar menu end -->
