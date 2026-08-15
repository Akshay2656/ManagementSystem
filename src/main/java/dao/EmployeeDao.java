package dao;

import config.DatabaseConnection;
import entity.Employee;
import util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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





}
