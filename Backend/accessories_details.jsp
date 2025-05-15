<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Accessory Details</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .details-container {
            max-width: 550px;
            margin: 40px auto;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            font-family: 'Roboto', sans-serif;
        }
        .details-container img {
            max-width: 300px;
            display: block;
            margin-bottom: 20px;
        }
        .details-container h1 {
            margin-bottom: 10px;
            font-family: 'Orbitron', sans-serif;
        }
        .details-container p {
            margin: 6px 0;
        }
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
              <button class="signin-btn"><a href="logout.html">Log Out </a></button>
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
              <li><a href="mobiles.html">Mobiles</a></li>
              <li><a href="laptop.html">Laptops</a></li>
              <li><a href="accessories.html">Accessories</a></li>
              <li><a href="home-appliances.html">Home Appliances</a></li>
          </ul>
      </li>
      <li><a href="fresh.html">Fresh</a></li>
      
      <li><a href="best-seller.jsp">Best Seller</a></li>
      <li><a href="deals.html">Today's Deals</a></li>
      <li><a href="new-release.html">New Release</a></li>
  </ul>
</div>
<div class="details-container">
    <%
        int productId = Integer.parseInt(request.getParameter("productId"));
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");
            String sql = "SELECT * FROM accessories_details WHERE id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productId);
            rs = stmt.executeQuery();

            if (rs.next()) {
    %>
                <img src="<%= rs.getString("image") %>" alt="Accessory Image">
                <h1><%= rs.getString("name") %></h1>
                <p><strong>Price:</strong> ₹<%= rs.getDouble("price") %></p>
                <p><strong>Brand:</strong> <%= rs.getString("brand") %></p>
                <p><strong>Description:</strong> <%= rs.getString("description") %></p>
                <p><strong>Compatibility:</strong> <%= rs.getString("compatibility") %></p>
                <p><strong>Color:</strong> <%= rs.getString("color") %></p>
                <p><strong>Warranty:</strong> <%= rs.getString("warranty") %></p>
                <p><strong>Rating:</strong> <%= rs.getDouble("rating") %> ★</p>
                  <button id="add-to-cart-btn" class="add-to-cart-btn">
                <a href="allproducts.jsp">Check out to see products</a>
    <%
            } else {
                out.println("<p>Accessory not found!</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</div>
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
