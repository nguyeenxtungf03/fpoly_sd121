<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtd=device-widtd, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body style=" font-weight: 400">
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div style="width: 84% ; float: right ;padding: 0rem 1rem 1rem 0rem">
    <div class="container mt-2">
        <div class="progress">
            <div ${hd.trangThai ==  1 or hd.trangThai ==  2 or hd.trangThai ==  3  or hd.trangThai ==  4 or hd.trangThai ==  5 or hd.trangThai ==  6  or hd.trangThai ==  7  ?'style = "background: #34ce57 ; width: 14.2857%"' :''}
                    class="progress-bar " style="width: 14.2857%">
                <i class="fas fa-cart-arrow-down"></i>
                Đặt hàng
                <c:if test="${hd.trangThai == 1}">
                         <span style="font-size: 12px"><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                       pattern="dd/MM/yyyy HH:mm:ss"/></span>
                </c:if>
                <c:if test="${hd.trangThai == 1 and hd.loaiHoaDon == 1}">
                    <form action="/hoa-don/trang-thai-don-hang" method="post">
                        <input name="trangThai" type="hidden" value="7">
                        <input name="idHoaDon" type="hidden" value="${hd.id}">
                        <button style="background: red">Huỷ</button>
                    </form>
                </c:if>
            </div>
            <c:if test="${hd.loaiHoaDon == 1 and  hd.trangThai != 7}">
                <div ${hd.trangThai ==  2 or hd.trangThai ==  3 or hd.trangThai ==  4 or hd.trangThai ==  5 or hd.trangThai ==  6   ?'style = "background: #34ce57 ; width: 14.2857%"' :''}
                        class="progress-bar " style="width: 14.2857%">
                    <i class="fas fa-check"></i>
                    Xác nhận
                    <c:if test="${hd.trangThai == 1}">
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="2">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">
                            <button>Xác nhận</button>
                        </form>
                    </c:if>
                    <c:if test="${hd.trangThai == 2}">
                        <span style="font-size: 12px"><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                      pattern="dd/MM/yyyy HH:mm:ss"/></span>
                    </c:if>
                    <c:if test="${hd.trangThai == 2}">
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="1">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">
                            <button>Hủy xác nhận</button>
                        </form>
                    </c:if>
                </div>
                <div ${hd.trangThai ==  3 or hd.trangThai ==  4 or hd.trangThai ==  5 or hd.trangThai ==  6  ?'style = "background: #34ce57 ; width: 14.2857%"' :''}
                        class="progress-bar " style="width: 14.2857%">
                    <i class="fas fa-box"></i>
                    Đóng gói
                    <c:if test="${hd.trangThai == 2}">
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="3">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">
                            <button>Đóng gói</button>
                        </form>
                    </c:if>
                    <c:if test="${hd.trangThai == 3}">
                        <span style="font-size: 12px"><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                      pattern="dd/MM/yyyy HH:mm:ss"/></span>
                    </c:if>
                </div>
                <div ${hd.trangThai ==  4 or hd.trangThai ==  5 or hd.trangThai ==  6   ?'style = "background: #34ce57 ; width: 14.2857%"' :''}
                        class="progress-bar" style="width: 14.2857%">
                    <i class="fas fa-truck"></i>
                    Vận chuyển
                    <c:if test="${hd.trangThai == 3}">
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="4">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">
                            <button>Vận chuyển</button>
                        </form>
                    </c:if>
                    <c:if test="${hd.trangThai == 4}">
                        <span style="font-size: 12px"><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                      pattern="dd/MM/yyyy HH:mm:ss"/></span>
                    </c:if>
                </div>
                <div  ${ hd.trangThai ==  5  or hd.trangThai ==  6  ?'style = "background: #34ce57 ; width: 14.2857%"' :''}
                        class="progress-bar" style="width: 14.2857%">
                    <i class="fas fa-credit-card"></i>
                    Thanh toán
                    <c:if test="${hd.trangThai == 4}">
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="5">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">
                            <button>Thành công</button>
                        </form>
                    </c:if>
                    <c:if test="${hd.trangThai == 5}">
                        <span style="font-size: 12px"><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                      pattern="dd/MM/yyyy HH:mm:ss"/></span>
                    </c:if>
                    <c:if test="${hd.trangThai == 4}">
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="7">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">
                            <input type="hidden" name="actions" value="hangLoi">
                            <button type="submit" style="background: red" name="action" value="hangLoi">Hàng lỗi</button>
                        </form>
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="7">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">
                            <button type="submit" style="background: red" name="action" value="khongThanhCong">Không thành công</button>
                        </form>
                    </c:if>
                    <c:if test="${hd.trangThai == 5}">
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="4">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">
                            <button style="background: red">Chưa thanh toán</button>
                        </form>
                    </c:if>
                </div>
                <div class="progress-bar" ${hd.trangThai ==  6  ?'style = "background: #34ce57 ; width: 14.2857%"' :''}
                     style="width: 14.2857% ">
                    <i class="fas fa-check-circle"></i>
                    Hoàn thành
                    <c:if test="${hd.trangThai == 5}">
                        <form action="/hoa-don/trang-thai-don-hang" method="post">
                            <input name="trangThai" type="hidden" value="6">
                            <input name="idHoaDon" type="hidden" value="${hd.id}">

                            <button>Hoàn thành</button>
                        </form>
                    </c:if>
                    <c:if test="${hd.trangThai == 6}">
                        <span style="font-size: 12px"><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                      pattern="dd/MM/yyyy HH:mm:ss"/></span>
                    </c:if>

                </div>

            </c:if>

            <c:if test="${hd.loaiHoaDon != 1 }">
                <div class="progress-bar" ${hd.trangThai ==  6  ?'style = "background: #34ce57 ; width: 14.2857%"' :''}
                     style="width: 14.2857% ">
                    <i class="fas fa-check-circle"></i>
                    Hoàn thành
                </div>
            </c:if>

            <c:if test="${hd.trangThai == 7}">
                <div ${hd.trangThai ==  7  ?'style = "background: red ; width: 14.2857%"' :''} class="progress-bar"
                                                                                               style="width: 12.5%;">
                    <i class="fas fa-times"></i>
                    Hủy
                    <c:if test="${hd.trangThai == 7}">
                         <span style="font-size: 12px"><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                       pattern="dd/MM/yyyy HH:mm:ss"/></span>
                    </c:if>
                </div>
            </c:if>

        </div>
    </div>
    <div class="container">
        <a href="/hoa-don/hien-thi" style="text-decoration: none ;color: black ;font-weight: 400"> ↩ Danh sách hóa
            đơn </a><br><br>
        <div style="margin-left: 0.5rem ;font-weight: 600  ">
            <div class="row">
                <div class="col-md-7">
                    Trạng thái : <strong ${hd.trangThai == 1 ? ' style="text-align:center ; color : #ffcc00" ' : hd.trangThai == 6 ? 'style="color: #34ce57;text-align:center"' :hd.trangThai == 7 ? 'style="color: red;text-align:center"' :''}  >
                    ${hd.trangThai == 1 ? 'Chờ xác nhận ' : hd.trangThai == 2  ? 'Đơn hàng đã được xác nhận' :hd.trangThai == 2  ? 'Đơn hàng đã được xác nhận' :
                            hd.trangThai == 3  ? 'Đang chuẩn bị hàng' :hd.trangThai == 4  ? 'Vận chuyển' :
                                    hd.trangThai == 5  ? 'Thanh toán' :hd.trangThai == 6 ? 'Hoàn thành' :hd.trangThai == 7 ? 'Đơn hàng đã bị hủy' :''}</strong><br>
                    Tên khách hàng : <span style=" font-weight: 400"> ${hd.nguoiNhan}</span><br>
                    Địa chỉ : <span style=" font-weight: 400"> ${hd.diaChiNhan}</span><br>
                    Số điện thoại : <span style=" font-weight: 400"> ${hd.sdtNguoiNhan}</span>
                </div>

                <div class="col-md-4 text-md-right" style="text-align: left">
                    Mã đơn hàng : <span style=" font-weight: 400"> ${hd.id}</span><br>
                    Tổng tiền : <span style=" font-weight: 400">  <fmt:formatNumber value="${hd.tongTien}"
                                                                                    pattern="##,###,###"></fmt:formatNumber> ₫</span><br>
                    Phí Vận chuyển : <span style=" font-weight: 400">  <fmt:formatNumber value="${hd.phiVanChuyen}"
                                                                                         pattern="##,###,###"></fmt:formatNumber> ₫</span><br>
                    Thành tiền : <span style=" font-weight: 400">  <fmt:formatNumber value="${hd.thanhTien}"
                                                                                     pattern="##,###,###"></fmt:formatNumber> ₫</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">

        <h1 style="text-align: center ; color: black ; font-weight: 600  ;">Danh sách sản phẩm đã mua </h1>
        <div style="margin-left: 0.5rem ; font-weight: 600">
            <c:set var="totalQuantity" value="0"/>
            <c:forEach var="ct" items="${listHdct}">
                <c:set var="totalQuantity" value="${totalQuantity + ct.soLuong}"/>
            </c:forEach>
            <span>Số đơn hàng : ${fn:length(listHdct)} , Số lượng : ${totalQuantity}</span><br>
        </div><br>
        <table class="table table-hover">
            <thead >
                <tr  >
                    <td scope="col">Sản phẩm</td>
                    <td scope="col">Tên Sản phẩm</td>
                    <td scope="col">Số lượng</td>
                    <td scope="col">Đơn giá</td>
                    <td scope="col">Tổng</td>
                    <td scope="col">Ghi chú</td>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${listHdct}" var="hdct">
            <tr>
                <td><img style=" max-width: 50px;max-height: 50px; object-fit: cover;"
                         src="/assets/images/imgSp/${hdct.idSanPhamChiTiet.anhSanPham}"></td>
                <td style=" font-weight: 600;" scope="row">${hdct.idSanPhamChiTiet.idSanPham.tenSanPham} <span
                        style="color: #565e64"> (  ${hdct.idSanPhamChiTiet.idMauSac.tenMauSac} , ${hdct.idSanPhamChiTiet.idKichThuoc.tenKichThuoc} )</span>
                </td>
                <td scope="row">${hdct.soLuong}</td>
                <td scope="row"><fmt:formatNumber value="${hdct.donGia}"
                                                  pattern="##,###,###"></fmt:formatNumber>
                    ₫
                </td>
                <td scope="row"><fmt:formatNumber value="${hdct.donGia * hdct.soLuong}"
                                                  pattern="##,###,###"></fmt:formatNumber> ₫
                </td>
                <td scope="row"> ${hdct.ghiChu}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div id="successToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true"
     data-delay="0.5" style="position: fixed; top: 20px; right: 20px;">
    <div class="toast-body" style="color: #34ce57">
        Trạng thái đơn hàng đã được cập nhật thành công.
    </div>
