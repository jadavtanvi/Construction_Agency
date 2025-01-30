<%@ page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
    
    PreparedStatement pst = null;
    ResultSet rs = null;
    HttpSession se = request.getSession();
    String email = request.getParameter("email");
    String passw = request.getParameter("password");

    if (email != null && passw != null) {
        String sql = "SELECT * FROM loginreg WHERE Email=? AND Password=? AND Role='Admin' AND Is_Active=1";
        pst = cn.prepareStatement(sql);
        pst.setString(1, email);
        pst.setString(2, passw);
        rs = pst.executeQuery();

        if (rs.next()) {
            se.setAttribute("email", rs.getString("Email"));
            se.setAttribute("name", rs.getString("First_Name"));
            se.setAttribute("w_id", rs.getString("Worker_ID"));
            se.setAttribute("con", rs.getString("Phone_No"));
            response.sendRedirect("index2.jsp");
        } else {
            out.println("<script>");
            out.println("var popup = document.createElement('div');");
            out.println("popup.innerHTML = '<h2>Invalid Login</h2><p>Invalid username or password. Please try again.</p><button onclick=\"window.location.href=\\'about.html\\';\">Close</button>';");

            out.println("popup.style.position = 'fixed';");
            out.println("popup.style.top = '50%';");
            out.println("popup.style.left = '50%';");
            out.println("popup.style.transform = 'translate(-50%, -50%)';");
            out.println("popup.style.background = 'white';");
            out.println("popup.style.border = '2px solid red';");
            out.println("popup.style.padding = '20px';");
            out.println("popup.style.boxShadow = '0px 0px 10px rgba(0, 0, 0, 0.5)';");

            out.println("document.body.appendChild(popup);");
            out.println("</script>");
        }
    } else {
        out.println("<p>No data received! Check form submission.</p>");
    }
%>

</body>
</html>
