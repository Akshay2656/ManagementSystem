<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="entity.LeaveRequest" %>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%
    if (session == null || session.getAttribute("work_email") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String name = (String) session.getAttribute("first_name");

    if (name == null || name.trim().isEmpty()) {
        name = "Administrator";
    }
%>

<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<title>Admin Dashboard</title>

<!-- Bootstrap -->
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

<!-- Font Awesome -->
<link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        background: #f4f7fb;
        font-family: "Segoe UI", Arial, sans-serif;
        color: #1f2937;
    }

    /* ================= MAIN CONTENT ================= */

    .content {
        margin-left: 270px;
        padding: 32px;
        min-height: 100vh;
    }

    /* ================= TOP HEADER ================= */

    .top-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 28px;
    }

    .page-title h1 {
        font-size: 28px;
        font-weight: 700;
        margin: 0;
        color: #111827;
    }

    .page-title p {
        margin: 6px 0 0;
        color: #6b7280;
        font-size: 14px;
    }

    .admin-profile {
        display: flex;
        align-items: center;
        gap: 12px;
        background: #ffffff;
        padding: 9px 15px 9px 9px;
        border-radius: 50px;
        box-shadow: 0 4px 18px rgba(0, 0, 0, 0.06);
    }

    .admin-avatar {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        background: #10b981;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 700;
        font-size: 17px;
    }

    .admin-info {
        line-height: 1.2;
    }

    .admin-info strong {
        display: block;
        font-size: 14px;
        color: #111827;
    }

    .admin-info span {
        font-size: 12px;
        color: #6b7280;
    }

    /* ================= WELCOME BANNER ================= */

    .welcome {
        position: relative;
        overflow: hidden;
        background: linear-gradient(135deg, #0f766e, #10b981);
        padding: 30px 34px;
        border-radius: 20px;
        margin-bottom: 28px;
        color: white;
        box-shadow: 0 10px 30px rgba(16, 185, 129, 0.20);
    }

    .welcome::before {
        content: "";
        position: absolute;
        width: 220px;
        height: 220px;
        border-radius: 50%;
        background: rgba(255,255,255,0.08);
        right: 40px;
        top: -120px;
    }

    .welcome::after {
        content: "";
        position: absolute;
        width: 160px;
        height: 160px;
        border-radius: 50%;
        background: rgba(255,255,255,0.06);
        right: -30px;
        bottom: -80px;
    }

    .welcome-content {
        position: relative;
        z-index: 2;
    }

    .welcome h2 {
        margin: 0;
        font-size: 25px;
        font-weight: 700;
    }

    .welcome p {
        margin: 8px 0 0;
        font-size: 14px;
        opacity: 0.9;
    }

    .welcome-icon {
        position: absolute;
        right: 45px;
        bottom: 20px;
        font-size: 70px;
        opacity: 0.15;
    }

    /* ================= SECTION TITLE ================= */

    .section-heading {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 16px;
    }

    .section-heading h4 {
        font-size: 18px;
        font-weight: 700;
        margin: 0;
        color: #111827;
    }

    .section-heading span {
        font-size: 13px;
        color: #9ca3af;
    }

    /* ================= ACTION CARDS ================= */

    .dashboard-card {
        position: relative;
        background: #ffffff;
        border-radius: 18px;
        padding: 24px;
        height: 100%;
        border: 1px solid #eef1f5;
        box-shadow: 0 5px 20px rgba(15, 23, 42, 0.05);
        transition: all 0.3s ease;
        overflow: hidden;
    }

    .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 28px rgba(15, 23, 42, 0.10);
        border-color: #d1fae5;
    }

    .card-icon {
        width: 52px;
        height: 52px;
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 18px;
        font-size: 22px;
    }

    .employee-icon {
        background: #ecfdf5;
        color: #10b981;
    }

    .leave-icon {
        background: #eff6ff;
        color: #3b82f6;
    }

    .document-icon {
        background: #fff7ed;
        color: #f97316;
    }

    .dashboard-card h5 {
        font-size: 17px;
        font-weight: 700;
        margin-bottom: 8px;
        color: #111827;
    }

    .dashboard-card p {
        font-size: 13px;
        line-height: 1.6;
        color: #6b7280;
        min-height: 42px;
        margin-bottom: 18px;
    }

    .dashboard-card a {
        text-decoration: none;
        font-size: 13px;
        font-weight: 600;
        color: #10b981;
        display: inline-flex;
        align-items: center;
        gap: 6px;
        transition: 0.2s;
    }

    .dashboard-card a:hover {
        gap: 10px;
    }

    /* ================= LEAVE SECTION ================= */

    .leave-section {
        margin-top: 30px;
        background: #ffffff;
        border-radius: 20px;
        border: 1px solid #eef1f5;
        box-shadow: 0 5px 20px rgba(15, 23, 42, 0.05);
        overflow: hidden;
    }

    .leave-header {
        padding: 22px 25px;
        border-bottom: 1px solid #eef1f5;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .leave-title {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .leave-title-icon {
        width: 40px;
        height: 40px;
        border-radius: 11px;
        background: #ecfdf5;
        color: #10b981;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .leave-title h5 {
        margin: 0;
        font-size: 16px;
        font-weight: 700;
        color: #111827;
    }

    .leave-title span {
        display: block;
        font-size: 12px;
        color: #9ca3af;
        margin-top: 3px;
    }

    .view-all {
        text-decoration: none;
        font-size: 13px;
        font-weight: 600;
        color: #10b981;
    }

    .view-all:hover {
        color: #047857;
    }

    /* ================= TABLE ================= */

    .table-container {
        padding: 5px 10px 10px;
    }

    .table {
        margin: 0;
    }

    .table thead th {
        background: #f9fafb;
        color: #6b7280;
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-weight: 700;
        border: none;
        padding: 15px;
    }

    .table tbody td {
        vertical-align: middle;
        padding: 17px 15px;
        font-size: 13px;
        color: #374151;
        border-bottom: 1px solid #f1f3f5;
    }

    .table tbody tr {
        transition: 0.2s;
    }

    .table tbody tr:hover {
        background: #f9fffc;
    }

    .table tbody tr:last-child td {
        border-bottom: none;
    }

    /* ================= EMPLOYEE NAME ================= */

    .employee-cell {
        display: flex;
        align-items: center;
        gap: 10px;
        font-weight: 600;
        color: #111827;
    }

    .employee-mini-avatar {
        width: 34px;
        height: 34px;
        border-radius: 50%;
        background: #ecfdf5;
        color: #059669;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 13px;
        font-weight: 700;
    }

    /* ================= STATUS ================= */

    .badge {
        border-radius: 20px;
        padding: 7px 12px;
        font-size: 11px;
        font-weight: 600;
    }

    /* ================= EMPTY STATE ================= */

    .empty-state {
        padding: 45px 20px !important;
        text-align: center;
        color: #9ca3af !important;
    }

    .empty-state i {
        display: block;
        font-size: 30px;
        margin-bottom: 10px;
        color: #d1d5db;
    }

    /* ================= RESPONSIVE ================= */

    @media (max-width: 992px) {

        .content {
            margin-left: 0;
            padding: 25px;
        }

        .top-header {
            align-items: flex-start;
        }

        .admin-profile {
            display: none;
        }

    }

    @media (max-width: 768px) {

        .content {
            padding: 18px;
        }

        .page-title h1 {
            font-size: 23px;
        }

        .welcome {
            padding: 25px;
        }

        .welcome h2 {
            font-size: 21px;
        }

        .welcome-icon {
            display: none;
        }

        .table-container {
            overflow-x: auto;
        }

        .table {
            min-width: 700px;
        }

    }

