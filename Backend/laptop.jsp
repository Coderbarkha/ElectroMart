<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laptops</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* CSS styles for grid layout, buttons, etc. */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .product-card {
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            padding: 15px;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
        }
        .product-card img {
            width: 200px;
            height: 200px;
            border-bottom: 1px solid #ddd;
            transition: transform 0.3s ease;
        }
        .product-card:hover img {
            transform: scale(1.05);
        }
        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }
        .price {
            font-size: 16px;
            color: #27ae60;
            font-weight: bold;
            margin: 5px 0;
        }
        
        button {
    all: unset;
    display: inline-block;
    padding: 5px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    border-radius: 5px;
    text-align: center;
}
        
        button.view-details {
    color: white;
    font-size: 14px;
    padding: 3px;
    border-radius: 5px;
    border: none;
    width: 48%;
    transition: background-color 0.3s ease;
}

button.view-details:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

        @media (max-width: 768px) {
            .product-grid {
                grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            }
        }
    </style>
    <link rel="stylesheet" href="style.css">
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
          <li><a href="allproducts.html">Products</a></li>
          <li><a href="contact.html">Contact</a></li>
          <li><a href="about.html">About</a></li>
        </ul>

        

        <div class="user-section">
          <button class="signin-btn"><a href="login.html">Log Out </a></button>
          <a href="cart.html"><i class="fas fa-shopping-cart cart-icon"></i></a>
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
          <li><a href="laptop.jsp">Laptops</a></li>
          <li><a href="accessories.jsp">Accessories</a></li>
          <li><a href="home-appliances.jsp">Home Appliances</a></li>
      </ul>
  </li>
  <li><a href="fresh.jsp">Fresh</a></li>
  
  <li><a href="bestseller.jsp">Best Seller</a></li>
  <li><a href="deals.jsp">Today's Deals</a></li>
  <li><a href="new-release.jsp">New Release</a></li>
</ul>
</div>

<div class="product-grid">
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            // Load database driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM laptop");

           
            while (rs.next()) {
                int productId = rs.getInt("id");  // or use "product_id" based on your DB
                String name = rs.getString("name");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
        %>

        <div class="product-card">
            <img src="<%= image %>" alt="<%= name %>">
            <h2 class="product-name"><%= name %></h2>
            <p class="price">₹<%= price %></p>
            <div class="button-container">
                <a href="laptop_details.jsp?productId=<%= productId %>">
                    <button class="view-details">View Details</button>
                </a>
            </div>
        </div>

        <%
            }
        %>

    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
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
              <li><a href="index.html">Home</a></li>
              <li><a href="allproducts.html">Products</a></li>
              <li><a href="contact.html">Contact</a></li>
              <li><a href="login.html">Login/Register</a></li>
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
