<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Appliance Details</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 0;
        }
        .main-content {
    max-width: 1200px;
    margin: 40px auto;
    padding: 20px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.product-detail {
    display: flex;
    flex-wrap: wrap;
    gap: 40px;
}

.product-detail img {
    width: 100%;
    max-width: 350px;
    border-radius: 10px;
}

.details {
    flex: 1;
    min-width: 300px;
}

.details h2 {
    margin-bottom: 10px;
    font-size: 28px;
}

.details p {
    margin: 6px 0;
    font-size: 16px;
    line-height: 1.5;
}

.price {
    font-size: 22px;
    color: green;
    font-weight: bold;
}
        .details {
            max-width: 600px;
        }
        .details h2 {
            margin-bottom: 10px;
        }
        .details p {
            margin: 6px 0;
        }
        .price {
            font-size: 20px;
            color: green;
            font-weight: bold;
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
                    <li><a href="mobiles.jsp">Mobiles</a></li>
                    <li><a href="laptop.jsp">Laptops</a></li>
                    <li><a href="accessories.jsp">Accessories</a></li>
                    <li><a href="home-appliances.jsp">Home Appliances</a></li>
                </ul>
            </li>
            <li><a href="fresh.html">Fresh</a></li>
            <li><a href="bestseller.jsp">Best Seller</a></li>
            <li><a href="deals.html">Today's Deals</a></li>
            <li><a href="new-release.html">New Release</a></li>
        </ul>
    </div>

<%
    String applianceId = request.getParameter("id");
    if (applianceId != null) {
        try {
            // Update DB credentials accordingly
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM appliance_detail WHERE id = ?");
            ps.setInt(1, Integer.parseInt(applianceId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
%>

<main class="main-content">
    <div class="product-detail">
        <img src="<%= rs.getString("image_url") %>" alt="<%= rs.getString("name") %>">
        <div class="details">
            <h2><%= rs.getString("name") %></h2>
            <p class="price">Price: ₹<%= rs.getDouble("price") %></p>
            <p><strong>Category:</strong> <%= rs.getString("category") %></p>
            <p><strong>Brand:</strong> <%= rs.getString("brand") %></p>
            <p><strong>Warranty:</strong> <%= rs.getString("warranty") %></p>
            <p><strong>Energy Rating:</strong> <%= rs.getString("energy_rating") %></p>
            <p><strong>Description:</strong> <%= rs.getString("description") %></p>
            <p><strong>Features:</strong> <%= rs.getString("features") %></p>
            <button id="add-to-cart-btn" class="add-to-cart-btn">
    		<a href="allproducts.jsp">Check out to see products</a>
            </div>
    </div>
</main>

<%
            } else {
%>
    <h2>Product not found.</h2>
<%
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    } else {
%>
    <h2>Invalid Product ID.</h2>
<%
    }
%>
 <!-- Footer -->
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
                    <li><a href="logout.html">Login/Register</a></li>
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
