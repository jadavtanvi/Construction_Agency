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
    String firstName = request.getParameter("FirstName");
    String lastName = request.getParameter("lastName");
    String contactNumber = request.getParameter("contactNumber");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    String ageStr = request.getParameter("age");
    String email = request.getParameter("email");
    String adharNumber = request.getParameter("aadharNumber");
    String Password = request.getParameter("Password");
    
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
       
        // Update query
          String sql = "INSERT INTO loginreg (First_name,Last_Name, Age, DOB, AdharNumber, Phone_no, Address, Email, Gender,Role,Is_Active,Password,status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
							        pstmt = con.prepareStatement(sql);
							        pstmt.setString(1, firstName);
							        pstmt.setString(2, lastName);
							        pstmt.setInt(3, Integer.parseInt(ageStr));
							        pstmt.setString(4, dob);
							        pstmt.setString(5, adharNumber);
							        pstmt.setString(6, contactNumber);
							        pstmt.setString(7, address);
							        pstmt.setString(8, email);
							        pstmt.setString(9, gender);
							        pstmt.setString(10, "Worker");
							        pstmt.setInt(11,1);
							        pstmt.setString(12, Password);
							        pstmt.setString(13, "Approved");
							        

        // Execute the update
        int rowsAffected = pstmt.executeUpdate();

        // Redirect to worker.jsp with a success or failure message
        if (rowsAffected > 0) {
        	
            response.sendRedirect("worker.jsp?message=Worker details added successfully.");
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