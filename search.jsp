<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String search = request.getParameter("search");
    String dbURL = "jdbc:mysql://localhost:3306/construction_agency";
    String dbUser = "root";
    String dbPass = "";

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String query = "SELECT * FROM loginreg WHERE (Worker_ID = ? OR Email = ?) AND status = 'Approved' AND role = 'Worker' AND Is_Active = 1";
        pst = conn.prepareStatement(query);
        pst.setString(1, search);
        pst.setString(2, search);
        rs = pst.executeQuery();

        if (rs.next()) {
%>
            <p><b>Worker ID:</b> <%= rs.getInt("Worker_ID") %></p>
            <p><b>First Name:</b> <%= rs.getString("First_Name") %></p>
            <p><b>Last Name:</b> <%= rs.getString("Last_Name") %></p>
            <p><b>Contact Number:</b> <%= rs.getString("Phone_no") %></p>
            <p><b>Gender:</b> <%= rs.getString("Gender") %></p>
            <p><b>Date of Birth:</b> <%= rs.getString("DOB") %></p>
            <p><b>Aadhar Number:</b> <%= rs.getString("AdharNumber") %></p>
            <p><b>Age:</b> <%= rs.getInt("Age") %></p>
            <p><b>Address:</b> <%= rs.getString("Address") %></p>
            <p><b>Email:</b> <%= rs.getString("Email") %></p>
<%
        } else {
%>
            <p>No worker found with this ID or email.</p>
<%
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (pst != null) pst.close();
        if (conn != null) conn.close();
    }
%>
