<%@ page import="java.sql.*" %>
<%
    String workerId = request.getParameter("dworkerId");
    String message = "";
    
    if (workerId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
            String qry = "DELETE FROM loginreg WHERE Worker_ID = ?";
            PreparedStatement pstmt = con.prepareStatement(qry);
            pstmt.setString(1, workerId);
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                message = "Worker deleted successfully.";
            } else {
                message = "Worker not found.";
            }
            
            pstmt.close();
            con.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    } else {
        message = "Worker ID is required.";
    }

    response.sendRedirect("worker.jsp?message=" + message); // Redirect to the worker.jsp page with a message
%>
