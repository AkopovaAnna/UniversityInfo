package db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
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

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (dbConnection != null) {
			return dbConnection;
		} else {
			
//				InputStream inputStream = DBConnection.class.getClassLoader().getResourceAsStream("db.properties");
//				Properties properties = new Properties();
//				if (properties != null) {

						
					
					
					String dbDriver = "com.mysql.jdbc.Driver"; //properties.getProperty("dbDriver");
					String connectionUrl = "jdbc:mysql://localhost:3306/UniversityInfo";// properties.getProperty("connectionUrl");
					String userName = "root"; // properties.getProperty("userName");
					String password = "root"; //properties.getProperty("password");
					// This will load the MySQL driver, each DB has its own
					// driver
				

//						properties.load(inputStream);
						try {
							Driver driver = (Driver) Class.forName(dbDriver).newInstance();
							DriverManager.registerDriver(driver);
							dbConnection = DriverManager.getConnection(connectionUrl, userName, password);
							System.out.println("connect");
						} catch (InstantiationException | IllegalAccessException e) {
							// TODO Auto-generated catch block
							logger.error(e);
							throw new IllegalArgumentException(e);
						}
						System.out.println("connect2");
					
		 
					// DriverManager.registerDriver(driver);
					// Setup the connection with the DB
//				}
			return dbConnection;
		}
	}

}
