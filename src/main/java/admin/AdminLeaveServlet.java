package admin;

import dao.LeaveDao;
import employee.EmployeeLeaveServlet;
import entity.Employee;
import entity.LeaveRequest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminLeaveServlet")
public class AdminLeaveServlet extends HttpServlet {
    private LeaveDao leaveDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if(session == null){
            resp.sendRedirect("index.jsp");
            return;
        }

        Employee employee = (Employee) session.getAttribute("employee");
        if(employee == null || !employee.getRole().equalsIgnoreCase("ADMIN")){
            resp.sendRedirect("index.jsp");
            return;
        }

        String action = req.getParameter("action");
        if(action == null){
            action == "view";
        }

        try{
            switch (action){
                case "approve":
                    approveLeave(req,resp);
                    break;

                case "reject":
                    rejectLeave(req, resp);
                    break;

                default:
                    viewLeaves(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void viewLeaves(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<LeaveRequest> leaveLists = leaveDao.getAllLeaves();
        req.setAttribute("leaveList", leaveLists);
        req.getRequestDispatcher("adminLeaves.jsp").forward(req, resp);
    }

    private void rejectLeave(HttpServletRequest req, HttpServletResponse resp) {
        int leaveId = Integer.parseInt(req.getParameter("id"));
        leaveDao.updateLeaveStatus("APPROVED", leaveId);

    }

    private void approveLeave(HttpServletRequest req, HttpServletResponse resp) {

    }
}
