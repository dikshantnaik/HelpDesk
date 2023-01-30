<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.Database"%>
<%
String taskName = request.getParameter("task");
String description = request.getParameter("description");
String due = request.getParameter("duedate");
String priority = request.getParameter("priority");

try{

    Connection conn = Database.initSql();
     
     
     PreparedStatement stmt=conn.prepareStatement("insert into tasks values(NULL,(select id from users WHERE email=?),?,?,?,?,'pending')");  
     stmt.setString(1,(String)session.getAttribute("email"));     
     stmt.setString(2, taskName);
     stmt.setString(3, description);
     stmt.setString(4, due);
     stmt.setString(5, priority);
     
   	if(stmt.executeUpdate()>0){
   	    response.sendRedirect("task.jsp");
   	}
}catch(Exception e){
    e.printStackTrace();
}
out.print(taskName);
%>