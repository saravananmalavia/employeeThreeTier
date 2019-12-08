<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.concept.bl.*,com.concept.dto.*,java.util.*"%>
    %>
<%!
String employeeId="";
int result=0;
%>
<%
employeeId=request.getParameter("employeeId");

result=EmployeeBl.employee_delete(employeeId);

		if(result>0)
		 {
		 	session.setAttribute("message", "Employee details deleted  successfully!");
		 }
		 else
		 {
		   	session.setAttribute("message", "Please try again later!");
		 }

	response.sendRedirect("employee_view_all.jsp");

%>
    