package entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Stack;

public class Employee {

    private int emp_id;
    private String first_name;
    private String last_name;
    private String personal_email;
    private String work_email;
    private String password;
    private String phone;
    private String designation;
    private String department;
    private String role;
    private String status;
    private boolean firstLogin;
    private Date joiningDate;
    private double salary;
    private Timestamp createdAt;

    public Employee(){}

    public Employee(int emp_id, String first_name, String last_name, String personal_email, String work_email, String password, String phone, String designation, String department, String role, String status, boolean firstLogin, Date joiningDate, double salary, Timestamp createdAt) {
        this.emp_id = emp_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.personal_email = personal_email;
        this.work_email = work_email;
        this.password = password;
        this.phone = phone;
        this.designation = designation;
        this.department = department;
        this.role = role;
        this.status = status;
        this.firstLogin = firstLogin;
        this.joiningDate = joiningDate;
        this.salary = salary;
        this.createdAt = createdAt;
    }

    public int getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(int emp_id) {
        this.emp_id = emp_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getPersonal_email() {
        return personal_email;
    }

    public void setPersonal_email(String personal_email) {
        this.personal_email = personal_email;
    }

    public String getWork_email() {
        return work_email;
    }

    public void setWork_email(String work_email) {
        this.work_email = work_email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isFirstLogin() {
        return firstLogin;
    }

    public void setFirstLogin(boolean firstLogin) {
        this.firstLogin = firstLogin;
    }

    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
