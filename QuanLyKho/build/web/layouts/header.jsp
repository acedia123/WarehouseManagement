<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header start -->
<header class="ttr-header">
    <div class="ttr-header-wrapper">
        <!--sidebar menu toggler start -->
        <div class="ttr-toggle-sidebar ttr-material-button">
            <i class="ttr-open-icon fa fa-close"></i>
            <i class="ttr-close-icon fa fa-bars"></i>
        </div>
        <!--sidebar menu toggler end -->
        <!--logo start -->
        <div class="ttr-logo-box">
            <div>
                <a href="./home.jsp" class="ttr-logo">
                    <span class="ttr-logo-mobile">QLK</span>
                    <span class="ttr-logo-desktop">Quản Lý Kho</span>

                    <!--                    <img class="ttr-logo-mobile" alt="" src="assets/images/logo-mobile.png" width="30" height="30">
                                        <img class="ttr-logo-desktop" alt="" src="assets/images/logo-white.png" width="160" height="27">-->
                </a>
            </div>
        </div>

        <div class="ttr-header-right ttr-with-seperator">
            <!-- header right menu start -->
            <ul class="ttr-header-navigation">
                <li>
                    <a href="#" class="ttr-material-button ttr-submenu-toggle">
                        <span >
                            Xin chào, Vinh
                            <!--${sessionScope.account.getTenNhanVien()!=""?sessionScope.account.getTenNhanVien():sessionScope.account.getMaNV()}-->
                        </span>
                    </a>
                    <div class="ttr-header-submenu">
                        <ul>
                            <li><a href="./user-profile.jsp">Hồ sơ cá nhân</a></li>
                            <li><a href="./home.jsp">Đăng xuất</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
            <!-- header right menu end -->
        </div>
    </div>
</header>
<!-- header end -->
