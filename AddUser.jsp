<%@page import="com.mongodb.client.model.CollationCaseFirst"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%
		//String w_id = request.getParameter("Worker_ID");
		String f_name = request.getParameter("FirstName");
		String l_name = request.getParameter("LastName");
		String w_dob = request.getParameter("DOB");
		String w_gen = request.getParameter("inlineRadioOptions");
		String w_email = request.getParameter("email");
		String w_pass = request.getParameter("Pwd");
		String w_CnfPwd = request.getParameter("CnfPwd");
		String w_phn = request.getParameter("PhnNo");
		String w_age = request.getParameter("Age");
		String w_adhnum = request.getParameter("Aadhar");
		String w_add = request.getParameter("Address");
		String w_sts =request.getParameter("sts");
		
		out.println("Password : "+f_name);
		out.println("Password : "+w_pass);
		out.println("Cnf Password : "+w_CnfPwd);
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency","root","");
			PreparedStatement ps = null;
			Statement st = cn.createStatement();
			
			String qry;
			
			if(w_CnfPwd.equals(w_pass))
			{
				qry = "INSERT INTO loginreg(First_Name,Last_Name,DOB,Email,Gender,Password,Phone_no,Age,AdharNumber,Address,Role,Is_Active) VALUES(";
				/* qry += "'"+w_id+"',"; */
				qry += "'"+f_name+"',";
				qry += "'"+l_name+"',";
				qry += "'"+w_dob+"',";
				qry += "'"+w_email+"',";
				qry += "'"+w_gen+"',";
				qry += "'"+w_pass+"',";
				qry += "'"+w_phn+"',";
				qry += "'"+w_age+"',";
				qry += "'"+w_adhnum+"',";
				qry += "'"+w_add+"',";
				qry += "'"+w_sts+"'";
				qry += ",1";
				qry += ")";
				
				//System.out.println(qry);
				//out.println();
				
				out.println("\n\nQry : "+qry);
				st.execute(qry);
				//out.println(qry);
				
				response.sendRedirect("popup.jsp?message=Registration+Successful!+Admin+Approval+Pending&redirect=workerlogin.html");
			} else {
			    // Redirect back if password mismatch
			    response.sendRedirect("popup.jsp?message=Password+Mismatch!&redirect=workerreg.html");
			}
				/* 
				response.sendRedirect("popup.jsp?message=Registration+Request+Sent\nLogin After Sometime!&redirect=workerlogin.html");	
			}
			else
			{
				response.sendRedirect("popup.jsp?message=Password and+Confirm Password Must Be Same!&redirect=workerlogin.html");
			}
			 */
		}
		catch(Exception e)
		{
			PrintWriter out1 = response.getWriter(); // Get PrintWriter from response
	        out1.println("Error: " + e.getMessage());
			//response.sendRedirect("popup.jsp?message=Enter+Unique+Supplier+id!&redirect=AddUser.jsp");
		} 
	%>
</body>
</html>