</style>


</head>

<body>

<!-- ================= NAVBAR ================= -->

<%@ include file="adminNavbar.jsp"%>

<!-- ================= MAIN CONTENT ================= -->

<div class="content">


<!-- ================= TOP HEADER ================= -->

<div class="top-header">

    <div class="page-title">

        <h1>Admin Dashboard</h1>

        <p>Overview of your HR management system</p>

    </div>

    <div class="admin-profile">

        <div class="admin-avatar">
            <%= name.substring(0, 1).toUpperCase() %>
        </div>

        <div class="admin-info">

            <strong><%= name %></strong>

            <span>Administrator</span>

        </div>

    </div>

</div>


<!-- ================= WELCOME ================= -->

<div class="welcome">

    <div class="welcome-content">

        <h2>
            Welcome back, <%= name %> 👋
        </h2>

        <p>
            Manage employees, leave requests and documents from one place.
        </p>

    </div>

    <i class="fa-solid fa-chart-line welcome-icon"></i>

</div>


<!-- ================= QUICK ACTIONS ================= -->

<div class="section-heading">

    <h4>Quick Actions</h4>

    <span>Manage your HR operations</span>

</div>


<div class="row g-4">


    <!-- ================= EMPLOYEES ================= -->

    <div class="col-lg-4 col-md-6">

        <div class="dashboard-card">

            <div class="card-icon employee-icon">

                <i class="fa-solid fa-users"></i>

            </div>

            <h5>Employees</h5>

            <p>
                Add, update and manage employee information
                from the employee management section.
            </p>

            <a href="adminServlet?action=viewRecentEmployees">

                Manage Employees

                <i class="fa-solid fa-arrow-right"></i>

            </a>

        </div>

    </div>


    <!-- ================= LEAVE ================= -->

    <div class="col-lg-4 col-md-6">

        <div class="dashboard-card">

            <div class="card-icon leave-icon">

                <i class="fa-solid fa-calendar-check"></i>

            </div>

            <h5>Leave Requests</h5>

            <p>
                Review employee leave requests and
                approve or reject them.
            </p>

            <a href="AdminLeaveServlet?action=view">

                View Requests

                <i class="fa-solid fa-arrow-right"></i>

            </a>

        </div>

    </div>


    <!-- ================= DOCUMENTS ================= -->

    <div class="col-lg-4 col-md-6">

        <div class="dashboard-card">

            <div class="card-icon document-icon">

                <i class="fa-solid fa-folder-open"></i>

            </div>

            <h5>Documents</h5>

            <p>
                Upload and manage important employee
                documents securely.
            </p>

            <a href="AdminDocumentServlet">

                Open Documents

                <i class="fa-solid fa-arrow-right"></i>

            </a>

        </div>

    </div>


