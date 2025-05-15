<%
String username = (String) session.getAttribute("uname");

if (username != null) {
    response.sendRedirect("buypreview1.jsp");  // user is logged in
} else {
    session.setAttribute("nextpage", "buypreview1.jsp"); // store where to go after login
    response.sendRedirect("login.html");
}
%>
