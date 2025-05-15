<!-- all-products.html -->
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
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

        <div class="search-bar">
          <input type="text" id="search-input" placeholder="Search electronics..." />
          <i class="fas fa-search" id="search-icon"></i>
        </div>

        <div class="user-section">
          <button class="signin-btn"><a href="Logout.html">Log Out </a></button>
              <a href="viewCart.jsp">
            <i class="fas fa-shopping-cart cart-icon"></i>
            
          </a>
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
              <li><a href="mobile.jsp">Mobiles</a></li>
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
  <section class="all-products-section">
        <h2 class="section-title">All Products</h2>
        <div class="product-grid">  
<%

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart","root","Barkha@241");
	PreparedStatement stmt=con.prepareStatement("select * from product_details");

	ResultSet rs=stmt.executeQuery();
	while(rs.next()){
		
		
%>
 <div class="product-card"
     data-name="<%=rs.getString(2)%>" 
     data-category="<%=rs.getString(3)%>">

  <img src="<%=rs.getString(9)%>" alt="Sneakers">
  <h3><%=rs.getString(2)%></h3>
  <p>Rs.<%=rs.getString(8)%></p>

  <!-- View Details Button -->
  <a href="product_details.jsp?productId=<%=rs.getString(1)%>">View Details</a>
   
  <a href="cart.jsp?productId=<%=rs.getString(1)%>" 
   class="add-to-cart" 
   data-id="<%=rs.getString(1)%>" 
   data-name="<%=rs.getString(2)%>" 
   data-price="<%=rs.getString(8)%>" 
   data-image="<%=rs.getString(9)%>">
   Add to Cart
</a>

</div>

        <%
        			
		
	}
	
}
catch(Exception e)
{
 	out.println(e);
}
%>







    <!-- All Products Section -->
     
       
          
         

    </div>
    </section>

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

  
<script>
document.addEventListener("DOMContentLoaded", function () {
    // Dropdown toggle
    let dropdownToggle = document.querySelector(".dropdown-toggle");
    let dropdownMenu = document.querySelector(".dropdown-menu");

    dropdownToggle.addEventListener("click", function (event) {
        event.preventDefault(); 
        dropdownMenu.classList.toggle("show");
    });

    document.addEventListener("click", function (event) {
        if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
            dropdownMenu.classList.remove("show");
        }
    });

    dropdownMenu.addEventListener("click", function (event) {
        event.stopPropagation();
    });



    // 🔍 Search functionality
    const searchInput = document.getElementById('search-input');
    const searchIcon = document.getElementById('search-icon');

    let debounceTimer;

    const filterProducts = () => {
        const query = searchInput.value.toLowerCase();
        const products = document.querySelectorAll('.product-card');

        products.forEach(product => {
            const name = product.dataset.name?.toLowerCase() || '';
            const category = product.dataset.category?.toLowerCase() || '';

            if (name.includes(query) || category.includes(query)) {
                product.style.display = '';
            } else {
                product.style.display = 'none';
            }
        });
    };

    const debounceSearch = () => {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(filterProducts, 300);
    };

    if (searchInput && searchIcon) {
        searchIcon.addEventListener('click', (e) => {
            e.preventDefault();
            filterProducts();
        });

        searchInput.addEventListener('keyup', debounceSearch);
    } else {
        console.error("Search input or icon not found");
    }
});
</script>

  

</body>
</html>
