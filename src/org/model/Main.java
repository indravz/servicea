package org.model;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		String Message="";
		String msg="";
		String TicketID="";
		//int TicketID=0;
		Date d = new Date();
		java.sql.Date sd1 = new java.sql.Date(d.getTime());
		SimpleDateFormat dft = new SimpleDateFormat("dd-MM-yyyy");
		
		HttpSession aSession = request.getSession();
		String id = (String) aSession.getAttribute("id");
		String zipcode = (String) aSession.getAttribute("zipcode");
		String TroubleServiceID = request.getParameter("TID");
		String TroubleDescription = request.getParameter("Trouble Description");
		String TicketType = null;
		String Remarks = request.getParameter("Remarks");
		String DispositionID = request.getParameter("Disposition");
		String Status = request.getParameter("status");
		String GroupID=null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "TIGER");
			PreparedStatement ps = con.prepareStatement("select Group_Ticket_ID from Group_Ticket where Zipcode = ? and Trouble_Service=?");

			ps.setString(1, zipcode);
			ps.setString(2, TroubleServiceID);
			ResultSet rs = ps.executeQuery();
			
			if (rs.isBeforeFirst()) {

				msg="Belongs to Group Ticket ID: ";
				while(rs.next())
				GroupID=rs.getString(1);
				msg = msg + GroupID;
				TicketType = "Group Ticket";
			}
			else TicketType="Single";
			
			con.close();
		}
			catch (Exception e) {
				e.printStackTrace();
			}
		
		java.sql.Date sd2 = null;
		
		if("open".equals(Status))
		{
			Date due = new Date();
			Calendar c = Calendar.getInstance(); 
			c.setTime(due); 
			c.add(Calendar.DATE, 4);
			due = c.getTime();
			sd2 = new java.sql.Date(due.getTime());
		}
		
		String CreatedBy = "Admin";
		
		TicketBean tb = new TicketBean(id,TroubleServiceID,TroubleDescription,TicketType,sd1, sd1, sd2, Remarks,DispositionID,Status,GroupID ,CreatedBy);
		AddNewTicket adt = new AddNewTicket();
		TicketID = adt.addTicket(tb);
		if (TicketID != null) 
			{
				Message=Message + "Ticket created Successfully!!!";
				
				/*try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "TIGER");
					PreparedStatement ps = con.prepareStatement("select Ticket_ID from Ticket_INFORMATION where Ticket_ID = ( select max(Ticket_ID) from Ticket_INFORMATION )");
					ResultSet rs = ps.executeQuery();
					while(rs.next())
						TicketID=rs.getString(1);
					//TicketID=Integer.parseInt(rs.getString(1));
					con.close();
				}
					catch (Exception e) {
						e.printStackTrace();
					}
*/				Message=Message +"   TicketID: "+ TicketID;
			}
		else Message=Message + "Encountered some Error!\n";
		
		Message = Message + msg;
		pw.println("<html>");
		pw.println("<head>");
		pw.println("</head>");
		pw.println("<body>");
		
		pw.println("<h3>"+Message+"</h3>");
		pw.println("</body>");
		pw.println("</html>");
		pw.println("<div align=\"center\">");
		
		
		pw.println("<a href = \"http://localhost:8080/ServiceAssurance/ServiceAssurance.jsp\" ><input type=\"button\" value=\"Back\" class=\"vzbtn1\"></a>");
		pw.println("</div>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
