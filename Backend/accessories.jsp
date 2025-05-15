<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Accessories</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        /* ... (Your CSS remains unchanged here) ... */
        /* Product Grid */
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
            text-align: center;
            padding: 15px;
        }
        .product-card img {
            width: 200px;
            height: 200px;
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


<!-- Product Grid -->
<div class="product-grid">
    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Connect to the DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");

            // Query only accessories
            String sql = "SELECT * FROM accessories";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("id"); // ✅ Fetch product ID
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
            %>
                <div class="product-card">
                    <img src="<%= image %>" alt="Accessory Image">
                    <h2 class="product-name"><%= name %></h2>
                    <p class="price">₹<%= price %></p>
                    <div class="button-container">
                        <a href="accessories_details.jsp?productId=<%= productId %>">
                            <button class="view-details">View Details</button>
                        </a>
                    </div>
                </div>
            <%
            }
        } catch (Exception e) {
            out.println("<p>Error loading accessories: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
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
