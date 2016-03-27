package com.employees.service;

import com.employees.dao.EmployeeDao;
import com.employees.model.Employee;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService{

    private EmployeeDao employeeDao;

    public void setEmployeeDao(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }

    @Override
    @Transactional
    public void addEmployee(Employee employee) {
        this.employeeDao.addEmployee(employee);
    }

    @Override
    @Transactional
    public void updateEmployee(Employee employee) {
        this.employeeDao.updateEmployee(employee);
    }

    @Override
    @Transactional
    public void deleteEmployeeById(int id) {
        this.employeeDao.deleteEmployeeById(id);
    }

    @Override
    @Transactional
    public Employee getEmployeeById(int id) {
        return this.employeeDao.getEmployeeById(id);
    }

    @Override
    @Transactional
    public List<Employee> getAllEmployee() {
        return this.employeeDao.getAllEmployee();
    }

    @Override
    @Transactional
    public List<Employee> findEmployeeByQuery(String query) {
        return this.employeeDao.findEmployeeByQuery(query);
    }
}
