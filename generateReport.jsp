<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    response.setContentType("application/json");

    try {
        // SQL query to fetch today's daily attendance data
       String dailyQuery = "SELECT " +
                    "    DATE_FORMAT(a.TimeIn, '%H:%i') as TimeIn, " +  // Only Time without Date
                    "    DATE_FORMAT(a.OutTime, '%H:%i') as OutTime, " +  // Only Time without Date
                    "    DATE(a.TimeIn) as AttendanceDate, " +
                    "    l.First_Name, " +
                    "    l.Last_Name, " +
                    "    l.Phone_no, " +
                    "    ABS(TIMESTAMPDIFF(HOUR, a.TimeIn, a.OutTime)) as HoursWorked, " +
                    "    ABS(TIMESTAMPDIFF(HOUR, a.TimeIn, a.OutTime)) * l.salary as salary " +
                    "FROM " +
                    "    loginreg l " +
                    "JOIN " +
                    "    attendance a ON l.Worker_ID = a.Worker_ID " +
                    "WHERE " +
                    "    DATE(a.TimeIn) = CURDATE() " +  // Fetch today's data
                    "    AND DATE(a.OutTime) = CURDATE() " +
                    "ORDER BY " +
                    "    a.TimeIn";

        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");

        StringBuilder json = new StringBuilder("{");

        // Fetch daily report
        stmt = conn.prepareStatement(dailyQuery);
        rs = stmt.executeQuery();
        
        json.append("\"dailyReport\":[");

        while (rs.next()) {
            json.append("{")
                .append("\"date\":\"").append(rs.getString("AttendanceDate")).append("\",")
                .append("\"firstName\":\"").append(rs.getString("First_Name")).append("\",")
                .append("\"lastName\":\"").append(rs.getString("Last_Name")).append("\",")
                .append("\"phone\":\"").append(rs.getString("Phone_no")).append("\",")
                .append("\"timeIn\":\"").append(rs.getString("TimeIn")).append("\",")
                .append("\"timeOut\":\"").append(rs.getString("OutTime")).append("\",")
                .append("\"hoursWorked\":\"").append(rs.getInt("HoursWorked")).append("\",")
                .append("\"wages\":\"").append(rs.getDouble("salary")).append("\"")
                .append("},");

        }

        // Remove trailing comma
        if (json.charAt(json.length() - 1) == ',') {
            json.deleteCharAt(json.length() - 1);
        }
        json.append("],");

       
        
        json.append("\"weeklyReport\":[");


        // Remove trailing comma
        if (json.charAt(json.length() - 1) == ',') {
            json.deleteCharAt(json.length() - 1);
        }
        json.append("]}");

        // Output the result as JSON
        out.print(json.toString());

    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        out.print("{\"error\": \"An error occurred: " + e.getMessage() + "\"}");
    } finally {
        // Close resources
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
