<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home Appliances</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js" defer></script>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        /* Header */
        header {
            background-color: #ff6600;
            color: white;
            padding: 20px;
            font-size: 24px;
        }

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
            background-color: #ff6600;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }

        .subcategory-btn:hover {
            background-color: #cc5200;
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
            color: #ff6600;
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
            <li><a href="fresh.html">Fresh</a></li>
            <li><a href="bestseller.jsp">Best Seller</a></li>
            <li><a href="deals.html">Today's Deals</a></li>
            <li><a href="new-release.html">New Release</a></li>
        </ul>
    </div>

<!-- Subcategory Navigation -->
<nav class="subcategory-bar">
    <button class="subcategory-btn" onclick="filterCategory('all')">All</button>
    <button class="subcategory-btn" onclick="filterCategory('washing-machine')">Washing Machines</button>
    <button class="subcategory-btn" onclick="filterCategory('refrigerator')">Refrigerators</button>
    <button class="subcategory-btn" onclick="filterCategory('microwave')">Microwaves</button>
    <button class="subcategory-btn" onclick="filterCategory('air-fryer')">Air Fryer</button>
</nav>

<!-- Product Grid -->
<div class="product-grid">
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");
            stmt = conn.createStatement();
            String query = "SELECT * FROM appliances";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
            	int productId = rs.getInt("id");
                String name = rs.getString("name");
                String price = rs.getString("price");
                String imageUrl = rs.getString("image_url");
                String category = rs.getString("category");
    %>
    <div class="product-card <%= category %>">
        <img src="<%= imageUrl %>" alt="<%= category %>">
        <h2 class="product-name"><%= name %></h2>
        <p class="price">₹<%= price %></p>
        <a href="appliance_detail.jsp?id=<%= productId %>" class="view-details-btn">View Details</a>
    </div>
    <%
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    %>
</div>

<script>
function filterCategory(category) {
    const cards = document.querySelectorAll('.product-card');
    cards.forEach(card => {
        if (category === 'all' || card.classList.contains(category)) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}

</script>
 <!-- Footer -->
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
                    <li><a href="logout.html">Login/Register</a></li>
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
