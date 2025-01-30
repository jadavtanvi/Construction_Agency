<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!doctype html>
<html lang="en">
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

</head>
<body data-sidebar="dark" data-layout-mode="light">
	<!-- Begin page -->
	<div id="layout-wrapper">
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">


					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div
								class="page-title-box d-sm-flex align-items-center justify-content-between">
								<h4 class="mb-sm-0 font-size-18">Dashbord</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-xl-10">
							<div class="row">
								<div class="col-md-4">
									<div class="card mini-stats-wid">
										<div class="card-body">
											<div class="d-flex">
												<div class="flex-grow-1">
													<p class="text-muted fw-medium">Workers</p>
													<%
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection cn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
													String cnt_qry = null;
													cnt_qry = "Select * from loginreg WHERE Role='Worker'and Is_Active=1 and status='Approved'";
													PreparedStatement ptst2 = cn2.prepareStatement(cnt_qry);
													ResultSet rs2 = ptst2.executeQuery();
													int count = 0;
													while (rs2.next()) {
														count++;

													}
													%>

													<h4 class="mb-0"><%=count%></h4>
												</div>

												<div class="flex-shrink-0 align-self-center">
													<div
														class="mini-stat-icon avatar-sm rounded-circle bg-primary">
														<a href="worker.jsp"> <span class="avatar-title">

																<i class="bx bx-user-plus font-size-24"></i>

														</span>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card mini-stats-wid">
										<div class="card-body">
											<div class="d-flex">
												<div class="flex-grow-1">
													<p class="text-muted fw-medium">Today CheckIn Workers</p>


													<%
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection cnTop = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
													String cnt_top = null;
													cnt_top = "SELECT COUNT(DISTINCT t1.Worker_ID) " + "FROM attendance t1 "
															+ "LEFT JOIN loginreg t2 ON t1.Worker_ID = t2.Worker_ID AND t2.Is_Active = 1 AND t2.Status = 'Approved' "
															+ "WHERE DATE(t1.TimeIn) = CURDATE()";
													PreparedStatement ptstTop = cnTop.prepareStatement(cnt_top);
													ResultSet rsTop = ptstTop.executeQuery();
													int coun = 0; // Initialize coun to 0, since we're counting workers
													if (rsTop.next()) {
														coun = rsTop.getInt(1); // Get the count of workers for today
													}
													%>
													<h4 class="mb-0"><%=coun%></h4>
												</div>

												<div class="flex-shrink-0 align-self-center ">
													<div
														class="avatar-sm rounded-circle bg-primary mini-stat-icon">
														<a href="attendence.jsp"> <span
															class="avatar-title rounded-circle bg-primary"> <i
																class="bx bx-run font-size-24"></i>
														</span>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card mini-stats-wid">
										<div class="card-body">
											<div class="d-flex">
												<div class="flex-grow-1">
													<p class="text-muted fw-medium">Today CheckOut Workers</p>


													<%
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection cnou = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
													String cntout = null;
													cntout = "SELECT COUNT(DISTINCT t1.Worker_ID) " + "FROM attendance t1 "
															+ "LEFT JOIN loginreg t2 ON t1.Worker_ID = t2.Worker_ID AND t2.Is_Active = 1 AND t2.Status = 'Approved' "
															+ "WHERE DATE(t1.OutTime) = CURDATE()";
													PreparedStatement ptstout = cnou.prepareStatement(cntout);
													ResultSet rsout = ptstout.executeQuery();
													int cou = 0; // Initialize coun to 0, since we're counting workers
													if (rsout.next()) {
														cou = rsout.getInt(1); // Get the count of workers for today
													}
													%>
													<h4 class="mb-0"><%=cou%></h4>
												</div>

												<div class="flex-shrink-0 align-self-center ">
													<div
														class="avatar-sm rounded-circle bg-primary mini-stat-icon">
														<a href="worker.jsp"> <span
															class="avatar-title rounded-circle bg-primary"> <i
																class="bx bx-run font-size-24"></i>
														</span>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>


							</div>

						</div>
					</div>
					<!-- end row -->



					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title mb-4">Awaiting Approval Worker</h4>
								<div class="table-responsive">
									<table class="table align-middle table-nowrap mb-0">
										<thead class="table-light">
											<tr>

												<th class="align-middle">Worker ID</th>
												<th class="align-middle">First Name</th>
												<th class="align-middle">Last Name</th>
												<th class="align-middle">Contact</th>
												<th class="align-middle">Action</th>

											</tr>
										</thead>
										<tbody>
											<%
											Class.forName("com.mysql.cj.jdbc.Driver");
											Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
											PreparedStatement ps = null;
											Statement st = cn.createStatement();

											String qry;

											qry = "Select * from loginreg WHERE Role='Worker' and status='Pending' AND Is_Active=1";

											PreparedStatement ptst = cn.prepareStatement(qry);
											ResultSet rs = ptst.executeQuery();
											Integer id = null;
											String fname = null;
											String lname = null;
											String contact = null;
											while (rs.next()) {
												id = rs.getInt("Worker_ID");
												fname = rs.getString("First_Name");
												lname = rs.getString("Last_Name");
												contact = rs.getString("Phone_no");
											%>
											<tr>

												<td><%=id%></td>
												<td><%=fname%></td>
												<td><%=lname%></td>
												<td><%=contact%></td>

												<td>
													<!-- Approve and Reject Buttons Side by Side -->
													<form action="AcceptWorker.jsp" class="d-inline-block">
														<input type="hidden" name="id" value="<%=rs.getInt(1)%>">
														<button type="submit"
															class="btn btn-success btn-sm btn-rounded waves-effect waves-light mx-2">
															Approve</button>
													</form>

													<form action="RejectWorker.jsp" class="d-inline-block">
														<input type="hidden" name="id" value="<%=rs.getInt(1)%>">
														<button type="submit"
															class="btn btn-danger btn-sm btn-rounded waves-effect waves-light mx-2">
															Reject</button>
													</form>
												</td>

											</tr>
											<%
											}
											%>


										</tbody>
									</table>

								</div>
								<!-- end table-responsive -->
							</div>
						</div>
					</div>

					<!-- end row -->
				</div>
				<!-- container-fluid -->
			</div>
			<!-- End Page-content -->
			<!-- Approve Modal -->
			<!-- <div class="modal fade" id="approveModal" tabindex="-1" role="dialog" aria-labelledby="approveModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="approveModalLabel">Approve Transaction</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to approve this worker?
            </div>
            <div class="modal-footer">
                <form action="AcceptWorker.jsp" method="POST" id="approveForm">
                    <input type="hidden" name="transactionId" id="approveTransactionId" value="">
                    <button type="submit" class="btn btn-success">Approve</button>
                </form>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
		 -->
			<!-- 	
