/* =============================================================== 
 �� �ý���  ��   : Redfoxi.com
 �� ���α׷� ��  : ���� Utility.
 �� �� �� �� ��  : 2001.10. 11
 �� �� �� ��     : ��Ʈ�� 
 �� ���α׷� ����
		���� library.
==================================================================*/

package test;


import java.io.*;
import java.io.IOException;
import java.text.*;
import java.util.*;

import javax.naming.*;



public class Util
{

	// Constructor
	public Util ( )
	{	}

	AppLog log = new AppLog ( );

	static String CLASS = "Util.java-";
	String ModuleName = "";

	FileOutputStream FileStream; 


	/* ===============================================================
	��  Method �� : getConfig ( ������ )
	��  Return Value ���� : String - ������ 
	��  �ֿ� ó�� ���� :
		Classpath redfoxi/common/RedfoxiConfig.properties �ȿ���
		������ �ش��ϴ� �������� �о� �����Ѵ�.
	��  �ۼ��� : ��Ʈ��
	��  �ۼ��� : 2001. 10.  10
	 ================================================================= */ 
/*   ============ �� �ʿ��� ���� ������ ��� ===========================
	public static String getConfig ( String Name )
	{
		return ResourceBundle.getBundle("redfoxi.common.RedfoxiConfig").getString(Name);
	}
*/
	/* ===============================================================
	��  Method �� : StringtoInt ( ��ȣ���� ���ڹ��ڿ� )
	��  Return Value ���� : int - ��ȯ�� ���� 
	��  �ֿ� ó�� ���� :
		��ȣ���� ���ڹ��ڿ��� int �� ��ȯ��Ų��.
	��  �ۼ��� : ��Ʈ��
	��  �ۼ��� : 2001. 10.  10
	 ================================================================= */ 

	public static int StringtoInt ( String str )
	{
		if ( str == null )
			return -1;
		else
		{
			str = str.trim();
			return Integer.valueOf(str).intValue();
		}
	}
  
/*************************** Time Format **************************

 Symbol	Meaning					  Presentation		  Example
 ------	-------					  ------------		  -------
 G		  era designator			 (Text)				  AD
 y		  year						  (Number)				1996
 M		  month in year			  (Text & Number)	  July & 07
 d		  day in month				(Number)				10
 h		  hour in am/pm (1~12)	 (Number)				12
 H		  hour in day (0~23)		(Number)				0
 m		  minute in hour			 (Number)				30
 s		  second in minute		  (Number)				55
 S		  millisecond				 (Number)				978
 E		  day in week				 (Text)				  Tuesday
 D		  day in year				 (Number)				189
 F		  day of week in month	 (Number)				2 (2nd Wed in July)
 w		  week in year				(Number)				27
 W		  week in month			  (Number)				2
 a		  am/pm marker				(Text)				  PM
 k		  hour in day (1~24)		(Number)				24
 K		  hour in am/pm (0~11)	 (Number)				0
 z		  time zone					(Text)				  Pacific Standard Time
 '		  escape for text			(Delimiter)
 ''		 single quote				(Literal)			  '

*/

	/* ===============================================================
	��  Method �� : getTime ( format )
	��  Return Value ���� : String - ����ð� 
	��  �ֿ� ó�� ���� :
		���� �ð��� �ð� format�� �°� �����Ѵ�..
	��  �ۼ��� : ��Ʈ��
	��  �ۼ��� : 2001. 10.  10
	��  ������� : ����Ͻú���1/1000�� ��� format :  yyyyMMddHHmmssSS 
	 ================================================================= */ 
//	Locale koLocale = new Locale("en", "KR");
//	TimeZone tz = TimeZone.getDefault();

	public static String getTime(String format)
	{
		if ( format == "" )
		{
		  return getTime ("yyyyMMddHHmmss");
		}

		TimeZone tz = TimeZone.getDefault();
		tz.setRawOffset((60*60*1000) * 9);
		TimeZone.setDefault(tz);
		Calendar cal = Calendar.getInstance(tz);
		Date date = cal.getTime();
		SimpleDateFormat formater = new SimpleDateFormat(format);
		String timestamp = formater.format(date);
 
		return timestamp;
	}

	// ���� �ð� ����Ͻú��� ����.
	public static String getTime()
	{
		return getTime("yyyyMMddHHmmss");
	}
	// ���� ����� �� ��´�.
	public static String getDate ()
	{
		return getTime("yyyyMMdd");
	}

	/* ===============================================================
	��  Method �� : isNullString ( ���ڿ� )
	��  Return Value ���� : true - ���ڿ��� NULL �̰ų�, ""(���ڿ�) �̴�. 
										false - �׷��� �ʰ� ������ �ִ�.
	��  �ֿ� ó�� ���� :
		�ܼ��ϰ�, ���ڿ�, NULL �� üũ�Ѵ�.

	��  �ۼ��� : ��Ʈ��
	��  �ۼ��� : 2001. 10.  10
	 ================================================================= */ 

