<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="myForm" action="/khuyen-mai/update/${km.id}" method="post" onsubmit="return validateDateRange()">
    <div class="form-column">
        <div class="col-md-12 mb-3" style="text-align: center; font-weight:600;"> Thông tin khuyến mại</div>
        <div class="col-md-12 mb-3">
            <label for="productName">Tên khuyến mại</label>
            <input  disabled  value="${km.tenKhuyenMai}" type="text" class="form-control" id="productName2"
                   required>
            <input name="tenKhuyenMai"  value="${km.tenKhuyenMai}" type="hidden" class="form-control" id="productName"
                   required>
        </div>
        <div class="col-md-12 mb-3">
                  <span style=" gap : 10px; flex-direction: row;">
                      Loại Khuyến Mại :
                      <input  ${km.loaiKhuyenMai == "product" ?  'checked' :''}
                             type="radio"
                             name="loaiKhuyenMai" onclick="limitPercentage()"
                             value="product"> VNĐ
                      <input style="margin-left: 20px;"
                             type="radio" ${km.loaiKhuyenMai == "percentage" ?  'checked' :''}
                             name="loaiKhuyenMai" onclick="limitPercentage()"
                             value="percentage"> %</span>
        </div>
        <div class="col-md-12 mb-3" >
            <label for="discountValue">Giá trị</label>
            <c:if test="${km.loaiKhuyenMai == 'product'}">
            <input value="${km.giaTri}" name="giaTri" type="number" min="1" max="100000000" class="form-control" id="discountValue"
                   required>
            </c:if>

            <c:if test="${km.loaiKhuyenMai == 'percentage'}">
                <input value="${km.giaTri}"  name="giaTri" type="number" min="1" max="100" class="form-control" id="discountValue"
                       required>
            </c:if>
        </div>
        <div class="col-md-12 mb-3">
            <label for="discountValue">Ngày bắt đầu</label>
            <input type="datetime-local" id="startDate" value="${km.ngayBatDau}" name="ngayBatDau" class="form-control" required>
        </div>
        <div class="col-md-12 mb-3">
            <label for="discountValue">Ngày kết thúc</label>
            <input type="datetime-local" id="endDate" value="${km.ngayKetThuc}" name="ngayKetThuc" class="form-control" required>
        </div>

        <div  class="col-md-12 mb-3">
            <label for="discountValue">Trạng thái : </label>
            <span style="font-weight: 600"> <span  ${km.trangThai == 1 && km.ngayBatDau <= newDate && newDate <= km.ngayKetThuc ? 'style="color: #34ce57"': km.trangThai == 1 && km.ngayBatDau > newDate && newDate <= km.ngayKetThuc  ? 'style="color: #ffc720"':'style="color: red"'} >${km.trangThai == 1 && km.ngayBatDau <= newDate && newDate <= km.ngayKetThuc  ? 'Đang áp dụng' :km.trangThai == 1 && km.ngayBatDau > newDate ? 'Chưa áp dụng':'Hết hạn ' }</span></span>
        </div>
    </div>
    <div style="display: flex ; flex-direction: column; align-content: center">
    <button  class="btn btn-primary" onclick="confirmAction(event)" type="submit">Cập nhật</button><br>
    </div>
</form>
<c:if test="${not empty dsSpctKm}">

    <div style="text-align: center ; font-weight: 600 ; font-size: 20px">Sản phẩm khuyến mại</div>
<table class="table table-hover" style="font-size: 12px ; font-weight: 500" >
    <tdead style = "color: white">
        <tr style="background: #5c636a ">
            <td style="color: white" scope="col"> Ảnh</td>
            <td style="color: white" scope="col">Tên sản phẩm</td>
            <td style="color: white" scope="col"> Giá bán</td>
            <td style="color: white" scope="col"> Số lượng</td>
            <td style="color: white" scope="col"> Trạng thái</td>
            <td style="color: white" scope="col"> Chức năng</td>
        </tr>
    </tdead>
    <tbody>
    <c:forEach items="${dsSpctKm}" var="spct">
    <tr>
        <td scope="row"><a href="/san-pham-chi-tiet/detail/${spct.id}"><img style="width: 2rem ;height: 2.5rem"
                                                                            src="../../../assets/images/imgSp/${spct.anhSanPham}"></a>
        <td scope="row">${spct.idSanPham.tenSanPham} <br> [ ${spct.idMauSac.tenMauSac} - ${spct.idKichThuoc.tenKichThuoc} ]</td>
        <td scope="row"><fmt:formatNumber>${spct.giaBan}</fmt:formatNumber></td>
        <td scope="row"><fmt:formatNumber>${spct.soLuong}</fmt:formatNumber></td>
        <td scope="row">${spct.trangThai == 0 ? 'Hoạt động' :'Không hoạt động'}</td>
        </td>
        <td>
            <form action="/khuyen-mai/deleteKmSp/${spct.id}" method="post">
                <button  class="btn btn-primary " style="background: red" type="submit"><i class="bi bi-trash3"></i></button>
            </form>
        </td>

    </tr>
    </c:forEach>
</table>
</c:if>


<!-- Include thư viện SweetAlert2 (đặt trước mã JavaScript của bạn) -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    function confirmAction(event) {

        // Hiển thị hộp thoại xác nhận
        if (confirm("Bạn có chắc chắn muốn cập nhật khuyến mại này ?")) {
            // Nếu người dùng chấp nhận, thực hiện chuyển hướng
            window.location.href = event.currentTarget.querySelector('button').getAttribute('submit');
        }
        // Ngăn chặn sự kiện mặc định (nhảy trang)
        event.preventDefault();
    }
</script>

<script>
    function validateDateRange() {
        var name = document.getElementById('productName').value;
        var name2 = document.getElementById('productName2').value;
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;

        var currentDate = new Date();

        startDate = new Date(startDate);
        endDate = new Date(endDate);

        if (startDate >= endDate) {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Ngày bắt đầu phải nhỏ hơn ngày kết thúc !',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            return false; // Ngăn chặn việc submit form
        } else if (startDate <= currentDate) {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Ngày bắt đầu phải lớn hơn ngày hiện tại !',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            return false;
        } else if (name !== '${km.tenKhuyenMai}' || name2 !== '${km.tenKhuyenMai}') {
        Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Cập nhật không thành công !',
            timer: 1000, // 1 giây
            showConfirmButton: false,
        });
        return false;
        } else {
            Swal.fire({
                icon: 'success',
                title: 'Thành công',
                text: 'Cập nhật thành công',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            setTimeout(() => {
                submitForm();
            }, 1200);
            return false;
        }
    }

    function submitForm() {
        // Thực hiện hành động submit form
        document.getElementById('myForm').submit();
        event.preventDefault();
    }

</script>
<script>
    // Kiểm tra radio button và áp dụng giới hạn giá trị
    function limitPercentage() {
        var discountInput = document.getElementById('discountValue');
        var vndRadio = document.querySelector('input[name="loaiKhuyenMai"][value="product"]');
        var percentageRadio = document.querySelector('input[name="loaiKhuyenMai"][value="percentage"]');

        if (vndRadio.checked) {
            discountInput.max = 100000000;
        } else if (percentageRadio.checked) {
            discountInput.max = 100;
        }
    }
</script>

</body>
</html>
