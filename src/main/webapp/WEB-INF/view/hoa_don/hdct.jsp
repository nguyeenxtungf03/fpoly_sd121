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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
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

            <c:forEach items="${listLshd}" var="ls">
                <div class="progress-bar" ${ls.trangThaiDonHang == 1 ? 'style="background: #ffc107"' : ls.trangThaiDonHang == 6 ? 'style="background: #34ce57"' : ls.trangThaiDonHang == 7 ? 'style="background: red"' : ''}>
                        <%--icon dat hang--%>
                    <c:if test="${ls.trangThaiDonHang == 1}">
                        <i class="fas fa-cart-arrow-down"></i>
                    </c:if>
                        <%--icon xac nhan don hang--%>
                    <c:if test="${ls.trangThaiDonHang == 2}">
                        <i class="fas fa-check"></i>
                    </c:if>
                        <%--icon dong goi--%>
                    <c:if test="${ls.trangThaiDonHang == 3}">
                        <i class="fas fa-box"></i>
                    </c:if>
                        <%--icon van chuyen--%>
                    <c:if test="${ls.trangThaiDonHang == 4}">
                        <i class="fas fa-truck"></i>
                    </c:if>
                        <%--icon giao hang--%>
                    <c:if test="${ls.trangThaiDonHang == 5}">
                        <i class="fas fa-user"></i>
                    </c:if>
                        <%--icon hoan thanh--%>
                    <c:if test="${ls.trangThaiDonHang == 6}">
                        <i class="fas fa-check-circle"></i>
                    </c:if>
                        <%--icon huy don hang--%>
                    <c:if test="${ls.trangThaiDonHang == 7}">
                        <i class="fas fa-times-circle"></i>
                    </c:if>
                        ${ ls.trangThaiDonHang == 1 ? 'Chờ xác nhận' : ls.trangThaiDonHang == 2 ? 'Xác nhận' : ls.trangThaiDonHang == 3 ? 'Chờ vận chuyển' : ls.trangThaiDonHang == 4 ? 'Vận chuyển' : ls.trangThaiDonHang == 5 ? 'Đã thanh toán' : ls.trangThaiDonHang == 6 ? 'Hoàn thành' : ls.trangThaiDonHang == 7 ? 'Hủy đơn hàng'  : ''}
                    <span style="font-size: 10px;font-weight: 400"><fmt:formatDate value="${ls.ngayTao}" pattern="dd-MM-yyyy HH:mm:ss"></fmt:formatDate></span>
                </div>
            </c:forEach>
        </div>

        <div class="container" style="padding: 10px">
            <div class="row d-flex">
                <div class="col-6">
                    <div class="d-grid gap-2 d-md-block">
                        <c:if test="${hd.loaiHoaDon == 1}">
                        <c:if test="${hd.trangThai != 6 and hd.trangThai != 7 }">
                        <button  ${hd.trangThai == 5 ? 'style="background: #34ce57 ; border: 1px solid #34ce57"':''}
                                class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" type="button">
                            <span ${hd.trangThai == 5 ? 'style="color: black"':''} >    ${hd.trangThai == 1  ? 'Xác nhận' : hd.trangThai == 2  ? 'Chờ vận chuyển' : hd.trangThai == 3  ? 'Vận chuyển' : hd.trangThai == 4  ? 'Đã thanh toán' : hd.trangThai == 5 ? 'Hoàn thành' :'' }</span>
                        </button>
                        </c:if>
                        <c:if test="${hd.trangThai != 7 and hd.trangThai != 1 }">
                        <button style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;margin-right: 50px"
                                class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@mdo" type="button">Quay lại
                        </button>
                        </c:if>
                        <c:if test="${hd.trangThai == 1  or hd.trangThai == 2 or hd.trangThai == 3  or hd.trangThai == 4 }">
                            <button style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;"
                                    class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal3"
                                    data-bs-whatever="@mdo" type="button">Hủy
                            </button>
                        </c:if>
                        </c:if>
                    </div>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận đơn hàng</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <form method="post" action="/hoa-don/trang-thai-don-hang" >
                                <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="message-text">Mô tả : </label>
                                            <textarea name="moTa" class="form-control" placeholder="Nhập mô tả tối thiểu 10 kí tự" id="message-text" required style="height: 150px"></textarea>
                                        </div>
                                </div>
                                <div class="modal-footer">
                                        <input type="hidden" name="trangThai" value="${hd.trangThai + 1}">
                                        <input type="hidden" name="idHoaDon" value="${hd.id}">
                                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel2">Xác nhận quay lại đơn hàng</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <form method="post" action="/hoa-don/trang-thai-don-hang" >
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="message-text">Mô tả : </label>
                                            <textarea name="moTa" class="form-control" placeholder="Nhập mô tả tối thiểu 50 kí tự" required style="height: 150px"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="hidden" name="trangThai" value="${hd.trangThai - 1}">
                                        <input type="hidden" name="trangThaiBack" value="${hd.trangThai - 1}">
                                        <input type="hidden" name="idHoaDon" value="${hd.id}">
                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel3">Xác nhận hủy đơn hàng </h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <form method="post" action="/hoa-don/trang-thai-don-hang" >
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="message-text">Mô tả : </label>
                                            <textarea name="moTa" class="form-control" placeholder="Nhập mô tả tối thiểu 100 kí tự" required style="height: 150px"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="hidden" name="trangThai" value="7">
                                        <input type="hidden" name="idHoaDon" value="${hd.id}">
                                        <button onclick="confirmAction(event)" type="submit" class="btn btn-primary">Xác nhận</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>


            <%--lich su--%>
                <div class="col-6">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;"
                                class="btn btn-primary me-md-2" type="button">Lịch sử
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                             tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Lịch sử hóa đơn</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="word-wrap-example">
                                        <table class="table table-hover" >
                                            <thead>
                                            <tr>
                                                <td scope="col">STT</td>
                                                <td scope="col">Trạng thái</td>
                                                <td scope="col">Người xác nhận</td>
                                                <td scope="col">Ngày xác nhận</td>
                                                <td scope="col">Ghi chú</td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${listLshd}" var="ls" varStatus="i">
                                            <tr>
                                               <td>${i.index + 1}</td>
                                               <td ${ls.trangThaiDonHang == 1 ? ' style="text-align:center ; color : #ffcc00" ' : ls.trangThaiDonHang == 6 ? 'style="color: #34ce57;text-align:center"' :ls.trangThaiDonHang == 7 ? 'style="color: red;text-align:center"' :''}  >
                                                       ${ls.trangThaiDonHang == 1 ? 'Chờ xác nhận ' : ls.trangThaiDonHang == 2  ? 'Xác nhận' :ls.trangThaiDonHang == 2  ? 'Xác nhận' :
                                                               ls.trangThaiDonHang == 3  ? 'Chờ vận chuyển' :ls.trangThaiDonHang == 4  ? 'Vận chuyển' :
                                                                       ls.trangThaiDonHang == 5  ? 'Đã thanh toán' :ls.trangThaiDonHang == 6 ? 'Hoàn thành' :ls.trangThaiDonHang == 7 ? 'Đơn hàng đã bị hủy' :''}</td>
                                               <td>${ls.nguoiTao}</td>
                                               <td><fmt:formatDate value="${ls.ngayTao}" pattern="dd-MM-yyyy HH:mm:ss"></fmt:formatDate> </td>
                                               <td >${ls.ghiChu}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
        <a href="/hoa-don/hien-thi" style="text-decoration: none ;color: black ;font-weight: 400"> ↩ Danh sách hóa
            đơn </a><br><br>
        <div style="margin-left: 0.5rem ;font-weight: 500 ;font-size: 15px ">
            <div class="row">
                <div class="col-md-6 " style="text-align: left">
                    Mã đơn hàng : <span class="spann" > ${hd.id}</span><br><br>
                    Tên khách hàng : <span class="spann" > ${hd.nguoiNhan}</span><br>
                    Địa chỉ : <span  class="spann"> ${hd.diaChiNhan}</span><br>
                    Số điện thoại : <span class="spann" > ${hd.sdtNguoiNhan}</span>
                </div>

                <div class="col-md-6 text-md-right " >
                    <span style="margin-right: 5px">Trạng thái:</span>
                    <strong class="boderr"  ${hd.trangThai == 1 ? ' style="text-align:center ; background : #ffcc00" ' : hd.trangThai == 6 ? 'style="background: #34ce57;text-align:center"' : hd.trangThai == 7 ? 'style="background: red;text-align:center"' :''}  >
                        ${hd.trangThai == 1 ? 'Chờ xác nhận' : hd.trangThai == 2  ? 'Xác nhận' :
                                hd.trangThai == 3  ? 'Chờ vận chuyển' : hd.trangThai == 4  ? 'Vận chuyển' :
                                        hd.trangThai == 5  ? 'Đã thanh toán' : hd.trangThai == 6 ? 'Hoàn thành' : hd.trangThai == 7 ? 'Đơn hàng đã bị hủy' :''}</strong>
                    <span style="margin-right: 5px">Loại hóa đơn:</span>  <span class="boderr" ${hd.loaiHoaDon == 1 ? ' style="background:#008080 ; color : white "':'style="background: #8B475D ; color : white  "'}  >${hd.loaiHoaDon == 1 ? 'Mua hàng Online' :'Mua hàng tại quầy'}</span><br><br>

                    Tổng tiền : <span class="spann" >  <fmt:formatNumber value="${hd.tongTien}"
                                                                         pattern="##,###,###"></fmt:formatNumber> ₫</span><br>
                    Phí Vận chuyển : <span  class="spann" >  <fmt:formatNumber value="${hd.phiVanChuyen}"
                                                                               pattern="##,###,###"></fmt:formatNumber> ₫</span><br>
                    Thành tiền : <span class="spann" >  <fmt:formatNumber value="${hd.thanhTien}"
                                                                          pattern="##,###,###"></fmt:formatNumber> ₫</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">

        <h1 style="text-align: center ; color: black ; font-weight: 700  ;">Danh sách sản phẩm </h1>
        <div style="margin-left: 0.5rem ; font-weight: 600">
            <c:set var="totalQuantity" value="0"/>
            <c:forEach var="ct" items="${listHdct}">
                <c:set var="totalQuantity" value="${totalQuantity + ct.soLuong}"/>
            </c:forEach>
            <span>Số đơn hàng : ${fn:length(listHdct)} , Số lượng : ${totalQuantity}</span><br>
        </div>
        <br>
        <table class="table table-hover">
            <thead>
            <tr>
                <td scope="col">Sản phẩm</td>
                <td scope="col">Tên Sản phẩm</td>
                <td scope="col">Số lượng</td>
                <td scope="col">Đơn giá</td>
                <td scope="col">Tổng</td>
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
            </tr>
            </c:forEach>
        </table>
    </div>
    </div>
