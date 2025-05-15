<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
     <%@page import="java.lang.*" %>

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phoneno = request.getParameter("phoneno");
	String uname = request.getParameter("username");
	String password = request.getParameter("pass");
	String confirmpass = request.getParameter("confirmpass");
	
	 
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart","root","Barkha@241");
		PreparedStatement stmt=con.prepareStatement("insert into register (full_name, email_address, phone_number, username, password, confirm_password) values(?,?,?,?,?,?)");
		
		stmt.setString(1,name);
		stmt.setString(2,email);
		stmt.setString(3,phoneno);
		stmt.setString(4,uname);
		stmt.setString(5,password);
		stmt.setString(6,confirmpass);
		 int i=stmt.executeUpdate();
		 if (i > 0) {
			 %>
				<%@ include file="index.html"%>
				<%
	        } else {
	            out.println("Registration failed!");
	        }

	}
	catch (Exception e) {
	    e.printStackTrace();  // This will print the stack trace to the console or logs
	    out.println("Error: " + e.getMessage());
	}

	out.print(email);

%>


</html>
