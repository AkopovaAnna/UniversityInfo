package model;

import java.sql.Date; //??
import java.util.ArrayList;
import java.util.List;

public class Student extends Person {

	private String studentNumber;
	private Date enrollDate;
	private String degree;
	private List<Section> courses; //Collection?

	public Student() {
		courses = new ArrayList<>();
	}

	public String getStudentNumber() {
		return studentNumber;
	}

	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public List<Section> getCourses() {
		return courses;
	}

	public void setCourses(List<Section> courses) {
		this.courses = courses;
	}
}
