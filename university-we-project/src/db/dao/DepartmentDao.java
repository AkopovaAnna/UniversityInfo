package db.dao;

import exception.DBException;
import model.Department;

public interface DepartmentDao {
	public void insert(Department department) throws DBException;
}
