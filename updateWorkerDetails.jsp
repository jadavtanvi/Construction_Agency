<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Worker</title>
</head>
<body>

<%
    // Input validation
    String Id = request.getParameter("ewid");
    String firstName = request.getParameter("ewfname");
    String lastName = request.getParameter("ewlname");
    String contactNumber = request.getParameter("econtactNumber");
    String gender = request.getParameter("egender");
    String dob = request.getParameter("edob");
    String address = request.getParameter("eaddress");
    String ageStr = request.getParameter("eage");
    String email = request.getParameter("eemail");
    String adharNumber = request.getParameter("eaadharNumber");
    String esalary = request.getParameter("esalary");
    

    
    int age = 0;

    try {
       
        if (ageStr != null && !ageStr.isEmpty()) {
            age = Integer.parseInt(ageStr); // Parse Age (if provided)
        }
    } catch (NumberFormatException e) {
        response.sendRedirect("worker.jsp?message=Invalid Worker_ID or Age.");
        return;
    }

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
        int w_id = Integer.parseInt(Id);
        // Update query
        String updateQuery = "UPDATE loginreg SET First_Name=?, Last_Name=?, Phone_no=?, Gender=?, DOB=?, AdharNumber=?, Address=?, Email=?, Age=?,Salary=? WHERE Worker_ID=?";
        pstmt = con.prepareStatement(updateQuery);
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, contactNumber);
        pstmt.setString(4, gender);
        pstmt.setString(5, dob);
        pstmt.setString(6, adharNumber);
        pstmt.setString(7, address);
        pstmt.setString(8, email);
        pstmt.setInt(9, age);
        pstmt.setInt(10,  Integer.parseInt(esalary));
        pstmt.setInt(11,  w_id);
        

        // Execute the update
        int rowsAffected = pstmt.executeUpdate();

        // Redirect to worker.jsp with a success or failure message
        if (rowsAffected > 0) {
            response.sendRedirect("worker.jsp?message=Worker details updated successfully.");
        } else {
            response.sendRedirect("worker.jsp?message=Worker not found or update failed.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("worker.jsp?message=An error occurred: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>




</body>
</html>
