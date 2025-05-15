<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mobiles</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <style>
        header {
            color: white;
            text-align: center;
            font-size: 28px;
            font-weight: bolder;
            background-color: orange;
           
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
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            padding: 15px;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
        }

        /* Product Image */
        .product-card img {
            width: 200px;
            height: 200px;
            border-bottom: 1px solid #ddd;
            transition: transform 0.3s ease;
        }

        .product-card:hover img {
            transform: scale(1.05);
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
            color: #27ae60;
            font-weight: bold;
            margin: 5px 0;
        }

.btn-link {
    display: inline-block;
    text-decoration: none;
    text-align: center;
    font-weight: bold;
    padding: 12px;
    width: 48%;
    border-radius: 5px;
    transition: all 0.3s ease-in-out;
    color: white;
}

.add-to-cart {
    background: #28a745;
}

.add-to-cart:hover {
    background: #218838;
}

.view-details {
    background: #3498db;
}

.view-details:hover {
    background: #2980b9;
}


        @media (max-width: 768px) {
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
                    <button class="signin-btn"><a href="login.html">Log Out</a></button>
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

    <header>Mobiles</header>
    <br><br><br>


<%
String tableName = "mobile_details";
    // DB Configuration
    String jdbcURL = "jdbc:mysql://localhost:3306/electromart";
    String dbUser = "root";
    String dbPassword = "Barkha@241";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Create connection to the database
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // SQL query to get all mobile products
        String sql = "SELECT * FROM mobiles";  
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

    %>

    <div class="product-grid">
        <% while(rs.next()) {
            // Get product details
            String name = rs.getString("product_name");
            double price = rs.getDouble("price");
            String imageUrl = rs.getString("image_url");
            int productId = rs.getInt("id"); // Assuming the column is 'product_id'
        %>

        <!-- Display each product -->
        <div class="product-card">
            <img src="<%= imageUrl %>" alt="<%= name %>">
            <h2 class="product-name"><%= name %></h2>
            <p class="price">₹<%= String.format("%.2f", price) %></p>

            <!-- Button container for Add to Cart and View Details -->
            <div class="button-container">
                <!-- Add to Cart Button -->
              


                <!-- View Details Button -->
                <a href="mobile_details.jsp?productId=<%= productId %>" 
                   class="btn-link view-details">
                   View Details
                </a>
            </div>
        </div>

        <% } %>
    </div>

    <%
    } catch(Exception e) {
        out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
    %>

</body>
</html>
