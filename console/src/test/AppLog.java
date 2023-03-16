/* =============================================================== 
 �� �ý���  ��   : Redfoxi.com
 �� ���α׷� ��  : ���� �α� 
 �� �� �� �� ��  : 2001.10. 11
 �� �� �� ��     : ��Ʈ�� 
 �� ���α׷� ����
		���α׷����� �߻��ϴ� ������ �α� ���Ͽ� �׵��� �Ѵ�.
		�Ǵ� ���α׷� ����뿡 �ʿ��� ����� �α׸� ���Ͽ� �״´�.
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
   ��  Method �� : PuzzleLog ( ���ϸ�, ����׸޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           PuzzleLogFile ��, �޼����� ����. PuzzleLogFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : Redfoxi
   ��  �ۼ��� : 2003. 05.  15
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
   ��  Method �� : PuzzleLog ( ���ϸ�, ����׸޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           PuzzleLogFile ��, �޼����� ����. PuzzleLogFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : Redfoxi
   ��  �ۼ��� : 2003. 05.  15
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
   ��  Method �� : SevenLog ( ���ϸ�, ����׸޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           SevenFile ��, �޼����� ����. SevenFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : Redfoxi
   ��  �ۼ��� : 2002. 10.  31
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
   ��  Method �� : LgBuyLog ( ���ϸ�, ����׸޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           TodayFile ��, �޼����� ����. TodayFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : Redfoxi
   ��  �ۼ��� : 2003. 03. 04
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
   ��  Method �� : LgPayLog ( ���ϸ�, ����׸޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           TodayFile ��, �޼����� ����. TodayFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : Redfoxi
   ��  �ۼ��� : 2003. 03. 04
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
   ��  Method �� : TodayLog ( ���ϸ�, ����׸޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           TodayFile ��, �޼����� ����. TodayFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : Redfoxi
   ��  �ۼ��� : 2002. 06.  27
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
   ��  Method �� : ErrorLog ( ���ϸ�, �����޼��� )
   ��  Return Value ���� : ����
   ��  �ֿ� ó�� ���� :
           ErrorLogFile ��, �޼����� ����. ErrorLogFile �� ������ �׳� �����Ѵ�.
   ��  �ۼ��� : ��Ʈ��
   ��  �ۼ��� : 2001. 10.  11
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
