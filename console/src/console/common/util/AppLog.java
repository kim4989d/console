/* =============================================================== 
 �� �ý���  ��   : Redfoxi.com
 �� ���α׷� ��  : ���� �α� 
 �� �� �� �� ��  : 2001.10. 11
 �� �� �� ��     : ��Ʈ�� 
 �� ���α׷� ����
		���α׷����� �߻��ϴ� ������ �α� ���Ͽ� �׵��� �Ѵ�.
		�Ǵ� ���α׷� ����뿡 �ʿ��� ����� �α׸� ���Ͽ� �״´�.
==================================================================*/

package console.common.util;


import java.io.*;
import java.io.IOException;
import java.text.*;
import java.util.*;

import javax.naming.*;

public class AppLog
{

	// Constructor
	public AppLog ( )
	{	}

	static String CLASS = "AppLog.java-";
	FileOutputStream FileStream; 

	String DebugFile = Settings.getInstance().get("DEBUG_LOG_FILE")+ Util.getDate()+".log";
	String ErrorLogFile = Settings.getInstance().get("ERROR_LOG_FILE")+ Util.getDate()+".log";
	String BatchLogFile = Settings.getInstance().get("BATCH_LOG_FILE")+ Util.getDate()+".log";
	String QUERY_LOG_FILE = Settings.getInstance().get("QUERY_LOG_FILE")+ Util.getDate()+".log";
	/* ===================================================================================================
	   ��  Method �� : QueryLog ( ���ϸ�, ����׸޼��� )
	   ��  Return Value ���� : ����
	   ��  �ֿ� ó�� ���� :
	           QUERY_LOG_FILE ��, �޼����� ����. BatchFile �� ������ �׳� �����Ѵ�.
	   ��  �ۼ��� : ��Ʈ��
	   ��  �ۼ��� : 2001. 10.  11
	 ===================================================================================================== */ 
		public void QueryLog(String Module, String Mesg)
		{
			if ( BatchLogFile.length() <= 0 )
				return;
			
			writeFile ( QUERY_LOG_FILE, "[" + Util.getTime() + "]-[BATCH] " +Module+ " " + Mesg );
		}

		public void QueryLog(String Mesg)
		{
			if ( BatchLogFile.length() <= 0 )
				return;
			
			writeFile ( QUERY_LOG_FILE, "[" + Util.getTime() + "]-[BATCH] " + Mesg );
		}


	
	
	
	
	
	
	
	
	
	
	
	
	
	/* ===================================================================================================
   ��  Method �� : BatchLog ( ���ϸ�, ����׸޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           BatchFile ��, �޼����� ����. BatchFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : ��Ʈ��
   ��  �ۼ��� : 2001. 10.  11
 ===================================================================================================== */ 
	public void BatchLog(String Module, String Mesg)
	{
		if ( BatchLogFile.length() <= 0 )
			return;
		
		writeFile ( BatchLogFile, "[" + Util.getTime() + "]-[BATCH] " +Module+ " " + Mesg );
	}

	public void BatchLog(String Mesg)
	{
		if ( BatchLogFile.length() <= 0 )
			return;
		
		writeFile ( BatchLogFile, "[" + Util.getTime() + "]-[BATCH] " + Mesg );
	}



/* ===================================================================================================
   ��  Method �� : DebugLog ( ���ϸ�, ����׸޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           DebugFile ��, �޼����� ����. DebugFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : ��Ʈ��
   ��  �ۼ��� : 2001. 10.  11
 =================================================================================================== */ 
	public void DebugLog(String Module, String Mesg)
	{
		if ( DebugFile.length() <= 0 )
			return;
		
		writeFile ( DebugFile, "[" + Util.getTime() + "]-[DEBUG] " +Module+ " " + Mesg );
	}

	public void debug(String Mesg)
	{
		System.out.println("debug :"+DebugFile);
		if ( DebugFile.length() <= 0 )
			return;
		
		writeFile ( DebugFile, "[" + Util.getTime() + "]-[DEBUG] " + Mesg );
	}

/* ===================================================================================================
   ��  Method �� : ErrorLog ( ���ϸ�, �����޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           ErrorLogFile ��, �޼����� ����. ErrorLogFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : ��Ʈ��
   ��  �ۼ��� : 2001. 10.  11
 ===================================================================================================== */ 
 
	public void errorlog(String Module, String Mesg)
	{
		
		System.out.println("ErrorLogFile :"+ErrorLogFile);
		if ( ErrorLogFile.length() <= 0 )
			return;
		
		System.out.println("ErrorLogFile null?:"+ErrorLogFile);
		writeFile ( ErrorLogFile , "[" + Util.getTime() + "]-[ERROR] " +Module+ " " + Mesg );
	}

	public void errorlog(String Mesg)
	{
		if ( ErrorLogFile.length() <= 0 )
			return;
		
		writeFile ( ErrorLogFile , "[" + Util.getTime() + "]-[ERROR] " + Mesg );
	}

/* ===================================================================================================
   ��  Method �� : writeFile ( ���ϸ�, �޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
		�Էµ� ���Ͽ� �޼����� �߰���Ų��. ���� �������ϴ� ������ ������ �����Ѵ�.
   ��  �ۼ��� : ��Ʈ��
   ��  �ۼ��� : 2001. 10.  11
 ===================================================================================================== */ 

	public synchronized void writeFile(String FilePath, String Message )
	{
		
	    System.out.println("writeFile(FilePath,Message)"+FilePath+","+Message);
		if ( FilePath == null || FilePath == "" )
			return;

		byte[] message = Message.getBytes();
 
		try
		{
			FileStream = new FileOutputStream(FilePath, true);
		}
		catch (FileNotFoundException FNFEx)
		{
			try
			{
				 FileStream = new FileOutputStream(FilePath);
			}
			catch ( Exception ex0 )
			{
				System.out.println(CLASS+"writeFile()"+"==>Catch Exception [" + ex0.toString() + "]");
				return;
			}
		}
		catch ( Exception ex )
		{
			System.out.println(CLASS+"writeFile()"+ "==>Catch Exception [" + ex.toString() + "]");
			return;
		}
  
		try
		{
			FileStream.write(message);
			FileStream.write('\n'); // ���Ŀ� ������ �޼����� �����ٿ� ���������� �Ѵ�.
			FileStream.close();
		}
		catch (Exception ex1)
		{
			System.out.println (CLASS+"writeFile()"+ "==>Exception [" + ex1.getMessage() + "]");
			return;
		}
	}

}
