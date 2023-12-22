<%@page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <title>Dashboard - SB Admin</title>

</head>
<style>
    /* Định nghĩa CSS cho nút và biểu tượng */
    .property-button {
        padding: 10px;
        margin: 5px;
        border: 1px solid #ccc;
        background-color: #f0f0f0;
        cursor: pointer;
        border-radius: 5px;
        text-align: left;
    }

    /* Định nghĩa CSS cho biểu tượng */
    .icon {
        margin-right: 5px;
    }
</style>
<body style="display: flex ; flex-direction: column ; gap: 1rem ; align-content: center ;padding: 3rem 3rem 3rem 5rem ">

<div style="display: flex ; flex-direction: row ; gap :20px">
    <div>
        <button class="property-button" onclick="openPopupSp()">
            <i class="icon bi bi-box"></i>
            Sản phẩm
        </button>
    </div>
    <div>
        <button class="property-button" onclick="openPopupKt()">
            <i class="icon bi bi-arrows-angle-contract"></i>
            Kích thước
        </button>
    </div>
    <div>
        <button class="property-button" onclick="openPopupLsp()">
            <i class="icon bi bi-grid-1x2"></i>
            Loại sản phẩm
        </button>
    </div>

</div>

<div style="display: flex ; flex-direction: row ; gap :20px">
    <div>
        <button class="property-button" onclick="openPopupCl()">
            <i class="icon bi bi-file-earmark-text"></i>
            Chất liệu
        </button>
    </div>
    <div>
        <button class="property-button" onclick="openPopupTh()">
            <i class="icon bi bi-hdd"></i>
            Thương hiệu
        </button>
    </div>
    <div>
        <button class="property-button" onclick="openPopupMs()">
            <i class="icon bi bi-palette"></i>
            Màu sắc
        </button>
    </div>

</div>
</div>

