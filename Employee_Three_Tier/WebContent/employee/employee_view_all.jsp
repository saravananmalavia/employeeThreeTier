<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="com.concept.bl.*,com.concept.dto.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee</title>
</head>

<body>
<table width="100%" height="688" border="0">
  <tbody>
    <tr>
      <td height="684" align="center" valign="top"><table width="100%" border="0">
        <tbody>
          <tr>
            <td height="138" align="center" valign="middle" bgcolor="#E7BF09"><h1 style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif; font-size: xx-large;">Student Information System</h1></td>
          </tr>
          <tr>
            <td height="530" align="center" valign="top"><table width="100%" border="0">
              <tbody>
                <tr>
                  <td height="33" align="center" valign="middle">
                  	<%@ include file="../includes/menu.jsp" %>
                  </td>
                </tr>
                <tr>
                  <td height="33" align="center" valign="middle" style="font-family: Cambria, 'Hoefler Text', 'Liberation Serif', Times, 'Times New Roman', serif; font-weight: bold; font-size: large;">Student Details </td>
                </tr>
                <tr>
                  <td height="33" align="center" valign="middle" style="color: #F70509">
          <% 
                  
                  if(session.getAttribute("message") !=null)
                  {
                 	out.println( (String)session.getAttribute("message") );
                 	session.removeAttribute("message");
                  }
                  
                  %>
                  
                  </td>
                </tr>
                <tr>
                  <td height="33" align="center" valign="middle">
					  <form id="form1" name="form1" method="post">
					    <table width="80%" border="1" align="center" bordercolor="#E7BF09" borde>
					      <tbody style="">
					        <tr>
					          <td width="11%" height="33" align="center" valign="middle" bgcolor="#E7BF09" style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">Employee ID</td>
					          <td width="16%" align="center" valign="middle" bgcolor="#E7BF09"><span style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">Employee Name </span></td>
					          <td width="12%" align="center" valign="middle" bgcolor="#E7BF09"><span style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">Basic Pay </span></td>
					          <td width="12%" align="center" valign="middle" bgcolor="#E7BF09" style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">HRA</td>
					          <td width="11%" align="center" valign="middle" bgcolor="#E7BF09"><span style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">Net Pay</span></td>
					          <td width="20%" align="center" valign="middle" bgcolor="#E7BF09"><span style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">
					          
					          Edit</a>
					          </span></td>
					          <td width="18%" align="center" valign="middle" bgcolor="#E7BF09"><span style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">
					          DELETE</span></td>
					          </tr>
					          
					           <%
					           ArrayList<Employee> employees=null;
					           
					 			employees=EmployeeBl.getEmployees();
					 			
							 if(employees!=null && (employees.size()>0))
							  {
								 
						          for(Employee employee : employees)
								  {
								    %>
								 
					          
					          
					        <tr>
					          <td height="30"><%=employee.getEmployeeId()  %></td>
					          <td><%=employee.getEmployeeName()%></td>
					          <td><%=employee.getBasicPay()  %></td>
					          <td ><%=employee.getHra()  %></td>
					          <td><%=employee.getNetPay()  %></td>
					          <td >					          <a href="employee_edit.jsp?employeeId=<%=employee.getEmployeeId()%>">Edit</a></td>
					          <td>					          <a href="employee_delete.jsp?employeeId=<%=employee.getEmployeeId()%>">Delete</a></td>
					          </tr>
					          <%
								  }
					          
					          
					          
							  }
							 else
							 {
								 %>
								 
								 <tr>
						          <td colspan="7"> There is No Record</td>
						          </tr>
						          <%	 
							 }
					          %>
					     
					        </tbody>
					      </table>
						  
						  
                      </form></td>
                </tr>
                <tr>
                  <td height="33" align="center" valign="middle">&nbsp;</td>
                </tr>
              </tbody>
            </table></td>
          </tr>
          <tr>
            <td align="center" valign="top"><table width="100%" border="0">
              <tbody>
                <tr>
                  <td align="center" valign="middle" bgcolor="#000000">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" valign="middle" bgcolor="#E7BF09">concept solutions &copy;2018</td>
                </tr>
              </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
</body>
</html>