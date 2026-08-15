<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<style>

    /* ================= SIDEBAR ================= */

    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: 270px;
        height: 100vh;

        background: #111827;
        color: white;

        display: flex;
        flex-direction: column;

        z-index: 1000;

        box-shadow: 4px 0 20px rgba(0,0,0,0.08);
    }


    /* ================= LOGO ================= */

    .logo {
        height: 82px;

        display: flex;
        align-items: center;
        justify-content: center;

        gap: 10px;

        font-size: 23px;
        font-weight: 700;
        letter-spacing: 0.5px;

        border-bottom: 1px solid rgba(255,255,255,0.08);
    }

    .logo-icon {
        width: 38px;
        height: 38px;

        border-radius: 11px;

        display: flex;
        align-items: center;
        justify-content: center;

        background: #10B981;
        color: white;

        font-size: 18px;

        box-shadow: 0 5px 15px rgba(16,185,129,0.25);
    }

    .logo-text {
        color: #ffffff;
    }

    .logo-text span {
        color: #10B981;
    }


    /* ================= MENU ================= */

    .menu {
        list-style: none;

        margin: 0;
        padding: 25px 14px;

        flex: 1;
    }

    .menu-title {
        color: #6B7280;

        font-size: 10px;
        font-weight: 700;

        text-transform: uppercase;
        letter-spacing: 1px;

        padding: 0 14px;

        margin-bottom: 12px;
    }

    .menu li {
        margin-bottom: 6px;
    }


    /* ================= MENU LINKS ================= */

    .menu a {
        position: relative;

        display: flex;
        align-items: center;

        gap: 14px;

        text-decoration: none;

        color: #9CA3AF;

        padding: 13px 15px;

        border-radius: 12px;

        font-size: 13px;
        font-weight: 500;

        transition: all 0.25s ease;
    }

    .menu a i {
        width: 20px;

        text-align: center;

        font-size: 15px;

        transition: 0.25s;
    }

    .menu a:hover {
        background: rgba(16,185,129,0.12);

        color: #ffffff;

        transform: translateX(3px);
    }

    .menu a:hover i {
        color: #10B981;
    }


    /* ================= ACTIVE DASHBOARD ================= */

    .menu a.active {
        background: #10B981;

        color: #ffffff;

        box-shadow: 0 6px 18px rgba(16,185,129,0.20);
    }

    .menu a.active i {
        color: #ffffff;
    }


    /* ================= PROFILE ================= */

    .profile {
        padding: 18px 20px;

        border-top: 1px solid rgba(255,255,255,0.08);

        background: rgba(0,0,0,0.10);
    }

    .profile-content {
        display: flex;
        align-items: center;

        gap: 11px;
    }

    .profile-avatar {
        width: 42px;
        height: 42px;

        border-radius: 50%;

        background: #10B981;

        color: white;

        display: flex;
        align-items: center;
        justify-content: center;

        font-size: 16px;
        font-weight: 700;

        flex-shrink: 0;
    }

    .profile-info {
        min-width: 0;
    }

    .profile-name {
        display: block;

        color: #ffffff;

        font-size: 13px;
        font-weight: 600;

        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .profile-role {
        display: block;

        color: #6B7280;

        font-size: 11px;

        margin-top: 2px;
    }


    /* ================= LOGOUT ================= */

    .logout-link {
        margin-top: 10px;

        display: flex;
        align-items: center;
        justify-content: center;

        gap: 7px;

        text-decoration: none;

        color: #9CA3AF;

        font-size: 11px;

        padding: 7px;

        border-radius: 8px;

        transition: 0.25s;
    }

    .logout-link:hover {
        background: rgba(239,68,68,0.10);

        color: #F87171;
    }


    /* ================= MOBILE ================= */

    @media (max-width: 992px) {

        .sidebar {
            width: 220px;
        }

        .logo {
            font-size: 20px;
        }

    }

    @media (max-width: 768px) {

        .sidebar {
            position: relative;

            width: 100%;
            height: auto;

            min-height: auto;
        }

        .menu {
            padding: 15px;
        }

        .profile {
            position: relative;
        }

    }

</style>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">


<!-- ================= LOGO ================= -->

<div class="logo">

    <div class="logo-icon">

        <i class="fa-solid fa-users"></i>

    </div>

    <div class="logo-text">

        HR<span>MS</span>

    </div>

</div>


<!-- ================= MENU ================= -->

<ul class="menu">

    <div class="menu-title">
        Main Menu
    </div>


    <!-- Dashboard -->

    <li>

        <a href="adminDashboard" class="active">

            <i class="fa-solid fa-house"></i>

            <span>Dashboard</span>

        </a>

    </li>


    <!-- Employees -->

    <li>

        <a href="adminServlet?action=viewRecentEmployees">

            <i class="fa-solid fa-user-group"></i>

            <span>Employees</span>

        </a>

    </li>


    <!-- Leave -->

    <li>

        <a href="AdminLeaveServlet?action=view">

            <i class="fa-solid fa-calendar-check"></i>

            <span>Leave Requests</span>

        </a>

    </li>


    <!-- Documents -->

    <li>

        <a href="AdminDocumentServlet">

            <i class="fa-solid fa-folder-open"></i>

            <span>Documents</span>

        </a>

    </li>


    <!-- Profile -->

    <li>

        <a href="adminProfile.jsp">

            <i class="fa-solid fa-user"></i>

            <span>Profile</span>

        </a>

    </li>

</ul>


<!-- ================= PROFILE ================= -->

<div class="profile">

    <div class="profile-content">


        <div class="profile-avatar">

            <%
                String sidebarName =
                        (String) session.getAttribute("first_name");

                if (sidebarName != null &&
                    !sidebarName.trim().isEmpty()) {
            %>

                <%= sidebarName.substring(0,1).toUpperCase() %>

            <%
                } else {
            %>

                A

            <%
                }
            %>

        </div>


        <div class="profile-info">

            <span class="profile-name">

                <%= session.getAttribute("first_name") %>

            </span>

            <span class="profile-role">

                Administrator

            </span>

        </div>

    </div>


    <!-- Logout -->

    <a href="LogoutServlet" class="logout-link">

        <i class="fa-solid fa-right-from-bracket"></i>

        Logout

    </a>

</div>


</div>
