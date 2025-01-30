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
	<!-- Add Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Add Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
	

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
<title>Report</title>
</head>
<body data-sidebar="dark" data-layout-mode="light">
<body>

	<div class="main-content">

		<div class="page-content">
			
			<div>
				<div class="btn-group" role="group" aria-label="Report Types" style="bottom: 10px; left: 1038px;">
							<button type="button" class="btn btn-primary mx-2" style="border-radius: 6px;" id="daily-report"  onclick="generateReport()">Daily Report</button>
							<button type="button" class="btn btn-primary mx-2" style="border-radius: 6px;" id="Monthly-report" onclick="monGenerateReport()" >Monthly Report</button>
						</div>
			</div>  
 		<div class="container-fluid">
				<div class="col-lg-12">
				
				
					<div class="card">
						<div class="card-body">
							<h4 class="card-title mb-4">Reports</h4>
							
							<div class="table-responsive">
								<table class="table align-middle table-nowrap mb-0">
									<thead class="table-light">
										<tr>

											<th class="align-middle">Worker ID</th>
											<th class="align-middle">FirstName</th>
											<th class="align-middle">LastName</th>
											<th class="align-middle">Contact</th>
											<th class="align-middle">Hourly Rate</th>
											<th class="align-middle">Download</th>
										</tr>
									</thead>
									<tbody>
										<%
										 Class.forName("com.mysql.cj.jdbc.Driver");
										Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_agency", "root", "");
										PreparedStatement ps = null;
										Statement st = cn.createStatement();

										String qry;

										qry = "Select * from loginreg where role='Worker' and Is_Active=1 and status='Approved'";
										
										PreparedStatement ptst = cn.prepareStatement(qry);
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

										while (rs.next()) {
											id = rs.getInt("Worker_ID");
											fname = rs.getString("First_Name");
											lname = rs.getString("Last_Name");
											contact = rs.getString("Phone_no");
											salary = rs.getInt("Salary"); 
											age1 = rs.getString("Age");
											gender1 = rs.getString("Gender");
											dob = rs.getString("DOB");
											adhar = rs.getString("AdharNumber");
											addr = rs.getString("Address");
										%> 
										
										
										<tr>

											<td class="align-middle" style="width: 15%;"><%=id%></td>
											<td><%=fname%></td>
											<td><%=lname%></td>
											<td><%=contact%></td>
											<td><%=salary%></td>
											<td>
												<!-- Button trigger modal -->
												<button type="button"
													class="btn btn-primary btn-sm btn-rounded waves-effect waves-light"
													onclick="openDownloadPopup(<%=id%>,'<%=fname%>','<%=lname%>','<%=contact%>','<%=salary%>','<%=age1%>','<%=gender1%>','<%=dob%>','<%=adhar%>','<%=addr%>')"
													id="openDownloadPopup1"
													>
													<i class="bx bx-down-arrow-alt font-size-18"></i>
												</button>
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
					<!-- end table-responsive -->


					<!-- View Details Transaction Modal -->
					<div class="modal fade transaction-detailModal" tabindex="-1"
						role="dialog" aria-labelledby="transaction-detailModalLabel"
						aria-hidden="true">
						<input type="hidden" Id="downloadPopup_Worker_Id">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="transaction-detailModalLabel">Download</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="table-responsive">
										
										<form id="workerForm">
											<div class="form-group">
												<label for="wid">Worker ID:</label> <input type="text"
													id="wid" class="form-control"  readonly>
											</div>
											<div class="form-group">
												<label for="wfname">First Name:</label> <input type="text"
													id="wfname" class="form-control" readonly>
											</div>
											<div class="form-group">
												<label for="wlname">Last Name:</label> <input type="text"
													id="wlname" class="form-control" readonly>
											</div>
											<div class="form-group">
												<label for="age">Age:</label> <input type="number" id="age"
													class="form-control" readonly>
											</div>
											<div class="form-group">
												<label for="gender">Gender:</label> <input type="text"
													id="gender" class="form-control" 
													readonly>
											</div>
											<div class="form-group">
											
											    <label for="sal">Hourly Rate:</label> 
											    <input type="number" id="sal" class="form-control" readonly >
											         
											</div>

											<div class="form-group">
												<label for="dob">Date of Birth:</label> <input type="text"
													id="dob" class="form-control"  readonly>
											</div>
											<div class="form-group">
												<label for="cont">Contact Number:</label> <input
													type="number" id="cont" class="form-control"
													 readonly>
											</div>
											<div class="form-group">
												<label for="adnum">Aadhar Number:</label> <input
													type="number" id="adnum" class="form-control"
													 readonly>
											</div>
											<div class="form-group">
												<label for="add">Address:</label> <input
													type="text" id="add" class="form-control"
													 readonly>
											</div>
										</form>
										<hr>
										
									</div>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										data-bs-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary"
										id="downloadPdfBtn">Download PDF</button>
									<!-- New button -->
									
									
									
									
								</div>
							</div>
							
						</div>
					</div>

					<!-- Add jsPDF library -->
<script
src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.24/jspdf.plugin.autotable.min.js"></script>

<script>
function openDownloadPopup(id,fname,lname,contact,salary,age1,gender1,dob,adhar,addr)
{
	 document.getElementById('wid').value=id;
     document.getElementById('wfname').value=fname;
     document.getElementById('wlname').value=lname;
	 document.getElementById('age').value=age1;
     document.getElementById('gender').value=gender1;
     document.getElementById('sal').value=salary;
     document.getElementById('dob').value=dob;
     document.getElementById('cont').value=contact;
     document.getElementById('adnum').value=adhar;
     document.getElementById('add').value=addr;
     
     $('.transaction-detailModal').modal('show');

	}
    
    document.getElementById("downloadPdfBtn").addEventListener("click", function () {
        // Create a new jsPDF instance
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        // Get the form values
        const workerId = document.getElementById('wid').value;
        const firstName = document.getElementById('wfname').value;
        const lastName = document.getElementById('wlname').value;
        const age = document.getElementById('age').value;
        const gender = document.getElementById('gender').value;
        const salary = document.getElementById('sal').value;
        const dob = document.getElementById('dob').value;
        const contact = document.getElementById('cont').value;
        
        const adnum =  document.getElementById('adnum').value;
        const add = document.getElementById('add').value;
        
     // Combine first name and last name
        const workerName = firstName + ' ' + lastName;


        // Define the table content
        const tableData = [
            ["Field", "Value"],
            ["Worker ID", workerId],
            ["Worker Name", workerName],
            ["Age", age],
            ["Gender", gender],
            ["Salary", salary],
            ["Date of Birth", dob],
            ["Contact Number", contact],
            ["Adhar Number", adnum],
            ["Address", add]
        ];

        // Add the table to the PDF
        doc.autoTable({
            head: [tableData[0]],
            body: tableData.slice(1)
        });

        doc.save("worker-details.pdf");
    });
    
    
    
    
    function generateReport() {
    fetch('generateReport.jsp')
        .then(response => response.json())
        .then(data => {
            console.log(data);  // Inspect the fetched data
            
            // Check if there is any error
            if (data.error) {
                alert("Error: " + data.error);
                return;
            }

            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Daily Attendance Table
            const dailyData = data.dailyReport.map(item => {
                return [
                    item.date,
                    item.firstName + " " + item.lastName,
                    item.phone,
                    item.timeIn,
                    item.timeOut,
                    item.hoursWorked,
                    item.wages
                ];
            });

            doc.text("Daily Attendance Report", 14, 20);
            doc.autoTable({
                head: [["Date", "Full Name", "Phone Number", "Time In", "Out Time", "Hours Worked", "Wages"]],
                body: dailyData,
                startY: 25
            });

            // Weekly Attendance Table
            const weeklyData = data.weeklyReport.map(item => {
                return [
                    "Week " + item.weekNo,
                    item.totalWorkers
                ];
            });

           

            // Save the PDF
            doc.save("Attendance_Report.pdf");
        })
        .catch(error => {
            console.error("Error fetching report:", error);
            alert("An error occurred while generating the report. Please try again.");
        });
}

    
    
    //Monthly Report
    function monGenerateReport() {
        fetch('monGenerateReport.jsp')
            .then(response => response.json())
            .then(data => {
                console.log(data);  // Inspect the fetched data
                
                // Check if there is any error
                if (data.error) {
                    alert("Error: " + data.error);
                    return;
                }

                const { jsPDF } = window.jspdf;
                const doc = new jsPDF();

                // Daily Attendance Table
                const dailyData = data.MonthlyReport.map(item => {
                    return [
                        
                        item.FullName,
                        item.phone,
                        item.month,
                        item.TotalDaysWorked,
                        item.HoursWorked,
                        item.wages
                    ];
                });

                doc.text("Monthly Attendance Report", 14, 20);
                doc.autoTable({
                    head: [[ "Full Name", "Phone Number" , "Month" , "Total Working Days" , "Total Hours Worked", "Wages"]],
                    body: dailyData,
                    startY: 25
                });

               

                // Save the PDF
                doc.save("Monthly Attendance_Report.pdf");
            })
            .catch(error => {
                console.error("Error fetching report:", error);
                alert("An error occurred while generating the report. Please try again.");
            });
    }


</script>
				</div>
			</div>
		</div>
	</div>
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