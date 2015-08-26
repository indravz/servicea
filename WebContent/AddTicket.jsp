<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="Header.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Open Tickets</title>

<link rel="stylesheet" type="text/css" href="styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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
</head>
<body onload="form1.reset();">
<div class ="layout">
	<div class="container">
		

		<form name="vinform" id="form1">

			<label class="vzh3">Enter Customer id:</label><input type="text"
				name="t1" onBlur="sendInfo()" class="vztext">

		</form>

		<span id="amit"> </span>
	</div>
	</div>
	<jsp:include page="Header2.jsp"></jsp:include>
</body>
</html>