</div>
<!-- Đảm bảo rằng bạn đã bao gồm thư viện jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">


<script>
    $(document).ready(function () {
        // Hiển thị Toast khi trạng thái đơn hàng được cập nhật thành công
        function showSuccessToast() {
            $('#successToast').toast('show');

            // Đặt thời gian tự động ẩn Toast sau 1 giây
            setTimeout(function () {
                $('#successToast').toast('hide');
            }, 1000);
        }

        // Bắt sự kiện khi Toast ẩn đi
        $('#successToast').on('hidden.bs.toast', function () {
            // Tải lại trang sau khi Toast ẩn đi
            location.reload();
        });

        // Bắt sự kiện khi form được submit
        $("form").submit(function (event) {
            // Ngăn chặn hành động mặc định của form (chuyển hướng trang)
            event.preventDefault();

            // Lấy dữ liệu từ form
            var formData = $(this).serialize();

            // Thực hiện POST request thông qua Ajax
            $.ajax({
                type: "POST",
                url: "/hoa-don/trang-thai-don-hang",
                data: formData,
                success: function (response) {
                    // Xử lý kết quả trả về từ server
                    console.log(response);

                    // Hiển thị và tự động ẩn Toast thành công
                    showSuccessToast();
                },
                error: function (error) {
                    // Xử lý lỗi nếu có
                    console.error(error);
                }
            });
        });
    });
