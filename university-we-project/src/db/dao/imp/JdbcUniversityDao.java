package db.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import db.DBConnection;
import db.dao.DAOUtil;
import db.dao.SQLQuery;
import db.dao.UniversityDao;
import exception.DAOException;
import model.University;

public class JdbcUniversityDao implements UniversityDao {
	private DBConnection dbconnection;
	final static Logger logger = Logger.getLogger(JdbcUniversityDao.class);

	public JdbcUniversityDao() {
		dbconnection = DBConnection.getInstance();
	}

	public University mapRsetToUniver(ResultSet resultset) throws SQLException {
		University university = new University();
		university.setId(resultset.getInt("id"));
		university.setName(resultset.getString("name"));
		university.setCity(resultset.getString("city"));
		university.setCountry(resultset.getString("country"));
		university.setAddress(resultset.getString("address"));
		university.setEmail(resultset.getString("email"));

		return university;
	}

	@Override
	public void insert(University university) throws SQLException {

		if (university.getId() != 0) {
			logger.error("university is already created, the user ID is not null.");
		}

		List<Object> univers = new ArrayList<>();
		univers.add(university.getName());
		univers.add(university.getCity());
		univers.add(university.getCountry());
		univers.add(university.getAddress());
		univers.add(university.getEmail());

		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection, SQLQuery.SQL_INSERT, true,
						univers)) {

			// if (statement.executeUpdate() != 0) { //?
			// logger.error("Creating user failed, no rows affected.");
			// }
			statement.executeUpdate();
			try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					university.setId(generatedKeys.getInt(1));
				} else {
					throw new DAOException("Creating user failed, no generated key obtained.");
				}
			}
		}
	}

	@Override
	public List<University> getAllUnivers() throws SQLException {

		List<University> univers = new ArrayList<>();
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(SQLQuery.SQL_LIST_ALL_Univers);
				ResultSet resultSet = statement.executeQuery();) {

			while (resultSet.next()) {
				univers.add(mapRsetToUniver(resultSet));
			}
		}
		return univers;
	}

}
