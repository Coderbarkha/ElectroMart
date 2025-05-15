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
  .btn {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
        }
        .btn:hover {
            background: #0056b3;
        }
.product-container {
    display: flex;
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
    background: #fff;
}
.product-image img {
    max-width: 300px;
    border-radius: 5px;
}
.product-details {
    margin-left: 20px;
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

try{
	int  id=Integer.parseInt(request.getParameter("productId"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart","root","Barkha@241");
	PreparedStatement stmt=con.prepareStatement("select * from product_details where product_id=?");
	stmt.setInt(1,id);

	ResultSet rs=stmt.executeQuery();
	while(rs.next()){
		
		
%>

 <div class="product-container">
        <div class="product-image">
            <img id="product-image" src="<%=rs.getString(9)%>" alt="Product Image">
        </div>
        <div class="product-details">
            <h1 id="product-name"><%=rs.getString(2)%></h1>
            <p id="product-description"><%=rs.getString(3)%></p>
            <p><strong>Brand:</strong> <span id="product-brand"><%=rs.getString(4)%></span></p>
            <p><strong>Category:</strong> <span id="product-category"><%=rs.getString(5)%></span></p>
            <p><strong>Color:</strong> <span id="product-color"><%=rs.getString(6)%></span></p>
            <p><strong>SKU:</strong> <span id="product-sku"><%=rs.getString(7)%></span></p>
            <p><strong>Price:</strong> $<span id="product-price"><%=rs.getString(8)%></span></p>

            <button id="add-to-cart-btn" class="add-to-cart-btn">
            <a href="cart.jsp?productId=<%=rs.getString("product_id")%>">Add to Cart</a>

            </button>

        </div>
    </div>

         <%
        			
		
	}
	
}
catch(Exception e)
{
 	out.println(e);
}
%>


   
    <br> <br> <br> <br> <br> <br> <br> <br>
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
