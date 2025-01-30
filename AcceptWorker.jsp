<%@ page import="java.sql.*" %>
<%
    try {
        // Retrieve the Worker_ID from the request
        int w_id = Integer.parseInt(request.getParameter("id"));
        boolean isActive = true;

        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");

        // Prepare the SQL query to activate the worker
        String qry = "UPDATE loginreg SET status = 'Approved' WHERE Worker_ID = ?";
        PreparedStatement ps = cn.prepareStatement(qry);
        ps.setInt(1, w_id);

        // Execute the update query
        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            // Redirect back to index2.jsp to approve more workers
            response.sendRedirect("popup.jsp?message=Worker+Registration+Approved!&redirect=index2.jsp");
        } else {
            response.sendRedirect("popup.jsp?message=Error! Worker Not Found.&redirect=index2.jsp");
        }

        // Close resources
        ps.close();
        cn.close();

    } catch (Exception e) {
        response.sendRedirect("popup.jsp?message=Error: " + e.getMessage() + "&redirect=index2.jsp");
    }
%>

<%-- <%@page import="com.mongodb.client.model.CollationCaseFirst"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%
		try
		{
			int w_id = Integer.parseInt(request.getParameter("id")); 
			boolean isActive = true;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency","root","");
			PreparedStatement ps = null;
			Statement st = cn.createStatement();
			
			String qry;
			
			 qry = "UPDATE loginreg SET Is_Active = ? WHERE Worker_ID = ?";
		         ps = cn.prepareStatement(qry);
		        ps.setBoolean(1, isActive); // Set Is_Active value
		        ps.setInt(2, w_id); // Set Worker_ID as an integer

		        // Execute the update
		        int rowsUpdated = ps.executeUpdate();
				//out.println(qry);
				
				response.sendRedirect("popup.jsp?message=Request Accepted!&redirect=index2.jsp");	
		
			
		}
		catch(Exception e)
		{
			PrintWriter out1 = response.getWriter(); // Get PrintWriter from response
	        out1.println("Error: " + e.getMessage());
			//response.sendRedirect("popup.jsp?message=Enter+Unique+Supplier+id!&redirect=AddUser.jsp");
		} 
	%>
</body>
</html>
 --%>
