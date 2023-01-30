<%@page import="main.Database"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	String status = request.getParameter("status");
	out.print(id);

	Connection conn = Database.initSql();
	Statement stmt = conn.createStatement();
	try {
	    String query;

		query = "DELETE FROM tasks where id =" + id;
	    stmt.executeUpdate(query);
	    response.sendRedirect("task.jsp");
	} catch (Exception e) {
	    e.printStackTrace();
	}
	%>
</body>
</html>