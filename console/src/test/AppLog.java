/* =============================================================== 
 ◎ 시스템  명   : Redfoxi.com
 ◎ 프로그램 명  : 에러 로그 
 ◎ 작 성 일 자  : 2001.10. 11
 ◎ 작 성 자     : 네트빌 
 ◎ 프로그램 개요
		프로그램에서 발생하는 에러를 로그 파일에 쌓도록 한다.
		또는 프로그램 디버깅에 필요한 디버그 로그를 파일에 쌓는다.
==================================================================*/

package test;


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

	String DebugFile = Settings.getInstance().get("test")+ Util.getDate()+".log";
	String ErrorLogFile = Settings.getInstance().get("ERROR_LOG_FILE")+ Util.getDate()+".log";
	String BatchLogFile = Settings.getInstance().get("BATCH_LOG_FILE")+ Util.getDate()+".log";
	String TodayLogFile = Settings.getInstance().get("TODAY_LOG_FILE")+ Util.getDate()+".log";//2002.06.27
//	String SKEventLogFile = Settings.getInstance().get("SKEvent_LOG_FILE")+ Util.getDate()+".log";//2002.07.30
	String SevenLogFile = Settings.getInstance().get("SEVEN_LOG_FILE")+ Util.getDate()+".log";//2002.10.31
	String LgBuyLogFile = Settings.getInstance().get("LGBUY_LOG_FILE")+ Util.getDate()+".log";//2003.03.04
	String LgPayLogFile = Settings.getInstance().get("LGPAY_LOG_FILE")+ Util.getDate()+".log";//2003.03.04
	String PuzzleLogFile = Settings.getInstance().get("PUZZLE_LOG_FILE")+ Util.getDate()+".log";//2003.05.15
	String LottoBuyLogFile = Settings.getInstance().get("LOTTOBUY_LOG_FILE")+ Util.getDate()+".log";//2006.04.18

/* ===================================================================================================
   ◎  Method 명 : PuzzleLog ( 파일명, 디버그메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           PuzzleLogFile 에, 메세지를 쓴다. PuzzleLogFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : Redfoxi
   ◎  작성일 : 2003. 05.  15
 ===================================================================================================== */ 
	public void LottoBuyLog(String Module, String Mesg)
	{
		if ( LottoBuyLogFile.length() <= 0 )
			return;
		
		writeFile ( LottoBuyLogFile, "[" + Util.getTime() + "]-[LOTTOBUY] " +Module+ " " + Mesg );
	}

	public void LottoBuyLog(String Mesg)
	{
		if ( LottoBuyLogFile.length() <= 0 )
			return;
		
		writeFile ( LottoBuyLogFile, "[" + Util.getTime() + "]-[LOTTOBUY] " + Mesg );
	}

/* ===================================================================================================
   ◎  Method 명 : PuzzleLog ( 파일명, 디버그메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           PuzzleLogFile 에, 메세지를 쓴다. PuzzleLogFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : Redfoxi
   ◎  작성일 : 2003. 05.  15
 ===================================================================================================== */ 
	public void PuzzleLog(String Module, String Mesg)
	{
		if ( PuzzleLogFile.length() <= 0 )
			return;
		
		writeFile ( PuzzleLogFile, "[" + Util.getTime() + "]-[PUZZLE] " +Module+ " " + Mesg );
	}

	public void PuzzleLog(String Mesg)
	{
		if ( PuzzleLogFile.length() <= 0 )
			return;
		
		writeFile ( PuzzleLogFile, "[" + Util.getTime() + "]-[PUZZLE] " + Mesg );
	}

