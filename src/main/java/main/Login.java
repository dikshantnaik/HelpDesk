package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
	super();
	// TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	System.out.println(email);
	// TODO Auto-generated mesthod stub
	try {

	    String query = "Select * from users";
	    PrintWriter out = response.getWriter();
	    HttpSession session  = request.getSession();
	    Connection conn = Database.initSql();
	    Statement stmt = conn.createStatement();
	    try {

		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
		    if (rs.getString("email").equals(email)) {
			System.out.println(rs.getString("email"));
			if (rs.getString("password").equals(password)) {
			    out.println("<script>alert(\"" + "LogedIn" + "\")</script>");
			    session.setAttribute("name", rs.getString("name"));
			    session.setAttribute("id", rs.getInt("id"));
			    session.setAttribute("email", rs.getString("email"));
			    session.setAttribute("role", rs.getString("jobRole"));
			    if(rs.getString("userType").equals("admin")) {
				response.sendRedirect("index.jsp");
			    }else {
				response.sendRedirect("index_user.jsp");
			    }
			}
		    }

		}
		out.print("Wrong Credenitial");
		
	    } catch (Exception e) {
		System.out.println(e.toString());
	    } finally {
		conn.close();
		stmt.close();
	    }

	} catch (SQLException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

//		doGet(request, response);
    }

}
