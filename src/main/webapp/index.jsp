<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>HRMS | Login</title>


<!-- Bootstrap -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">


<!-- Font Awesome -->

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>


<!-- Google Font -->

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
      rel="stylesheet">


<style>

    * {
        margin: 0;

        padding: 0;

        box-sizing: border-box;

        font-family: 'Inter', sans-serif;
    }


    body {

        min-height: 100vh;

        background:
            radial-gradient(
                circle at 10% 20%,
                rgba(16,185,129,0.08),
                transparent 30%
            ),
            radial-gradient(
                circle at 90% 80%,
                rgba(15,118,110,0.08),
                transparent 30%
            ),
            #f4f7fb;

        display: flex;

        align-items: center;

        justify-content: center;

        padding: 25px;

    }


    /* ================= MAIN CONTAINER ================= */

    .login-container {

        width: 1050px;

        min-height: 630px;

        background: white;

        border-radius: 24px;

        overflow: hidden;

        display: flex;

        box-shadow:
            0 25px 60px rgba(15,23,42,0.10);

        border: 1px solid rgba(255,255,255,0.8);

    }


    /* ================= LEFT PANEL ================= */

    .left-panel {

        width: 50%;

        position: relative;

        overflow: hidden;

        background:
            linear-gradient(
                145deg,
                #111827,
                #172033
            );

        color: white;

        padding: 55px;

        display: flex;

        flex-direction: column;

        justify-content: space-between;

    }


    /* Decorative circles */

    .circle-one {

        position: absolute;

        width: 280px;

        height: 280px;

        border-radius: 50%;

        background: rgba(16,185,129,0.08);

        top: -130px;

        right: -100px;

    }


    .circle-two {

        position: absolute;

        width: 220px;

        height: 220px;

        border-radius: 50%;

        background: rgba(16,185,129,0.06);

        bottom: -100px;

        left: -90px;

    }


    /* ================= BRAND ================= */

    .brand {

        position: relative;

        z-index: 2;

        display: flex;

        align-items: center;

        gap: 12px;

    }


    .brand-icon {

        width: 46px;

        height: 46px;

        border-radius: 13px;

        background: #10B981;

        display: flex;

        align-items: center;

        justify-content: center;

        font-size: 21px;

        box-shadow:
            0 8px 20px rgba(16,185,129,0.25);

    }


    .brand-name {

        font-size: 23px;

        font-weight: 800;

        letter-spacing: .5px;

    }


    .brand-name span {

        color: #10B981;

    }


    /* ================= LEFT CONTENT ================= */

    .left-content {

        position: relative;

        z-index: 2;

        max-width: 400px;

    }


    .left-content .small-title {

        color: #10B981;

        font-size: 12px;

        font-weight: 700;

        text-transform: uppercase;

        letter-spacing: 1.5px;

        margin-bottom: 15px;

    }


    .left-content h1 {

        font-size: 40px;

        line-height: 1.2;

        font-weight: 800;

        margin-bottom: 18px;

    }


    .left-content h1 span {

        color: #10B981;

    }


    .left-content p {

        color: #9CA3AF;

        font-size: 14px;

        line-height: 1.8;

        margin: 0;

    }


    /* ================= FEATURES ================= */

    .features {

        position: relative;

        z-index: 2;

        display: flex;

        gap: 25px;

        margin-top: 30px;

    }


    .feature {

        display: flex;

        align-items: center;

        gap: 8px;

        color: #D1D5DB;

        font-size: 11px;

    }


    .feature i {

        color: #10B981;

        font-size: 13px;

    }


    /* ================= LEFT FOOTER ================= */

    .left-footer {

        position: relative;

        z-index: 2;

        color: #6B7280;

        font-size: 11px;

    }


    /* ================= RIGHT PANEL ================= */

    .right-panel {

        width: 50%;

        padding: 55px 65px;

        display: flex;

        align-items: center;

        justify-content: center;

        background: #ffffff;

    }


    .login-box {

        width: 100%;

        max-width: 390px;

    }


    /* ================= LOGIN HEADER ================= */

    .login-header {

        margin-bottom: 30px;

    }


    .login-header h2 {

        color: #111827;

        font-size: 28px;

        font-weight: 800;

        margin-bottom: 8px;

    }


    .login-header p {

        color: #6B7280;

        font-size: 13px;

        margin: 0;

    }


    /* ================= ERROR ================= */

    .alert-danger {

        border: none;

        border-radius: 10px;

        background: #fef2f2;

        color: #b91c1c;

        font-size: 12px;

        padding: 12px 14px;

        margin-bottom: 20px;

    }


    /* ================= FORM ================= */

    .form-label {

        font-size: 12px;

        font-weight: 600;

        color: #374151;

        margin-bottom: 8px;

    }


    .input-group {

        margin-bottom: 18px;

    }


    .input-group-text {

        background: #f9fafb;

        border: 1px solid #E5E7EB;

        color: #9CA3AF;

        height: 50px;

    }


    .input-group-text:first-child {

        border-radius: 11px 0 0 11px;

        padding-left: 16px;

        padding-right: 12px;

    }


    .form-control {

        height: 50px;

        border: 1px solid #E5E7EB;

        border-left: none;

        color: #111827;

        font-size: 13px;

        box-shadow: none !important;

    }


    .form-control::placeholder {

        color: #9CA3AF;

    }


    .form-control:focus {

        border-color: #10B981;

    }


    .input-group:focus-within .input-group-text {

        border-color: #10B981;

        color: #10B981;

        background: #f0fdf9;

    }


    .eye {

        cursor: pointer;

        border-left: none;

        border-radius: 0 11px 11px 0;

        padding-left: 12px;

        padding-right: 15px;

    }


    .eye:hover {

        color: #10B981;

    }


    /* ================= LOGIN BUTTON ================= */

    .btn-login {

        width: 100%;

        height: 50px;

        border: none;

        border-radius: 11px;

        background: #111827;

        color: white;

        font-size: 13px;

        font-weight: 700;

        margin-top: 5px;

        transition: all .3s ease;

        box-shadow:
            0 7px 18px rgba(17,24,39,0.12);

    }


    .btn-login:hover {

        background: #10B981;

        transform: translateY(-2px);

        box-shadow:
            0 9px 22px rgba(16,185,129,0.20);

    }


    .btn-login:active {

        transform: translateY(0);

    }


    .btn-login i {

        margin-left: 7px;

        transition: .2s;

    }


    .btn-login:hover i {

        transform: translateX(3px);

    }


    /* ================= SECURITY INFO ================= */

    .security-info {

        display: flex;

        align-items: center;

        justify-content: center;

        gap: 7px;

        margin-top: 22px;

        color: #9CA3AF;

        font-size: 10px;

    }


    .security-info i {

        color: #10B981;

    }


    /* ================= FOOTER ================= */

    .footer {

        text-align: center;

        margin-top: 30px;

        padding-top: 20px;

        border-top: 1px solid #F3F4F6;

        color: #9CA3AF;

        font-size: 10px;

    }


    /* ================= RESPONSIVE ================= */

    @media(max-width: 900px) {

        .login-container {

            width: 100%;

            max-width: 520px;

            min-height: auto;

        }


        .left-panel {

            display: none;

        }


        .right-panel {

            width: 100%;

            padding: 50px 35px;

        }

    }


    @media(max-width: 480px) {

        body {

            padding: 15px;

        }


        .login-container {

            border-radius: 18px;

        }


        .right-panel {

            padding: 40px 25px;

        }


        .login-header h2 {

            font-size: 24px;

        }

    }

