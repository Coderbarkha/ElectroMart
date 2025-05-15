<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);

    String name = "", brand = "", warranty = "", description = "", image = "";
    double originalPrice = 0, discountedPrice = 0;
    int stock = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");

        PreparedStatement pst = con.prepareStatement("SELECT * FROM deals_details WHERE id = ?");
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            brand = rs.getString("brand");
            warranty = rs.getString("warranty");
            description = rs.getString("description");
            image = rs.getString("image_path");
            originalPrice = rs.getDouble("original_price");
            discountedPrice = rs.getDouble("discounted_price");
            stock = rs.getInt("stock");
        }
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= name %> - Deal Details</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .product-details {
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
            display: flex;
            gap: 20px;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
        }
        .product-details img {
            max-width: 300px;
            height: auto;
            border-radius: 10px;
        }
        .product-info {
            flex-grow: 1;
        }
        .product-info h2 {
            margin-bottom: 10px;
        }
        .price-box {
            margin: 10px 0;
        }
        .original {
            text-decoration: line-through;
            color: #888;
        }
        .discounted {
            color: #e91e63;
            font-size: 20px;
            font-weight: bold;
        }
        .back-link {
            margin: 20px auto;
            display: block;
            text-align: center;
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
              <li><a href="mobiles.html">Mobiles</a></li>
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
    <header class="header">
        <h1>🔎 Product Deal Details</h1>
    </header>

    <div class="product-details">
        <img src="<%= image %>" alt="<%= name %>">
        <div class="product-info">
            <h2><%= name %></h2>
            <p><strong>Brand:</strong> <%= brand %></p>
            <p><strong>Warranty:</strong> <%= warranty %></p>
            <p><strong>Stock Available:</strong> <%= stock %> units</p>

            <div class="price-box">
                <p class="original">Original Price: ₹<%= originalPrice %></p>
                <p class="discounted">Now: ₹<%= discountedPrice %></p>
                <p>You Save: ₹<%= (originalPrice - discountedPrice) %></p>
            </div>

            <p><strong>Description:</strong></p>
            <p><%= description %></p>
            
            <button id="add-to-cart-btn" class="add-to-cart-btn">
                <a href="allproducts.jsp">Check out to see products</a>
        </div>
    </div>

    <div class="back-link">
        <a href="deals.jsp">⬅ Back to Deals</a>
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
              <li><a href="allproducts.jsp">Products</a></li>
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
