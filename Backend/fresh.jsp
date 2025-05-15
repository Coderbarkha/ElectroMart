<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fresh Electronics</title>
    <link rel="stylesheet" href="style.css">
    <style>
            /* Subcategory Bar */
.subcategory-bar {
  display: flex;
  justify-content: center;
  gap: 10px;
  background-color: #fff;
  padding: 15px;
  margin-bottom: 20px;
  box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.subcategory-btn {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  cursor: pointer;
  font-size: 16px;
  border-radius: 5px;
}

.subcategory-btn:hover {
  background-color: #0056b3;
}
/* Product Grid */
.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  padding: 20px;
  max-width: 1200px;
  margin: auto;
}

/* Product Card */
.product-card {
  background: #fff;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
  text-align: center;
  padding: 15px;
}

.product-card:hover {
  transform: scale(1.05);
}

/* Product Image */
.product-card img {
  width: 200px;
  height: 200px;
  border-bottom: 1px solid #ddd;
}

/* Product Name */
.product-name {
  font-size: 18px;
  font-weight: bold;
  margin: 10px 0;
}

/* Price */
.price {
  font-size: 16px;
  color: #007bff;
  font-weight: bold;
}

/* Add to Cart Button */
button.add-to-cart {
  background: #28a745;
  color: white;
  border: none;
  padding: 10px;
  font-size: 14px;
  cursor: pointer;
  border-radius: 5px;
  margin-top: 10px;
}

button.add-to-cart:hover {
  background: #218838;
}

/* Responsive */
@media (max-width: 768px) {
  .subcategory-bar {
    flex-wrap: wrap;
  }
  .product-grid {
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
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

    <!-- Subcategory Navigation -->
    <nav class="subcategory-bar">
        <button class="subcategory-btn" onclick="filterCategory('all')">All</button>
        <button class="subcategory-btn" onclick="filterCategory('laptops')">Laptops</button>
        <button class="subcategory-btn" onclick="filterCategory('smartphones')">Smartphones</button>
        <button class="subcategory-btn" onclick="filterCategory('smartwatches')">Smartwatches</button>
        <button class="subcategory-btn" onclick="filterCategory('earphones')">Earphones</button>
    </nav>
    
    <div class="product-grid">

    <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM fresh");

            while(rs.next()) {
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                String image = rs.getString("image_url");
    %>

        <div class="product-card <%= category %>">
            <img src="<%= image %>" alt="<%= name %>">
            <h2 class="product-name"><%= name %></h2>
            <p class="price">₹<%= price %></p>
            <a href="fresh_details.jsp?id=<%= rs.getInt("id") %>">View Details</a>

        </div>

    <%
            }
        } catch(Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(stmt != null) stmt.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    %>

    </div>
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
