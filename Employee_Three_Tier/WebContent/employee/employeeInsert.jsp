<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.concept.bl.*,com.concept.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee</title>

<script src="../resources/js/validation.js">
</script>
</head>

<body>
<table width="100%" height="688" border="0">
  <tbody>
    <tr>
      <td height="684" align="center" valign="top"><table width="100%" border="0">
        <tbody>
          <tr>
            <td height="138" align="center" valign="middle" bgcolor="#E7BF09"><h1 style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif; font-size: xx-large;">Employee Information System</h1></td>
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
                  <td height="33" align="center" valign="middle" style="font-family: Cambria, 'Hoefler Text', 'Liberation Serif', Times, 'Times New Roman', serif; font-weight: bold; font-size: large;">Employee Details Insert</td>
                </tr>
                <tr>
                  <td height="33" align="center" valign="middle" style="color: #F70509">message</td>
                </tr>
                <tr>
                
                <%!
                String semployeeId,semployeeName,sbasicPay;
                String eemployeeId,eemployeeName,ebasicPay;
                boolean ErrorFlag=false;
                boolean sErrorFlag=false;
                
                int basicPay;
                
                
                %>
                
                <%
                if(request.getParameter("submit")!=null)
                {
                	semployeeId="";semployeeName="";sbasicPay="";
                	eemployeeId="";eemployeeName="";ebasicPay="";
                	  ErrorFlag=false;
               	   sErrorFlag=false;
                	
                	try
                	{
                		
                		semployeeId=request.getParameter("employeeId");
                		semployeeName=request.getParameter("employeeName");
                		sbasicPay=request.getParameter("basicPay");
                		
                		
                		if(semployeeId.equals(""))
           		    	{
                			eemployeeId="ID should not be empty";
           		    	    sErrorFlag=true;
           		    	}
                		
                		if(semployeeName.equals(""))
           		    	{
                			eemployeeName="Name should not be empty";
           		    	    sErrorFlag=true;
           		    	}
                		if(sbasicPay.equals(""))
           		    	{
                			ebasicPay="Basic Pay should not be empty";
           		    	    sErrorFlag=true;
           		    	}
                		
                		if(!sErrorFlag)
           		    	{
            		 
                			basicPay= Integer.parseInt(sbasicPay);
                			
							if((basicPay <0 || basicPay > 100000 ))
                		    	
                		    {
                		    	ErrorFlag =true;
                		    	ebasicPay ="basicPay should be between (1-100000)";
                		    }
							
							 if(!ErrorFlag)
	                		    {
								 System.out.println("Success");
								 
								 Employee employee= null;
								 int result=0;
								 
								 try
								 {
									 employee= new Employee();
									 employee.setEmployeeId(semployeeId);
									 employee.setEmployeeName(semployeeName);
									 employee.setBasicPay(basicPay);
									 
									 result= EmployeeBl.employee_insert(employee);
									 
									 if(result>0)
									 {
									    	session.setAttribute("message", "employee details added successfully!");
				                 				  
									 }
									 else
										 
									 {
										
									    	session.setAttribute("message", "please try again later!");
						                 	 
									 }
									 
									 response.sendRedirect("employee_view_all.jsp");
									 
									 
								 }
								 catch(Exception e)
								 {
					System.out.println("***Error : employeeIsert.jsp "+e.getMessage());
										
									 
									 
								 }
								 
								 
								 
	                		    }
							 
           		    	}
                		
                		
                	
                }
        	    catch(NumberFormatException e)
        	    {
        	    	ebasicPay = "basic pay should be positive integer";
        	    	System.out.println("ebasicPay"+ e.getMessage());
        	    }
                	catch(Exception e)
                	{
                		
                		System.out.println("Error :" + e.getMessage());
                		
                	}
                	
                }
                else
                {
             	  
             	   ErrorFlag=false;
             	   sErrorFlag=false;
             	  semployeeId="";semployeeName="";sbasicPay="";
              	eemployeeId="";eemployeeName="";ebasicPay="";
               
                }
                
                
                %>
                
                
                
                
                
                
                
                
                
                  <td height="33" align="center" valign="middle">
                  <form id="form1" name="form1" method="post">
					<!--   <form id="form1" name="form1" method="post" onsubmit="return validate();">--> 
					    <table width="100%" border="0">
					      <tbody>
					        <tr>
					          <td width="11%" height="30">&nbsp;</td>
					          <td width="11%">&nbsp;</td>
					          <td width="11%">&nbsp;</td>
					          <td width="17%" align="left" valign="middle" style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">Employee ID</td>
					          <td width="1%">&nbsp;</td>
					          <td width="16%" align="left" valign="middle">
					            <input type="text" name="employeeId" id="employeeId" value='<%=semployeeId%>'>
					           
					          
					           <td width="26%" align="left" valign="middle" style="color: #F70509" ><%=eemployeeId%>
					      <span id="EemployeeId" style="color:red; visibility:hidden">ID should not be empty</span>
        </td>
					          
					       
					            
					          <td width="11%">&nbsp;</td>
					          <td width="11%">&nbsp;</td>
					          <td width="11%">&nbsp;</td>
					          </tr>
					        <tr>
					          <td height="30">&nbsp;</td>
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          <td align="left" valign="middle" style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">Employee Name					          </td>
					          <td>&nbsp;</td>
					          <td align="left" valign="middle"><input type="text" name="employeeName" id="employeeName" value='<%=semployeeName%>'>
					          
					          </td>
					          
					           <td width="26%" align="left" valign="middle" style="color: #F70509" ><%=eemployeeName%>
					         <span id="EemployeeName" style="color:red; visibility:hidden">Name should not be empty</span>
					             </td>
					          
					       
					         
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          </tr>
					        <tr>
					          <td height="30">&nbsp;</td>
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          <td align="left" valign="middle" style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">Basic Pay				          </td>
					          <td>&nbsp;</td>
					          <td align="left" valign="middle"><input type="text" name="basicPay" id="basicPay" value='<%=sbasicPay%>'>
					          
					              <span id="EbasicPay" style="color:red; visibility:hidden">Basic Pay should not be an Integer</span>
					   
					          </td>
					          
					           <td width="26%" align="left" valign="middle" style="color: #F70509" ><%=ebasicPay%>
					        <span id="EbasicPay" style="color:red; visibility:hidden">Basic Pay should not be an Integer</span>
					       </td>
					           
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          </tr>
					       
					        <tr>
					          <td height="30">&nbsp;</td>
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          <td align="left" valign="middle" style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif">&nbsp;</td>
					          <td>&nbsp;</td>
					          <td align="left" valign="middle"><input type="submit" name="submit" id="submit" value="Submit"></td>
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          <td>&nbsp;</td>
					          </tr>
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
