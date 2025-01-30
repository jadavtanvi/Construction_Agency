<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.util.Random" %>

<html>
<head>
    <title>Admin Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            text-align: center;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
        .message {
            color: green;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        
            
        <%
                // Fetch the OTP from the database for the given email
                try {
                	
                	String em = request.getParameter("email");
                	String pw = request.getParameter("password");
                	String cpw = request.getParameter("Cpassword");
                	String final_pw = "";
                	
                	if(pw.equals(cpw)){
                		final_pw = pw;
                		
                	}
                	else {
                        
                        response.sendRedirect("popup.jsp?message=Password+Not+Match!&redirect=reset.jsp"); 
                    }
                	
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
                    PreparedStatement pst = cn.prepareStatement("SELECT Email FROM loginreg WHERE Email = ?");
                    pst.setString(1, em);
                    ResultSet rs = pst.executeQuery();

                    if (rs.next()) 
                    {
                       
                       PreparedStatement pt = cn.prepareStatement("UPDATE loginreg SET Password=? WHERE Email=?");
                       pt.setString(1, final_pw);
                       pt.setString(2, em);
                       Integer rst = pt.executeUpdate();
                       
                       if(rst>0)
                       {
                    	   response.sendRedirect("popup.jsp?message=Password+Updated+Successfully!&redirect=about.html"); 
                       } 
                       
                    }
        			else {
                        
                        response.sendRedirect("popup.jsp?message=Email+Not+Found!&redirect=about.html"); 
                    }
                } catch (Exception e) {
                    out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
                }
            
        %>
    </div>
</body>
</html>
