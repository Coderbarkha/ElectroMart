<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bestsellers</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js" defer></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        #bestseller-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .product-card img {
            width: 100%;
            max-height: 180px;
            height: auto;
            object-fit: contain;
            border-radius: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }

        .product-card h3 {
            font-size: 1.1rem;
            color: #333;
            margin-top: 12px;
            margin-bottom: 6px;
        }

        .product-card p {
            font-size: 0.95rem;
            color: #555;
            margin: 5px 0;
        }

        .product-card .price {
            font-size: 1.1rem;
            font-weight: bold;
            color: #e91e63;
            margin-top: 8px;
        }

        .product-card .rating {
            color: #fbc02d;
            font-size: 1rem;
        }

        .product-card .view-details-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 5px 15px;
            background-color: #e91e63;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        .product-card .view-details-btn:hover {
            background-color: #d81b60;
        }

        @media (max-width: 768px) {
            #bestseller-grid {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
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
                    <li><a href="allproducts.jsp">Products</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li><a href="about.html">About</a></li>
                </ul>
              
                <div class="user-section">
                    <button class="signin-btn"><a href="logout.html">Log Out</a></button>
                    <a href="viewCart.jsp"><i class="fas fa-shopping-cart cart-icon"></i></a>
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
                    <li><a href="mobiles.html">Mobiles</a></li>
                    <li><a href="laptop.html">Laptops</a></li>
                    <li><a href="accessories.html">Accessories</a></li>
                    <li><a href="home-appliances.html">Home Appliances</a></li>
                </ul>
            </li>
            <li><a href="fresh.html">Fresh</a></li>
            <li><a href="bestseller.jsp">Best Seller</a></li>
            <li><a href="deals.html">Today's Deals</a></li>
            <li><a href="new-release.html">New Release</a></li>
        </ul>
    </div>

    <header>
        <h1>🔥 Bestselling Products</h1>
    </header>

    <!-- Bestseller Grid -->
    <div class="bestseller-container">
        <div id="bestseller-grid">
            <%
                String url = "jdbc:mysql://localhost:3306/electromart?useUnicode=true&characterEncoding=UTF-8";
                String user = "root";
                String password = "Barkha@241";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    String query = "SELECT * FROM bestseller";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        int productId = rs.getInt("id");
                        String productName = rs.getString("name");
                        double price = rs.getDouble("price");
                        String imageUrl = rs.getString("image");
                        double rating = rs.getDouble("rating");
            %>
                        <div class="product-card">
                            <img src="<%= imageUrl %>" alt="<%= productName %>">
                            <h3><%= productName %></h3>
                            <p class="price">₹<%= price %></p>
                            <p class="rating"><%= rating %>/5</p>
                            <a href="bestsellerdetail.jsp?id=<%= productId %>" class="view-details-btn">View Details</a>
                        </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
        </div>
    </div>

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
