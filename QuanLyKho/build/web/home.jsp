<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="format-detection" content="telephone=no">
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
        <title>Danh sách kệ hàng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="assets/vendors/calendar/fullcalendar.css">
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
        <link rel="stylesheet" type="text/css" href="assets/css/pages/chiTietKe.css">
        <link rel="stylesheet" type="text/css" href="assets/css/custom.css">
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <%@ include file="layouts/header.jsp" %>
        <%@ include file="layouts/sidebar.jsp" %>
        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">Dashboard</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="./home.jsp"><i class="fa fa-home"></i>Trang chủ</a></li>
                        <li>Dashboard</li>
                    </ul>
                </div>	
                <div class="row">
                    <div class="col-md-6 col-lg-4 col-xl-8 col-sm-6 col-12">
                        <div class="mb-3 d-flex align-items-center justify-content-between">
                            <!--<a href="./addOrEditStore.jsp" class="btn btn-primary">Thêm kệ hàng mới</a>-->
                            <form class="form-inline">
                                <input class="form-control" value="${param.search}" name="search" type="search" placeholder="Tìm kiếm theo tên">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </form>
                        </div>
                        <!-- Section -->
                        <div class="sections">
                            <div class="section-header">
                                <h3 class="section-header__title">Khu vực 1</h3>
                                <div class="d-flex align-items-center">
                                    <span>12-03-2022</span>
                                    <i class="fa fa-calendar ml-2"></i>
                                </div>
                            </div>
                            <div class="row">
                                <c:forEach var="j" begin="1" step="1" end="12">
                                    <div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12 ${j <= 8 ? "mb-4":"mb-3"}">
                                        <div class="section-card">	
                                            <div class="grid-container">
                                                <c:forEach var="i" begin="1" step="1" end="8">
                                                    <div class="grid-item">
                                                        <div class="small-rect small-rect--${i % 2 != 0?"full":"empty"}"></div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <span class="mt-2">KVH-0${j}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="section-footer">
                                <div class="d-flex align-items-center">
                                    <div class="small-rect small-rect--full"></div>
                                    <span class="ml-3 font-weight-bold">Đã đầy</span>
                                </div>
                                <div class="d-flex align-items-center ml-3">
                                    <div class="small-rect small-rect--empty"></div>
                                    <span class="ml-3 font-weight-bold">Còn trống</span>
                                </div>
                            </div>
                        </div>
                        <!-- Section END -->
                        <!-- Section -->
                        <div class="list-sections">
                            <div class="section-header">
                                <h3 class="section-header__title">Danh sách khu vực</h3>
                                <!--                                <select>
                                                                    <option>Sort by</option>
                                                                </select>-->
                            </div>
                            <div>
                                <c:forEach var="ls" step="1" begin="1" end="5">
                                    <div class="row mb-3">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-sm-6 col-12">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <span>Khu vực 0${ls}</span>
                                                <div class="d-flex align-items-center">
                                                    <span>12-03-2022</span>
                                                    <i class="fa fa-calendar ml-2"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-sm-6 col-12">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <span>Đã dùng</span>
                                                    <div class="input-range">
                                                        <c:if test="${ls * 20 > 0 && ls * 20 < 40}">
                                                            <div class="input-range-thumb bg-primary" style="width: ${ls * 20}%"></div>
                                                        </c:if>
                                                        <c:if test="${ls * 20 > 39 && ls * 20 < 80}">
                                                            <div class="input-range-thumb bg-warning" style="width: ${ls * 20}%"></div>
                                                        </c:if>
                                                        <c:if test="${ls * 20 > 79 && ls * 20 < 101}">
                                                            <div class="input-range-thumb bg-danger" style="width: ${ls * 20}%"></div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <span>${ls * 20}%</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- Section END -->
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-4 col-sm-6 col-12">
                        <div class="w-100">
                            <div class="main-section">
                                <span class="main-section-title">Khu vực 5 usage</span>
                                <div style="width: 260px;height: 260px; margin-top: 34px; position: relative">
                                    <canvas id="myChart"></canvas>
                                    <div class="progess-value">
                                        <span>872</span>
                                        <p>Vị trí đã dùng</p>
                                    </div>
                                </div>
                                <div class="w-100 mt-3 d-flex align-items-center justify-content-around">
                                    <div class="d-flex align-items-center flex-column">
                                        <span>Đã đầy</span>
                                        <p class="main-section-value">19 Kệ</p>
                                    </div>
                                    <div class="d-flex align-items-center flex-column">
                                        <span>Còn trống</span>
                                        <p class="main-section-value">64 Kệ</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="group-tabs mt-4 tab-card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="nav-item active">
                                    <a class="nav-link" href="#received" aria-controls="received" role="tab" data-toggle="tab">Received</a>
                                </li>
                                <li role="presentation" class="nav-item">
                                    <a class="nav-link" href="#send" aria-controls="send" role="tab" data-toggle="tab">Send</a>
                                </li>
                                <li role="presentation" class="nav-item">
                                    <a class="nav-link" href="#expected" aria-controls="expected" role="tab" data-toggle="tab">Expected</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content p-3">
                                <div role="tabpanel" class="tab-pane active" id="received">
                                    <c:forEach begin="1" end="7" var="i">
                                        <div class="d-flex align-items-center justify-content-between my-3">
                                            <div class="d-flex align-items-center">
                                                <div><img src="./assets/images/box.png"/></div>
                                                <div class="d-flex flex-column justify-content-center ml-5">
                                                    <span class="section-header__title">Box 1457AN</span>
                                                    <span>Delivered 08:59AM</span>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <span class="section-header__title">Area-A</span>
                                                <span>John Herry Ken</span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="send"><c:forEach begin="1" end="7" var="i">
                                        <div class="d-flex align-items-center justify-content-between my-3">
                                            <div class="d-flex align-items-center">
                                                <div><img src="./assets/images/box.png"/></div>
                                                <div class="d-flex flex-column justify-content-center ml-5">
                                                    <span class="section-header__title">Box 1457AN</span>
                                                    <span>Delivered 08:59AM</span>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <span class="section-header__title">Area-A</span>
                                                <span>John Herry Ken</span>
                                            </div>
                                        </div>
                                    </c:forEach></div>
                                <div role="tabpanel" class="tab-pane" id="expected">
                                    <c:forEach begin="1" end="7" var="i">
                                        <div class="d-flex align-items-center justify-content-between my-3">
                                            <div class="d-flex align-items-center">
                                                <div><img src="./assets/images/box.png"/></div>
                                                <div class="d-flex flex-column justify-content-center ml-5">
                                                    <span class="section-header__title">Box 1457AN</span>
                                                    <span>Delivered 08:59AM</span>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <span class="section-header__title">Area-A</span>
                                                <span>John Herry Ken</span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>
        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src='assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/vendors/chart/chart.min.js"></script>
        <script src="assets/js/admin.js"></script>
        <script src='assets/vendors/calendar/moment.min.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script> 
        <script>
            var ctx2 = document.getElementById('myChart').getContext('2d');
            var campaignDonut = new Chart(ctx2, {
                type: 'doughnut',
                data: {
                    datasets: [{
                            label: 'Load',
                            data: [40, 60],
                            backgroundColor: ['#EBAF3A', 'rgba(231, 194, 123, 0.4)'],
                            borderColor: ['transparent', 'transparent'],
                            hoverOffset: 4
                        }]
                },
                options: {
                    aspectRatio: 1,
                    layout: {
                        padding: {
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0
                        }
                    },
                    responsive: true,
                    cutoutPercentage: 90,
                    legend: {
                        display: false
                    },
                    title: {
                        display: false
                    }
                }
            });
        </script>  
    </body>
</html>
