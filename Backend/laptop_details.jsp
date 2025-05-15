<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("productId");
    String url = "jdbc:mysql://localhost:3306/electromart";
    String user = "root";
    String pass = "Barkha@241";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        String query = "SELECT * FROM laptop_details WHERE id=?";
        ps = conn.prepareStatement(query);
        ps.setString(1, id);
        rs = ps.executeQuery();

        if(rs.next()) {
%>
<html>
<head>
    <title><%= rs.getString("name") %></title>
    <link rel="stylesheet" href="style.css">
    <style>
       
        .page-container {
    padding: 30px;
    max-width: 1200px;
    margin: 0 auto;
}

/* Product details */
.details-container {
    display: flex;
    gap: 30px;
    align-items: flex-start;
    background-color: #f9f9f9;
    padding: 30px;
    border-radius: 10px;
}

.laptop-img {
    width: 300px;
    height: auto;
}

.info {
    max-width: 600px;
}

.info h2 {
    margin-top: 0;
}

.price {
    color: green;
    font-weight: bold;
    font-size: 20px;
}
        .laptop-img {
            width: 300px; height: auto;
        }
        .info { max-width: 500px; }
        .info h2 { margin-top: 0; }
        .price { color: green; font-weight: bold; font-size: 20px; }
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
     <div class="page-container">
        <div class="details-container">
            <img src="<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>" class="laptop-img">
            <div class="info">
                <h2><%= rs.getString("name") %></h2>
                <p class="price">₹<%= rs.getString("price") %></p>
                <p><strong>Processor:</strong> <%= rs.getString("processor") %></p>
                <p><strong>RAM:</strong> <%= rs.getString("ram") %></p>
                <p><strong>Storage:</strong> <%= rs.getString("storage") %></p>
                <p><strong>Display:</strong> <%= rs.getString("display") %></p>
                <p><strong>Battery:</strong> <%= rs.getString("battery") %></p>
                <p><%= rs.getString("description") %></p>
                 <button id="add-to-cart-btn" class="add-to-cart-btn">
                <a href="allproducts.jsp">Check out to see products</a>
            </div>
        </div>
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
    
</body>
</html>
<%
        } else {
            out.println("<h2>No laptop found with ID = " + id + "</h2>");
        }
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
