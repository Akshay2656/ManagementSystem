package admin;

import authentication.GmailSender;
import dao.EmployeeDao;
import entity.Employee;
import jakarta.mail.MessagingException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.PasswordUtil;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    EmployeeDao employeeDao = new EmployeeDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if("viewAllEmployee".equals(action)){
            try{
                viewAllEmployee(req, resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        else if("searchEmployee".equals(action)){
            try{
                searchEmployee(req, resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        else if("viewRecentEmployee".equals(action)){
            try {
                viewRecentEmployee(req, resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        else if("viewRecentLeaves".equals(action)){
            try{
                viewRecentLeave(req, resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminDashboard.jsp");
            requestDispatcher.forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("addEmployee".equals(action)){
            try {
                addEmployee(req, resp);
            } catch (Exception e) {
                e.printStackTrace();

                req.setAttribute("error", "Unable to add Employee");
                req.getRequestDispatcher("addEmployee.jsp").forward(req, resp);
            }
        }

    }

    public void addEmployee(HttpServletRequest req, HttpServletResponse resp) throws SQLException, NoSuchAlgorithmException, ClassNotFoundException, MessagingException, UnsupportedEncodingException {
        resp.setContentType("text/html");

        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String personal_email = req.getParameter("personal_email");
        String work_email = req.getParameter("work_email");
        String password = PasswordUtil.generatePassword();
        String phone = req.getParameter("phone");
        String department = req.getParameter("department");
        String designation = req.getParameter("designation");
        java.sql.Date joiningDate = java.sql.Date.valueOf(req.getParameter("joiningDate"));
        double salary = Double.parseDouble(req.getParameter("salary"));

        boolean status = employeeDao.addEmployee(first_name, last_name, personal_email, work_email, password, phone, department, designation, joiningDate,salary);

        if (status){
            String subject = "Welcome to the Company";

            String message =
                    "Dear " + first_name + " " + last_name + ",\n\n"
                            + "Congratulations! Your employee account has been created.\n\n"
                            + "Work Email : " + work_email + "\n"
                            + "Password   : " + password + "\n\n"
                            + "Please login using the above credentials and change your password after your first login.\n\n"
                            + "Regards,\n"
                            + "HR Team";

            System.out.println("Employee Added Successfully");
            System.out.println("Sending email to: "+personal_email);

            GmailSender.sendEmail(personal_email, subject, message);

            System.out.println("Email send successfully");
        }
    }

    public void viewAllEmployee(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        resp.setContentType("text/html");
        String status = req.getParameter("status");
        List<Employee> employees;
        employees = employeeDao.getEmployeeByStatus(status);
        req.setAttribute("employees", employees);
        req.getRequestDispatcher("viewEmployees.jsp").forward(req, resp);

    }

    public void searchEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        resp.setContentType("text/html");
        String work_email = req.getParameter("work_email");
        Employee employee = employeeDao.getEmployeeByWorkEmail(work_email);
        req.setAttribute("employee", employee);
        req.getRequestDispatcher("searchEmployee.jsp").forward(req, resp);
    }

    public void viewRecentEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        resp.setContentType("text/html");
        List<Employee> recentEmployee = employeeDao.getRecentEmployee();
        req.setAttribute("recentEmployees", recentEmployee);
        req.getRequestDispatcher("employee.jsp").forward(req, resp);
    }

    public void viewRecentLeave(HttpServletRequest req, HttpServletResponse resp){

    }


}
