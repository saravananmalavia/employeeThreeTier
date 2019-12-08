package com.concept.bl;

import java.util.ArrayList;

import com.concept.dao.*;
import com.concept.dto.Employee;

public class EmployeeBl {
	
	public  static int employee_insert(Employee employee)
	{	
		int result=0;
		
		try
		{
		employee.setHra(employee.getBasicPay()*10/100);
		employee.setNetPay(employee.getBasicPay() + employee.getHra());
		
		result= EmployeeDao.employee_insert(employee);
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeBl :employee_insert :"+e.getMessage());
		}
		
		return result;
		
	}
	
	public  static int employee_update(Employee employee)
	{	
		int result=0;
		
		try
		{
		employee.setHra(employee.getBasicPay()*10/100);
		employee.setNetPay(employee.getBasicPay() + employee.getHra());
		
		result= EmployeeDao.employee_update(employee);
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeBl :employee_update :"+e.getMessage());
		}
		
		return result;
		
	}
	
	public static int employee_delete(String employeeId)
	{	
		int result=0;
		
		try
		{
		
		result= EmployeeDao.employee_delete(employeeId);
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeBl :employee_delete :"+e.getMessage());
		}
		
		return result;
		
	}
	
	public static Employee getEmployee(String employeeId)
	{	
		Employee employee=null;
		
		try
		{
		
			employee= EmployeeDao.getEmployee(employeeId);
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeBl :getEmployee :"+e.getMessage());
		}
		
		return employee;
		
	}
	
	
	public  static ArrayList<Employee> getEmployees()
	{	
		ArrayList<Employee> employeeList=null;
		
		try
		{
		
			employeeList= EmployeeDao.getEmployees();
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeBl :getEmployees :"+e.getMessage());
		}
		
		return employeeList;
		
	}

}
