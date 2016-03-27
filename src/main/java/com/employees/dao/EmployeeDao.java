package com.employees.dao;

import com.employees.model.Employee;

import java.util.List;

/**
 * Created by User on 22.03.2016.
 */
public interface EmployeeDao {

    void addEmployee(Employee employee);

    void updateEmployee(Employee employee);

    void deleteEmployeeById(int id);

    Employee getEmployeeById(int id);

    List<Employee> getAllEmployee();

    List<Employee> findEmployeeByQuery(String query);
}
