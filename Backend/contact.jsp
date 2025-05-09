<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thank You | ElectroMart</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            overflow: hidden;
            background: linear-gradient(to bottom, #89f7fe, #66a6ff);
            position: relative;
        }
    
        .bubbles {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
        }

        .bubble {
            position: absolute;
            bottom: -100px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            animation: rise 10s infinite ease-in;
        }

        @keyframes rise {
            0% {
                transform: translateY(0) scale(1);
                opacity: 0.6;
            }
            100% {
                transform: translateY(-110vh) scale(0.5);
                opacity: 0;
            }
        }

        .thank-you-card {
            position: relative;
            z-index: 1;
            background: #fff;
            padding: 40px;
            max-width: 400px;
            margin: 150px auto;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .thank-you-card h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .thank-you-card p {
            color: #555;
            font-size: 16px;
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
          <a href="viewCart.jsp"><i class="fas fa-shopping-cart cart-icon"></i></a>
        </div>
      </nav>
    </div>
  </header>

<%
    // Backend Logic: Store Data to MySQL
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    if(name != null && email != null && message != null){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");

            String sql = "INSERT INTO contact (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, message);
            pst.executeUpdate();
            con.close();
        } catch(Exception e) {
            out.println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;text-align:center;'>Invalid input! Please fill the contact form first.</p>");
    }
%>

<!-- Bubble Animation -->
<div class="bubbles">
    <%-- 20 dynamic bubbles --%>
    <% for(int i = 0; i < 20; i++) { 
        int left = (int)(Math.random() * 100);
        int size = 20 + (int)(Math.random() * 30);
        double delay = Math.random() * 5;
    %>
        <div class="bubble" style="left: <%=left%>vw; width: <%=size%>px; height: <%=size%>px; animation-delay: <%=delay%>s;"></div>
    <% } %>
</div>

<!-- Thank You Card -->
<div class="thank-you-card">
    <h2>Thank You!</h2>
    <p>We'll get back to you as soon as possible!</p>
</div>



</body>
</html>
