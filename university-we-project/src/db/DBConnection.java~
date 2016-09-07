package db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.log4j.Logger;


public class DBConnection {
	
	private static Connection dbConnection = null;
	private static DBConnection provider;
	final static Logger logger = Logger.getLogger(DBConnection.class);

	public DBConnection() {
		
	}
	
    public static DBConnection getInstance() {
        if (provider == null) {
            provider = new DBConnection();
        }
        return provider;
    }

	public Connection getConnection() throws SQLException {
		if (dbConnection != null) {
			return dbConnection;
		} else {
			
//				InputStream inputStream = DBConnection.class.getClassLoader().getResourceAsStream("UniveristyInfo/src/db/db.properties");
//				Properties properties = new Properties();
//				if (properties != null) {
//					properties.load(inputStream);
					
					String dbDriver = "com.mysql.jdbc.Driver"; //properties.getProperty("dbDriver");
					String connectionUrl = "jdbc:mysql://localhost:3306/UniversityInfo";// properties.getProperty("connectionUrl");
					String userName = "root"; // properties.getProperty("userName");
					String password = "root"; //properties.getProperty("password");
					// This will load the MySQL driver, each DB has its own
					// driver
				
					try {
						Class.forName(dbDriver).newInstance();
						dbConnection = DriverManager.getConnection(connectionUrl, userName, password);
					} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
						logger.error("error with loading driver", e);
					}
		 
					// DriverManager.registerDriver(driver);
					// Setup the connection with the DB
					
			return dbConnection;
		}
	}

}
