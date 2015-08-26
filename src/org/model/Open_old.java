package org.model;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Open
 */
@WebServlet("/Open")
public class Open_old extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Open_old() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		String ticket_id=request.getParameter("tid");
		PreparedStatement pst;
		ResultSet rs;
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String user = "scott";
				String password = "TIGER";
				String url = "jdbc:oracle:thin:@localhost:1521:orcl";	
				con = DriverManager.getConnection(url, user, password);
				String query="Select * from Ticket_Information where ticket_id="+ticket_id;
				Statement s=con.createStatement();
				List<TicketBean> ticket=new ArrayList<TicketBean>();
				pst=con.prepareStatement(query);
				rs=pst.executeQuery();
				rs=s.executeQuery(query);  
				while(rs.next())
				{
						TicketBean bean=new TicketBean(null,null,null,null,null,null,null,null,null,null,null,null);
						//bean.setTicketID(rs.getString("ticket_ID"));
						bean.setCustID(rs.getString("Customer_ID"));
						bean.setTroubleID(rs.getString("Trouble_Service_ID"));
						bean.setTicketDescription(rs.getString("Trouble_Description"));
						bean.setTicketType(rs.getString("Ticket_Type"));
						bean.setCreationDate(rs.getDate("Date_Of_Creation"));
						bean.setLastUpdated(rs.getDate("Last_Updated"));
						bean.setDueDate(rs.getDate("Due_date"));
						bean.setRemarks(rs.getString("Remarks"));
						bean.setDispositionID(rs.getString("Disposition_ID"));
						bean.setTicketStatus(rs.getString("Status"));
						bean.setGroupTicketID(rs.getString("Group_Ticket_ID"));
						bean.setCreatedBY(rs.getString("Created_By"));
						
						ticket.add(bean);
						
				}
				
				
				
				System.out.println("Tickets Displayed");
			
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			}
	

		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
