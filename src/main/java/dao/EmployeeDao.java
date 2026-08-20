package dao;

import config.DatabaseConnection;
import entity.Employee;
import util.PasswordUtil;

import javax.swing.text.html.HTMLDocument;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmployeeDao {

    public boolean validateUser(String workEmail, String password) throws SQLException, ClassNotFoundException {
        String sql = "Select * from employees where work_email = ? and password = ?";

        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, workEmail);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                return true;
            }
            return false;
        }
    }

    public String getRole(String workEmail) throws Exception {
        String sql = "Select role from employees where work_email = ?";

        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            statement.setString(1, workEmail);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                return resultSet.getString("role");
            }
        }
        return null;
    }

    public Employee getEmployeeByEmail(String workEmail) throws Exception {
        String sql = "Select * from employees where work_email = ?";

        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            statement.setString(1, workEmail);
            ResultSet resultSet = statement.executeQuery();
            Employee employee = null;

            if (resultSet.next()){
                employee = new Employee();

                employee.setEmp_id(resultSet.getInt("emp_id"));
                employee.setFirst_name(resultSet.getString("first_name"));
                employee.setLast_name(resultSet.getString("last_name"));
                employee.setPersonal_email(resultSet.getString("personal_email"));
                employee.setWork_email(resultSet.getString("work_email"));
                employee.setPhone(resultSet.getString("phone"));
                employee.setDepartment(resultSet.getString("department"));
                employee.setDepartment(resultSet.getString("designation"));
                employee.setRole(resultSet.getString("role"));
                employee.setStatus(resultSet.getString("status"));
                employee.setJoiningDate(resultSet.getDate("joining_date"));
                employee.setSalary(resultSet.getDouble("salary"));

            }
            return employee;
        }
    }

    public boolean checkLoginStatus(String workEmail) throws SQLException, ClassNotFoundException {
        String sql = "Select first_login From employees where work_email = ?";
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            statement.setString(1, workEmail);
            ResultSet resultSet = statement.executeQuery();

            boolean firstLogin = false;

            if(resultSet.next()){
                firstLogin = resultSet.getBoolean("first_login");
            }
            return firstLogin;
        }
    }

    public void updatePassword(String word_email, String newPassword) throws Exception {
        String sql = "update employees set password = ?, first_login = 0 where work_email = ?";

        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            statement.setString(1, PasswordUtil.hash(newPassword));
            statement.setString(2, word_email);

            statement.executeQuery();
        }
    }

    public boolean addEmployee(String first_name, String last_name, String personal_email, String work_email, String password, String phone, String department, String designation , Date joiningDate, double salary) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
        String sql = "Insert into employees(first_name, last_name, personal_email, work_email, password, phone, department, designation, joining_date, salary) values(?,?,?,?,?,?,?,?,?,?)";

        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            statement.setString(1, first_name);
            statement.setString(2, last_name);
            statement.setString(3, personal_email);
            statement.setString(4, work_email);
            statement.setString(5, PasswordUtil.hash(password));
            statement.setString(6, phone);
            statement.setString(7, department);
            statement.setString(8, designation);
            statement.setDate(9, (java.sql.Date) joiningDate);
            statement.setDouble(10, salary);

            int rows = statement.executeUpdate();
            return rows > 0;
        }
    }


    public List<Employee> getEmployeeByStatus(String status) throws SQLException, ClassNotFoundException {
        String sql = "select * from employees where status = ?";

        List<Employee> employeeList = new ArrayList<>();

        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            ResultSet resultSet = statement.executeQuery();
            if( resultSet.next()){
                Employee employee = new Employee();

                employee.setEmp_id(resultSet.getInt("emp_id"));
                employee.setFirst_name(resultSet.getString("first_name"));
                employee.setLast_name(resultSet.getString("last_name"));
                employee.setWork_email(resultSet.getString("work_email"));
                employee.setDepartment(resultSet.getString("department"));
                employee.setDepartment(resultSet.getString("designation"));
                employee.setStatus(resultSet.getString("status"));

                employeeList.add(employee);
            }
            return employeeList;
        }
    }


    public Employee getEmployeeByWorkEmail(String workEmail) throws SQLException, ClassNotFoundException {
        String sql = "select * from employees where work_email = ?";

        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                Employee employee = new Employee();

                employee.setEmp_id(resultSet.getInt("emp_id"));
                employee.setFirst_name(resultSet.getString("first_name"));
                employee.setLast_name(resultSet.getString("last_name"));
                employee.setPersonal_email(resultSet.getString("personal_email"));
                employee.setWork_email(resultSet.getString("work_email"));
                employee.setPhone(resultSet.getString("phone"));
                employee.setDepartment(resultSet.getString("department"));
                employee.setDesignation(resultSet.getString("designation"));
                employee.setStatus(resultSet.getString("status"));

                return employee;
            }
        }
        return null;
    }


    public List<Employee> getRecentEmployee() throws SQLException, ClassNotFoundException {
        String sql = "select * from employees order by emp_id limit 4";

        List<Employee> recentEmployee = new ArrayList<>();
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Employee employee = new Employee();

                employee.setEmp_id(resultSet.getInt("emp_id"));
                employee.setFirst_name(resultSet.getString("first_name"));
                employee.setLast_name(resultSet.getString("last_name"));
                employee.setWork_email(resultSet.getString("work_email"));
                employee.setDepartment(resultSet.getString("department"));
                employee.setDesignation(resultSet.getString("designation"));
                employee.setStatus(resultSet.getString("status"));

                recentEmployee.add(employee);
            }
        }
        return recentEmployee;
    }






}
