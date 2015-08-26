package org.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Today {
	public static String  getCurrentDate(){
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
		Date date = new Date();
		return dateFormat.format(date);	
	}

}
