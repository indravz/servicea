package org.model;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.util.Random;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.sun.corba.se.pept.transport.Connection;

/**
 * Servlet implementation class ProjIndex
 */
@WebServlet("/ProjIndex")
public class ProjIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void LineTest() {
        Random rg = new Random();
        int bin = rg.nextInt(2);
        System.out.println(bin);
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession aSession = request.getSession();
		String id = request.getParameter("val");
		aSession.setAttribute("id", id);
		
		PrintWriter pw = response.getWriter();
		if (id == null || id.trim().equals("")) {
			pw.print("Please enter Customer id");
		} else

		{

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:orcl", "scott", "TIGER");
				PreparedStatement ps = con
						.prepareStatement("select c.*, p.Name from Customer c inner join Products p on c.SERVICE_ID=P.PRODUCT_ID where Cust_Id = ? ");

				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				if (!rs.isBeforeFirst()) {

					pw.println("No Customer with Customer Id " + id
							+ " exists.<br>Please retype Customer Id");
				} else {
					 pw.println("<form action='Main'>");
					 pw.println("<html>\n");
					 //pw.println("script type=\"text/javascript");
					 pw.println("<body>\n");
					 pw.println("<div class=\"container\">");
					 pw.println("<table class=\"vztable1\">");
					
					 while(rs.next()){
					 pw.println("<tr><td>Customer FirstName:</td>");
					 pw.println("<td>"+rs.getString(2)+"&nbsp"+rs.getString(3));
					
					 pw.println("<tr><td>Customer Account No:</td>");
					 pw.println("<td>"+rs.getString(5));
					 pw.println("<tr><td>Billing address:</td>");
					 pw.println("<td>"+rs.getString(6));
					 pw.println("<tr><td>Shipping address:</td>");
					 pw.println("<td>"+rs.getString(7));
					 aSession.setAttribute("zipcode", rs.getString(7));
					 pw.println("<tr><td>Customer Email:</td>");
					 pw.println("<td>"+rs.getString(8));
					 pw.println("<tr><td>Mobile No:</td>");
					 pw.println("<td>  </td>");
					 pw.println("<tr><td>Service Availed:</td>");
					 pw.println("<td>"+rs.getString(10));
					 }
					// pw.println("</table>");
					 //pw.println("<br><br>");
				
					 pw.println(
					
					
					 //"<table class=\"vztable1\">" +
					 "<tr><td>Trouble Service</td> <td>" +
					 "<select  id='TID' name='TID'>" +
					 "<option value='' disabled selected >Select Trouble Service</option>"
					 +
					 "<option value='1'>Enterprise</option>" +
					 "<option value='2'>Wireless</option>" +
					 "<option value='3'>Television</option>" +
					 "<option value=\"4\">Fios</option>" +
					 "</select>" +
					 "</td> </tr>" +
					
					 "<tr> <td>Trouble Description</td><td>"
					 +"<input type='text' id='Trouble Description' value='' placeholder=\"Trouble Description\" class=\"vztext\" name='Trouble Description'>"
					 + "</td> </tr>" +
					 "<tr> <td>Trouble Shoot</td><td>" +"<input type=\"button\" class=\"vzbtn1small\" name=\"Ping Device\" value=\"Ping\" onclick=\"Ping()\"/>"
					+ "&nbsp;&nbsp&nbsp" +"<input type=\"button\" class=\"vzbtn1small\" name=\"Reboot Device\" value=\"Reboot\" onclick=\"Reboot()\"/>"
					
					 + "</td> </tr>" +
					
					 "<tr> <td>Disposition Type</td><td>" +
					 "<select id='Disposition' name='Disposition'>" +
					 "<option value='' disabled selected >Select Disposition</option>"
					 +
					 "<option value='1'>Closed Out</option>" +
					 "<option value='2'>Tech Dispatch</option>" +
					 "<option value='3'>Hardware Mail</option>" +
					 "</select>" +
					 "</td> </tr>" +
					
					 "<tr> <td>Closure Comments</td><td>"
					 +"<textarea id='Closure Comments' rows=\"5\" cols=\"25\" class=\"vztextarea\" placeholder=\"Closure Comments\" name ='Remarks' >"
					 +"</textarea>" + "</td> </tr>" +
					
					 "<tr> <td>Status</td><td>"
					 +"<input type=\"radio\" id=\"rb1\" name=\"status\" value ='open' ><label for=\"rb1\">Open</label>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
					 +"<input type=\"radio\"  id=\"rb2\" name=\"status\" value ='close'><label for=\"rb2\">Closed</label>"
					 + "</td> </tr>" +
					
					 "<tr> <td></td><td>" +"<input type='submit' value='Submit' class=\"vzbtnmedium\" onclick='return validate()'/>" +
					 "</td> </tr>" +
					 "</table>" +
					 "</form>" +
					
					 "</body></html>");
				}
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
