<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import="java.lang.*" %>
<%@ page import="java.sql.*" %>

<% 
String uname= request.getParameter("username");


String password= request.getParameter("pass");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart","root","Barkha@241");
	PreparedStatement stmt=con.prepareStatement("select * from register where username=? and  password=?");


	stmt.setString(1,uname);
	stmt.setString(2,password);
	ResultSet rs=stmt.executeQuery();
	if(rs.next()){
		
		//String name=rs.getString(1);
		session.setAttribute("uname",uname);
		response.sendRedirect("buypreview.jsp");
		
	}
	else{
		
		
		System.out.println("Username or Password is not correct");
		%>
		<%@ include file="register.html"%>
		<%
	}
}
catch(Exception e)
{
 	out.println(e);
}
%>
