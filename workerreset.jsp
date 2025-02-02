
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Admin - Construction</title>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script> 

<link rel="stylesheet" href="assets/main.css">

</head>



<body class="about-page">

	<header id="header" class="header d-flex align-items-center fixed-top">
		<div
			class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

			<a href="index.html" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
				
				<h1 class="sitename">Skote Construction</h1>
			</a>

			<nav id="navmenu" class="navmenu">
				<ul>
					<li><a href="index.html" style="font-size: 17px;">Home</a></li>
					<li><a href="about.html"  style="font-size: 17px;">Admin</a></li>
					<li><a href="workerlogin.html" class="active" style="font-size: 17px;">Worker</a></li>


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
				<h1>Worker</h1>
				<nav class="breadcrumbs">
					<ol>
						<li><a href="index.html" style="font-size: 20px;">Home</a></li>
						<li class="current"  style="font-size: 20px;">Worker</li>
					</ol>
				</nav>
			</div>
		</div>
		<!-- End Page Title -->
		<!-- Stats Counter Section -->
		<section id="stats-counter" class="stats-counter section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
			<h2>Reset Password</h2>
			<br />
				<form action="workreset-pass.jsp" method="post">
					<!-- Email input -->
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="form2Example1">Email
							address</label><br /> <input type="email" id="form2Example1"
							class="emailcss" required name="email" placeholder="Existing Email"/>

					</div>

					<!-- Password input -->
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="form2Example2">Password</label><br />
						<input type="password" id="form2Example2" class="emailcss" required name="password" placeholder="New Password"/>
					</div>
					
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="form2Example2">Confirm Password</label><br />
						<input type="password" id="form2Example2" class="emailcss" required name="Cpassword" placeholder="Confirm Password"/>
					</div>
						
						<button type="submit" id="signInBtn" class="btn btn-primary btn-block mb-4" >Reset Password</button>
					</form>
					
			</div>
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
				� <span>Copyright</span> <strong class="px-1 sitename">Construction</strong>
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
	<!-- <div id="preloader"></div> -->

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