</script>

<style>
    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
        margin-top: 10px;
    }

    table.table {
        font-size: 14px;
    }

    table.table thead td {
        padding: 10px;
        text-align: center;
        border: 1px solid #dee2e6;
        background: #b3b7bb;
    }


    table.table tbody td {
        padding: 10px;
        text-align: center;
        border: 1px solid #dee2e6;
    }
    .progress button {
        border: 1px solid white;
        background: black;
        color: white;
        border-radius: 20px;
    }

</style>
<style>
    body {
        background-color: #f8f9fa;
    }

    .progress-bar {
        text-align: center;
        padding: 20px; /* Tăng padding cho ô tiến trình */
        position: relative;
    }

    .progress {
        height: 7rem;
    }

    .progress-bar i {
        font-size: 100px; /* Tăng kích thước biểu tượng */
        margin-bottom: 20px; /* Tăng khoảng cách dưới biểu tượng */
        display: block;
    }

    .progress-bar:hover {
        opacity: 0.8;
    }

    .progress-bar.active {
        background-color: #007bff;
        color: #fff;
        font-weight: bold;
    }

    .progress-bar.active i {
        color: #fff;
    }

    .progress-bar.complete {
        background-color: #28a745;
        color: #fff;
        font-weight: bold;
    }

    .progress-bar.complete i {
        color: #fff;
    }

    .progress-bar:not(:last-child)::after {
        content: "";
        position: absolute;
        top: 50%;
        right: 0;
        transform: translateY(-50%);
        width: 30px;
        height: 2px;
        background-color: #e9ecef;
    }

    .progress-bar:last-child::after {
        display: none;
    }
    .table {
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
</style>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>
</html>
