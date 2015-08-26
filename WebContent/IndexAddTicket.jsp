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
<script>
	function validate() {
		var result = document.getElementById('TID').value;
		if (result == "") {
			alert("Please Select Trouble Service");
			return false;
		}

		var result = document.getElementById('Trouble Description').value;
		if (result == "") {
			alert("Please FillTrouble Description");
			return false;
		}

		var result = document.getElementById('Disposition').value;
		if (result == "") {
			alert("Please select Disposition Type");
			return false;
		}

		var o = document.getElementById('rb1');
		var c = document.getElementById('rb2');

		if ((o.checked == false) && (c.checked == false)) {
			alert("Please choose the Status of the Ticket");
			return false;
		}

		else if (c.checked == true) {
			var t = document.getElementById('Closure Comments').value;
			if (t == "") {
				alert("Please enter closure comments");
				return false;
			} else if (t == "close" || t == "closed" || t == "solved by itself"
					|| t == "Closure Comments") {
				alert("Please enter closure comments with proper description");
				return false;
			}

		}
	}
	function Reboot() {
		var x = (Math.floor((Math.random() * 2) + 0));
		if (x == 1)
			alert("Device successfully Rebooted");
		else
			alert("Failed to Reboot");
	}

	function Ping() {
		var x = (Math.floor((Math.random() * 2) + 0));
		if (x == 1)
			alert("Device responding");
		else
			alert("Device not responding");
	}

	var request;
	function sendInfo() {
		var v = document.vinform.t1.value;
		var url = "ProjIndex?val=" + v;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function getInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			document.getElementById('amit').innerHTML = val;
			//console.log(val);
		}
	}
</script>

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
<body onload="form1.reset();">
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
							<div class="container">
	

		<form name="vinform" id="form1">

			<label class="vzh3">Enter Customer id:</label><input type="text"
				name="t1" onBlur="sendInfo()" class="vztext">

		</form>

		<span id="amit"> </span>
	</div>
	</div>
		</div>
	</div>
</body>
</html>
</body>
</html>