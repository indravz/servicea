package org.model;

import java.sql.Date;

public class TicketBean {
	//private String ticketID;
	private String custID;
	private String troubleID;
	private String ticketDescription;
	private String ticketType;
	private Date creationDate;
	private Date lastUpdated;
	private Date dueDate;
	private String remarks;
	private String dispositionID;
	private String ticketStatus;
	private String groupTicketID;
	private String createdBY;
/*	public String getTicketID() {
		return ticketID;
	}
	public void setTicketID(String ticketID) {
		this.ticketID = ticketID;
	}*/
	public String getCustID() {
		return custID;
	}
	public void setCustID(String custID) {
		this.custID = custID;
	}
	public String getTroubleID() {
		return troubleID;
	}
	public void setTroubleID(String troubleID) {
		this.troubleID = troubleID;
	}
	public String getTicketDescription() {
		return ticketDescription;
	}
	public void setTicketDescription(String ticketDescription) {
		this.ticketDescription = ticketDescription;
	}
	public String getTicketType() {
		return ticketType;
	}
	public void setTicketType(String ticketType) {
		this.ticketType = ticketType;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getDispositionID() {
		return dispositionID;
	}
	public void setDispositionID(String dispositionID) {
		this.dispositionID = dispositionID;
	}
	public String getTicketStatus() {
		return ticketStatus;
	}
	public void setTicketStatus(String ticketStatus) {
		this.ticketStatus = ticketStatus;
	}
	public String getGroupTicketID() {
		return groupTicketID;
	}
	public void setGroupTicketID(String groupTicketID) {
		this.groupTicketID = groupTicketID;
	}
	public String getCreatedBY() {
		return createdBY;
	}
	public void setCreatedBY(String createdBY) {
		this.createdBY = createdBY;
	}
	public TicketBean(String custID, String troubleID,
			String ticketDescription, String ticketType, Date creationDate,
			Date lastUpdated, Date dueDate, String remarks,
			String dispositionID, String ticketStatus, String groupTicketID,
			String createdBY) {
		super();
		//this.ticketID = ticketID;
		this.custID = custID;
		this.troubleID = troubleID;
		this.ticketDescription = ticketDescription;
		this.ticketType = ticketType;
		this.creationDate = creationDate;
		this.lastUpdated = lastUpdated;
		this.dueDate = dueDate;
		this.remarks = remarks;
		this.dispositionID = dispositionID;
		this.ticketStatus = ticketStatus;
		this.groupTicketID = groupTicketID;
		this.createdBY = createdBY;
	}
	
	
		
}
