package software.trentanove.sciabaladaGourmet.beans;

public class ResturantScore {  
 
	private String resturant;  
	private String city;  
	private String dinnerDate;  
	private float location;  
	private float service;
	private float menu;  
	private float bill;
	
	public String getResturant() {
		return resturant;
	}
	public void setResturant(String resturant) {
		this.resturant = resturant;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDinnerDate() {
		return dinnerDate;
	}
	public void setDinnerDate(String dinnerDate) {
		this.dinnerDate = dinnerDate;
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