<%@page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/login.css" />

</head>
<body>
<section style=" background:url('/assets/images/Gucci_HP_Desktop_CinamaticLandscape_Gucci-Sustainable-Horsebit-Nov23-SHOT-6-A.png')">
    <div class="form-box">
        <div class="form-value">
            <form method="post" action="/login">
                <h2>Đăng nhập</h2>
                <div class="inputbox">
                    <ion-icon name="mail-outline"></ion-icon>
                    <input type="text" id="username" name="username" required />
                    <label for="username">Tài khoản</label>
                </div>
                <div class="inputbox">
                    <input type="password" id="password" name="password" required />
                    <label for="password">Mật khẩu</label>
                </div>


                <button type="submit" style="color: darkgray">Đăng nhập</button>
                <br />
                <br />
                <div style="display: flex; justify-content:space-between ;">
                    <a style="color: azure" href="/auth/dang-ky">Đăng ký</a>
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



</html>
