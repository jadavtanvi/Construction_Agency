<%@page import="com.mongodb.client.model.CollationCaseFirst"%>
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
   try {
       // Retrieve the 'id' parameter
       String idParam = request.getParameter("id");
       
       if (idParam != null && !idParam.isEmpty()) {
           int w_id = Integer.parseInt(idParam); // Parse the ID
           
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
           String qry = "update loginreg set status='Rejected' WHERE Worker_ID = ?";
          
           PreparedStatement ps = cn.prepareStatement(qry);
           ps.setInt(1, w_id); // Set Worker_ID
         
           int rowsUpdated = ps.executeUpdate();
           
           if (rowsUpdated > 0) {
               response.sendRedirect("popup.jsp?message=Request Rejected!&redirect=index2.jsp");
           } else {
               response.sendRedirect("popup.jsp?message=No+such+Worker+ID!&redirect=index2.jsp");
           }
       } else {
           response.sendRedirect("popup.jsp?message=Worker+is+missing!&redirect=index2.jsp");
       }
   } catch (Exception e) {
       PrintWriter out1 = response.getWriter(); // Output error details
       out1.println("Error: " + e.getMessage());
   } 
%>

</body>
</html>