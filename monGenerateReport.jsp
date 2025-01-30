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
                            "  CONCAT(l.First_Name, ' ', l.Last_Name) as FullName, " +
                            "    l.Phone_no, " +
                            "  CONCAT(MONTHNAME(a.TimeIn),' ', YEAR(a.TimeIn)) as Month," +
                            "    COUNT( DATE(a.TimeIn)) as TotalDaysWorked, " +
                            "    SUM(ABS(TIMESTAMPDIFF(HOUR, a.TimeIn, a.OutTime)))  as HoursWorked, " +
                            "    SUM(ABS(TIMESTAMPDIFF(HOUR, a.TimeIn, a.OutTime)) * l.salary) as salary " +
                            "FROM " +
                            "    loginreg l " +
                            "Inner JOIN " +
                            "    attendance a ON l.Worker_ID = a.Worker_ID  and l.Is_Active=1 and a.OutTime is not null and a.TimeIn is not null " +
                            		
                            "GROUP BY l.First_Name, l.Last_Name,CONCAT(MONTHNAME(a.TimeIn),' ', YEAR(a.TimeIn)) "+
                            "order by MONTH(a.TimeIn)" ;

       

        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");

        StringBuilder json = new StringBuilder("{");

        // Fetch daily report
        stmt = conn.prepareStatement(dailyQuery);
        rs = stmt.executeQuery();
        
        json.append("\"MonthlyReport\":[");

        while (rs.next()) {
            json.append("{")
               
                .append("\"FullName\":\"").append(rs.getString("FullName")).append("\",")
              
                .append("\"phone\":\"").append(rs.getString("Phone_no")).append("\",")
                .append("\"month\":\"").append(rs.getString("Month")).append("\",")
                .append("\"TotalDaysWorked\":\"").append(rs.getString("TotalDaysWorked")).append("\",")
                .append("\"HoursWorked\":\"").append(rs.getInt("HoursWorked")).append("\",")
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
