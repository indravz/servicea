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
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div class = "layout">
	<% Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user = "scott";
		String password = "TIGER";
		String url = "jdbc:oracle:thin:@192.168.0.139:1521:orcl";
		String tid = request.getParameter("ticketid");
		String cid = request.getParameter("custid");
		String query = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			if(tid.length() > 0) {
				query = "Select * from TICKET_INFORMATION where ticket_id = ?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, tid);
			} else {
				query = "Select * from TICKET_INFORMATION where customer_id = ?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cid);
			}
			rs = pstmt.executeQuery();
			if (!rs.isBeforeFirst()) {
				%><h2 class="vzh2">No Ticket with the given ID exists!!</h2><%
						
			} 
				else {%>
				
			
					<TABLE border="1" class="vztable">

		<tr>
			<td>Ticket ID</td>
			<td>Customer ID</td>
			<td>Trouble Service</td>
			<td>Trouble Description</td>
			<td>Ticket Type</td>
			<td>Date Of Creation</td>
			<td>Last Updated</td>
			<td>Due Date</td>
			<td>Remarks</td>
			<td>Disposition ID</td>
			<td>Status</td>
			<td>Group Ticket ID</td>
			<td >Created By</td>
		</tr><%} %>
			<%while (rs.next()) {%>
	
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getDate(6)%></td>
			<td><%=rs.getDate(7)%></td>
			<td><%=rs.getDate(8) %></td>
			<td><%=rs.getString(9) %></td>
			<td><%=rs.getString(10) %></td>
			<td><%=rs.getString(11) %></td>
			<td><%=rs.getString(12)%></td>
			<td><%=rs.getString(13)%></td>
		</tr>
		
	
		<%
			}%>
			</TABLE><br><br><br>
			<%
			/* out.println("<tr><input type = \"Submit\" value = \"Update\"></tr>"); */
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if(rs != null)	rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}
		%>
	<div align="center">
	<a href = "http://localhost:8080/ServiceAssurance/IndexRetrieveDetails.jsp" ><input type="button" value="Back" class="vzbtn1"></a>
	</div>
	</div>
	<jsp:include page="Header2.jsp"></jsp:include>
</body>
</html>