	public static boolean isNullString ( String str )
	{
		if ( str == null || "".equals(str) || "null".equals(str) )
			return true;
		else
			return false;
	}

	/* ===============================================================
	��  Method �� : NulltoEmptyString ( ���ڿ� )
	��  Return Value ���� : ���� NULL �̰ų�, "null" �̸� �� ���ڿ��� 
	                                    �׷��� ������ �Էµ� ���ڿ��� �����Ѵ�. 
	��  �ֿ� ó�� ���� :
		�ܼ��ϰ�, ���ڿ��̳�, ���ڿ��� "null"�� ���ڿ��� �� ���ڿ��� ����� �ش�.

	��  �ۼ��� : ��Ʈ��
	��  �ۼ��� : 2001. 10.  10
	 ================================================================= */ 

	public static String NulltoEmptyString ( String str )
	{
		if (str == null || "null".equals(str) )
			return "" ;
		else
			return str;
	}

	/* ===============================================================
	��  Method �� : Exec ( �ý��� ��ɾ� )
	��  Return Value ���� : String - �ý��� ��� ���� ��� ���ڿ� 
	��  �ֿ� ó�� ���� :
		�ý��� ��ɾ �����ϰ�, �� ����� �����ϵ��� �Ѵ�.
		�� �ڹٷ� ������ �͵��� ���α׷����� ó���ϰ� -
		    ���� ��� file handling -,
		    �ڹٷ� ó���ϱⰡ ���� �͵鸸 ����ϵ��� �ϰ�,
			�������̸� ����� �����Ѵ�.
	��  �ۼ��� : ��Ʈ��
	��  �ۼ��� : 2001. 10.  10
	 ================================================================= */ 
	public static String Exec ( String Command )
	{
		if ( isNullString(Command) )
			return "";

		String OutputString = "";
		try 
		
		{
			Process p  = Runtime.getRuntime().exec(Command);
			InputStreamReader reader = new InputStreamReader (p.getInputStream ());
			BufferedReader commandResult = new BufferedReader (reader);
			try 
			{
				int i = 0;
				String tmp = new String ();
				while ((tmp = commandResult.readLine()) != null)
				{
					OutputString += tmp + "\n";
				}
				commandResult.close();
			}
			catch (Exception e)
			{
				return "Raise Exception - 1 :["+ e.getMessage()+"]";
			}
		}
		catch (Exception e) 
		{
			return "Raise Exception - 2 :[" + e.getMessage() + "]";
		} 		
		return OutputString;
	}

	
	/* ===============================================================
	��  Method �� : toKorean ( ���ڿ� )
	��  Return Value ���� : String - �ѱ۷� ��ȯ�� ���ڿ� 
	��  �ֿ� ó�� ���� :
		���� ���ڼ��� ��ȯ�Ѵ�. 8859_1 ==> KSC5601.
	��  �ۼ��� : ��Ʈ��
	��  �ۼ��� : 2001. 10.  11
	 ================================================================= */ 

	public static String toKorean(String str) throws Exception
	{
		if ( isNullString(str) )
			return str;

		return  new String( str.getBytes("8859_1"), "KSC5601" ); 
	}		
	/* ===============================================================
	��  Method �� : toUnKorean ( ���ڿ� )
	��  Return Value ���� : String - 8859_1 ���ڼ����� ��ȯ�� ���ڿ�
	��  �ֿ� ó�� ���� :
		���ڼ��� ��ȯ�Ѵ�. KSC5601 ==> 8859_1.
	��  �ۼ��� : ��Ʈ��
	��  �ۼ��� : 2001. 10.  11
	 ================================================================= */ 

	public static String toUnKorean(String str) throws Exception
	{
		if ( isNullString(str) )
			return str;

		return new String( str.getBytes("KSC5601"), "8859_1" );
	}



	public static boolean isThereChar ( String Src, char Chr )
	{
		if ( isNullString(Src) )
			return false;

		for ( int i=0; i < Src.length(); ++i)
		{
			if ( Src.charAt(i) == Chr )
				return true;
		}
		return false;
	}


	public static String ReplaceText (String OrgStr, String Source, String Target )
	{
		String ModuleName = "ReplaceText()";

		if ( isNullString(OrgStr) || isNullString(Source) )
			return "";

		String tmp = "";

		for ( int i = 0; i < (OrgStr.length()); ++i )
		{
			if ( OrgStr.startsWith(Source, i ) == true )
			{
				i += Source.length()-1;
				tmp += Target;
			}
			else
			{
				tmp += OrgStr.charAt(i) + "";
			}

		} // end of 'for' loop

		return tmp;
	}



}
