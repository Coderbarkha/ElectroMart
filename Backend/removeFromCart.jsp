<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.*" %>
<%

// Get the removeId from the request
String removeId = request.getParameter("removeId");

// Retrieve the cart from the session
List<String> cart = (List<String>) session.getAttribute("cart");

// If the cart is null, initialize it
if (cart == null) {
    cart = new ArrayList<>();
}

if (removeId != null && !removeId.isEmpty()) {
    // Remove the product from the cart by its ID (ensure it's a String)
    cart.remove(removeId);

    // Update the cart in the session
    session.setAttribute("cart", cart);
}

// Redirect back to the cart view page after removal
response.sendRedirect("viewCart.jsp");

%>
