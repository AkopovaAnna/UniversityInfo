package db.dao;

import java.sql.SQLException;
import java.util.List;

import exception.DAOException;
import model.University;

public interface UniversityDao {
	
	public void insert(University university) throws SQLException;
//	public University findByUniverId(int id); 
	public List<University> getAllUnivers() throws SQLException;
//	public List<University> getLimitedNumberUsers();
//	public List<String> listAllUniverNames();
	
	

}
