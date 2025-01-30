<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Attendance System</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Bootstrap Css -->
<link href="assets/css/bootstrap.min.css" id="bootstrap-style"
	rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="assets/css/app.min.css" id="app-style" rel="stylesheet"
	type="text/css" />
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Add Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Add Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>


<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="assets/css/main.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="assets/main.css">
</head>
<body data-sidebar="dark" data-layout-mode="light">
<body>


<div class="main-content">

		<div class="page-content">
			<div class="container-fluid">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title mb-4">Attendance</h4>
							<div class="table-responsive">
								<table class="table align-middle table-nowrap mb-0">
									<thead class="table-light">
										<tr>

											<th class="align-middle">Worker ID</th>
											<th class="align-middle">FirstName</th>
											<th class="align-middle">LastName</th>
											<th class="align-middle">Contact</th>
											<th class="align-middle">Date</th>
											<th class="align-middle">Time-In</th>
											<th class="align-middle">Time-Out</th>
											<th class="align-middle">Work Hours</th>
											<th class="align-middle">Extra Hours</th>
											
										</tr>
									</thead>
									<tbody>
										<%
										Class.forName("com.mysql.cj.jdbc.Driver");
										Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
										PreparedStatement ptst = null;
										Statement st = cn.createStatement();

										String qry;
										
										
									
										/* qry = "SELECT l.Worker_ID, " +
											      "l.First_Name, " +
											      "l.Last_Name, " +
											      "l.Phone_no, " +
											      "DATE_FORMAT(a.TimeIn,  '%d-%m-%Y') AS DateIn, " +
											      "DATE_FORMAT(a.TimeIn, '%H:%i') AS TimeIn, " +
											      "IFNULL(DATE_FORMAT(a.OutTime, '%H:%i'), '-') AS OutTime " +
											      "FROM loginreg l " +
											      "JOIN attendance a ON l.Worker_ID = a.Worker_ID " +
											      "WHERE l.Role = 'Worker' " +
											      "AND DATE(a.TimeIn) = CURDATE() " +
											      "ORDER BY a.TimeIn";
 */
 qry = "SELECT l.Worker_ID, " +
         "l.First_Name, " +
         "l.Last_Name, " +
         "l.Phone_no, " +
         "DATE_FORMAT(a.TimeIn,  '%d-%m-%Y') AS DateIn, " +
         "DATE_FORMAT(a.TimeIn, '%H:%i') AS TimeIn, " +
         "IFNULL(DATE_FORMAT(a.OutTime, '%H:%i'), '-') AS OutTime " +
         "FROM loginreg l " +
         "JOIN attendance a ON l.Worker_ID = a.Worker_ID " +
         "WHERE l.Role = 'Worker' And l.Status='Approved'" +
         "AND DATE(a.TimeIn) = CURDATE() " +
         "ORDER BY a.TimeIn";

		                                ptst = cn.prepareStatement(qry);
										ResultSet rs = ptst.executeQuery();
										Integer id = null;
										String fname = null;
										String lname = null;
										String contact = null;
										String dateIn = null;
										String timein = null; 
										String timeout = null; 

										while (rs.next()) {
										    id = rs.getInt("Worker_ID");
										    fname = rs.getString("First_Name");
										    lname = rs.getString("Last_Name");
										    contact = rs.getString("Phone_no");
										    dateIn = rs.getString("DateIn");// Get the formatted CreatedDTStamp as Date
										    timein = rs.getString("TimeIn");
										    timeout = rs.getString("OutTime");
										%>
										<tr>
										    <td class="align-middle" style="width: 9%;"><%=id%></td>
										    <td><%=fname%></td>
										    <td><%=lname%></td>
										    <td><%=contact%></td>
										    <td><%=dateIn%></td>  <!-- Display the formatted date -->
										    <td><%=timein%></td>
										    <td><%=timeout%></td>  
										<td>
            <button type="button" id="8hours_<%=id%>" class="btn btn-sm btn-rounded"></button>
        </td>
        <td>
            <button type="button" id="Extrahours_<%=id%>" class="btn btn-sm btn-rounded"></button>
        </td>
											<%
											}
											%>
										</tr>
											
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end table-responsive -->
		</div>
	</div>
