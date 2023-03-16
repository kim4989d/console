package console.common.cmd;

import java.sql.*;
import java.sql.SQLException;

import console.common.util.AppLog;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.servlet.http.HttpServlet;
import console.common.execption.AppException;
import console.common.tray.Tray;
public abstract class BaseCommand  implements Command {
	private Connection connection = null;
	private String     nextPage   = null;
	private DataSource ds=null;
	public  AppLog Log=new AppLog();
	


	protected Connection getConnection() throws Exception {
		try{
			   Class.forName("com.mysql.jdbc.Driver");
			   
			   //검수용(합정동) DB 
//			   String url="jdbc:mysql://210.112.162.220:3306/mysql";
//			   String id="root";
//			   String pass="kim2154";

			   
			   //임시 내부서버 DB설정(가산)
//			   String url="jdbc:mysql://192.168.0.30:3306/mysql";
//			   String id="root";
//			   String pass="kim2154";
			   
			   //테스트 서버 DB정보 
//			   String url="jdbc:mysql://172.18.165.242:3306/ngsdb";
//			   String id="ngs";
//			   String pass="ngs123";
			   
			   //Local DB
			   String url="jdbc:mysql://localhost:3306/ngsdb";
			   String id="root";
			   String pass="ngs123";
			   
			   
			   connection=DriverManager.getConnection(url,id,pass);
		}catch(Exception e){e.printStackTrace();}	   	
	return connection;
	}
	
	
	/*
	protected Connection getConnection() throws Exception {
		
		
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   String    url    =    "jdbc:oracle:thin:@ 172.16.20.120:1521:orcl"; // DB 환경에 맞도록 고치면 됩니다.
		   String userid="kim";
		   String passwd="kim2154";
		   Statement stmt;
		   connection = DriverManager.getConnection(url,userid,passwd);
	return connection;
}
	*/
	
	
	
	
	public  Connection getConnection2() throws Exception {
		
		
		
    	System.out.println("Connection start...");
    	connection = ds.getConnection();
		
		return connection;
	}
	
	
	public void commit() throws Exception
    {
		if ( connection != null ) {
			connection.commit();
		}
    }

	public void endCommand() throws SQLException {

		if ( connection != null ) {
		System.out.println("---------Connection close-----------------");
			connection.close();
		}

		
	}

    public final String execute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {

        try {
			Log.debug("BaseCommand Pre_reqTray("+reqTray.get("cmd")+") : " + reqTray);
            doExecute(reqTray, request, response);
        } catch (AppException ex) {
        	Log.errorlog("BaseCommand.execute(): 최종적으로 exception catch. AppException = ", ex.getMessage());
            request.setAttribute("exception", ex);
        } catch (Throwable t) {
            request.setAttribute("exception", new AppException("Command에서 일반 예외 발생", t));
        } finally {
			
        	try{
        		endCommand();
        		
        	}catch(Exception ex){Log.errorlog("BaseCommand.execute(): 최종적으로 exception catch. exception = ", ex.getMessage());}
			if (request.getAttribute("reqTray") == null) {
        		request.setAttribute("reqTray", reqTray);
        	}
        }
        return getNextPage();
    }
    
    
    protected abstract void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response);
    
    protected void setNextPage(String nextPageObj) {
        nextPage = nextPageObj;
    }

    public String getNextPage() throws AppException {
       System.out.println("[get next page   ]  "+nextPage);
    	if (nextPage == null) {
    		System.out.println("get next page null");
    		// throw new AppException("하위 Command에서 next page를 지정하지 않았습니다.");
        }
        return "/" + nextPage;
    }
}