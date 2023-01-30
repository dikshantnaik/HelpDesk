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
	    if (status.equals("pending")) {

		query = "UPDATE tasks SET status='running' where id = " + id;
	    }else if(status.equals("running")){
		query = "UPDATE tasks SET status='closed' where id = " + id;
	    }else{
		query = "UPDATE tasks SET status='pending' where id = " + id;
	    }
	    stmt.executeUpdate(query);
	    response.sendRedirect("task.jsp");
	} catch (Exception e) {
	    e.printStackTrace();
	}
	%>
</body>
</html>