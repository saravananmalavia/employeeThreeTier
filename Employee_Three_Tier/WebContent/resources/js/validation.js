/**
 * 
 */


 function validate()
            {
            
            	var employeeName= document.getElementById("employeeName");
            	var employeeId= document.getElementById("employeeId");
                var basicPay = document.getElementById("basicPay");
                
                var ibasicPay= document.getElementById("basicPay").value;
               
                var valid = true;
               
                
                document.getElementById("EemployeeId").style.visibility = "hidden";
                document.getElementById("EemployeeName").style.visibility = "hidden";
                document.getElementById("EbasicPay").style.visibility = "hidden";
          
                if(employeeName.value.length<=0 )
                {
            	 document.getElementById("EemployeeName").style.visibility = "visible";
                    //alert("Don't leave the field empty!");
                    valid = false;
                 
                }
                if(employeeId.value.length<=0 )
                {
            	 document.getElementById("EemployeeId").style.visibility = "visible";
                    //alert("Don't leave the field empty!");
                    valid = false;
                 
                }
                
                if(basicPay.value.length<=0 )
                    {
                	 document.getElementById("EbasicPay").style.visibility = "visible";
                        //alert("Don't leave the field empty!");
                        valid = false;
                     
                    }
               
                
                if(isNaN(ibasicPay))
            	{
            	document.getElementById("EbasicPay").style.visibility = "visible";
                 //alert(imark1);
                 valid = false;
             
            	
            	}
               
                return valid;
            };
