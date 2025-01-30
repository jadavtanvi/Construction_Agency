<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Worker - Construction</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery, Popper.js, and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- jQuery, Popper.js, and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
<body class="about-page">

	<header id="header" class="header d-flex align-items-center fixed-top">
		<div
			class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

			<a href="index.html" class="logo d-flex align-items-center">
				<h1 class="sitename" style="font-size: 28px;">Skote
					Construction</h1>
			</a>

			<nav id="navmenu" class="navmenu">
				<ul>
					<li class="current"></li>
					<li><a href="workerlogin.html" style="font-size: 17px;">Check-out</a></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>

		</div>
	</header>

	<main class="main">

		<!-- Page Title -->
		<div class="page-title dark-background"
			style="background-image: url(assets/images/page-title-bg.jpg);">
			<div class="container position-relative">
				<h3>Worker DashBoard</h3>
			</div>
		</div>
		<!-- End Page Title -->

		<!-- Stats Counter Section -->
		<section id="stats-counter" class="stats-counter section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<div class="main-content">

					<div class="page-content">
						<div class="container-fluid">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body" style="margin-right: -5px;">
										<h4 class="card-title mb-4">Workers</h4>
										<div class="table-responsive">
											<div class="table-responsive">
												<table class="table align-middle table-nowrap mb-0">
													<thead class="table-light">
														<tr>
															<th class="align-middle">WorkerID</th>
															<th class="align-middle">WorkerName</th>
															<th class="align-middle">Contact</th>
															<th class="align-middle">Email</th>
														</tr>
													</thead>
													<tbody>
														<%
														HttpSession see = request.getSession();

														// Database Connection
														Class.forName("com.mysql.cj.jdbc.Driver");
														Connection cn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");

														String eml1 = (see.getAttribute("email") != null) ? see.getAttribute("email").toString() : "default_email@example.com";
														String name1 = (see.getAttribute("name") != null) ? see.getAttribute("name").toString() : "default_name";
														int w_id1 = Integer.parseInt(see.getAttribute("w_id").toString());
														try {
															// Check if attendance already exists for today
															String checkQuery1 = "SELECT * FROM loginreg WHERE Worker_ID = ? and status='Approved' and Is_Active=1";

															PreparedStatement ptst = cn1.prepareStatement(checkQuery1);
															ptst.setInt(1, w_id1);
															ResultSet rs1 = ptst.executeQuery();
															while (rs1.next()) {
																String id = rs1.getString("Worker_ID");
																String fullName = rs1.getString("First_Name") + " " + rs1.getString("Last_Name");
																String phnNo = rs1.getString("Phone_no");
																String email = rs1.getString("Email");
														%>
														<tr>

															<td class="align-middle" style="width: 15%;"><%=id%></td>
															<td><%=fullName%></td>
															<td><%=phnNo%></td>
															<td><%=email%></td>
														</tr>
														<%
														}
														%>
													</tbody>
												</table>
												<%
												} catch (Exception e) {
												%>
												<p>
													Error:
													<%=e.getMessage()%></p>
												<%
												}
												%>
											</div>
											<div class="table-responsive">
												<table class="table align-middle table-nowrap mb-0">
												<thead class="table-light">
													<tr>
														<th class="align-middle">Date</th>
														<th class="align-middle">Time-In</th>
														<th class="align-middle">Time-Out</th>
														<th class="align-middle">Total Hours</th>
														<th class="align-middle">Salary</th>

													</tr>
												</thead>
												<tbody>


													<%
													double totalSalary = 0;
													HttpSession se = request.getSession();

													// Database Connection
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");

													String eml = (se.getAttribute("email") != null) ? se.getAttribute("email").toString() : "default_email@example.com";
													String name = (se.getAttribute("name") != null) ? se.getAttribute("name").toString() : "default_name";
													int w_id = Integer.parseInt(se.getAttribute("w_id").toString());

													try {
														// Check if attendance already exists for today
														String checkQuery = "SELECT * FROM attendance WHERE DATE(CreatedDTStamp) = CURDATE() AND Worker_ID = ?";
														PreparedStatement pst = cn.prepareStatement(checkQuery);
														pst.setInt(1, w_id);
														ResultSet rsCheck = pst.executeQuery();

														if (!rsCheck.next()) {
															String insertQuery = "INSERT INTO attendance (Worker_ID) VALUES (?)";
															PreparedStatement pstInsert = cn.prepareStatement(insertQuery);
															pstInsert.setInt(1, w_id);
															pstInsert.executeUpdate();
															pstInsert.close();
														}
														rsCheck.close();
														pst.close();
														String qryForReadLoginDtl = "SELECT " + "    DATE_FORMAT(a.TimeIn, '%d-%m-%Y') AS DateIn, " // Format TimeIn as dd-mm-yyyy
														+ "    DATE_FORMAT(a.TimeIn, '%H:%i') AS TimeIn, " // Extract TimeIn as hh:mm
														+ "    IFNULL(DATE_FORMAT(a.OutTime, '%H:%i'), '-') AS OutTime, " // Extract OutTime as hh:mm, if null show '-'
														+ "    IFNULL(ABS(TIMESTAMPDIFF(HOUR, a.TimeIn, a.OutTime)), 0) AS HoursWorked, "
														+ "    IFNULL(ABS(TIMESTAMPDIFF(HOUR, a.TimeIn, a.OutTime)) * l.salary, 0) AS Salary " + "FROM loginreg l "
														+ "INNER JOIN attendance a ON l.Worker_ID = a.Worker_ID " + "WHERE l.Worker_ID = ? "
														+ "AND MONTH(a.TimeIn) = MONTH(CURDATE()) " + "AND YEAR(a.TimeIn) = YEAR(CURDATE()) " + "ORDER BY a.TimeIn";

														PreparedStatement psForReadLoginDtl = cn.prepareStatement(qryForReadLoginDtl);
														psForReadLoginDtl.setInt(1, w_id);
														ResultSet rsForReadLoginDtl = psForReadLoginDtl.executeQuery();

														while (rsForReadLoginDtl.next()) {
															String dateIn = rsForReadLoginDtl.getString("DateIn");
															String timeIn = rsForReadLoginDtl.getString("TimeIn");
															String outTime = rsForReadLoginDtl.getString("OutTime");
															int hoursWorked = rsForReadLoginDtl.getInt("HoursWorked");
															double salary = rsForReadLoginDtl.getDouble("Salary");

															totalSalary += salary; // Accumulate total salary
													%>


													<tr>


														<td><%=dateIn%></td>
														<td><%=timeIn%></td>
														<td><%=outTime%></td>
														<td><%=hoursWorked%></td>
														<td><%=salary%></td>
													</tr>
													<%
													}
													%>
													<tr>
											            <td colspan="4" class="text-end"><strong>Total Salary:</strong></td>
											            <td class="text-end"><strong><%= String.format("%.2f", totalSalary) %></strong></td>
											        </tr>
													<%
													rsForReadLoginDtl.close();
													psForReadLoginDtl.close();
													cn.close();
													%>



												</tbody>
											</table>
											<%
											} catch (Exception e) {
											%>
											<p>
												Error:
												<%=e.getMessage()%></p>
											<%
											}
											%>
										</div>
											</div>
											
										<!-- Timeout Button -->

										<!-- Modal Structure -->
										<div class="modal" id="responseModal" tabindex="-1"
											role="dialog" aria-labelledby="responseModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" style="top:228px;" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="responseModalLabel"
															style="color: red;">Warning</h5>
														<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
