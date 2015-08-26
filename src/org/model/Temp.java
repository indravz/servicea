package org.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Temp {

	public static void main(String[] args) {
		
		DateFormat dft = new SimpleDateFormat("DD-MM-YYYY");

			Date d = new Date();
			Date d2 = new Date();
			Date d3  = new Date();
			
			java.sql.Date sd1 = new java.sql.Date(d.getTime());
			java.sql.Date sd2 = new java.sql.Date(d2.getTime());
			java.sql.Date sd3 = new java.sql.Date(d3.getTime());
			
		TicketBean tb = new TicketBean("33","003","jksgk","Single",sd1, sd2, sd3, "unsolved","102","Open","3","");
		AddNewTicket_old adt = new AddNewTicket_old();
		if (adt.addTicket(tb) == 1) System.out.println("Ticket created Successfully!!!");

	}

}
