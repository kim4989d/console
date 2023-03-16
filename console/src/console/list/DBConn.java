package console.list;


import java.sql.*;


import console.common.util.AppLog;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.servlet.http.HttpServlet;
import console.common.execption.AppException;
import console.common.tray.Tray;

public class DBConn {

	private Connection connection = null;
	private String     nextPage   = null;
	private DataSource ds=null;
	public  AppLog Log=new AppLog();

	
	public Connection getConnection() throws Exception {
		/*
		Context initCtx = new InitialContext();
    	ds = (DataSource) initCtx.lookup("ci");
    	System.out.println("Connection start...");
    	connection = ds.getConnection();
		
		return connection;
	*/
	
	String url="jdbc:oracle:thin:@203.210.53.30:1521:orcl";
	String userid="kim";
	String passwd="kim2154";
	Class.forName("oracle.jdbc.OracleDriver");
	connection = DriverManager.getConnection(url,userid,passwd);

	return connection;
	}
	

    public void commit() throws Exception
    {
		if ( connection != null ) {
			connection.commit();
		}
    }

	public void endCommand() throws Exception {

		if ( connection != null ) {
			connection.close();
		}

		
	}
	
}
