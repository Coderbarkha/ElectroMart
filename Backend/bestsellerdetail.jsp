<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <link rel="stylesheet" href="style.css">
    <style>
    /* Product Detail Styles */
    .product-detail-container {
        margin: 20px 0;
        background-color: white;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .product-detail-container img {
        width: 250px;
        max-width: 200px;
        margin: 0 auto;
        display: block;
    }

    .product-detail-container h1 {
        font-size: 28px;
        text-align: center;
        color: #333;
    }

    .product-detail-container p {
        font-size: 18px;
        line-height: 1.6;
        color: #555;
    }

    .product-detail-container button {
        display: block;
        width: 100%;
        padding: 10px 0;
        background-color: #007bff;
        color: white;
        border: none;
        font-size: 18px;
        border-radius: 5px;
        cursor: pointer;
        text-align: center;
        margin-top: 20px;
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

    <!-- Header -->
       <!-- Header -->
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
                    <button class="signin-btn"><a href="logout.html">Log Out</a></button>
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
            <li><a href="bestseller.jsp">Best Seller</a></li>
            <li><a href="deals.html">Today's Deals</a></li>
            <li><a href="new-release.html">New Release</a></li>
        </ul>
    </div>

    <div class="product-detail-container">
        <%
            String productId = request.getParameter("id");
            String url = "jdbc:mysql://localhost:3306/electromart?useUnicode=true&characterEncoding=UTF-8";
            String user = "root";
            String password = "Barkha@241";
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                String query = "SELECT * FROM bestsellerdetail WHERE id=?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, Integer.parseInt(productId));
                rs = stmt.executeQuery();

                if (rs.next()) {
                	String productName = rs.getString("name");
                    double price = rs.getDouble("price");
                    String imageUrl = rs.getString("image");
                    double rating = rs.getDouble("rating");
                    String description = rs.getString("description");
                    String brand = rs.getString("brand");
                    String category = rs.getString("category");
                    String warranty = rs.getString("warranty");
                    int stock = rs.getInt("stock");
        %>

       <div class="product-detail">
    <img src="<%= imageUrl %>" alt="<%= productName %>">
    <h1><%= productName %></h1>
    <p><strong>Price:</strong> ₹<%= price %></p>
    <p><strong>Description:</strong> <%= description %></p>
    <p><strong>Brand:</strong> <%= brand %></p>
    <p><strong>Category:</strong> <%= category %></p>
    <p><strong>Warranty:</strong> <%= warranty %></p>
    <p><strong>Stock:</strong> <%= stock %> available</p>
    <p><strong>Rating:</strong> <%= rating %>/5</p>
    <button id="add-to-cart-btn" class="add-to-cart-btn">
    <a href="allproducts.jsp">Check out to see products</a>
</div>


        <%
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
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
