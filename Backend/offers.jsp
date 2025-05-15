<%@ page import ="java.util.*, java.sql.*" %>

<%
    double totalPrice = 0.0;
    try {
        List<String> cart = (List<String>) session.getAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electromart", "root", "Barkha@241");
            cart.removeIf(Objects::isNull);
            session.setAttribute("cart", cart);

            // Calculate the total price of cart items
            for (String item : cart) {
                int id = Integer.parseInt(item);
                PreparedStatement stmt = con.prepareStatement("SELECT * FROM product_details WHERE product_id=?");
                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    totalPrice += rs.getDouble(8);
                }
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    double discount = 0.0;
    if (totalPrice >= 5000) {
        discount = 20.0;
        session.setAttribute("availableDiscount", discount);
    } else if (totalPrice >= 3000) {
        discount = 15.0;
        session.setAttribute("availableDiscount", discount);
    } else if (totalPrice >= 1000) {
        discount = 10.0;
        session.setAttribute("availableDiscount", discount);
    } else {
        discount = 5.0;
        session.setAttribute("availableDiscount", discount);
    }
%>

<!-- Display coupon message -->
<h2>Special Offers for You</h2>
<div class="coupon-container">
    <div class="coupon" onclick="window.location='viewCart.jsp?applyCoupon=true'">
        <p><strong>Apply Now!</strong></p>
        <p class="discount"><%= discount %>% OFF</p>
        <p class="validity">Valid on cart total ₹<%= totalPrice %> and above</p>
    </div>
</div>

double discountedPrice = totalPrice - (totalPrice * discount / 100);
session.setAttribute("finalPrice", discountedPrice);
