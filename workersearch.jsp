<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
</head>
<body>

<%
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String phoneno = request.getParameter("phoneno");

    if (email != null && !email.trim().isEmpty()) {
        String url = "jdbc:mysql://localhost:3306/construction_agency";
        String user = "root";
        String password = "";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "UPDATE loginreg SET name = ?, phoneno = ? WHERE Email = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, phoneno);
            stmt.setString(3, email);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<p>User details updated successfully!</p>");
            } else {
                out.println("<p>Update failed. Try again.</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
%>

<a href="search.jsp">Back to Search</a>

</body>
</html>
