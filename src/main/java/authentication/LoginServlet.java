package authentication;

import dao.EmployeeDao;
import entity.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

    EmployeeDao employeeDao = new EmployeeDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            login(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    protected void login(HttpServletRequest req,
                         HttpServletResponse resp) throws Exception {

        String work_email = req.getParameter("work_email");
        String password = req.getParameter("password");

        boolean validUser = employeeDao.validateUser(work_email, password);

        System.out.println(validUser);

        String role = employeeDao.getRole(work_email);

        Employee employee = employeeDao.getEmployeeByEmail(work_email);

        HttpSession session = req.getSession();
        session.setAttribute("employee", employee);
        session.setAttribute("emp_id", employee.getEmp_id());
        session.setAttribute("first_login", employee.getFirst_name());
        session.setAttribute("last_name", employee.getLast_name());
        session.setAttribute("work_email", employee.getWork_email());
        session.setAttribute("designation", employee.getDesignation());
        session.setAttribute("phone", employee.getPhone());
        session.setAttribute("role", role);

        if("ADMIN".equalsIgnoreCase(role)){
            resp.sendRedirect("adminDashboard");
        }
        else {
            boolean firstLogin = employeeDao.checkLoginStatus(work_email);

            if(firstLogin){
                resp.sendRedirect("resetPassword.jsp?work_email=" + work_email);
                employeeDao.updatePassword(work_email, password);
            }
            resp.sendRedirect("EmployeeDashboardServlet");
        }
    }
}