/* ===================================================================================================
   ◎  Method 명 : SevenLog ( 파일명, 디버그메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           SevenFile 에, 메세지를 쓴다. SevenFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : Redfoxi
   ◎  작성일 : 2002. 10.  31
 ===================================================================================================== */ 
	public void SevenLog(String Module, String Mesg)
	{
		if ( SevenLogFile.length() <= 0 )
			return;
		
		writeFile ( SevenLogFile, "[" + Util.getTime() + "]-[SEVEN] " +Module+ " " + Mesg );
	}

	public void SevenLog(String Mesg)
	{
		if ( SevenLogFile.length() <= 0 )
			return;
		
		writeFile ( SevenLogFile, "[" + Util.getTime() + "]-[SEVEN] " + Mesg );
	}

/* ===================================================================================================
   ◎  Method 명 : LgBuyLog ( 파일명, 디버그메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           TodayFile 에, 메세지를 쓴다. TodayFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : Redfoxi
   ◎  작성일 : 2003. 03. 04
 ===================================================================================================== */ 
	public void LgBuyLog(String Module, String Mesg)
	{
		if ( LgBuyLogFile.length() <= 0 )
			return;
		
		writeFile ( LgBuyLogFile, "[" + Util.getTime("yyyyMMddHHmmssSSS") + "]-[LGBuy] " +Module+ " " + Mesg );
	}

	public void LgBuyLog(String Mesg)
	{
		if ( LgBuyLogFile.length() <= 0 )
			return;
		
		writeFile ( LgBuyLogFile, "[" + Util.getTime("yyyyMMddHHmmssSSS") + "]-[LGBuy] " + Mesg );
	}

/* ===================================================================================================
   ◎  Method 명 : LgPayLog ( 파일명, 디버그메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           TodayFile 에, 메세지를 쓴다. TodayFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : Redfoxi
   ◎  작성일 : 2003. 03. 04
 ===================================================================================================== */ 
	public void LgPayLog(String Module, String Mesg)
	{
		if ( LgPayLogFile.length() <= 0 )
			return;
		
		writeFile ( LgPayLogFile, "[" + Util.getTime("yyyyMMdd/HHmmssSSS") + "]-[LGPay] " +Module+ " " + Mesg );
	}

	public void LgPayLog(String Mesg)
	{
		if ( LgPayLogFile.length() <= 0 )
			return;
		
		writeFile ( LgPayLogFile, "[" + Util.getTime("yyyyMMdd/HHmmssSSS") + "]-[LGPay] " + Mesg );
	}

/* ===================================================================================================
   ◎  Method 명 : TodayLog ( 파일명, 디버그메세지 )
   ◎  Return Value 설명 : 없음
   ◎  주요 처리 사항 :
           TodayFile 에, 메세지를 쓴다. TodayFile 이 없으면 그냥 리턴한다.
   ◎  작성자 : Redfoxi
   ◎  작성일 : 2002. 06.  27
 ===================================================================================================== */ 
	public void TodayLog(String Module, String Mesg)
	{
		if ( TodayLogFile.length() <= 0 )
			return;
		
		writeFile ( TodayLogFile, "[" + Util.getTime() + "]-[TODAY] " +Module+ " " + Mesg );
	}

	public void TodayLog(String Mesg)
	{
		if ( TodayLogFile.length() <= 0 )
			return;
		
		writeFile ( TodayLogFile, "[" + Util.getTime() + "]-[TODAY] " + Mesg );
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
 ===================================================================================================== */ 
	public void DebugLog(String Module, String Mesg)
	{
		if ( DebugFile.length() <= 0 )
			return;
		
		writeFile ( DebugFile, "[" + Util.getTime() + "]-[DEBUG] " +Module+ " " + Mesg );
	}

	public void DebugLog(String Mesg)
	{
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
 
	public void ErrorLog(String Module, String Mesg)
	{
		
		System.out.println("ErrorLogFile :"+ErrorLogFile);
		if ( ErrorLogFile.length() <= 0 )
			return;
		
		System.out.println("ErrorLogFile null?:"+ErrorLogFile);
		writeFile ( ErrorLogFile , "[" + Util.getTime() + "]-[ERROR] " +Module+ " " + Mesg );
	}

	public void ErrorLog(String Mesg)
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
