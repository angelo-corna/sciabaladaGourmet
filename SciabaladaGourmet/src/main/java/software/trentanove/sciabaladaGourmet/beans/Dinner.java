package software.trentanove.sciabaladaGourmet.beans;

public class Dinner {  
 
	private int id;
	private String resturant;  
	private String city;  
	private String resturantAndCity;  
	private String dinnerDate;  
	private String participants;  
	private String kind;  
	private boolean evaluated;  
	
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
	public String getParticipants() {
		return participants;
	}
	public void setParticipants(String participants) {
		this.participants = participants;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getResturantAndCity() {
		return resturantAndCity;
	}
	public void setResturantAndCity(String resturantAndCity) {
		this.resturantAndCity = resturantAndCity;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isEvaluated() {
		return evaluated;
	}
	public void setEvaluated(boolean evaluated) {
		this.evaluated = evaluated;
	}
}  