<!DOCTYPE html>
<%@page import="main.Database"%>
<%@page import="java.sql.*"%>
<html lang="en">
<%
if(session.getAttribute("email")==null){
    response.sendRedirect("login.html");
}
%>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Dashboard - HelpDesk</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
	<%
	String query = "SELECT count(*) as count FROM tasks WHERE status='pending'";
	String query2 = "SELECT count(*) as count FROM tasks WHERE status='closed'";
	String query4 = "SELECT count(*) as count FROM tasks WHERE status='running'";
	Connection conn = Database.initSql();
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	Statement stmt4 = conn.createStatement();
	try {
	    String ClosedCount = "";
	    String pendingCount = "";

	    ResultSet rs5 = stmt.executeQuery(query);
	    ResultSet rs2 = stmt2.executeQuery(query2);
	    ResultSet rs4 = stmt4.executeQuery(query4);
	    rs5.next();
	    rs2.next();
	    rs4.next();
	    ClosedCount = rs2.getString("count");
	    pendingCount = rs5.getString("count");
	    String runningCount = rs4.getString("count");
	%>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center"> <img
				src="assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">HelpDesk</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a> <!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>New Task</h4>
								<p>Manjari Nair just added a new task</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Task Due</h4>
								<p>"Compter Networks" is due tomorrow</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>One Task Completed</h4>
								<p>Prathamesh Kulkarni completed the task</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Priority Changed</h4>
								<p>Subhalaxmi Mohanty changed the priority from Low to High</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a> <!-- End Messages Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">You have 3 new messages <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Manjari Naik</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>4 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Subhalaxmi Mohanty</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>6 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Prathamesh Kulkarni</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>8 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="dropdown-footer"><a href="#">Show all messages</a>
						</li>

					</ul> <!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="assets/img/profile-img.jpg" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2"><%=session.getAttribute("name")%></span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6><%=session.getAttribute("name")%></h6> <span><%=session.getAttribute("role")%></span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile_user.jsp"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile_user.jsp"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="signOut.jsp"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link " href="index_user.jsp">
					<i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="addtask_user.jsp"> <i class="bi bi-clipboard2-plus-fill"></i> <span>Add
						Task</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="users-profile_user.jsp"> <i class="bi bi-menu-button-wide"></i> <span>Your Profile</span>
			</a></li>
			
			<li class="nav-item"><a class="nav-link collapsed" href="task_users.jsp">
					<i class="bi bi-database-add"></i> <span>Tasks</span>
			</a></li>





			<!-- End Blank Page Nav -->

		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">

								<div class="card-body">
									<h5 class="card-title">Running</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6><%=runningCount%></h6>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="card-body">
									<h5 class="card-title">Closed</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi bi-check-all"></i>
										</div>
										<div class="ps-3">
											<h6><%=ClosedCount%></h6>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<!-- End Customers Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="card-body">
									<h5 class="card-title">Pending</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-hourglass-split"></i>
										</div>
										<div class="ps-3">
											<h6><%=pendingCount%></h6>
										</div>
									</div>
								</div>

							</div>
						</div>

						<!-- All Card-->

						<!-- Reports -->
						<div class="col-12">
							<div class="card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>


								<!-- Recent Sales -->
								<div class="col-12">
									<div class="card recent-sales overflow-auto">

										<div class="filter">
											<a class="icon" href="#" data-bs-toggle="dropdown"><i
												class="bi bi-three-dots"></i></a>
											<ul
												class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
												<li class="dropdown-header text-start">
													<h6>Filter</h6>
												</li>

												<li><a class="dropdown-item" href="#">Today</a></li>
												<li><a class="dropdown-item" href="#">This Month</a></li>
												<li><a class="dropdown-item" href="#">This Year</a></li>
											</ul>
										</div>

										<div class="card-body">

											<%
											String query3 = "SELECT *,users.id as uid,tasks.id as tid  FROM `tasks`,users WHERE tasks.user_id = users.id  ORDER BY tasks.id DESC LIMIT 5";

											Connection conn3 = Database.initSql();
											Statement stmt3 = conn3.createStatement();
											try {

											    ResultSet rs = stmt.executeQuery(query3);
											%>
											<table class="table table-striped ">
												<thead>
													<tr>
														<th scope="col">Task No</th>
														<th scope="col">User</th>
														<th scope="col">Task Name</th>
														<th scope="col">Description</th>
														<th scope="col">Prority</th>
														<th scope="col">Status</th>
													</tr>
												</thead>
												<tbody>
													<%
													while (rs.next()) {
													    String priorityString = "";
													    if (rs.getString("priority").equals("Low")) {
														priorityString = "success";
													    } else if (rs.getString("priority").equals("Medium")) {
														priorityString = "warning";
													    } else {
														priorityString = "danger";
													    }

													    String statusString = "";
													    if (rs.getString("status").equals("pending")) {
														statusString = "warning";
													    } else if (rs.getString("status").equals("closed")) {
														statusString = "danger";
													    } else {
														statusString = "success";
													    }
													%>
													<tr>
														<th scope="row"><a href="#">#<%=rs.getString("tid")%></a></th>
														<td><%=rs.getString("name")%></td>
														<td><a href="#" class="text-primary"><%=rs.getString("taskName")%></a></td>
														<td><%=rs.getString("description")%></td>
														<td><span class="badge bg-<%=priorityString%>"><%=rs.getString("priority")%>
														</span></td>
														<td><span class="badge bg-<%=statusString%>"><%=rs.getString("status")%>
														</span></td>
													</tr>

													<%
													}
													} catch (Exception e) {
													e.printStackTrace();
													}
													%>
												</tbody>
											</table>

										</div>
									</div>
								</div>
							</div>

						</div>
						<!-- End Right side columns -->

					</div>
		</section>

	</main>
	<!-- End #main -->


	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.min.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>

</html>
