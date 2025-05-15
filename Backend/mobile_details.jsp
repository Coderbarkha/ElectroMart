<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Mobile Details</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .add-to-cart-btn{
    background: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
    }
    .add-to-cart-btn a{
    text-decoration:none;
    color:white;
    }
  .btn {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
        }
        .btn:hover {
            background: #0056b3;
        }
.product-container {
    display: flex;
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
    background: #fff;
}
.product-image img {
    max-width: 300px;
    border-radius: 5px;
}
.product-details {
    margin-left: 20px;
}
    </style>
</head>
<body>
<header class="header">
        <div class="top-bar">
            <div class="logo">
                <h1><span class="e">Electro</span><span class="m">Mart</span></h1>
            </div>

            <nav class="navbar">
                <ul class="nav-links">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="allproducts.jsp">Products</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li><a href="about.html">About</a></li>
                </ul>

                <div class="user-section">
                    <button class="signin-btn"><a href="login.html">Log Out</a></button>
                    <a href="viewCart.jsp"><i class="fas fa-shopping-cart cart-icon"></i></a>
                </div>
            </nav>
        </div>
    </header>

    <!-- Sub Category Bar -->
    <div class="sub-category-bar">
        <ul class="category-list">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle">All <i class="fa-solid fa-caret-down"></i></a>
                <ul class="dropdown-menu">
                    <li><a href="mobiles.jsp">Mobiles</a></li>
                    <li><a href="laptop.html">Laptops</a></li>
                    <li><a href="accessories.html">Accessories</a></li>
                    <li><a href="home-appliances.html">Home Appliances</a></li>
                </ul>
            </li>
            <li><a href="fresh.html">Fresh</a></li>
            
            <li><a href="bestseller.jsp">Best Seller</a></li>
            <li><a href="deals.html">Today's Deals</a></li>
            <li><a href="new-release.html">New Release</a></li>
        </ul>
    </div>



<%
    String productId = request.getParameter("productId");
    String tableName = "mobile_details"; // Or fetch from request if you're passing it

    String jdbcURL = "jdbc:mysql://localhost:3306/electromart";
    String dbUser = "root";
    String dbPassword = "Barkha@241";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Validate and sanitize table name before using it directly
        if(!tableName.matches("^[a-zA-Z_]+$")) {
            throw new Exception("Invalid table name");
        }

        String sql = "SELECT * FROM " + tableName + " WHERE product_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        rs = pstmt.executeQuery();

        if(rs.next()) {
        	
            String name = rs.getString("product_name");
            String brand = rs.getString("brand");
            String display = rs.getString("display");
            String processor = rs.getString("processor");
            String storage = rs.getString("storage");
            String features = rs.getString("features");
            double price = rs.getDouble("price");
            String imageUrl = rs.getString("image_url"); // Fetch the image URL
%>
<div class="product-container">
   
    <div class="product-image">
    <img src="<%= imageUrl %>" alt="<%= name %>" style="max-width: 300px;"> <!-- Display image -->
    </div>
     <div class="product-details">
    <div class="product-name"><h1><%= name %></h1></div>
    <p id="product-brand"><strong>Brand:</strong> <%= brand %></p>
    <p><strong>Display:</strong> <%= display %></p>
    <p><strong>Processor:</strong> <%= processor %></p>
    <p><strong>Storage:</strong> <%= storage %></p>
    <p><strong>Features:</strong> <%= features %></p>
    <p id="product-price"><strong>Price:</strong> ₹<%= price %></p>
	 <button id="add-to-cart-btn" class="add-to-cart-btn">
    <a href="allproducts.jsp">Check out to see products</a>
 </div>
</div> 
<%
        } else {
            out.println("<p>No product found.</p>");
        }
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>


    <!-- footer section -->
    <footer class="footer">
     <div class="footer-container">
       <div class="footer-about">
         <h3>About Us</h3>
         <p>Your one-stop online store for all your shopping needs. We deliver quality products at the best prices.</p>
       </div>
   
       <div class="footer-links">
         <h3>Quick Links</h3>
         <ul>
           <li><a href="#">Home</a></li>
           <li><a href="#">Products</a></li>
           <li><a href="#">Contact</a></li>
           <li><a href="#">Login/Register</a></li>
         </ul>
       </div>
   
       <div class="footer-contact">
         <h3>Contact Us</h3>
         <p><strong>Phone:</strong> +91-9876543210</p>
         <p><strong>Email:</strong> support@shopstore.com</p>
         <p><strong>Address:</strong> 123 Shopping Street, Your City</p>
       </div>
   
       <div class="footer-social">
         <h3>Follow Us</h3>
         <a href="#">🔵 Facebook</a><br>
         <a href="#">🟣 Instagram</a><br>
         <a href="#">🔷 Twitter</a>
       </div>
     </div>
   
     <div class="footer-bottom">
       <p>&copy; 2025 ShopStore. All Rights Reserved.</p>
     </div>
   </footer>
</body>
</html>