</style>


</head>

<body>

<div class="login-container">


<!-- ================= LEFT PANEL ================= -->

<div class="left-panel">


    <div class="circle-one"></div>

    <div class="circle-two"></div>


    <!-- BRAND -->

    <div class="brand">

        <div class="brand-icon">

            <i class="fa-solid fa-users"></i>

        </div>


        <div class="brand-name">

            HR<span>MS</span>

        </div>

    </div>


    <!-- MAIN CONTENT -->

    <div class="left-content">

        <div class="small-title">

            Human Resource Management System

        </div>


        <h1>

            Manage your workforce

            <span>smarter.</span>

        </h1>


        <p>

            A secure and centralized platform for managing

            employees, leave requests, documents and

            essential HR operations.

        </p>


        <div class="features">


            <div class="feature">

                <i class="fa-solid fa-circle-check"></i>

                Employee Management

            </div>


            <div class="feature">

                <i class="fa-solid fa-circle-check"></i>

                Leave Management

            </div>


        </div>

    </div>


    <!-- FOOTER -->

    <div class="left-footer">

        <i class="fa-solid fa-shield-halved me-1"></i>

        Secure Employee Portal

    </div>


</div>


<!-- ================= RIGHT PANEL ================= -->

<div class="right-panel">


    <div class="login-box">


        <!-- HEADER -->

        <div class="login-header">

            <h2>

                Welcome back

            </h2>


            <p>

                Sign in using your work credentials.

            </p>

        </div>


        <!-- ERROR -->

        <%

            String error =
                    (String)request.getAttribute("error");

            if(error != null){

        %>


        <div class="alert alert-danger">

            <i class="fa-solid fa-circle-exclamation me-2"></i>

            <%=error%>

        </div>


        <%

            }

        %>


        <!-- LOGIN FORM -->

        <form action="loginServlet" method="post">


            <!-- EMAIL -->

            <div class="mb-3">

                <label class="form-label">

                    Work Email

                </label>


                <div class="input-group">

                    <span class="input-group-text">

                        <i class="fa-solid fa-envelope"></i>

                    </span>


                    <input

                            type="email"

                            name="work_email"

                            class="form-control"

                            placeholder="Enter your work email"

                            autocomplete="email"

                            required>

                </div>

            </div>


            <!-- PASSWORD -->

            <div class="mb-3">

                <label class="form-label">

                    Password

                </label>


                <div class="input-group">

                    <span class="input-group-text">

                        <i class="fa-solid fa-lock"></i>

                    </span>


                    <input

                            type="password"

                            id="password"

                            name="password"

                            class="form-control"

                            placeholder="Enter your password"

                            autocomplete="current-password"

                            required>


                    <span

                            class="input-group-text eye"

                            onclick="togglePassword()">


                        <i

                                class="fa-solid fa-eye"

                                id="eye">

                        </i>


                    </span>

                </div>

            </div>


            <!-- LOGIN BUTTON -->

            <button

                    type="submit"

                    class="btn btn-login">


                Login

                <i class="fa-solid fa-arrow-right"></i>


            </button>


        </form>


        <!-- SECURITY -->

        <div class="security-info">

            <i class="fa-solid fa-lock"></i>

            Your connection is protected and secure

        </div>


        <!-- FOOTER -->

        <div class="footer">

            © 2026 HRMS · Secure Employee Portal

        </div>


    </div>

</div>


</div>

<!-- ================= PASSWORD SCRIPT ================= -->

<script>

    function togglePassword(){

        let pass =
            document.getElementById("password");

        let eye =
            document.getElementById("eye");


        if(pass.type === "password"){

            pass.type = "text";

            eye.classList.remove("fa-eye");

            eye.classList.add("fa-eye-slash");

        }

        else{

            pass.type = "password";

            eye.classList.remove("fa-eye-slash");

            eye.classList.add("fa-eye");

        }

    }

</script>

</body>

</html>
