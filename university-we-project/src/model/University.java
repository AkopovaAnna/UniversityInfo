package model;

public class University{ //Serializable
	
	private int id;
	private String name;
	private String city;
	private String country;
	private String address;
	private String email;
		
	public University(){
		id = 0;
		name = "";
		city = "";
		country = "";
		address = "";
		email = "";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString(){
		return (name + " " + address + " " + city + " " + country + " " + email);
	}
	

}
