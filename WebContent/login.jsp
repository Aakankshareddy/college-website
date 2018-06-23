<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.example.util.DBUtil"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	Connection con = DBUtil.getMySqlConnection();
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select * from USER where EMAIL='"
			+ email + "' and PASSWORD='" + password + "'");
	if (rs.next()) {
		session.setAttribute("email", email);
		response.sendRedirect("success.jsp");
	} else {
		out.println("Invalid password <a href='index.jsp'>try again</a>");
	}
%>