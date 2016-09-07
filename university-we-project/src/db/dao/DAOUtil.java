package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.log4j.Logger;

public class DAOUtil {
	
	final static Logger logger = Logger.getLogger(DAOUtil.class);

	private DAOUtil() {
    
	}
    
    public static PreparedStatement prepareStatement (Connection connection, String sql, boolean returnGeneratedKeys, List<Object> values)
    		throws SQLException {
    	
    	PreparedStatement statement;
    		
    	if(returnGeneratedKeys){
    		statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    	} else{
    		statement = connection.prepareStatement(sql, Statement.NO_GENERATED_KEYS);
    	}
    	setValues(statement, values);
        return statement;
    }

    public static void setValues(PreparedStatement statement, List<Object> values)
        throws SQLException {
    	if(values != null && !values.isEmpty()){
        for (int i = 0; i < values.size(); i++) {
            statement.setObject(i + 1, values.get(i));
            }
    	} else {
    		logger.warn("the list of values is null or empty");
    	}
       }
}
