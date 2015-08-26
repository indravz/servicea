<!DOCTYPE html>
<!--[if IE 9]>
<html class="ie ie9" lang="en-US">
<![endif]-->
<html lang="en-US">

<!-- Mirrored from torchtemplates.net/html/autocar/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 23 Aug 2015 08:51:40 GMT -->
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>VZHome</title>


<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,500,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css" href="styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/simple-line-icons.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/autocar.css">

<link rel="stylesheet" href="assets/rs-plugin/css/settings.css">

<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->

</head>
<body>


	<div class="sidebar-menu-container" id="sidebar-menu-container">

		<div class="sidebar-menu-push">

			<div class="sidebar-menu-overlay"></div>

			<div class="sidebar-menu-inner">
				<header class="site-header">
					<div id="main-header" class="main-header header-sticky">
						<div class="container clearfix">
							<div class="logo">
								<a href="index-2.html"><img src="assets/images/logo.png"
									alt="Verizon" /></a>

							</div>
							<div class="header-right-toggle pull-right hidden-md hidden-lg">
								<a href="javascript:void(0)" class="side-menu-button"><i
									class="fa fa-bars"></i></a>
							</div>
							<nav class="main-navigation pull-right hidden-xs hidden-sm"
								style="border-bottom: 1px solid #d2d3d4">
								<ul style="font-size: 50px;">
									<li><a href="index-2.html">Home</a></li>
									<li><a href="#" class="has-submenu">Menu1 </a>
										<ul class="sub-menu">
											<li><a href="listing-2-columns.html">List 1</a></li>
											<li><a href="listing-3-columns.html">List 2</a></li>
											<li><a href="listing-4-columns.html">List 3</a></li>
										</ul></li>
									<li><a href="#" class="has-submenu">Menu 2</a>
										<ul class="sub-menu">
											<li><a href="blog.html">List 1</a></li>
											<li><a href="blog-grid.html">List 2</a></li>
											<li><a href="single-post.html">List 3</a></li>
										</ul></li>
									<li><a href="#">Service Assurance</a>
										<ul class="sub-menu">
											<li><a href="IndexAddTicket.jsp">Generate Ticket</a></li>
											<li><a href="IndexRetrieveDetails.jsp">Review Ticket</a></li>
										</ul></li>
									<li><a href="#" class="has-submenu">Menu 4</a>
										<ul class="sub-menu">
											<li><a href="single-car.html">List 1</a></li>
											<li><a href="single-car-2.html">List 2</a></li>
											<li><a href="shortcodes.html">List 3</a></li>
										</ul></li>
									<li><a href="contact.html" style="color: red;">Log Out</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</header>

				<div class="layout">
					<div class="fullwidthbanner-container">
						<div class="fullwidthbanner">
							<ul>
								<form action="SearchByID.jsp">
									<table align="center">
										<tr>
											<td><div class="inputwrap">
													<label class="vzh3">CustID:</label> <input type="text"
														name="custid" class="vztext">
												</div> <br></td>
										</tr>
										<tr>
											<td><div class="inputwrap">
													<label class="vzh3">Or</label>
												</div></td>
										</tr>
										<tr>
											<td><div class="inputwrap">

													<label class="vzh3">TicketID:</label> <input type="text"
														name="ticketid" class="vztext">
												</div> <br> <br> <!--a href="SearchByID.jsp"-->
												<div class="inputwrap">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
														type="submit" value="Search" class="vzbtnmedium"
														onclick="document.location.href='SearchByID.jsp'"><br>
													<br> <br>
												</div></td>
										</tr>
									</table>
								</form>
								<table align="center">
									<tr>
										<td><label class="vzh3">Select Ticket Type:</label></td>
									</tr>

									<!-- a href="DisplayOpenTicket.jsp"-->
									<tr>
										<td><div class="inputwrap">
												<input type="button" name="open" value="ShowOpenTickets"
													class="vzbtn"
													onclick="document.location.href='DisplayOpenTicket.jsp'">
											</div> <br> <!-- a href="DisplayClosedTicket.jsp"-->
											<div class="inputwrap">
												<input type="button" name="closed" value="ShowClosedTickets"
													class="vzbtn"
													onclick="document.location.href='DisplayClosedTicket.jsp'">
											</div></td>
									</tr>
								</table>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>