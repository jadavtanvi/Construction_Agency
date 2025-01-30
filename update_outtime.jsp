<%@ page import="java.sql.*, java.time.*, java.time.temporal.ChronoUnit" %>
<%
    String workerId = request.getParameter("workerId");
    String outTime = request.getParameter("outTime");

    Connection cn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        // Load database driver and establish connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");

        // Query to get the TimeIn for the worker
        String selectQuery = "SELECT TimeIn FROM attendance WHERE Worker_ID = ? AND OutTime IS NULL";
        pst = cn.prepareStatement(selectQuery);
        pst.setInt(1, Integer.parseInt(workerId));
        rs = pst.executeQuery();

        if (rs.next()) {
            Timestamp timeIn = rs.getTimestamp("TimeIn");
            LocalDateTime timeInDateTime = timeIn.toLocalDateTime();
            LocalDateTime currentDateTime = LocalDateTime.now();

            // Calculate the difference in hours
            long hoursBetween = ChronoUnit.HOURS.between(timeInDateTime, currentDateTime);

            // Check if the time difference is greater than or equal to 8 hours
            if (hoursBetween >= 8) {
                // Update the OutTime if the difference is greater than or equal to 8 hours
                String updateQuery = "UPDATE attendance SET OutTime = ? WHERE Worker_ID = ? AND OutTime IS NULL";
                pst = cn.prepareStatement(updateQuery);
                pst.setString(1, outTime);
                pst.setInt(2, Integer.parseInt(workerId));

                int rowsUpdated = pst.executeUpdate();
                if (rowsUpdated > 0) {
                    out.print("OutTime updated successfully!");
                } else {
                    out.print("Failed to update OutTime.");
                }
            } else {
                out.print("You need to work for at least 8 hours before marking OutTime.");
            }
        } else {
            out.print("No active attendance record found.");
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (cn != null) cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
