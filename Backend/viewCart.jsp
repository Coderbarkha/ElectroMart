<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List, java.util.Objects, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <style>
.product-container {
    display: flex;
    flex-wrap: wrap;
    max-width: 1000px;
    margin: 30px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    background: #fefefe;
    gap: 20px;
}

.product-image {
    flex: 1 1 300px;
    text-align: center;
}
.product-image img {
    max-width: 100%;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.product-details {
    flex: 2;
}
.product-details h1 {
    font-size: 1.5rem;
    margin-bottom: 10px;
    font-family: 'Orbitron', sans-serif;
}
.product-details p {
    margin: 5px 0;
    font-family: 'Roboto', sans-serif;
}

.buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin: 20px 0;
    flex-wrap: wrap;
}

.btn-back, .btn-remove, .btn-checkout {
    background: #007bff;
    border: none;
    padding: 10px 20px;
    border-radius: 6px;
    color: white;
    cursor: pointer;
    font-size: 1rem;
    transition: background 0.3s;
}
.btn-remove {
    background: #dc3545;
}
.btn-back:hover, .btn-remove:hover, .btn-checkout:hover {
    background: #0056b3;
}
.btn-remove:hover {
    background: #b52a38;
}

.total-price {
    max-width: 800px;
    margin: 30px auto 10px;
    padding: 15px;
    background: #f8f9fa;
    border-left: 5px solid #007bff;
    font-size: 1.1rem;
    font-weight: bold;
}
.discount-info {
    background-color: #e0f7fa;
    padding: 10px;
    margin-top: 10px;
    border-radius: 5px;
}
form {
    display: inline-block;
}
@media (max-width: 768px) {
    .product-container {
        flex-direction: column;
        padding: 15px;
    }
    .buttons {
        flex-direction: column;
    }
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
          <button class="signin-btn"><a href="logout.html">Log Out</a></button>
          <a href="viewCart.jsp"><i class="fas fa-shopping-cart cart-icon"></i>
            

          </a>
        </div>
      </nav>
    </div>
  </header>


<%
    List<String> cart = (List<String>) session.getAttribute("cart");
    double totalPrice = 0.0;
    double discount = 0.0;
    double discountedPrice = 0.0;
    boolean couponApplied = false;

    if (cart == null || cart.isEmpty()) {
%>

    <p style="text-align:center; color :red;font-size:45px">Your cart is empty. Total Price: ₹0</p>
<%
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");

            // Remove null values from the cart (if any)
            cart.removeIf(Objects::isNull);
            session.setAttribute("cart", cart);

            for (int i = 0; i < cart.size(); i++) {
                String productId = cart.get(i);

                int id = Integer.parseInt(productId);
                String query = "SELECT * FROM product_details WHERE product_id=?";
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    double price = rs.getDouble(8);
                    totalPrice += price;
%>
    <div class="product-container">
        <div class="product-image">
            <img src="<%= rs.getString(9) %>" alt="Product Image">
        </div>
        <div class="product-details">
            <h1><%= rs.getString(2) %></h1>
            <p><%= rs.getString(3) %></p>
            <p><strong>Brand:</strong> <%= rs.getString(4) %></p>
            <p><strong>Category:</strong> <%= rs.getString(5) %></p>
            <p><strong>Color:</strong> <%= rs.getString(6) %></p>
            <p><strong>SKU:</strong> <%= rs.getString(7) %></p>
            <p><strong>Price:</strong> ₹<%= price %></p>
        </div>
    </div>
    <div class="buttons">
        <button class="btn-back">
            <a href="allproducts.jsp" style="color:white;text-decoration:none;">Back to Products</a>
        </button>
        <form action="removeFromCart.jsp" method="post" style="margin:0;">
            <input type="hidden" name="removeId" value="<%= id %>">
            <button type="submit" class="btn-remove">Remove</button>
        </form>
    </div>
<%
                }
            }

            if (request.getParameter("applyCoupon") != null) {
                discount = 10.0;
                discountedPrice = totalPrice - (totalPrice * discount / 100.0);
                couponApplied = true;
            }
%>
    <div class="total-price">
        <p>Total Price: ₹<%= totalPrice %></p>
        <% if (couponApplied) { %>
            <div class="discount-info">
                <p>Coupon Applied: <strong><%= discount %>% OFF</strong></p>
                <p>Discounted Price: ₹<%= String.format("%.2f", discountedPrice) %></p>
            </div>
        <% } %>
    </div>

    <form method="get">
        <button type="submit" name="applyCoupon" class="btn-checkout">Apply Coupon</button>
    </form>

    <div class="buttons">
        <button class="btn-checkout">
            <a href="buypreview.jsp?finalPrice=<%= couponApplied ? discountedPrice : totalPrice %>" style="color:white;text-decoration:none;">Proceed to Checkout</a>
        </button>
    </div>

<%
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
%>
<br><br><br><br><br><br><br><br><br>
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