</button>
													</div>

													<div class="modal-body" id="responseMessage"
														style="font-size: 19px;"></div>

													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
										<div class="btn-group" role="group" aria-label="Timeout">

											<button type="button" class="btn btn-primary mx-20" id="myButton" 
    data-bs-toggle="modal" data-bs-target="#responseModal" 
    onclick="startTimeout()">
    Time Out
</button>
										</div>
									</div>
								</div>
								<!-- end table-responsive -->
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				function startTimeout() {
					var workerId =
			<%=w_id%>
				; // Worker ID from session
					var currentTime = new Date().toISOString().slice(0, 19)
							.replace("T", " "); // Current time in MySQL format

					// AJAX call to update OutTime
					var xhr = new XMLHttpRequest();
					xhr.open("POST", "update_outtime.jsp", true);
					xhr.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");

					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4 && xhr.status == 200) {
							var response = xhr.responseText.trim(); // Response from server
							document.getElementById("responseMessage").innerText = response; // Set response in modal body
							$('#responseModal').modal('show'); // Show the modal
						}
					};

					xhr
							.send("workerId=" + workerId + "&outTime="
									+ currentTime);
				}
				$('#responseModal').on('hidden.bs.modal', function () {
				    $('body').removeClass('modal-open');
				    $('.modal-backdrop').remove();
				});
			</script>

			<!-- End Section Title -->
		</section>
	</main>
	<footer id="footer" class="footer dark-background">

		<div class="container footer-top">
			<div class="row gy-4">
				<div class="col-lg-4 col-md-6 footer-about">
					<a href="index.html" class="logo d-flex align-items-center"> <span
						class="sitename">Construction</span>
					</a>
					<div class="footer-contact pt-3">
						<p>A108 Adam Street</p>
						<p>New York, NY 535022</p>
						<p class="mt-3">
							<strong>Phone:</strong> <span>+1 5589 55488 55</span>
						</p>
						<p>
							<strong>Email:</strong> <span>info@example.com</span>
						</p>
					</div>
					<div class="social-links d-flex mt-4">
						<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
							class="bi bi-facebook"></i></a> <a href=""><i
							class="bi bi-instagram"></i></a> <a href=""><i
							class="bi bi-linkedin"></i></a>
					</div>
				</div>

				<div class="col-lg-2 col-md-3 footer-links">
					<h4>Useful Links</h4>
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">About us</a></li>
						<li><a href="#">Services</a></li>
						<li><a href="#">Terms of service</a></li>
						<li><a href="#">Privacy policy</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-3 footer-links">
					<h4>Our Services</h4>
					<ul>
						<li><a href="#">Web Design</a></li>
						<li><a href="#">Web Development</a></li>
						<li><a href="#">Product Management</a></li>
						<li><a href="#">Marketing</a></li>
						<li><a href="#">Graphic Design</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-3 footer-links">
					<h4>Hic solutasetp</h4>
					<ul>
						<li><a href="#">Molestiae accusamus iure</a></li>
						<li><a href="#">Excepturi dignissimos</a></li>
						<li><a href="#">Suscipit distinctio</a></li>
						<li><a href="#">Dilecta</a></li>
						<li><a href="#">Sit quas consectetur</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-3 footer-links">
					<h4>Nobis illum</h4>
					<ul>
						<li><a href="#">Ipsam</a></li>
						<li><a href="#">Laudantium dolorum</a></li>
						<li><a href="#">Dinera</a></li>
						<li><a href="#">Trodelas</a></li>
						<li><a href="#">Flexo</a></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="container copyright text-center mt-4">
			<p>
				© <span>Copyright</span> <strong class="px-1 sitename">Construction</strong>
				<span>All Rights Reserved</span>
			</p>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you've purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>

	</footer>

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>