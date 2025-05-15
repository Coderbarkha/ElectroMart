<%@ page import="java.sql.*" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="style.css">
    <style>
 .reset-form{
    width: 100%;
  max-width: 450px;
  margin: 50px auto;
  padding: 30px;
  background-color: #f5f5f5;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
  text-align: center;
  }
  .reset-form h2 {
    margin-bottom: 20px;
    color: #333;
  }
  .reset-form form {
    display: flex;
    flex-direction: column;
  }
  .reset-form input {
    padding: 12px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 16px;
  }
  .reset-form button {
    background-color:  #00cc99;
    margin: 10px;
    padding: 12px;
    border: none;
    border-radius: 6px;
    font-size: 18px;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  
  .reset-form button:hover {
    background-color: #66d6b0;
  }
  
  .reset-form p {
    margin-top: 10px;
    font-size: 14px;
  }  
  .reset-form a{
    text-decoration: none;
    
  }
    </style>
</head>
<body>
    <body style="background-image: url(images/login.avif); background-repeat: no-repeat; background-size: cover;">
  <header class="header">
    <div class="top-bar">
      <div class="logo">
        <h1><span class="e">Electro</span><span class="m">Mart</span></h1>
      </div>


        <div class="user-section">
          <button class="signin-btn"><a href="register.html">Register </a></button>
        </div>
      </nav>
    </div>
  </header>
    <div class="reset-form">
    <form action="resetPassword.jsp" method="post">
        <label>Enter your username or email:</label><br>
        <input type="text" name="username" required><br><br>

        <label>Enter new password:</label><br>
        <input type="password" name="newpass" required><br><br>

        <button type="submit">Reset Password</button>
    </form>
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
