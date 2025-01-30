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
       
        
    	String query = "SELECT * FROM attendance WHERE CAST(CreatedDTStamp AS DATE) = CAST(NOW() AS DATE) AND Worker_ID = ? AND OutTime IS NULL";

	    
        PreparedStatement pst = cn.prepareStatement(query);

       // Set Worker_ID parameter
       pst.setInt(1, w_id);
      
       // Execute query
       ResultSet rs = pst.executeQuery();
		
       // Count rows
       int rowCount = 0;
       while (rs.next()) {
           rowCount++;
       }
      
        if(rowCount>0)
        {
        
	        // Prepare the SQL query to activate the worker
	        String qry = "UPDATE attendance SET OutTime	 = NOW() WHERE  CAST(CreatedDTStamp AS DATE) = CAST(NOW() AS DATE) AND Worker_ID = ? AND OutTime IS NULL";
	        PreparedStatement ps = cn.prepareStatement(qry);
	        ps.setInt(1, w_id);
	
	        // Execute the update query
	        int rowsUpdated = ps.executeUpdate();
	
	        if (rowsUpdated > 0) {
	            // Redirect back to index2.jsp to approve more workers
	            response.sendRedirect("popup.jsp?message=Timeout updated!&redirect=worker.jsp");
	        } else {
	            response.sendRedirect("popup.jsp?message=Error! TimeEntry Not Found.&redirect=worker.jsp");
	        }
	        // Close resources
	        ps.close();
        }
        else
        {
        	  response.sendRedirect("popup.jsp?message=Error! Signin entry Not Found.&redirect=worker.jsp");
        }
        // Close resources
        pst.close();
        cn.close();

    } catch (Exception e) {
        response.sendRedirect("popup.jsp?message=Error: " + e.getMessage() + "&redirect=worker.jsp");
    }
%>