</div>
<div  id="successToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true"
      data-delay="1000" style="position: fixed; top: 20px; right: 20px;  z-index: 1051;background: white">
    <div  ${error != null ? 'style="color: red"': 'style="color: #34ce57"'}  class="toast-body" >

    </div>
</div>
<!-- Đảm bảo rằng bạn đã bao gồm thư viện jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<script>
    document.addEventListener("DOMContentLoaded", function () {
        if (`${error}` !== '' || `${pass}` !== ''  ) {
            showSuccessToast('${error}${pass}');
        }

    });
    function showSuccessToast(message) {
        // Lấy phần tử có id là 'successToast'
        var successToast = document.getElementById("successToast");

        // Thiết lập nội dung của toast
        successToast.querySelector('.toast-body').innerText = message;

        // Hiển thị toast
        $(successToast).toast('show');

        // Đặt thời gian tự động ẩn toast sau 1 giây
        setTimeout(function () {
            $(successToast).toast('hide');
        }, 2000);
    }

</script>
<script>
    function confirmAction(event) {
        // Hiển thị hộp thoại xác nhận
        if (confirm("Bạn có chắc muốn hủy đơn hàng ${hd.id} ?")) {
            // Nếu người dùng chấp nhận, thực hiện chuyển hướng
            window.location.href = event.currentTarget.querySelector('button').getAttribute('submit');
        }
        // Ngăn chặn sự kiện mặc định (nhảy trang)
        event.preventDefault();
    }
