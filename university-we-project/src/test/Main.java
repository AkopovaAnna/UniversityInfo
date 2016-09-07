package test;

import model.University;
import service.UniversityService;

public class Main {

	public static void main(String[] args) {

		
		University univer = new University();
		univer.setAddress("address1");
		univer.setCity("Yerevan");
		univer.setCountry("Armenia");
		univer.setEmail("ysu@ysu.com");
		univer.setName("YSU");
		UniversityService uservice = new UniversityService();
		uservice.createUniversity(univer);
	}

}
