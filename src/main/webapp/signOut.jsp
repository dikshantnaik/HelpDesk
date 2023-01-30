<%
session.removeAttribute("email");
session.removeAttribute("dept");
session.removeAttribute("name");
response.sendRedirect("login.html");
%>