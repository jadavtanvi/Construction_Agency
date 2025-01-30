<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<meta charset="UTF-8">
<title>Attendance System</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<header id="page-topbar">
		<div class="navbar-header">
			<div class="d-flex">
				<!-- LOGO -->
				<div class="navbar-brand-box">
					<a href="#" class="logo logo-dark"> <span class="logo-sm">
							<img src="assets/images/logo.svg" alt="" height="22">
					</span> <span class="logo-lg"> <img
							src="assets/images/logo-dark.png" alt="" height="17">
					</span>
					</a> <a href="index-2.html" class="logo logo-light"> <span
						class="logo-sm"> <img src="assets/images/logo-light.svg"
							alt="" height="22">
					</span> <span class="logo-lg"> <img
							src="assets/images/logo-light.png" alt="" height="19">
					</span>
					</a>
				</div>

				<button type="button"
					class="btn btn-sm px-3 font-size-16 header-item waves-effect"
					id="vertical-menu-btn">
					<i class="fa fa-fw fa-bars"></i>
				</button>

				<%
				HttpSession se = request.getSession();
				String email = se.getAttribute("email").toString();
				%>

				<div class="d-flex">
					<div class="dropdown d-inline-block ms-auto"
						style="position: absolute; right: 67px;">
						<button type="button" class="btn header-item waves-effect"
							id="page-header-user-dropdown" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<span class="d-none d-xl-inline-block ms-1" key="t-henry"
								style="font-size: 21px;">Admin</span> <i
								class="fa fa-user-circle" aria-hidden="true"
								style="font-size: 19px;"></i> <i
								class="mdi mdi-chevron-down d-none d-xl-inline-block"
								style="font-size: 18px;"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-end">
							<a class="dropdown-item" href="index2.jsp"> <i
								class="bx bx-user font-size-16 align-middle me-1"></i> <%=email%>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item text-danger" href="index.html"> <i
								class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i>
								<span key="t-logout">Logout</span>
							</a>
						</div>
					</div>
				</div>

				<form class="app-search d-none d-lg-block" onsubmit="return false;">
					<div class="position-relative">
						<input type="text" class="form-control" name="search"
							placeholder="Search Email..." id="searchField"> <span
							class="bx bx-search-alt" id="searchIcon" style="cursor: pointer;"
							onclick="searchWorker()"></span>
					</div>
				</form>
			</div>

		</div>
	</header>
	<!-- Modal for Details -->
	
	
	<div class="modal" id="transaction-searchModal" tabindex="-1"
    aria-labelledby="transaction-searchModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="transaction-searchModalLabel">Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="searchDetailsContainer"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"
                    data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function searchWorker() {
			const search = $('#searchField').val();
			if (search.trim() === "") {
				alert("Please enter a search term.");
				return;
			}

			$.ajax({
				url : 'search.jsp',
				method : 'GET',
				data : {
					search : search
				},
				success : function(response) {
					$('#searchDetailsContainer').html(response);
					$('#transaction-searchModal').modal('show');
				},
				error : function() {
					alert("Error fetching worker details.");
				}
			});
		}
	</script>
	<br>
</body>
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
</html>