</body>
<script>
    let popupWindow = null;

    function openPopupKt() {
        if (popupWindow && !popupWindow.closed) {
            alert('Vui lòng đóng cửa sổ hiện tại trước khi mở cửa sổ mới.');
            return;
        }
        // Đường link cần dẫn đến
        var linkToOpen = 'http://localhost:8080/kich-thuoc/hien-thi';

        // Kích thước cửa sổ nhỏ
        var popupWidth = 600;
        var popupHeight = 400;

        // Tính toán vị trí trung tâm của màn hình
        var screenWidth = window.screen.width;
        var screenHeight = window.screen.height;

        var leftPosition = (screenWidth - popupWidth) / 2;
        var topPosition = (screenHeight - popupHeight) / 2;

        // Tạo một sự kiện (event) mới
        var clickEvent = new MouseEvent('click', {
            bubbles: true,
            cancelable: true,
            view: window
        });

        // Mở cửa sổ nhỏ và dẫn đến đường link khi nhận sự kiện click
        document.body.addEventListener('click', function () {
            popupWindow = window.open(linkToOpen, '_blank', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition);

            // Tối ưu hóa cửa sổ nhỏ hiện tại
            if (popupWindow && popupWindow.focus) {
                popupWindow.focus();
            }
        }, {once: true});

        // Gửi sự kiện click cho document
        document.body.dispatchEvent(clickEvent);
    }

    function openPopupSp() {
        if (popupWindow && !popupWindow.closed) {
            alert('Vui lòng đóng cửa sổ hiện tại trước khi mở cửa sổ mới.');
            return;
        }
        // Đường link cần dẫn đến
        var linkToOpen = 'http://localhost:8080/san-pham/index';

        // Kích thước cửa sổ nhỏ
        var popupWidth = 600;
        var popupHeight = 400;

        // Tính toán vị trí trung tâm của màn hình
        var screenWidth = window.screen.width;
        var screenHeight = window.screen.height;

        var leftPosition = (screenWidth - popupWidth) / 2;
        var topPosition = (screenHeight - popupHeight) / 2;

        // Tạo một sự kiện (event) mới
        var clickEvent = new MouseEvent('click', {
            bubbles: true,
            cancelable: true,
            view: window
        });

        // Mở cửa sổ nhỏ và dẫn đến đường link khi nhận sự kiện click
        document.body.addEventListener('click', function () {
            popupWindow = window.open(linkToOpen, '_blank', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition);

            // Tối ưu hóa cửa sổ nhỏ hiện tại
            if (popupWindow && popupWindow.focus) {
                popupWindow.focus();
            }
        }, {once: true});

        // Gửi sự kiện click cho document
        document.body.dispatchEvent(clickEvent);
    }

    function openPopupTh() {
        // Đường link cần dẫn đến
        if (popupWindow && !popupWindow.closed) {
            alert('Vui lòng đóng cửa sổ hiện tại trước khi mở cửa sổ mới.');
            return;
        }
        var linkToOpen = 'http://localhost:8080/thuong-hieu/hien-thi';

        // Kích thước cửa sổ nhỏ
        var popupWidth = 600;
        var popupHeight = 400;

        // Tính toán vị trí trung tâm của màn hình
        var screenWidth = window.screen.width;
        var screenHeight = window.screen.height;

        var leftPosition = (screenWidth - popupWidth) / 2;
        var topPosition = (screenHeight - popupHeight) / 2;

        // Tạo một sự kiện (event) mới
        var clickEvent = new MouseEvent('click', {
            bubbles: true,
            cancelable: true,
            view: window
        });

        // Mở cửa sổ nhỏ và dẫn đến đường link khi nhận sự kiện click
        document.body.addEventListener('click', function () {
            popupWindow = window.open(linkToOpen, '_blank', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition);

            // Tối ưu hóa cửa sổ nhỏ hiện tại
            if (popupWindow && popupWindow.focus) {
                popupWindow.focus();
            }
        }, {once: true});

        // Gửi sự kiện click cho document
        document.body.dispatchEvent(clickEvent);
    }

    function openPopupMs() {
        if (popupWindow && !popupWindow.closed) {
            alert('Vui lòng đóng cửa sổ hiện tại trước khi mở cửa sổ mới.');
            return;
        }
        // Đường link cần dẫn đến
        var linkToOpen = 'http://localhost:8080/mau-sac/hien-thi';

        // Kích thước cửa sổ nhỏ
        var popupWidth = 600;
        var popupHeight = 400;

        // Tính toán vị trí trung tâm của màn hình
        var screenWidth = window.screen.width;
        var screenHeight = window.screen.height;

        var leftPosition = (screenWidth - popupWidth) / 2;
        var topPosition = (screenHeight - popupHeight) / 2;

        // Tạo một sự kiện (event) mới
        var clickEvent = new MouseEvent('click', {
            bubbles: true,
            cancelable: true,
            view: window
        });

        // Mở cửa sổ nhỏ và dẫn đến đường link khi nhận sự kiện click
        document.body.addEventListener('click', function () {
            popupWindow = window.open(linkToOpen, '_blank', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition);

            // Tối ưu hóa cửa sổ nhỏ hiện tại
            if (popupWindow && popupWindow.focus) {
                popupWindow.focus();
            }
        }, {once: true});

        // Gửi sự kiện click cho document
        document.body.dispatchEvent(clickEvent);
    }

    function openPopupLsp() {
        if (popupWindow && !popupWindow.closed) {
            alert('Vui lòng đóng cửa sổ hiện tại trước khi mở cửa sổ mới.');
            return;
        }
        // Đường link cần dẫn đến
        var linkToOpen = 'http://localhost:8080/loai-san-pham/hien-thi';

        // Kích thước cửa sổ nhỏ
        var popupWidth = 600;
        var popupHeight = 400;

        // Tính toán vị trí trung tâm của màn hình
        var screenWidth = window.screen.width;
        var screenHeight = window.screen.height;

        var leftPosition = (screenWidth - popupWidth) / 2;
        var topPosition = (screenHeight - popupHeight) / 2;

        // Tạo một sự kiện (event) mới
        var clickEvent = new MouseEvent('click', {
            bubbles: true,
            cancelable: true,
            view: window
        });

        // Mở cửa sổ nhỏ và dẫn đến đường link khi nhận sự kiện click
        document.body.addEventListener('click', function () {
            popupWindow = window.open(linkToOpen, '_blank', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition);

            // Tối ưu hóa cửa sổ nhỏ hiện tại
            if (popupWindow && popupWindow.focus) {
                popupWindow.focus();
            }
        }, {once: true});

        // Gửi sự kiện click cho document
        document.body.dispatchEvent(clickEvent);
    }

    function openPopupCl() {
        if (popupWindow && !popupWindow.closed) {
            alert('Vui lòng đóng cửa sổ hiện tại trước khi mở cửa sổ mới.');
            return;
        }
        // Đường link cần dẫn đến
        var linkToOpen = 'http://localhost:8080/chat-lieu/index';

        // Kích thước cửa sổ nhỏ
        var popupWidth = 600;
        var popupHeight = 400;

        // Tính toán vị trí trung tâm của màn hình
        var screenWidth = window.screen.width;
        var screenHeight = window.screen.height;

        var leftPosition = (screenWidth - popupWidth) / 2;
        var topPosition = (screenHeight - popupHeight) / 2;

        // Tạo một sự kiện (event) mới
        var clickEvent = new MouseEvent('click', {
            bubbles: true,
            cancelable: true,
            view: window
        });

        // Mở cửa sổ nhỏ và dẫn đến đường link khi nhận sự kiện click
        document.body.addEventListener('click', function () {
            popupWindow = window.open(linkToOpen, '_blank', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition);

            // Tối ưu hóa cửa sổ nhỏ hiện tại
            if (popupWindow && popupWindow.focus) {
                popupWindow.focus();
            }
        }, {once: true});

        // Gửi sự kiện click cho document
        document.body.dispatchEvent(clickEvent);
    }
</script>
</html>
