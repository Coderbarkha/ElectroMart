<%
String username = (String) session.getAttribute("uname");

if (username != null) {
    response.sendRedirect("buypreview.jsp");  // user is logged in
} else {
    session.setAttribute("nextpage", "buypreview.jsp"); // store where to go after login
    response.sendRedirect("login.html");
}
%>
