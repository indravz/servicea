package org.model;

import java.sql.*;


public class AddNewTicket_old {
	public int addTicket(TicketBean tb) {

		Connection con = null;
		CallableStatement cstmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String user = "hr";
			String password = "hr";
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";	
			con = DriverManager.getConnection(url, user, password);
			//String query = "{call create_ticket(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			String query = "{call create_ticket(?, ?, ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = con.prepareCall(query);
			//cstmt.setString(1, tb.getTicketID());
			cstmt.setString(2, tb.getCustID());
			cstmt.setString(3, tb.getTroubleID());
			cstmt.setString(4, tb.getTicketDescription());
			cstmt.setString(5, tb.getTicketType());
			cstmt.setDate(6, tb.getCreationDate());
			cstmt.setDate(7, tb.getLastUpdated());
			cstmt.setDate(8, tb.getDueDate());
			cstmt.setString(9, tb.getRemarks());
			cstmt.setString(10,tb.getDispositionID());
			cstmt.setString(11,tb.getTicketStatus());
			cstmt.setString(12,tb.getGroupTicketID());
			cstmt.setString(13,tb.getCreatedBY());
			cstmt.execute();
			return 1;

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} finally {

			try {
				if(cstmt != null)
					cstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
}
