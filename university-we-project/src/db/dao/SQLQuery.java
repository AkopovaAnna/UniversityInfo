package db.dao;

public class SQLQuery {
	public static final String SQL_INSERT = "INSERT INTO university(name, city, country, address, email) VALUES(?,?,?,?,?)";
	public static final String SQL_LIST_ALL_Univers = "SELECT * FROM university ORDER BY id";
}
