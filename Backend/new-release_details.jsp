<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 40px;
            text-align: center;
        }

        .product-detail {
            background: white;
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
        }

        .product-detail img {
            width: 100%;
            max-height: 300px;
            object-fit: cover;
            border-radius: 10px;
        }

        .product-detail h2 {
            margin-top: 20px;
            font-size: 26px;
        }

        .product-detail .price {
            color: #e91e63;
            font-size: 22px;
            margin: 10px 0;
        }

        .product-detail .release-date {
            color: #4caf50;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .product-detail .description, 
        .product-detail .features,
        .product-detail .warranty-info,
        .product-detail .manufacturer,
        .product-detail .specifications {
            text-align: left;
            margin-bottom: 10px;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<%
    String idParam = request.getParameter("id");

    if (idParam == null || idParam.trim().equals("")) {
        out.println("<p>Invalid product ID.</p>");
    } else {
        int id = Integer.parseInt(idParam);

        String url = "jdbc:mysql://localhost:3306/electromart";
        String username = "root";
        String password = "Barkha@241";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM new_release_detail WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                String features = rs.getString("features");
                String warrantyInfo = rs.getString("warranty_info");
                String manufacturer = rs.getString("manufacturer");
                String specifications = rs.getString("specifications");
                int stockQuantity = rs.getInt("stock_quantity");
                double rating = rs.getDouble("rating");
                int reviewsCount = rs.getInt("reviews_count");
                boolean isAvailable = rs.getBoolean("is_available");
%>
                <div class="product-detail">
                    <img src="<%= image %>" alt="<%= name %>">
                    <h2><%= name %></h2>
                    <p class="price">$<%= price %></p>
                    <p class="release-date">In Stock: <%= stockQuantity %> | Rating: <%= rating %> | Reviews: <%= reviewsCount %></p>

                    <div class="description">
                        <h3>Description</h3>
                        <p><%= description %></p>
                    </div>

                    <div class="features">
                        <h3>Features</h3>
                        <p><%= features %></p>
                    </div>

                    <div class="warranty-info">
                        <h3>Warranty Info</h3>
                        <p><%= warrantyInfo %></p>
                    </div>

                    <div class="manufacturer">
                        <h3>Manufacturer</h3>
                        <p><%= manufacturer %></p>
                    </div>

                    <div class="specifications">
                        <h3>Specifications</h3>
                        <p><%= specifications %></p>
                    </div>

                    <a href="new-release.jsp" class="back-button">⬅ Back to New Releases</a>
                </div>
<%
            } else {
                out.println("<p>Product not found.</p>");
            }

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>

</body>
</html>
