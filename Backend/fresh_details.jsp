<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Details</title>
    <link rel="stylesheet" href="style.css">
        <style>
        .product-details {
            max-width: 550px;
            margin: 40px auto;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            font-family: 'Roboto', sans-serif;
        }
        .product-details img {
            max-width: 300px;
            display: block;
            margin-bottom: 20px;
        }
        .product-details h1 {
            margin-bottom: 10px;
            font-family: 'Orbitron', sans-serif;
        }
        .product-details p {
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
<%
    String id = request.getParameter("id");
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");

        String query = "SELECT * FROM fresh_details WHERE id = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, id);
        rs = ps.executeQuery();

        if(rs.next()) {
%>
        <div class="product-details">
            <h1><%= rs.getString("name") %></h1>
            <img src="<%= rs.getString("image_url") %>" width="300" height="300" alt="<%= rs.getString("name") %>"><br>
            <strong>Price:</strong> ₹<%= rs.getDouble("price") %><br>
            <strong>Category:</strong> <%= rs.getString("category") %><br>
            <strong>Brand:</strong> <%= rs.getString("brand") %><br>
            <strong>Rating:</strong> <%= rs.getFloat("rating") %> / 5<br>
            <strong>In Stock:</strong> <%= rs.getInt("stock") %> units<br>
            <p><strong>Description:</strong> <%= rs.getString("description") %></p>
            <p><strong>Specifications:</strong> <%= rs.getString("specifications") %></p>
        	 <button id="add-to-cart-btn" class="add-to-cart-btn">
                <a href="allproducts.jsp">Check out to see products</a>
        </div>
<%
        } else {
            out.println("<p>Product not found.</p>");
        }
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(ps != null) ps.close(); } catch(Exception e) {}
        try { if(con != null) con.close(); } catch(Exception e) {}
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
      <script>
        document.addEventListener("DOMContentLoaded", function () {
    let dropdownToggle = document.querySelector(".dropdown-toggle");
    let dropdownMenu = document.querySelector(".dropdown-menu");

    dropdownToggle.addEventListener("click", function (event) {
        event.preventDefault(); // Prevents the default anchor behavior
        dropdownMenu.classList.toggle("show");
    });

    // Close dropdown when clicking outside
    document.addEventListener("click", function (event) {
        if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
            dropdownMenu.classList.remove("show");
        }
    });

    // Ensure clicking on dropdown items doesn't close the menu
    dropdownMenu.addEventListener("click", function (event) {
        event.stopPropagation();
    });
});



// Function to filter categories
function filterCategory(category) {
    let products = document.querySelectorAll(".product-card");

    products.forEach(product => {
        if (category === "all") {
            product.style.display = "block";
        } else {
            product.style.display = product.classList.contains(category) ? "block" : "none";
        }
    });
}


</script>
</body>
</html>
