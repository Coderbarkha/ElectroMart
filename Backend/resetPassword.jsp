<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
  <html>  
  <head>
  <link rel="stylesheet" href="style.css">
  <style>
  .message-container {
    max-width: 600px;
    margin: 120px auto 60px;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.95);
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    font-size: 18px;
}

.success {
    color: green;
    font-weight: bold;
}

.error {
    color: red;
    font-weight: bold;
}

.warning {
    color: #e67e22;
    font-weight: bold;
}
  
  </style>
  </head>
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
  </body>
  </html>

<%
    String username = request.getParameter("username");
    String newpass = request.getParameter("newpass");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");

        // Check if user exists
        PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM register WHERE username=?");
        checkStmt.setString(1, username);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
            // Update password
            PreparedStatement updateStmt = con.prepareStatement("UPDATE register SET password=? WHERE username=?");
            updateStmt.setString(1, newpass);
            updateStmt.setString(2, username);
            int i = updateStmt.executeUpdate();

            if (i > 0) {
            	out.println("<div class='message-container success'>Password updated successfully! <a href='login.html'>Login now</a></div>");

            } else {
            	out.println("<div class='message-container error'>Failed to update password.</div>");

            }
        } else {
        	out.println("<div class='message-container warning'>Username not found. <a href='forgotPassword.jsp'>Try again</a></div>");
        	
        }

    } catch (Exception e) {
    	out.println("<div class='message-container error'>Error: " + e + "</div>");

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
