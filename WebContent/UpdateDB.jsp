<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="styles.css">
<jsp:include page="Header.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Updation</title>
</head>
<body>
<div class ="layout">
	<%
		
		String remarks=request.getParameter("remark");
		String status=request.getParameter("status");
		String id=request.getParameter("tid");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user = "scott";
		String password = "TIGER";
		String url = "jdbc:oracle:thin:@192.168.0.139:1521:orcl";
		try {
			con = DriverManager.getConnection(url, user, password);
			String query1 = "update ticket_information set status = ? where ticket_id = ?";
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1,status);
			pstmt.setString(2,id);
			int c = pstmt.executeUpdate();
			String query2 = "update ticket_information set remarks = ? where ticket_id = ?";
			pstmt = con.prepareStatement(query2);
			pstmt.setString(1,remarks);
			pstmt.setString(2,id);
			c = pstmt.executeUpdate();
			/* String query3 = "update group_ticket set status = ? where group_ticket_id in (select group_ticket_id from ticket_information where ticket_id = ?)"; */
			String query3 = " update group_ticket set status = ? where group_ticket_id in(select group_ticket_id from ticket_information where ticket_id = ?)";
			pstmt = con.prepareStatement(query3);
			pstmt.setString(1, status);
			pstmt.setString(2, id);
			c = pstmt.executeUpdate();
			con.commit();
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

	%>
	<h4>Updated Successfully!!!!</h4>
	<div align="center">
	<a href = "http://localhost:8080/ServiceAssurance/IndexRetrieveDetails.jsp" ><input type="button" value="Back" class="vzbtn1"></a>
	</div>
	</div>
	<jsp:include page="Header2.jsp"></jsp:include>
</body>
</html>