</div>


<!-- ================= RECENT LEAVE REQUESTS ================= -->

<div class="leave-section">

    <div class="leave-header">

        <div class="leave-title">

            <div class="leave-title-icon">

                <i class="fa-solid fa-calendar-check"></i>

            </div>

            <div>

                <h5>Recent Leave Requests</h5>

                <span>Latest employee leave activity</span>

            </div>

        </div>

        <a
                href="AdminLeaveServlet?action=view"
                class="view-all">

            View All

            <i class="fa-solid fa-arrow-right ms-1"></i>

        </a>

    </div>


    <div class="table-container">

        <table class="table table-hover align-middle">

            <thead>

            <tr>

                <th>Employee</th>

                <th>Leave Type</th>

                <th>Start Date</th>

                <th>End Date</th>

                <th>Status</th>

            </tr>

            </thead>


            <tbody>

            <%

                List<LeaveRequest> recentLeaves =
                        (List<LeaveRequest>) request.getAttribute("recentLeaves");

                if (recentLeaves != null && !recentLeaves.isEmpty()) {

                    for (LeaveRequest leave : recentLeaves) {

            %>


            <tr>

                <td>

                    <div class="employee-cell">

                        <div class="employee-mini-avatar">

                            <%
                                String employeeName = leave.getEmployeeName();

                                if (employeeName != null && !employeeName.trim().isEmpty()) {
                            %>

                                <%= employeeName.substring(0, 1).toUpperCase() %>

                            <%
                                } else {
                            %>

                                ?

                            <%
                                }
                            %>

                        </div>

                        <%= leave.getEmployeeName() %>

                    </div>

                </td>


                <td>

                    <%= leave.getLeaveType() %>

                </td>


                <td>

                    <%= leave.getStartDate() %>

                </td>


                <td>

                    <%= leave.getEndDate() %>

                </td>


                <td>

                    <span class="badge bg-success">

                        <%= leave.getStatus() %>

                    </span>

                </td>

            </tr>


            <%

                    }

                } else {

            %>


            <tr>

                <td colspan="5" class="empty-state">

                    <i class="fa-regular fa-calendar-xmark"></i>

                    No recent leave requests

                </td>

            </tr>


            <%

                }

            %>

            </tbody>

        </table>

    </div>

</div>


</div>

<!-- Bootstrap JS -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>
