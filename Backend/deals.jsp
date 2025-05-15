<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Today's Deals</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Header */
header {
    background-color: #ff5722;
    color: white;
    padding: 4px;
    font-size: 24px;
}

/* Deals Container */
.deals-container {
    width: 90%;
    margin: 20px auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

/* Product Grid */
#deals-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    width: 100%;
    max-width: 1200px;
    margin: auto;
}

/* Deal Card */
.deal-card {
    background: white;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s;
    position: relative;
}

.deal-card:hover {
    transform: scale(1.05);
}

.deal-card img {
    width: 100%;
    max-height: 180px;
    object-fit: cover;
    border-radius: 10px;
}

.deal-card h3 {
    font-size: 18px;
    margin: 10px 0;
}

.deal-card .price {
    font-size: 18px;
    font-weight: bold;
    color: #e91e63;
}

.deal-card .discount {
    font-size: 16px;
    font-weight: bold;
    color: #4caf50;
}

.deal-card .original-price {
    font-size: 14px;
    text-decoration: line-through;
    color: #757575;
}

/* Responsive */
@media (max-width: 768px) {
    #deals-grid {
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    }
}
.view-details {
  display: inline-block; /* Add this line */
  background: #28a745;
  color: white;
  border: none;
  padding: 10px;
  font-size: 14px;
  cursor: pointer;
  border-radius: 5px;
  margin-top: 10px;
  text-decoration: none;
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
      <li><a href="fresh.jsp">Fresh</a></li>
      
      <li><a href="bestseller.jsp">Best Seller</a></li>
      <li><a href="deals.jsp">Today's Deals</a></li>
      <li><a href="new-release.jsp">New Release</a></li>
    </ul>
    </div>



<div class="deals-container">
    <div id="deals-grid">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM deals");

                while (rs.next()) {
                    String name = rs.getString("name");
                    double originalPrice = rs.getDouble("original_price");
                    double discountedPrice = rs.getDouble("discounted_price");
                    String image = rs.getString("image");
                    int discount = (int) Math.round(((originalPrice - discountedPrice) / originalPrice) * 100);
        %>
        <div class="deal-card">
            <img src="<%= image %>" alt="<%= name %>">
            <h3><%= name %></h3>
            <p class="original-price">₹<%= originalPrice %></p>
            <p class="price">₹<%= discountedPrice %></p>
            <p class="discount">Save <%= discount %>%</p>
            <a href="deals_details.jsp?id=<%= rs.getInt("id") %>" class="view-details">View Details</a>
            
        </div>
        <%
                }
            } catch (Exception e) {
                out.println("<p>Error loading deals: " + e.getMessage() + "</p>");
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                try { if (conn != null) conn.close(); } catch (Exception e) {}
            }
        %>
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