<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/construction_agency";
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // Query to get worker hours and calculate extra hours
        String query = "SELECT a.Worker_ID, " +
                "CASE WHEN a.OutTime IS NOT NULL THEN ABS(TIMESTAMPDIFF(HOUR, a.TimeIn, a.OutTime)) " +
                "ELSE '-' END AS hoursWorked " + // If OutTime is null, return '-'
                "FROM attendance a " +
                "JOIN loginreg l ON a.Worker_ID = l.Worker_ID " +
                "WHERE l.Status = 'Approved' " +
                "AND l.Role = 'Worker' " +
                "AND l.Is_Active = 1 " +
                "ORDER BY a.CreatedDTStamp ";
        Statement stmt = conn.createStatement();
        ResultSet rs2 = stmt.executeQuery(query);

        
        while (rs2.next()) {
            int hoursWorked = 0;
            int extraHours = 0;

            String result = rs2.getString("hoursWorked");  
            if (result.equals("-")) {
                hoursWorked = -1;  // Indicating OutTime is null
            } else {
                hoursWorked = Integer.parseInt(result);
                if (hoursWorked > 8) {
                    extraHours = hoursWorked - 8;  // Calculate extra hours only if more than 8 hours worked
                }
            }
    %>

            
            <script>
                // Wait for the page to load completely before running the script
                document.addEventListener("DOMContentLoaded", function() {
                	const workerId = <%= rs2.getInt("Worker_ID") %>;
                    const hoursWorked = <%= hoursWorked %>;
                    const extraHours = <%= extraHours %>;

                    const eightHoursBtn = document.getElementById("8hours_" + workerId);
                    const extraHoursBtn = document.getElementById("Extrahours_" + workerId);

                    eightHoursBtn.className = "btn";  
                    extraHoursBtn.className = "btn";  

                    if (hoursWorked === -1) {
                        eightHoursBtn.textContent = "No Checkout Yet";
                        eightHoursBtn.classList.add("btn-danger");  // Red
                        extraHoursBtn.textContent = "-"; 
                        extraHoursBtn.classList.add("btn-secondary");  // Gray
                    } 
                    else if (hoursWorked < 8) {
                        eightHoursBtn.textContent = hoursWorked + " hrs";
                        eightHoursBtn.classList.add("btn-warning");  // Yellow
                        extraHoursBtn.textContent = "No Extra Hours";  //gray
                        extraHoursBtn.classList.add("btn-secondary");  
                    } 
                    else if (hoursWorked === 8) {
                        eightHoursBtn.textContent = "8 hrs";
                        eightHoursBtn.classList.add("btn-success");  // Green
                        extraHoursBtn.textContent = "No Extra Hrs";
                        extraHoursBtn.classList.add("btn-secondary");  
                    } 
                    else if (hoursWorked > 8) {
                        eightHoursBtn.textContent = "8 hrs";
                        eightHoursBtn.classList.add("btn-success");  // Green
                        extraHoursBtn.textContent = extraHours + " hrs Extra";
                        extraHoursBtn.classList.add("btn-warning");  // Yellow
                    }
                });
                </script>
            <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>





	<!-- end modal -->
	<script src="assets/libs/jquery/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/libs/metismenu/metisMenu.min.js"></script>
	<script src="assets/libs/simplebar/simplebar.min.js"></script>
	<script src="assets/libs/node-waves/waves.min.js"></script>

	<!-- apexcharts -->
	<script src="assets/libs/apexcharts/apexcharts.min.js"></script>

	<!-- dashboard init -->
	<script src="assets/js/pages/dashboard.init.js"></script>

	<!-- App js -->
	<script src="assets/js/app.js"></script>
</body>
<jsp:include page="header.jsp" />
<jsp:include page="SidePanel.jsp" />
</html>