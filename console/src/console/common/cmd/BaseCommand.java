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
			   
			   //�˼���(������) DB 
//			   String url="jdbc:mysql://210.112.162.220:3306/mysql";
//			   String id="root";
//			   String pass="kim2154";

			   
			   //�ӽ� ���μ��� DB����(����)
//			   String url="jdbc:mysql://192.168.0.30:3306/mysql";
//			   String id="root";
//			   String pass="kim2154";
			   
			   //�׽�Ʈ ���� DB���� 
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
		   String    url    =    "jdbc:oracle:thin:@ 172.16.20.120:1521:orcl"; // DB ȯ�濡 �µ��� ��ġ�� �˴ϴ�.
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
        	Log.errorlog("BaseCommand.execute(): ���������� exception catch. AppException = ", ex.getMessage());
            request.setAttribute("exception", ex);
        } catch (Throwable t) {
            request.setAttribute("exception", new AppException("Command���� �Ϲ� ���� �߻�", t));
        } finally {
			
        	try{
        		endCommand();
        		
        	}catch(Exception ex){Log.errorlog("BaseCommand.execute(): ���������� exception catch. exception = ", ex.getMessage());}
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
    		// throw new AppException("���� Command���� next page�� �������� �ʾҽ��ϴ�.");
        }
        return "/" + nextPage;
    }
}