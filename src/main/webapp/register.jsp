<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="main.Database"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><%
try {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String userType = request.getParameter("usertype");
    String company = request.getParameter("company");
    String dept = request.getParameter("dept");
    String contact = request.getParameter("contact");
	
   Connection conn = Database.initSql();
    
    
    PreparedStatement stmt=conn.prepareStatement("insert into users values(NULL,?,?,?,?,?,?,?)");  
    stmt.setString(1, name);
    stmt.setString(2, email);
    stmt.setString(3, password);
    stmt.setString(4, userType);
    stmt.setString(5, company);
    stmt.setString(6, dept);
    stmt.setString(7, contact);
    
  	if(stmt.executeUpdate()>0){
  	    response.sendRedirect("login.html");
  	}
    //ResultSet rs = stmt.executeQuery("SELECT * FROM students");

    
} catch (Exception e) {
    out.print(e.toString());
}
%>

</body>
</html>