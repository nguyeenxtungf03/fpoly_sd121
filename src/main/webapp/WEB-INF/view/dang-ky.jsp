<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="/assets/css/login.css" />    <title>HASH TECHIE OFFICIAL</title>
</head>

<body>
<section style=" background:url('/assets/images/Gucci_HP_Desktop_CinamaticLandscape_Gucci-Sustainable-Horsebit-Nov23-SHOT-6-A.png')">
    <div class="form-box">
        <div class="form-value">
            <form method="POST" action="/auth/dang-ky" id="registerForm" modelAttribute="registerForm">
                <h2>Đăng ký</h2>
                <div class="inputbox">
                    <ion-icon name="mail-outline"></ion-icon>
                    <input type="text" id="tenTaiKhoan" name="tenTaiKhoan" required />
                    <label for="tenTaiKhoan">Tài khoản</label>
                </div>
                <div class="inputbox">
                    <input type="password" id="matKhau" name="matKhau" required />
                    <label for="matKhau">Mật khẩu</label>
                </div>
                <div class="inputbox">
                    <input type="text" id="sdt" name="sdt" required />
                    <label for="sdt">Số điện thoại</label>
                </div>

                <button style="color: darkgray">Đăng ký</button>
                <br />
                <br />
                <div style="display: flex; justify-content:space-between ;">
                    <a style="color: azure" href="/auth/dang-nhap">Đăng nhập</a>
                    <a style="color: azure" href="">Quên mật khẩu</a>
                </div>
            </form>
        </div>
    </div>
    <div class="block-content">
        <div
                class="actions-toolbar social-btn social-btn-actions-toolbar facebook-login"
        >
            <a class="btn btn-block btn-social btn-facebook">
                <span class="fa fa-facebook"></span>
            </a>
        </div>
        <div
                class="actions-toolbar social-btn social-btn-actions-toolbar google-login"
        >
            <a class="btn btn-block btn-social btn-google">
                <span class="fa fa-google"></span>
            </a>
        </div>
    </div>
</section>
<script src="main.js"></script>
<script
        type="module"
        src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
></script>
<script
        nomodule
        src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
></script>
</body>
</html>
