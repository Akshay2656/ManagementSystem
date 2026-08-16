<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>

    <title>Add Employee</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>

        body{
            background:#F5F7FA;
        }

        .content{
            margin-left:270px;
            padding:35px;
        }

        .card-box{

            background:white;
            border-radius:18px;
            padding:35px;
            box-shadow:0 5px 20px rgba(0,0,0,.08);

        }

        h2{

            color:#111827;
            font-weight:bold;
            margin-bottom:30px;

        }

        .form-label{

            font-weight:600;
            color:#374151;

        }

        .form-control,
        .form-select{

            border-radius:10px;

        }

        .btn-success{

            padding:10px 25px;
            border-radius:10px;

        }

        .btn-secondary{

            padding:10px 25px;
            border-radius:10px;

        }

    </style>

</head>

<body>

<%@ include file="adminNavbar.jsp"%>

<div class="content">

<div class="card-box">

<h2>

<i class="fa-solid fa-user-plus text-success"></i>

Add New Employee

</h2>
<%
String success = (String) request.getAttribute("Success");
String error = (String) request.getAttribute("Error");
%>

<% if(success != null) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= success %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
<% } %>

<% if(error != null) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
<% } %>


<form action="adminServlet" method="post">

<input type="hidden" name="action" value="addEmployee">

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">

First Name

</label>

<input type="text"
       name="first_name"
       class="form-control"
       required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Last Name

</label>

<input type="text"
       name="last_name"
       class="form-control"
       required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Personal Email

</label>

<input type="email"
       name="personal_email"
       class="form-control"
       required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Work Email

</label>

<input type="email"
       name="work_email"
       class="form-control"
       required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Phone Number

</label>

<input type="text"
       name="phone"
       class="form-control"
       maxlength="10"
        required>


</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Department

</label>

<select name="department" class="form-select" required>

<option value="">Select Department</option>
<option>Human Resources</option>
<option>Information Technology</option>
<option>Finance</option>
<option>Sales</option>
<option>Marketing</option>

</select>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Designation

</label>

<input type="text"
       name="designation"
       class="form-control"
       required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Joining Date

</label>

<input type="date"
       name="joiningDate"
       class="form-control"
       required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Salary

</label>

<input type="number"
       name="salary"
       class="form-control"
       step="1"
       required>

</div>

</div>

<div class="mt-4">

<button type="submit"
        class="btn btn-success">

<i class="fa-solid fa-floppy-disk"></i>

Save Employee

</button>

<a href="employee.jsp"
   class="btn btn-secondary">

Cancel

</a>

</div>

</form>

</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>