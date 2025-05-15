<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>

<%
    // Server-side cart logic
    List<String> cart = (List<String>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<>();
    }

    // Get product ID from query parameter
    String productId = request.getParameter("productId");

   
    // Add product to cart only if not null or empty
    if (productId != null && !productId.trim().isEmpty()) {
        cart.add(productId);
    }

    // Save cart back into session
    session.setAttribute("cart", cart);
    int cartCount = cart.size();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
    .addcart-section {
        height: 30vh;
        width: 30vw;
        display: flex;
        margin-left: 500px;
        gap: 20px;
        justify-content: center;
        align-items: center;
    }
    .addcart-section a {
        background-color: green;
        padding: 15px;
        border-radius: 20px;
        text-decoration: none;
        color: white;
    }

    .cart-list {
        text-align: center;
        margin-top: 40px;
    }

    .cart-list ul {
        list-style-type: none;
        padding: 0;
    }

    .cart-list li {
        margin: 10px 0;
        font-size: 18px;
        color: #333;
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
                <li data-aos="fade-down"><a href="index.html">Home</a></li>
                <li data-aos="fade-down" data-aos-delay="100"><a href="allproducts.jsp">Products</a></li>
                <li data-aos="fade-down" data-aos-delay="200"><a href="contact.html">Contact</a></li>
                <li data-aos="fade-down" data-aos-delay="300"><a href="about.html">About</a></li>
            </ul>

            <div class="user-section">
                <button class="signin-btn"><a href="logout.html">Log Out</a></button>
                <a href="viewCart.jsp"><i class="fas fa-shopping-cart cart-icon"></i>
                    <span id="cart-count"><%= cartCount %></span>
                </a>
            </div>
        </nav>
    </div>

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
</header>

<div class="addcart-section">
    <a href="allproducts.jsp">Continue Shopping</a>
    <a href="viewCart.jsp">View Cart</a>
</div>



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
