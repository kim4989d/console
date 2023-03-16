/* =============================================================== 
 ◎ 시스템  명   : Redfoxi.com
 ◎ 프로그램 명  : 에러 로그 
 ◎ 작 성 일 자  : 2001.10. 11
 ◎ 작 성 자     : 네트빌 
 ◎ 프로그램 개요
		프로그램에서 발생하는 에러를 로그 파일에 쌓도록 한다.
		또는 프로그램 디버깅에 필요한 디버그 로그를 파일에 쌓는다.
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
	   ◎  Method 명 : QueryLog ( 파일명, 디버그메세지 )
	   ◎  Return Value 설명 : 없음
	   ◎  주요 처리 사항 :
	           QUERY_LOG_FILE 에, 메세지를 쓴다. BatchFile 이 없으면 그냥 리턴한다.
	   ◎  작성자 : 네트빌
	   ◎  작성일 : 2001. 10.  11
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
   ◎  Method 명 : BatchLog ( 파일명, 디버그메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           BatchFile 에, 메세지를 쓴다. BatchFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : 네트빌
   ◎  작성일 : 2001. 10.  11
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
   ◎  Method 명 : DebugLog ( 파일명, 디버그메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           DebugFile 에, 메세지를 쓴다. DebugFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : 네트빌
   ◎  작성일 : 2001. 10.  11
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
   ◎  Method 명 : ErrorLog ( 파일명, 에러메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           ErrorLogFile 에, 메세지를 쓴다. ErrorLogFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : 네트빌
   ◎  작성일 : 2001. 10.  11
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
   ◎  Method 명 : writeFile ( 파일명, 메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
		입력된 파일에 메세지를 추가시킨다. 만약 쓸려고하는 파일이 없으면 리턴한다.
   ◎  작성자 : 네트빌
   ◎  작성일 : 2001. 10.  11
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
			FileStream.write('\n'); // 이후에 쓰려는 메세지는 다음줄에 씌어지도록 한다.
			FileStream.close();
		}
		catch (Exception ex1)
		{
			System.out.println (CLASS+"writeFile()"+ "==>Exception [" + ex1.getMessage() + "]");
			return;
		}
	}

}