</script>
<style>

    .modal-backdrop.show {
        opacity: 5%;
    }

    /* Đảm bảo văn bản sẽ xuống dòng khi không thể hiển thị toàn bộ trong một cell */
    .word-wrap-example {
        white-space: normal;
        word-wrap: break-word;
    }

    /* Ngăn chặn văn bản tràn ra khỏi cell */
    .table td {
        max-width: 300px; /* Đặt chiều rộng tối đa của cell */
        overflow: hidden;
        text-overflow: ellipsis; /* Hiển thị dấu elipsis (...) khi văn bản quá dài */
    }




    .toast-body {
        color: #34ce57;
    }


    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
        margin-top: 10px;
    }
    .boderr{
        border: 1px solid #1e1e1e ;
        padding: 2px 8px 4px 8px;
        border-radius: 200px;
        color: white;
        font-weight: 500;
        font-size: 14px;
        margin-right: 20px;
        background: #0d6efd ;
    }

    .spann{
        font-max-size: 14px;
        font-family: 'Arial', sans-serif;
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


    .btn{
        --bs-btn-padding-y: .25rem;
        --bs-btn-padding-x: .5rem;
        --bs-btn-font-size: .75rem;
        margin-right: 120px
    }
    .progress-bar {
        text-align: center;
        padding: 20px; /* Tăng padding cho ô tiến trình */
        position: relative;
        width: 14.2857% ;
        font-size: 12px;
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

    .progress-bar:not(:last-child)::before {
        content: '';
        position: absolute;
        top: 50%;
        right: 5%;
        transform: translateY(-50%);
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 5px 0 5px 5px; /* Giảm kích thước mũi tên bằng cách sửa đổi giá trị này */
        border-color: transparent transparent transparent #e9ecef;
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