Reject Modal -->
			<!-- 
<div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rejectModalLabel">Reject Transaction</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to reject the worker?
            </div>
            <div class="modal-footer">
                <form action="RejectWorker.jsp" method="POST" id="rejectForm">
                    <input type="hidden" name="transactionId" id="rejectTransactionId" value="">
                    <button type="submit" class="btn btn-danger">Reject</button>
                </form>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
 -->

			<script>
				// Handle Approve Button click
				/* document.querySelectorAll('button[data-bs-target="#approveModal"]').forEach(button => {
				    button.addEventListener('click', () => {
				        const transactionId = button.getAttribute('data-transaction-id');
				        document.getElementById('approveTransactionId').value = transactionId;
				    });
				});

				// Handle Reject Button click
				document.querySelectorAll('button[data-bs-target="#rejectModal"]').forEach(button => {
				    button.addEventListener('click', () => {
				        const transactionId = button.getAttribute('data-transaction-id');
				        document.getElementById('rejectTransactionId').value = transactionId;
				    });
				}); */
			</script>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6">
							<script>
								document.write(new Date().getFullYear())
							</script>
							Attendance System.
						</div>
						<div class="col-sm-6">
							<div class="text-sm-end d-none d-sm-block"></div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<!-- end main content-->

	</div>
	<!-- END layout-wrapper -->



	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>

	<!-- JAVASCRIPT -->
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
<!-- Mirrored from themesbrand.com/skote/layouts/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 09 Jan 2023 05:38:00 GMT -->
</html>