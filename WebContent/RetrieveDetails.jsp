<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="Header.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" href="theme.css">


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>
<body>
<!-- div align="center"-->

<div class = "layout">
<form action="SearchByID.jsp">
<table align="center">
<tr><td><div class="inputwrap">
<label class="vzh3">CustID:</label>
<input type="text" name="custid" class="vztext"></div><br></td></tr>
<tr><td><div class="inputwrap">
<label class="vzh3">Or</label>
</div></td></tr>
<tr><td><div class="inputwrap">

<label class="vzh3">TicketID:</label>
<input type="text" name="ticketid" class="vztext"></div><br><br>
<!--a href="SearchByID.jsp"--><div class="inputwrap">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"  value="Search" class="vzbtnmedium" onclick="document.location.href='SearchByID.jsp'"><br><br><br>
</div></td></tr>
</table>
</form>
<table align="center">
<tr><td><label class="vzh3">Select Ticket Type:</label></td></tr>

<!-- a href="DisplayOpenTicket.jsp"--><tr><td><div class="inputwrap"><input type="button" name="open" value="ShowOpenTickets" class="vzbtn" onclick="document.location.href='DisplayOpenTicket.jsp'"></div><br>
<!-- a href="DisplayClosedTicket.jsp"--><div class="inputwrap"><input type="button" name="closed" value="ShowClosedTickets" class="vzbtn" onclick="document.location.href='DisplayClosedTicket.jsp'"></div></td></tr>
</table>
</div>
<jsp:include page="Header2.jsp"></jsp:include>
</body>
</html>