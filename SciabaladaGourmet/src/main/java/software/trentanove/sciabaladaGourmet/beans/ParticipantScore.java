package software.trentanove.sciabaladaGourmet.beans;

public class ParticipantScore {  
 
	private String Participant;  
	private float location;  
	private float service;
	private float menu;  
	private float bill;
	
	public String getParticipant() {
		return Participant;
	}
	public void setParticipant(String participant) {
		Participant = participant;
	}
	public float getLocation() {
		return location;
	}
	public void setLocation(float location) {
		this.location = location;
	}
	public float getService() {
		return service;
	}
	public void setService(float service) {
		this.service = service;
	}
	public float getMenu() {
		return menu;
	}
	public void setMenu(float menu) {
		this.menu = menu;
	}
	public float getBill() {
		return bill;
	}
	public void setBill(float bill) {
		this.bill = bill;
	}
	

}  