package com.employees.dao;

import com.employees.model.Employee;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{

    private static final Logger logger = LoggerFactory.getLogger(EmployeeDaoImpl.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addEmployee(Employee employee) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(employee);
        logger.info("Employee successfully saved. Employee details: " + employee);
    }

    @Override
    public void updateEmployee(Employee employee) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(employee);
        logger.info("Employee successfully updated. Employee details: " + employee);
    }

    @Override
    public void deleteEmployeeById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.load(Employee.class, new Integer (id));
        if (employee != null) {
            session.delete(employee);
        }
        logger.info("Employee successfully removed. Employee details: " + employee);
    }

    @Override
    public Employee getEmployeeById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.load(Employee.class, new Integer (id));
        logger.info("Employee successfully loaded. Employee details: " + employee);
        return employee;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Employee> getAllEmployee() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Employee> employeeList = session.createQuery("from Employee").list();
        for (Employee employee: employeeList) {
            logger.info("Employee list: " + employee);
        }
        return employeeList;
    }
    //filter
    @Override
    @SuppressWarnings("unchecked")
    public List<Employee> findEmployeeByQuery(final String query) {
        Session session = this.sessionFactory.getCurrentSession();
        Criteria searchCriteria = session.createCriteria(Employee.class).
                add(Restrictions.disjunction().add(Restrictions.or(Restrictions.like("firstName", query + "%"),
                                                                   Restrictions.like("lastName", query + "%"))));
        return searchCriteria.list();
    }
}
