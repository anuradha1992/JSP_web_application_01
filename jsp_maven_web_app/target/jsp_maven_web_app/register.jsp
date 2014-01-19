<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager.*" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import = "java.lang.Integer"%>
<%@ page import = "java.util.*"%>
<%

        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String confirmedPassword=request.getParameter("confirmedPassword");
        String firstName=request.getParameter("firstName");
        String lastName=request.getParameter("lastName");
        String dob=request.getParameter("dob");
        String email=request.getParameter("email");
        String billingAddress=request.getParameter("billingAddress");

        
        if(username == "" || password == "" || firstName == "" || lastName == "" || confirmedPassword == ""){
        
            	request.setAttribute("userMessage", "One or more required data have not being filled!");
            	request.setAttribute("userName", username);
            	request.setAttribute("userPassword", password);
            	request.setAttribute("userConfirmedPassword", confirmedPassword);
            	request.setAttribute("userFirstName", firstName);
            	request.setAttribute("userLastName", lastName);
            	request.setAttribute("userDOB", dob);
            	request.setAttribute("userEmail", email);
            	request.setAttribute("userBillingAddress", billingAddress);
            	request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else{
        		int userExists = 0;
        		try{
        			Connection con=null;
                	PreparedStatement ps=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","sql");
                    
                    Statement st=con.createStatement();
                    ResultSet rst = st.executeQuery("select * from users");
                    String existing_user=null;
                    
                    while (rst.next()) {
                    	existing_user = rst.getString("username");
                    	if(username.equalsIgnoreCase(existing_user)){
                    		userExists = 1;
                    		break;
                    	}
                    }
        		}catch(Exception e){
        			out.println(e);
                	e.printStackTrace();
        		}
        		
                if(userExists != 0){
                	request.setAttribute("userMessage", "Username already exists!"); 
                	request.setAttribute("userName", username);
                	request.setAttribute("userPassword", password);
                	request.setAttribute("userConfirmedPassword", confirmedPassword);
                	request.setAttribute("userFirstName", firstName);
                	request.setAttribute("userLastName", lastName);
                	request.setAttribute("userDOB", dob);
                	request.setAttribute("userEmail", email);
                	request.setAttribute("userBillingAddress", billingAddress);
                	request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
        		else if(!password.equals(confirmedPassword)){
            		request.setAttribute("userMessage", "Please confirm password correctly!");
                	request.setAttribute("userName", username);
                	request.setAttribute("userPassword", password);
                	request.setAttribute("userConfirmedPassword", confirmedPassword);
                	request.setAttribute("userFirstName", firstName);
                	request.setAttribute("userLastName", lastName);
                	request.setAttribute("userDOB", dob);
                	request.setAttribute("userEmail", email);
                	request.setAttribute("userBillingAddress", billingAddress);
                	request.getRequestDispatcher("/index.jsp").forward(request, response);
            	}else{
            		int dateValidation = 1;
                    String[] parts = dob.split("/");
                    int day=Integer.parseInt(parts[0]);
                    int month=Integer.parseInt(parts[1]);
                    int year= Integer.parseInt(parts[2]); 
                    Calendar now = Calendar.getInstance();   
                    int currentYear = now.get(Calendar.YEAR);
                    
                    if(day<1 || day>31){
                    	dateValidation = 0;
                    }else if(month<1 || month>12){
                    	dateValidation = 0;
                    }else if(year > currentYear || year < (currentYear - 100)){
                    	dateValidation = 0;
                    }
                    
                    if(dateValidation  != 1){
                    	request.setAttribute("userMessage", "Invalid date entry!");
                    	request.setAttribute("userName", username);
                    	request.setAttribute("userPassword", password);
                    	request.setAttribute("userConfirmedPassword", confirmedPassword);
                    	request.setAttribute("userFirstName", firstName);
                    	request.setAttribute("userLastName", lastName);
                    	request.setAttribute("userDOB", dob);
                    	request.setAttribute("userEmail", email);
                    	request.setAttribute("userBillingAddress", billingAddress);
                    	request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }else{
                    	try{
                    		Connection con=null;
                        	PreparedStatement ps=null;
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","sql");
                            Statement st=con.createStatement();
                            int insertResult =  st.executeUpdate("insert into users (username,password,confirmed_password,first_name,last_name,regdate,email,billing_address) values ('"+username+"','"+password+"','"+confirmedPassword+"','"+firstName+"','"+lastName+"','"+dob+"','"+email+"','"+billingAddress+"')");
                            if (insertResult!=0)
                            {
                                out.println("Successfully registered!");
                			%>
                				<hr><a href="index.jsp">Return to registration form</a>
                			<%
                                }
                            
                        }catch(Exception e){
                        	out.println(e);
                        	e.printStackTrace();
                        }
                    }
                    
            	}
                
        }
        	    
        
%>  
</body>
</html>