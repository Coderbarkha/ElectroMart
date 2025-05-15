<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>


<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout - Buy Page</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link rel="stylesheet" href="style.css">
<script type="text/javascript">
        // JavaScript to validate form fields
        function validateForm(event) {
            var name = document.getElementById("fullname").value;
            var address = document.getElementById("address").value;
            var city = document.getElementById("city").value;
            var pincode = document.getElementById("pincode").value;
            var phone = document.getElementById("phone").value;
            var payment = document.getElementById("payment").value;

            // Check if any fields are empty
            if (!name || !address || !city || !pincode || !phone || !payment) {
                alert("Please fill in all fields.");
                event.preventDefault();
                return;
            }

            // Validate that the name contains only alphabets (no numbers or special characters)
            if (!/^[A-Za-z\s]+$/.test(name)) {
                alert("Name should only contain alphabets and spaces.");
                event.preventDefault();
                return;
            }

            // Validate that the city contains only alphabets (no numbers)
            if (!/^[A-Za-z\s]+$/.test(city)) {
                alert("City should only contain alphabets.");
                event.preventDefault();
                return;
            }

            // Validate that the pincode is exactly 6 digits
            if (!/^\d{6}$/.test(pincode)) {
                alert("Please enter a valid 6-digit pincode.");
                event.preventDefault();
                return;
            }

            // Validate that the phone number is exactly 10 digits and only numbers
            if (!/^\d{10}$/.test(phone)) {
                alert("Please enter a valid 10-digit phone number.");
                event.preventDefault();
                return;
            }
        }
    </script>


  
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f6f6f6;
      margin: 0;
      padding: 0;
    }
    /* Universal selector */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Roboto', sans-serif;
}

body {
  background-color: #f4f4f4;
}

.header {
  width: 100%;
  background-color: #111;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
}

.top-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 2rem;
  flex-wrap: wrap;
}

.logo h1 {
  font-family: 'Orbitron', sans-serif;
  font-size: 2rem;
  background: linear-gradient(90deg, #0ff1ce, #00d9ff, #4286f4);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.logo .e {
  font-weight: 700;
}

.logo .m {
  font-weight: 400;
  margin-left: 5px;
}

.navbar {
  display: flex;
  align-items: center;
  gap: 2rem;
  flex-wrap: wrap;
}

.nav-links {
  list-style: none;
  display: flex;
  gap: 1.5rem;
}

.nav-links li a {
  color: #fff;
  text-decoration: none;
  font-size: 1.1rem;
  position: relative;
  padding: 5px;
  transition: color 0.3s ease;
}

.nav-links li a::after {
  content: '';
  width: 0%;
  height: 2px;
  background: #00d9ff;
  position: absolute;
  left: 0;
  bottom: -4px;
  transition: 0.3s ease;
}

.nav-links li a:hover {
  color: #00d9ff;
}

.nav-links li a:hover::after {
  width: 100%;
}

/* Search Bar */
.search-bar {
  display: flex;
  align-items: center;
  border:1px solid white;
  background-color: #222;
  padding: 6px 12px;
  border-radius: 25px;
  color: #fff;
  gap: 8px;
}

.search-bar input {
  background: transparent;
  border: none;
  outline: none;
  color: white;
  font-size: 0.95rem;
}

.search-bar i {
  color: #00d9ff;
  cursor: pointer;
  font-size: 1rem;
}

/* User Section (Sign In + Cart) */
.user-section {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.signin-btn {
  padding: 8px 16px;
  background-color: #00d9ff;
  border: none;
  border-radius: 20px;
  color: #fff;
  font-size: 0.95rem;
  cursor: pointer;
  transition: 0.3s ease;
}

.signin-btn a{
  text-decoration: none;
  color: white;
}

.signin-btn:hover {
  background-color: #0ff1ce;
}

.cart-icon {
  font-size: 1.4rem;
  color: #fff;
  cursor: pointer;
  transition: 0.3s ease;
}

.cart-icon:hover {
  color: #00d9ff;
}
    .checkout-container {
      max-width: 1000px;
      margin: 50px auto;
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #333;
    }
    .checkout-section {
      margin-bottom: 30px;
    }
    .checkout-section label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }
    .checkout-section input, .checkout-section select {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .place-order-btn {
      display: block;
      width: 100%;
      padding: 15px;
      background-color: #28a745;
      color: white;
      font-size: 18px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
    }
    .place-order-btn:hover {
      background-color: #218838;
    }
  </style>

</head>
<body>
    <!-- Header -->
    <header class="header">
      <div class="top-bar">
        <div class="logo">
          <h1><span class="e">Electro</span><span class="m">Mart</span></h1>
        </div>
  
        <nav class="navbar">
          <ul class="nav-links">
            <li><a href="index.html">Home</a></li>
            <li><a href="allproducts.html">Products</a></li>
            <li><a href="Contact.html">Contact</a></li>
            <li><a href="about.html">About</a></li>
          </ul>
  
         
  
          <div class="user-section">
            <button class="signin-btn"><a href="logout.html">Log Out </a></button>
            <a href="viewCart.jsp"><i class="fas fa-shopping-cart cart-icon"></i></a>
          </div>
        </nav>
      </div>
    </header>
  <div class="checkout-container">
    <h2>Checkout - Confirm Your Order</h2>
    <%
String username = (String) session.getAttribute("uname");

if (username == null) {
    response.sendRedirect("checklogin1.jsp");
    return; // Stop further execution
}
%>
    
    <%
    try{
    	List<String> cart = (List<String>) session.getAttribute("cart");
    	if (cart == null || cart.isEmpty()) {
    	    out.println("<p>Your cart is empty.</p>");
    	    return;
    	}

    	 
  %>
<form id="orderForm" onsubmit="validateForm(event)" action="buy.jsp" method="post">

  <!-- Shipping Information -->
  <div class="checkout-section">
    <h3>Shipping Address</h3>

    <label for="name">Full Name</label>
    <input type="text" id="name" name="fullname" placeholder="Enter your full name" required>

    <label for="address">Address</label>
    <input type="text" id="address" name="address" placeholder="Enter full address" required>

    <label for="city">City</label>
    <input type="text" id="city" name="city" placeholder="Enter city name" required>

    <label for="pincode">Pincode</label>
    <input type="text" id="pincode" name="pincode" placeholder="Enter pincode" pattern="\d{6}" required>

    <label for="phone">Phone Number</label>
    <input type="text" id="phone" name="phone" placeholder="Enter phone number" pattern="\d{10}" required>

    
  </div>

  <!-- Payment Information -->
  <div class="checkout-section">
    <h3>Payment Method</h3>
    <label for="payment">Select Payment Option</label>
    <select id="payment" name="payment" required>
      <option value="" disabled selected>Select a payment method</option>
      <option>Cash on Delivery (COD)</option>
      <option>UPI Payment</option>
      <option>Credit/Debit Card</option>
      <option>Net Banking</option>
    </select>
  </div>

  


<%
    double finalPrice = 0.0;
    if (request.getParameter("finalPrice") != null) {
        finalPrice = Double.parseDouble(request.getParameter("finalPrice"));
    }
%>

<p>Total Amount Payable: ₹<%= String.format("%.2f", finalPrice) %></p>

    

    <button class="place-order-btn" type="submit">Place Order</button>
  </div></form>
<%

    }
    catch(Exception e) {
        e.printStackTrace();
    }
    
%>
  <!-- Footer -->
<br><br><br><br><br>
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
