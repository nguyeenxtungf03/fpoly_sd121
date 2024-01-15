<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page language="java" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
</head>
<body>
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div class="container" style="width: 85% ; float: right ">
    <div class="capNhat">
        <a href="/san-pham-chi-tiet/hien-thi-sp" style="text-decoration: none ;color: black "> ↩ Danh sách sản phẩm </a>
        <form method="get" action="/san-pham-chi-tiet/form-add">
            <div  style="display:flex; justify-content: end"  >
                <button  type="submit" class="btn btn-danger">Làm mới</button>
            </div>
        </form>
        <h2 style="text-align: center ; margin-top: 20px">Thêm sản phẩm </h2>

        <form method="post" action="/san-pham-chi-tiet/uploadSpct"  enctype="multipart/form-data" style="display: none">
            <div class="mb-3">
                <input style="width: 20rem" type="file" name="file" accept=".xls,.xlsx" required>
                <button class="btn btn-primary" type="submit"><i class="bi bi-upload"></i> Thêm sản phẩm từ exel
                </button>
            </div>
            <span style="color: #34ce57">${mess}</span>
            <span style="color: red">${messNull}</span>
        </form>

        <p style="color: #1c7430">${pass}</p>
        <c:if test="${ empty pass}">
            <p style="color: red">${error}</p>
        </c:if>
        <form method="post" class="row needs-validation" novalidate enctype="multipart/form-data" action="/san-pham-chi-tiet/add" >

            <div class="row">
                <div class="col-md-6">
                    <label  >Sản phẩm
                        <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal10">
                            <i class="bi bi-plus-circle-fill"></i> </a>
                    </label>
                    <select id="idSanPham" name="idSanPham" class="form-select" required>
                        <option selected disabled value="">Chọn sản phẩm...</option>
                        <c:forEach items="${listSp}" var="sp">
                            <option ${spct.idSanPham.tenSanPham == sp.tenSanPham ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenSanPham}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Không để trống sản phẩm !
                    </div>
                </div>
                <div class="col-md-3">
                    <label >Màu sắc
                        <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal6">
                            <i class="bi bi-plus-circle-fill"></i> </a>
                    </label>
                    <select id="idMauSac" name="idMauSac" class="form-select" required>
                        <option selected disabled value="">Chọn màu sắc...</option>
                        <c:forEach items="${listMs}" var="ms">
                            <option ${spct.idMauSac.tenMauSac == ms.tenMauSac ? 'selected' : ''}
                                    value="${ms.id}">${ms.tenMauSac}</option>
                        </c:forEach> </select>
                    <div class="invalid-feedback">
                        Không để trống màu sắc !
                    </div>
                </div>
                <div class="col-md-3">
                    <label>Kích Thước
                        <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal4">
                            <i class="bi bi-plus-circle-fill"></i> </a></label><br>
                    <c:forEach items="${listKt}" var="kt">
                        <span style="margin-right: 5px"> <input type="checkbox"  ${fn:contains(listIdKichThuoc, kt.id) ? 'checked' : ''} name="idKichThuoc" value="${kt.id}">${kt.tenKichThuoc}</span>
                    </c:forEach>
                </div>

            </div>
            <br>
            <div class="row">
                <div class="col-md-3">
                    <label>Loại sản phẩm
                        <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal5">
                            <i class="bi bi-plus-circle-fill"></i> </a></label>
                    <select id="idLoaiSanPham" name="idLoaiSanPham" class="form-select" required>
                        <option selected disabled value="">Chọn loại sản phẩm...</option>
                        <c:forEach items="${listLsp}" var="sp">
                            <option  ${spct.idLoaiSanPham.tenLoai == sp.tenLoai ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenLoai}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Không để trống loại sản phẩm !
                    </div>
                </div>
                <div class="col-md-3">
                    <label>Thương hiệu
                        <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                            <i class="bi bi-plus-circle-fill"></i> </a></label>
                    <select id="idThuongHieu" name="idThuongHieu" class="form-select" required>
                        <option selected disabled value="">Chọn thương hiệu...</option>

                        <c:forEach items="${listTh}" var="sp">
                            <option  ${spct.idThuongHieu.tenThuongHieu == sp.tenThuongHieu ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenThuongHieu}</option>
                        </c:forEach> </select>
                    <div class="invalid-feedback">
                        Không để trống thương hiệu !
                    </div>
                </div>
                <div class="col-md-2">
                    <label>Chất liệu
                        <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal3">
                            <i class="bi bi-plus-circle-fill"></i> </a></label>
                    <select id="idChatLieu" name="idChatLieu" class="form-select" required>
                        <option selected disabled value="">Chọn chất liệu...</option>

                        <c:forEach items="${listCl}" var="sp">
                            <option ${spct.idChatLieu.tenChatLieu == sp.tenChatLieu ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenChatLieu}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Không để trống chất liệu !
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="minPrice">Ảnh ( Dung lượng tối đa cho phép 10MB )</label>
                        <div class="input-group">
                            <input  type="file" name="file" accept=".png,.jpg,.gif,.svg,.tiff,.jpeg" class="form-control"
                                    value="" required>
                            <div class="invalid-feedback">
                                Không để trống ảnh !
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="minPrice">Giá bán</label>
                        <div class="input-group">
                            <input name="giaBan" required value="${spct.giaBan}" type="number" class="form-control"
                                   id="minPrice"
                                   placeholder="Giá bán " min="1">
                            <div class="invalid-feedback">
                                Không để trống giá bán và giá bán phải > 0
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="minPrice">Số lượng</label>
                        <div class="input-group">
                            <input name="soLuong" required value="${spct.soLuong}" type="number" class="form-control" placeholder="Số lượng" min="0" />
                            <div class="invalid-feedback">
                                Không để trống số lượng và số lượng phải >= 0
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="minPrice">Mô tả</label>
                        <div class="input-group">
                            <textarea placeholder="Mô tả" name="moTa" required  class="form-control">${spct.moTa}</textarea>
                            <div class="invalid-feedback">
                                Không để trống mô tả !
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <label>Trạng thái</label>
                    <select name="trangThai"  class="form-select form-select-sm">
                        <option  ${spct.trangThai == 0 ? 'selected':''} value="0">Hoạt động</option>
                        <option  ${spct.trangThai == 1 ? 'selected':''} value="1">Không hoạt động</option>
                    </select>
                </div>
            </div>
            <div class="col-md-2">
                <input type="hidden" name="anhSanPham" value="${spct.anhSanPham}" class="form-control">
                <input type="hidden" name="idKhuyenMai" value="${spct.idKhuyenMai.id}" class="form-control">
            </div>

            <div class="col-md-2" style="padding-top: 5px">
                <button type="submit" class="btn btn-primary">Thêm</button>
            </div>
        </form>



        <!-- Modal -->
        <div class="modal fade" id="exampleModal10" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm sản phẩm</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <jsp:include page="../san_pham/sanPham.jsp"></jsp:include>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel2">Thêm thương hiệu</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <jsp:include page="../thuong_hieu/thuongHieu.jsp"></jsp:include>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel3">Thêm chất liệu</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <jsp:include page="../chat_lieu/chatLieu.jsp"></jsp:include>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel4">Thêm kích thước</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <jsp:include page="../kich-thuoc/kichThuoc.jsp"></jsp:include>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel5">Thêm loại sản phẩm</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <jsp:include page="../loai-san-pham/loaiSp.jsp"></jsp:include>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal6" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel6">Thêm màu sắc</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <jsp:include page="../mau_sac/mauSac.jsp"></jsp:include>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${not empty listSpct}">

    <div class="capNhat2">
        <form id="capNhat" action="/san-pham-chi-tiet/capNhat" method="post" >
            <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-bottom: 20px">
                <button class="btn btn-success me-md-2" type="submit">Lưu và cập nhật</button>
            </div>
        <div class="capNhat3"  style="text-align: center">
            <span style=" font-weight: 400 ;font-size: 15px ;margin-right: 35px"> <strong>Sản phẩm :</strong> ${spct.idSanPham.tenSanPham} </span>
            <span style=" font-weight: 400 ;font-size: 15px ; margin-right: 35px"> <strong>Loại sản phẩm :</strong> ${spct.idLoaiSanPham.tenLoai} </span>
            <span style=" font-weight: 400 ;font-size: 15px ; margin-right: 35px"> <strong>Chất liệu :</strong> ${spct.idChatLieu.tenChatLieu} </span>
            <span style=" font-weight: 400 ;font-size: 15px"> <strong>Thương hiệu :</strong> ${spct.idThuongHieu.tenThuongHieu} </span>

        </div>
            <c:forEach items="${listSpctMs}" var="spctMs">
        <div class="capNhat3" style="margin-top: 20px">

                    <span style="font-size: 18px ;font-weight: 600 ">Danh sách sản phẩm : Màu ( ${spctMs.idMauSac.tenMauSac} ) </span>
                    <table class="table table-hover" style="margin-top: 20px">
                        <tdead>
                            <tr style="color: black ; font-weight: 600">
                                <td><input id="${spctMs.idMauSac}" type="checkbox"></td>
                                <td> Ảnh</td>
                                <td>Tên sản phẩm</td>
                                <td>Kích thước</td>
                                <td> Giá bán</td>
                                <td> Số lượng</td>
                                <td> Mô tả</td>
                                <td> Trạng thái</td>
                            </tr>
                        </tdead>
                        <tbody>
                        <fmt:formatDate var="newdate" value="${newDate}" pattern="yyyy-MM-dd"></fmt:formatDate>

                        <c:forEach items="${listSpct}" var="spctDs" varStatus="i">
                        <tr>
                                <c:if test="${spctDs.idMauSac.id == spctMs.idMauSac.id}">
                                    <td scope="row"><input class="${spctDs.idMauSac.tenMauSac}" name="checkBox"  type="checkbox" value="${spctDs.id}">
                                        <input name="idSpct" type="hidden" value="${spctDs.id}">
                                    </td>
                                    <td scope="row"><img style="width: 3rem ;height: 4rem"
                                                         src="/assets/images/imgSp/${spctDs.anhSanPham}"></td>
                                    <td scope="row">${spctDs.idSanPham.tenSanPham}
                                        <c:if test="${spctDs.ngayTao == newdate}"><span
                                            style="color: red"> ( New )</span></c:if>
                                    </td>
                                    <td scope="row">${spctDs.idKichThuoc.tenKichThuoc}</td>
                                    <td scope="row"><input name="giaBan" size="3px" class="form-control" value="${spctDs.giaBan}">
                                    </td>
                                    <td scope="row"><input name="soLuong" size="2px" class="form-control" value="${spctDs.soLuong}">
                                    </td>
                                    <td scope="row"><input name="moTa" size="5px" class="form-control" value="${spctDs.moTa}"></td>
                                    <td scope="row">
                                        <select name="trangThai" class="form-select form-select-sm">
                                            <option  ${spctDs.trangThai == 0 ? 'selected':''} value="0">Hoạt động
                                            </option>
                                            <option  ${spctDs.trangThai == 1 ? 'selected':''} value="1">Không hoạt
                                                động
                                            </option>
                                        </select>
                                    </td>

                                </c:if>
                            </tr>

                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </c:forEach>
        </form>

    </c:if>
    </div>

    <%--    thong bao cap nhat--%>
    <div id="successToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true"
         data-delay="1000" style="position: fixed; top: 20px; right: 20px;  z-index: 1051;background: white">
        <div class="toast-body" >

        </div>
    </div>
    <style>
        table.table {
            font-size: 14px;
            background-color: #fff;
            overflow: hidden;
        }
        table.table tbody td {
            border: none;
            padding: 10px;
            text-align: center;
        }

        table.table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }


        table.table tbody tr:hover {
            background-color: #e9ecef;
        }
        .capNhat2 {
            font-size: 14px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 1px 2px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }

        .capNhat3 {
            font-size: 14px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 1px 2px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 10px;
        }


    </style>
    <style>
        .capNhat {
            font-size: 14px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 1px 2px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin-top: 20px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
    <script>
        (() => {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            const forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>


    <script>
        <c:forEach items="${listSpctMs}" var="spctMs">
        document.getElementById('${spctMs.idMauSac}').addEventListener('change', function () {
            var checkboxes = document.getElementsByClassName('${spctMs.idMauSac.tenMauSac}');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = this.checked;
            }
        });
        </c:forEach>
    </script>
    <script>
        $(document).ready(function () {
            $('#idSanPham').select2();
        });
        $(document).ready(function () {
            $('#idMauSac').select2();
        });
        $(document).ready(function () {
            $('#idKichThuoc').select2();
        });
        $(document).ready(function () {
            $('#idLoaiSanPham').select2();
        });
        $(document).ready(function () {
            $('#idChatLieu').select2();
        });
        $(document).ready(function () {
            $('#idThuongHieu').select2();
        });

    </script>
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
            $('#capNhat').submit(function (event) {
                // Ngăn chặn hành động mặc định của form (chuyển hướng trang)
                event.preventDefault();

                // Lấy dữ liệu từ form
                var formData = $(this).serialize();

                // Thực hiện POST request thông qua Ajax
                $.ajax({
                    type: "POST",
                    url: "/san-pham-chi-tiet/capNhat",
                    data: formData,
                    success: function (response) {
                        $("#successToast .toast-body").text(response);
                        if (response === "Lưu và cập nhật thành công !") {
                            // Áp dụng style khi response bằng một giá trị cụ thể
                            $("#successToast .toast-body").css("color", "#34ce57");
                        } else {
                            // Áp dụng style khi response không bằng giá trị cụ thể
                            $("#successToast .toast-body").css("color", "red");
                        }

                        showSuccessToast();
                    },
                    error: function (error) {
                        console.error(error);
                        alert("Đã xảy ra lỗi . Vui lòng thử lại !");
                    }
                });
            });
        });
    </script>



</body>
</html>