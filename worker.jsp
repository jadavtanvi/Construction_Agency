<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="assets/main.css">
<title>Worker</title>
</head>
<body data-sidebar="dark" data-layout-mode="light">
	<div class="main-content">
		<div class="page-content">
			<div class="container-fluid mt-4">
				<div class="d-flex justify-content-end">
					<div class="col-lg-2">
						<div class="card">
							<div class="card-body">
								<div
									class="d-flex justify-content-between align-items-center mb-1">
									<h4 class="card-title text-center">Add Workers</h4>
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#addWorkerModal"
										style="padding-left: 23px; padding-right: 23px;">Add</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="modal" id="addWorkerModal" tabindex="-1"
				aria-labelledby="addWorkerModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="AddWorkerDetails.jsp" method="POST">
							<div class="modal-header">
								<h5 class="modal-title" id="addWorkerModalLabel">Add Worker
									Details</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="mb-3">
									<label for="workerfName" class="form-label">First Name</label>
									<input placeholder="First Name" type="text" id="firstName"
										name="FirstName" class="form-control form-control-lg" required />
								</div>
								<div class="mb-3">
									<label for="workerlName" class="form-label">Last Name</label> <input
										placeholder="Last Name" type="text" id="lastName"
										name="lastName" class="form-control form-control-lg" required />
								</div>
								<div class="mb-3">
									<label for="Password" class="form-label">Password </label> <input
										type="password" class="form-control" id="Password"
										name="Password" required>
								</div>
								<div class="mb-3">
									<label for="age" class="form-label">Age</label> <input
										type="number" class="form-control" id="age" name="age"
										required>
								</div>
								<div class="mb-3">
									<label for="dob" class="form-label">Date of Birth</label> <input
										type="date" class="form-control" id="dob" name="dob" required>
								</div>
								<div class="mb-3">
									<label for="aadharNumber" class="form-label">Aadhar
										Number</label> <input type="text" class="form-control"
										name="aadharNumber" id="aadharNumber" required>
								</div>
								<div class="mb-3">
									<label for="contactNumber" class="form-label">Contact
										Number</label> <input type="text" class="form-control"
										name="contactNumber" id="contactNumber" required>
								</div>
								<div class="mb-3">
									<label for="address" class="form-label">Address</label> <input
										type="text" class="form-control" id="address" name="address"
										required>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">Email Address</label> <input
										type="email" class="form-control" id="email" name="email"
										required>
								</div>
								<div class="mb-3">
									<label for="gender" class="form-label">Gender</label> <select
										class="form-select" id="gender" name="gender" required>
										<option value="" disabled selected>Select Gender</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
										<option value="Other">Other</option>
									</select>
								</div>
								<input type="hidden" name="sts" value="admin" />

							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Save
									Worker</button>

							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- End Add Worker Modal -->



			<!-- Add margin-top to the container -->
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title mb-4">Workers</h4>
						<div class="table-responsive">
							<table class="table align-middle table-nowrap mb-0">
								<thead class="table-light">
									<tr>
										<th class="align-middle">Worker ID</th>
										<th class="align-middle">First Name</th>
										<th class="align-middle">Last Name</th>
										<th class="align-middle">Contact</th>
										<th class="align-middle">View Details</th>
										<th class="align-middle">TimeOut</th>
										<th class="align-middle">Edit</th>
										<th class="align-middle">Delete</th>
									</tr>
								<tbody>
									<%
									Class.forName("com.mysql.cj.jdbc.Driver");
									Connection cn1 = DriverManager.getConnection("jdbc:mysql://localhost/construction_agency", "root", "");
									Statement stm1 = cn1.createStatement();

									String qry1 = "Select t1.*,ifnull(t2.Worker_ID,0) as IsSignIn from loginreg t1 "
											+ "left join (select Worker_ID from attendance t2 where CAST(CreatedDTStamp AS DATE) = CAST(NOW() AS DATE) and OutTime IS NULL) t2 "
											+ "on t1.Worker_ID=t2.Worker_ID " + "where Role='Worker' and status='Approved' AND Is_Active=1";

									PreparedStatement ptst = cn1.prepareStatement(qry1);
									ResultSet rs = ptst.executeQuery();
									Integer id = null;
									String fname = null;
									String lname = null;
									String contact = null;
									Integer salary = null;

									String age1 = null;
									String gender1 = null;
									String dob = null;
									String adhar = null;
									String addr = null;
									String eemail = null;
									Integer IsSignIn = null;

									while (rs.next()) {
										id = rs.getInt("Worker_ID");
										fname = rs.getString("First_name");
										lname = rs.getString("Last_name");
										contact = rs.getString("Phone_no");
										salary = rs.getInt("Salary");
										age1 = rs.getString("Age");
										gender1 = rs.getString("Gender");
										dob = rs.getString("DOB");
										adhar = rs.getString("AdharNumber");
										addr = rs.getString("Address");
										eemail = rs.getString("Email");
										IsSignIn = rs.getInt("IsSignIn");
									%>
									<tr>
										<td class="align-middle" style="width: 15%;"><%=id%></td>
										<td><%=fname%></td>
										<td><%=lname%></td>
										<td><%=contact%></td>
										<td>
											<!-- Button trigger modal -->
											<button type="button"
												class="btn btn-primary btn-sm btn-rounded waves-effect waves-light"
												onclick="openViewPopup(<%=id%>,'<%=fname%>','<%=lname%>','<%=contact%>','<%=salary%>','<%=age1%>','<%=gender1%>','<%=dob%>','<%=adhar%>','<%=addr%>','<%=eemail%>')">View
												Details</button>
										</td>
										<td>
											<%
											if (IsSignIn > 0) {
											%>
											<form action="AddTimeoutByAdmin.jsp">
												<input type="hidden" name="id" value="<%=id%>">
												<button type="submit"
													class="btn btn-primary btn-sm btn-rounded waves-effect waves-light"
													data-bs-toggle="modal" data-bs-target="#approveModal">
													Timeout</button>
											</form> <%
												 } else {
												 %> - <%
												 }
												 %>
										</td>
										<td>
											<!-- Button trigger modal  Edit-->
											<button type="button"
												class="btn btn-primary btn-sm btn-rounded waves-effect waves-light"
												data-bs-toggle="modal"
												onclick="openUpdatePopup(<%=id%>,'<%=fname%>','<%=lname%>','<%=contact%>','<%=salary%>','<%=age1%>','<%=gender1%>','<%=dob%>','<%=adhar%>','<%=addr%>','<%=eemail%>')"
												data-bs-target="#transaction-editModal">
												<i class="bx bxs-edit font-size-18"></i>
											</button>

										</td>
										<td>
											<!-- Button trigger modal of Delete-->
											<button type="button"
												class="btn btn-danger btn-sm btn-rounded waves-effect waves-light"
												onclick="openDeletePopup(<%=id%>)">
												<i class="bx bx-trash font-size-18"></i>
											</button>
										</td>
									</tr>
									<%
									}
									%>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end table-responsive -->

		<!-- View Details Transaction Modal -->
		<div class="modal" id="transaction-workerModal" tabindex="-1"
			role="dialog" aria-labelledby="transaction-workerModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="transaction-workerModalLabel">Workers
							Details</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="table-responsive">

							<div class="mb-3">
								<label for="workerFName" class="form-label">First Name</label> <input
									type="text" class="form-control" id="vwfname" name="vwfname"
									disabled>
							</div>
							<div class="mb-3">
								<label for="workerLName" class="form-label">Last Name</label> <input
									type="text" class="form-control" id="vwlname" name="vwlname"
									disabled>
							</div>

							<!-- Contact Number (Editable) -->
							<div class="mb-3">
								<label for="contactNumber" class="form-label">Contact
									Number</label> <input type="text" class="form-control"
									id="vcontactNumber" name="vcontactNumber" disabled>
							</div>

							<!-- Gender (Editable) -->
							<div class="mb-3">
								<label for="gender" class="form-label">Gender</label> <select
									class="form-select" id="vgender" name="vgender" disabled>
									<option value="">Select Gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="Other">Other</option>
								</select>
							</div>

							<!-- Date of Birth (Editable) -->
							<div class="mb-3">
								<label for="dob" class="form-label">Date of Birth</label> <input
									type="date" class="form-control" id="vdob" name="vdob" disabled>
							</div>

							<!-- Aadhar Number (Non-editable) -->
							<div class="mb-3">
								<label for="aadharNumber" class="form-label">Aadhar
									Number</label> <input type="text" class="form-control"
									id="vaadharNumber" name="vaadharNumber" disabled>
							</div>

							<!-- Age (Non-editable) -->
							<div class="mb-3">
								<label for="age" class="form-label">Age</label> <input
									type="number" class="form-control" id="vage" name="vage"
									disabled>
							</div>

							<!-- Address (Non-editable) -->
							<div class="mb-3">
								<label for="address" class="form-label">Address</label> <input
									disabled type="text" class="form-control" id="vaddress"
									name="vaddress">
							</div>

							<!-- Email (Non-editable) -->
							<div class="mb-3">
								<label for="email" class="form-label">Email Address</label> <input
									disabled type="email" class="form-control" id="vemail"
									name="vemail">
							</div>


							<!-- End of while loop -->
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- end modal -->

		<!-- Edit Transaction Modal -->
		<div class="modal" id="transaction-editModal" tabindex="-1"
			role="dialog" aria-labelledby="transaction-editModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="transaction-editModalLabel">Edit
							Worker Details</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">

						<form id="updateWorkerForm" action="updateWorkerDetails.jsp"
							method="POST">
							<!-- Worker Name (Editable) -->
							<input type="hidden" id="ewid" name="ewid" />
							<div class="mb-3">
								<label for="workerFName" class="form-label">First Name</label> <input
									type="text" class="form-control" id="ewfname" name="ewfname"
									required pattern="[A-Za-z ]+"> <small
									class="text-danger" id="fnameError"></small>
							</div>
							<!-- Last Name -->
							<div class="mb-3">
								<label for="workerLName" class="form-label">Last Name</label> <input
									type="text" class="form-control" id="ewlname" name="ewlname"
									required pattern="[A-Za-z ]+"> <small
									class="text-danger" id="lnameError"></small>
							</div>

							<!-- Contact Number (Editable) -->
							<div class="mb-3">
								<label for="contactNumber" class="form-label">Contact
									Number</label> <input type="text" class="form-control"
									id="econtactNumber" name="econtactNumber" pattern="\d{10}"
									required title="Contact Number must be exactly 10 digits.">
								<small class="text-danger" id="contactError"></small>
							</div>

							<!-- Gender (Editable) -->
							<div class="mb-3">
								<label for="gender" class="form-label">Gender</label> <select
									class="form-select" id="egender" name="egender" required>
									<option value="">Select Gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="Other">Other</option>
								</select>
							</div>

							<!-- Date of Birth (Editable) -->
							<div class="mb-3">
								<label for="dob" class="form-label">Date of Birth</label> <input
									type="date" class="form-control" id="edob" name="edob" required>
							</div>

							<!-- Aadhar Number (Non-editable) -->
							<div class="mb-3">
								<label for="aadharNumber" class="form-label">Aadhar
									Number</label> <input type="text" class="form-control"
									id="eaadharNumber" name="eaadharNumber" required
									pattern="\d{12}"
									title="Aadhar Number must be exactly 12 digits."> <small
									class="text-danger" id="aadharError"></small>
							</div>

							<!-- Age (Non-editable) -->
							<div class="mb-3">
								<label for="age" class="form-label">Age</label> <input
									type="number" class="form-control" id="eage" name="eage">
							</div>

							<!-- Address (Non-editable) -->
							<div class="mb-3">
								<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" id="eaddress" name="eaddress">
							</div>

							<!-- Email (Non-editable) -->
							<div class="mb-3">
								<label for="email" class="form-label">Email Address</label> <input
									type="email" class="form-control" id="eemail" name="eemail">
							</div>

							<!-- Salary (editable) -->
							<div class="mb-3">
								<label for="salary" class="form-label">Salary(Per Hours)</label>
								<input type="number" class="form-control" id="esalary"
									name="esalary" min="0">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Save
									Changes</button>
								<button type="button" class="btn btn-primary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</form>
						<%
						/* } */
						%>
					</div>
				</div>
			</div>
		</div>

		<script>
			document.getElementById("edob").addEventListener("change", function() {
			    const dob = new Date(this.value);
			    const age = new Date().getFullYear() - dob.getFullYear();
			    if (age >= 18 && age <= 60) {
			        document.getElementById("eage").value = age;
			    } else {
			        alert("Age must be between 18 and 60.");
			        this.value = "";
			        document.getElementById("eage").value = "";
			    }
			});
			</script>




		<!-- Delete Confirmation Modal -->
		<div class="modal" id="deleteWorkerModal" tabindex="-1" role="dialog"
			aria-labelledby="deleteWorkerModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="deleteWorkerModalLabel">Delete
							Worker</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">Are you sure you want to delete this
						worker?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>
						<form action="deleteWorker.jsp" method="POST"
							id="deleteWorkerForm">
							<input type="hidden" name="dworkerId" id="dworkerId" value="">
							<button type="submit" class="btn btn-danger">Delete</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Script to set the worker ID in the modal -->
		<script>
			    const deleteButtons = document.querySelectorAll('[data-bs-target="#deleteWorkerModal"]');
			    deleteButtons.forEach(button => {
			        button.addEventListener('click', () => {
			            const workerId = button.getAttribute('data-worker-id');
			            document.getElementById('workerId').value = workerId;
			        });
			    });
			</script>

		<!-- JavaScript to Toggle Forms Based on Selection -->
		<script>
		function openDeletePopup(Id)
		{
			 document.getElementById('dworkerId').value=Id;	     
		     $('#deleteWorkerModal').modal('show');
		}
		function openUpdatePopup(id,fname,lname,contact,salary,age1,gender1,dob,adhar,addr,email)
		{
			 document.getElementById('ewid').value=id;
		     document.getElementById('ewfname').value=fname;
		     document.getElementById('ewlname').value=lname;
		     
		     document.getElementById('eage').value=age1;
		     document.getElementById('egender').value=gender1;
		      document.getElementById('esalary').value=salary; 
		     document.getElementById('edob').value=dob;
		     document.getElementById('econtactNumber').value=contact;
		     document.getElementById('eaadharNumber').value=adhar;
		     document.getElementById('eaddress').value=addr;
		     document.getElementById('eemail').value=email;
		     
		     $('#transaction-editModal').modal('show');

			}
		function openViewPopup(id,fname,lname,contact,salary,age1,gender1,dob,adhar,addr,email)
		{
			
		     document.getElementById('vwfname').value=fname;
		     document.getElementById('vwlname').value=lname;
		     
		     document.getElementById('vage').value=age1;
		     document.getElementById('vgender').value=gender1;
		     /* document.getElementById('esal').value=salary; */
		     document.getElementById('vdob').value=dob;
		     document.getElementById('vcontactNumber').value=contact;
		     document.getElementById('vaadharNumber').value=adhar;
		     document.getElementById('vaddress').value=addr;
		     document.getElementById('vemail').value=email;
		     
		     $('#transaction-workerModal').modal('show');

			}
</script>

		<!-- end modal -->


	</div>

	<!-- Include Bootstrap JS -->
	<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>


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