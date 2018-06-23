<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.example.util.DBUtil"%>
<%
	String password = request.getParameter("password");
	String firstName = request.getParameter("firstname");
	String lastName = request.getParameter("lastname");
	String email = request.getParameter("email");
	String branch = request.getParameter("branch");
	String year = request.getParameter("year");
	Connection con = DBUtil.getMySqlConnection();
	Statement st = con.createStatement();
	//ResultSet rs;
	int i = st
			.executeUpdate("insert into USER(FIRST_NAME, LAST_NAME, EMAIL, BRANCH, YEAR, PASSWORD) values ('"
					+ firstName
					+ "','"
					+ lastName
					+ "','"
					+ email
					+ "','" 
					+ branch
					+ "','" 
					+ year
					+ "','" 
					+ password 
					+ "')");
	if (i > 0) {
		response.sendRedirect("welcome.jsp");
	} else {
		response.sendRedirect("index.jsp");
	}
%>