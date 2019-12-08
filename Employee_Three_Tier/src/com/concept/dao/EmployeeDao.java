package com.concept.dao;

import java.sql.*;
import com.concept.dto.*;


import java.util.*;
public class EmployeeDao {
	
	
	
	public static  int employee_insert(Employee employee)
	{	
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con=null;
		
		try
		{
			con=DBHelper.getConnection();
			query = "INSERT INTO employee_salay(employeeId,employeeName,basicPay,hra,netPay)VALUES(?,?,?,?,?)";
			
			ps=con.prepareStatement(query);
			ps.setString(1, employee.getEmployeeId());
			ps.setString(2, employee.getEmployeeName());
			ps.setInt(3, employee.getBasicPay());
			ps.setInt(4, employee.getHra());
			ps.setInt(5, employee.getNetPay());
			
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeDao :employee_insert :"+e.getMessage());
		}
		
		return result;
		
	}
	
	public static int employee_update(Employee employee)
	{	int result=0;
	
		String query;
		PreparedStatement ps=null;
		Connection con=null;
		
		try
		{
	query = "UPDATE employee_salay SET employeeName=?,basicPay=?,hra=?,netPay=? WHERE employeeId=?";
		

	con=DBHelper.getConnection();
			ps=con.prepareStatement(query);
		
			ps.setString(1, employee.getEmployeeName());
			ps.setInt(2, employee.getBasicPay());
			ps.setInt(3, employee.getHra());
			ps.setInt(4, employee.getNetPay());
			ps.setString(5, employee.getEmployeeId());
			
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeDao :employee_update :"+e.getMessage());
		}
		return result;
		
	}
	
	
	public static int employee_delete(String employeeId)
	{	int result=0;
	String query;
	PreparedStatement ps=null;
	Connection con=null;
	
		try
		{
			con=DBHelper.getConnection();
			query = "delete from employee_salay where employeeId=?";
			ps=con.prepareStatement(query);
			ps.setString(1, employeeId);
			result = ps.executeUpdate();
			ps.close();
		    con.close();
			
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeDao :employee_delete :"+e.getMessage());
		}
		return result;
		
	}
	
	public static Employee getEmployee(String employeeId)
	{		Employee employee= null;
	
			Connection con=null;
			Statement statement =null;
			ResultSet resultSet=null;
			
		try
		{
			String sql = "SELECT * FROM employee_salay WHERE employeeId='" + employeeId + "'";
	        con=DBHelper.getConnection();
	        statement = con.createStatement();
	        resultSet = statement.executeQuery(sql);
	         if(resultSet.next()) {
	        	 employee = new Employee();
	        	 employee.setEmployeeId(resultSet.getString("employeeId"));
	        	 employee.setEmployeeName(resultSet.getString("employeeName"));
	        	 employee.setBasicPay(resultSet.getInt("basicPay"));
	        	 employee.setHra(resultSet.getInt("hra"));
	        	 employee.setNetPay(resultSet.getInt("netPay"));
		           
	         }
	         
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeDao :getEmployee :"+e.getMessage());
		}
		return employee;
		
	}
	
	public static ArrayList<Employee> getEmployees()
	{	
		
		ArrayList<Employee> employeeList=null;

		Connection con=null;
		Statement statement =null;
		ResultSet resultSet=null;
		Employee employee= null;
		
		try
		{
			String sql = "SELECT * FROM employee_salay";
	        con=DBHelper.getConnection();
	        statement = con.createStatement();
	        resultSet = statement.executeQuery(sql);
	        
	        employeeList = new ArrayList<Employee>();
	        
	         while(resultSet.next()) {
	        	 employee = new Employee();
	        	 employee.setEmployeeId(resultSet.getString("employeeId"));
	        	 employee.setEmployeeName(resultSet.getString("employeeName"));
	        	 employee.setBasicPay(resultSet.getInt("basicPay"));
	        	 employee.setHra(resultSet.getInt("hra"));
	        	 employee.setNetPay(resultSet.getInt("netPay"));
	        	 
	        	 employeeList.add(employee);
		           
	         }
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("***Error : EmployeeDao :getEmployees :"+e.getMessage());
		}
		return employeeList;
		
	}
	
	

}
