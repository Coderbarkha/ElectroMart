<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.lang.*, javax.servlet.http.*, javax.servlet.*" %>

<%
    String fullname = request.getParameter("fullname");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    String phone = request.getParameter("phone");
    String payment = request.getParameter("payment");
    String productid = request.getParameter("productid");

    // Get final price from session (either discounted or full price)
    Double price = (Double) session.getAttribute("finalPrice");
    if (price == null) {
        price = 100.0; // Default price if not set
    }

    // Store final price in session for future use (e.g., for payment)
    session.setAttribute("finalPrice", price);

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");

        // Include price column
        PreparedStatement stmt = con.prepareStatement(
            "INSERT INTO buy (id, fullname, address, city, pincode, phone_number, payment_method, productid, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        
        stmt.setInt(1, 0); // auto_increment
        stmt.setString(2, fullname);
        stmt.setString(3, address);
        stmt.setString(4, city);
        stmt.setString(5, pincode);
        stmt.setString(6, phone);
        stmt.setString(7, payment);
        stmt.setString(8, productid);
        stmt.setDouble(9, price != null ? price : 0.0); // fallback to 0.0 if price is not available

        int i = stmt.executeUpdate();
        if (i > 0) {
%>
            <%@ include file="payment_Successfully.html" %>
<%
        } else {
            out.println("Order failed!");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
    
    %>
