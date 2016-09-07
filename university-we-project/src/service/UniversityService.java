package service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import db.dao.UniversityDao;
import db.dao.imp.JdbcUniversityDao;
import model.University;

public class UniversityService {

	private UniversityDao univerDao;
	private static UniversityService univerService;
	final static Logger logger = Logger.getLogger(UniversityService.class);

	public UniversityService() {
		univerDao = new JdbcUniversityDao();
	}

	public static UniversityService getInstance() {
		if (univerService == null) {
			synchronized (UniversityService.class) {
				if (univerService == null) {
					univerService = new UniversityService();
				}
			}
		}
		return univerService;
	}

	public UniversityDao getUniverDao() {
		return univerDao;
	}

	public void createUniversity(University university) {
		try {
			univerDao.insert(university);
		} catch (SQLException e) {
			logger.error("failed to coonect to db", e);
		}
	}

	public List<University> getAllData() {
		List<University> univers = null;
		try {
			univers = univerDao.getAllUnivers();
		} catch (SQLException e) {
			logger.error("failed to coonect to db", e);
		}

		return univers;
	}
}
