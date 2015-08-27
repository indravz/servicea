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
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type">
<title>Ticket Updation</title>
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
<div class ="layout">
	<%
		String tid = request.getParameter("tid");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user = "scott";
		String password = "TIGER";
		String url = "jdbc:oracle:thin:@192.168.0.139:1521:orcl";
		try {
			con = DriverManager.getConnection(url, user, password);
			String query1 = "Select * from TICKET_INFORMATION where ticket_id = ?";
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, tid);
			rs = pstmt.executeQuery();
			if (!rs.isBeforeFirst()) {
	%>
	<p>
		No record Found<%
		}
			while (rs.next()) {
	%>
	
	<form action="UpdateDB.jsp">
		<TABLE class = "vztable">
			<TR>
				<td></td>
				<td></td>
			</TR>
			<TR>
				<td>Ticket ID</td>
				<Td><INPUT STYLE="color : #000000" type="text" value="<%=rs.getString(1)%>" readonly name = "tid"></Td>
			</TR>
			<TR>
				<td>Customer ID</td>
				<TD><INPUT type="text" value="<%=rs.getString(2)%>" readonly></TD>
			</TR>
			<TR>
				<td>Service ID</td>
				<TD><INPUT type="text" value="<%=rs.getString(3)%>" readonly></TD>
			</TR>
			<TR>
				<td>Description</td>
				<TD><INPUT type="text" value="<%=rs.getString(4)%>" readonly></TD>
			</TR>
			<TR>
				<td>Ticket Type</td>
				<TD><INPUT type="text" value="<%=rs.getString(5)%>" readonly></TD>
			</TR>
			<TR>
				<td>Creation Date</td>
				<TD><INPUT type="text" value="<%=rs.getString(6)%>" readonly></TD>
			</TR>
			<TR>
				<td>Last Updated</td>
				<TD><INPUT type="text" value="<%=rs.getString(7)%>" readonly></TD>
			</TR>
			<TR>
				<td>Due Date</td>
				<TD><INPUT type="text" value="<%=rs.getString(8)%>" readonly></TD>
			</TR>
			<TR>
				<td>Remarks</td>
				<TD><INPUT type="text" value="<%=rs.getString(9)%>"
					name="remark"></TD>
			</TR>
			<TR>
				<td>Disposition ID</td>
				<TD><INPUT type="text" value="<%=rs.getString(10)%>" readonly></TD>
			</TR>
			<TR>
				<td>Status</td>
				<%
					String rb1chk = "";
					String rb2chk = "";
					if(rs.getString(11).equals("Open")) rb1chk = "checked";
					else rb2chk = "checked";
				%>
				<TD><INPUT type="radio" id = "rb1" value="Open"
					name="status" <%=rb1chk %>><label for="rb1">Open&nbsp;&nbsp;</label>
					
					<INPUT type="radio" id = "rb2" value="Closed"
					name="status"<%=rb2chk %>><label for="rb2">Closed&nbsp;&nbsp;</label>
					</TD>
			</TR>
			<TR>
				<td>Group Ticket ID</td>
				<TD><INPUT type="text" value="<%=rs.getString(12)%>" readonly></TD>
			</TR>
			<TR>
				<td>Created By</td>
				<TD><INPUT type="text" value="<%=rs.getString(13)%>" readonly></TD>
			</TR>
			<TR><td></td>
				<td><input type="submit" value="Update"  class = "vzbtn"></td>
			</TR>
		</TABLE>
			</form>
		<%
			}

			} catch (SQLException e) {
				e.printStackTrace();

			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			}
		%>
		</div>
<jsp:include page="Header2.jsp"></jsp:include>
</body>
</html>