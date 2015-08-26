<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="Header.jsp"></jsp:include>
<head>
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
</head>
<body>
	<div class = "layout">
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		String user = "scott";
		String password = "TIGER";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		try {
			con = DriverManager.getConnection(url, user, password);
			String query1 = "Select * from TICKET_INFORMATION where status = 'Closed' and ticket_type = 'Single'";
			String query2 = "Select * from TICKET_INFORMATION where status = 'Closed' and ticket_type = 'Group Ticket'";
			pstmt = con.prepareStatement(query1);
			rs1 = pstmt.executeQuery();

			pstmt = con.prepareStatement(query2);
			rs2 = pstmt.executeQuery();

			if (!rs1.isBeforeFirst()) {
	%><h3>Individual Ticket</h3>
	<p>
		No record Found<%
		} else {
	%>
	
	<h3>Individual Ticket</h3>
	<TABLE class="vztable">

		<tr>
			<td>Ticket ID</td>
			<td>Customer ID</td>
			<td>Trouble Service</td>
			<!-- <td>Trouble Description</td> -->
			<!-- <td>Ticket Type</td> -->
			<td>Created On</td>
			<td>Last Updated</td>
			<!-- <td>Due Date</td><td>Remarks</td><td>Disposition ID</td><td>Status</td>
			<td>Group Ticket ID</td> -->
			<td>Created By</td>
			<td></td>
		</tr>


		<%
			}
				int i = 0;
				while (rs1.next()) {
					i++;
					String str = "submit" + i;
					String str2 = "form" + i;
		%>
		<form action="UpdateDetails.jsp" name="<%=str2%>">
		<tr>

			<td><input type="text" readonly value="<%=rs1.getString(1)%>"
				name="tid"></td>
			<td><%=rs1.getString(2)%></td>
			<td><%=rs1.getString(3)%></td>
			<%-- <td><%=rs1.getString(4) %></td> --%>
			<td><%=rs1.getString(5)%></td>
			<%-- <td><%=rs1.getDate(6)%></td> --%>
			<td><%=rs1.getDate(7)%></td>
			<%-- <td><%=rs1.getDate(8) %></td><td><%=rs1.getString(9) %></td><td><%=rs1.getString(10) %></td><td><%=rs1.getString(11) %></td>
			<td><%=rs1.getString(12)%></td> --%>
			<td><%=rs1.getString(13)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Submit" value="Update"  class = "vzbtn"
				name="<%=str%>"></td>
		</tr>
		</form>

		<%
			}
		%>
	</TABLE>
	<%
		if (!rs2.isBeforeFirst()) {
	%><h3>Group Ticket</h3>
	<p>
		No record Found </p>
		<%} else {%>
	
	<h3>Group Ticket</h3>
	<TABLE class="vztable">

		<tr>
			<td>Ticket ID</td>
			<td>Customer ID</td>
			<td>Trouble Service</td>
			<!-- <td>Trouble Description</td> -->
			<!-- <td>Ticket Type</td> -->
			<td>Created On</td>
			<td>Last Updated</td>
			<!-- <td>Due Date</td><td>Remarks</td><td>Disposition ID</td><td>Status</td> -->
			<td>Group Ticket ID</td>
			<td>Created By</td>
			<td></td>
		</tr>


		<%
			}
				i = 0;
				while (rs2.next()) {
					i++;
					String str = "submit" + i;
					String str2 = "form" + i;
		%>
		<form action="UpdateDetails.jsp" name="<%=str2%>">
			<tr>

				<td><input type="text" readonly value="<%=rs2.getString(1)%>"
					name="tid"></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(3)%></td>
				<%-- <td><%=rs2.getString(4) %></td> --%>
				<td><%=rs2.getString(5)%></td>
				<%-- <td><%=rs2.getDate(6)%></td> --%>
				<td><%=rs2.getDate(7)%></td>
				<%-- <td><%=rs2.getDate(8) %></td><td><%=rs2.getString(9) %></td><td><%=rs2.getString(10) %></td><td><%=rs2.getString(11) %></td> --%>
				<td><%=rs2.getString(12)%></td>
				<td><%=rs2.getString(13)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Submit" value="Update" class = "vzbtn"></td>
			</tr>
		</form>

		<%
			}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			} finally {
				if (rs1 != null)
					rs1.close();
				if (rs2 != null)
					rs2.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			}
		%>
	</TABLE>
	<div align="center">
	<a href = "http://localhost:8080/ServiceAssurance/RetrieveDetails.jsp" ><input type="button" value="Back" class="vzbtn1"></a>
	</div>
	</div>
	<jsp:include page="Header2.jsp"></jsp:include>
</body>
</html>