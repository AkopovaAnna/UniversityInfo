package model;

public class Faculty {
	
	private String name;
	private double fee;
	private int departmentId;
	
	public Faculty(){
		name = "";
		fee = 0.0;
		departmentId = 0;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getFee() {
		return fee;
	}
	public void setFee(double fee) {
		this.fee = fee;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	
	

}
