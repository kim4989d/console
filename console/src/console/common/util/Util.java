/* =============================================================== 
 ◎ 시스템  명   : Redfoxi.com
 ◎ 프로그램 명  : 각종 Utility.
 ◎ 작 성 일 자  : 2001.10. 11
 ◎ 작 성 자     : 네트빌 
 ◎ 프로그램 개요
		공통 library.
==================================================================*/

package console.common.util;


import java.io.*;
import java.text.*;
import java.util.*;

import javax.naming.*;
import java.util.StringTokenizer;


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
	◎  Method 명 : getConfig ( 변수명 )
	◎  Return Value 설명 : String - 변수값 
	◎  주요 처리 사항 :
		Classpath redfoxi/common/RedfoxiConfig.properties 안에서
		변수명에 해당하는 변수값을 읽어 리턴한다.
	◎  작성자 : 네트빌
	◎  작성일 : 2001. 10.  10
	 ================================================================= */ 
/*   ============ 꼭 필요한 경우는 협의후 사용 ===========================
	public static String getConfig ( String Name )
	{
		return ResourceBundle.getBundle("redfoxi.common.RedfoxiConfig").getString(Name);
	}
*/
	/* ===============================================================
	◎  Method 명 : StringtoInt ( 부호없는 숫자문자열 )
	◎  Return Value 설명 : int - 변환된 숫자 
	◎  주요 처리 사항 :
		부호없는 숫자문자열을 int 로 변환시킨다.
	◎  작성자 : 네트빌
	◎  작성일 : 2001. 10.  10
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
	◎  Method 명 : getTime ( format )
	◎  Return Value 설명 : String - 현재시각 
	◎  주요 처리 사항 :
		현재 시간을 시간 format에 맞게 리턴한다..
	◎  작성자 : 네트빌
	◎  작성일 : 2001. 10.  10
	◎  참고사항 : 년월일시분초1/1000초 얻는 format :  yyyyMMddHHmmssSS 
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

	// 현재 시간 년월일시분초 까지.
	public static String getTime()
	{
		return getTime("yyyyMMddHHmmss");
	}
	// 현재 년월일 을 얻는다.
	public static String getDate ()
	{
		return getTime("yyyyMMdd");
	}

	/* ===============================================================
	◎  Method 명 : isNullString ( 문자열 )
	◎  Return Value 설명 : true - 문자열이 NULL 이거나, ""(빈문자열) 이다. 
										false - 그렇지 않고 내용이 있다.
	◎  주요 처리 사항 :
		단순하게, 빈문자열, NULL 을 체크한다.

	◎  작성자 : 네트빌
	◎  작성일 : 2001. 10.  10
	 ================================================================= */ 

	public static boolean isNullString ( String str )
	{
		if ( str == null || "".equals(str) || "null".equals(str) )
			return true;
		else
			return false;
	}

	/* ===============================================================
	◎  Method 명 : NulltoEmptyString ( 문자열 )
	◎  Return Value 설명 : 만약 NULL 이거나, "null" 이면 빈 문자열을 
	                                    그렇지 않으면 입력된 문자열을 리턴한다. 
	◎  주요 처리 사항 :
		단순하게, 빈문자열이나, 문자열이 "null"인 문자열을 빈 문자열로 만들어 준다.

	◎  작성자 : 네트빌
	◎  작성일 : 2001. 10.  10
	 ================================================================= */ 

	public static String NulltoEmptyString ( String str )
	{
		if (str == null || "null".equals(str) )
			return "" ;
		else
			return str;
	}

	/* ===============================================================
	◎  Method 명 : Exec ( 시스템 명령어 )
	◎  Return Value 설명 : String - 시스템 명령 실행 결과 문자열 
	◎  주요 처리 사항 :
		시스템 명령어를 실행하고, 그 결과를 리턴하도록 한다.
		※ 자바로 가능한 것들은 프로그램으로 처리하고 -
		    예를 들면 file handling -,
		    자바로 처리하기가 힘든 것들만 사용하도록 하고,
			가급적이면 사용을 자제한다.
	◎  작성자 : 네트빌
	◎  작성일 : 2001. 10.  10
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

	
//페이지로 전달하는 데이터  한글 처리	
	public static String toEucKr(String str) throws Exception
	{
	
		String str2=new String( str.getBytes("8859_1"), "euc-kr" ); 		
		return  str2;
	}		

	
	
	
	/* ===============================================================
	◎  Method 명 : toKorean ( 문자열 )
	◎  Return Value 설명 : String - 한글로 변환된 문자열 
	◎  주요 처리 사항 :
		단지 문자셋을 변환한다. 8859_1 ==> KSC5601.
	◎  작성자 : 네트빌
	◎  작성일 : 2001. 10.  11
	 ================================================================= */ 

	
	
	
	public static String toKorean(String str) throws Exception
	{
		if ( isNullString(str) )
			return str;

		return  new String( str.getBytes("8859_1"), "KSC5601" ); 
	}		
	/* ===============================================================
	◎  Method 명 : toUnKorean ( 문자열 )
	◎  Return Value 설명 : String - 8859_1 문자셋으로 변환된 문자열
	◎  주요 처리 사항 :
		문자셋을 변환한다. KSC5601 ==> 8859_1.
	◎  작성자 : 네트빌
	◎  작성일 : 2001. 10.  11
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



	public static String DataFormat(String inputvalue){
		inputvalue = inputvalue.replaceAll("'","''");
		inputvalue = inputvalue.replaceAll("<","&lt;");
		inputvalue = inputvalue.replaceAll("&","&amp;");
		inputvalue = inputvalue.replaceAll("-","/");
		
		//int choice= inputvalue.indexOf(" ");
		//inputvalue=inputvalue.substring(0,choice);
		return inputvalue;
	}





	/**
	 * 
	 * 기능: 	yy-MM-dd hh:mm:ss.0 형태의 String형 날짜 형식에 대하여 
	 * 				yy/MM/dd  String 형으로 변환 하는 기능
	 * return: 		String
	 * 
	 */
	public static String DataFormat_yyMMdd(String inputvalue){
		inputvalue=inputvalue.replaceAll("-","/");
		int choice= inputvalue.indexOf(" ");
		inputvalue=inputvalue.substring(0,choice);
		return inputvalue;
		
	}
	
	/**
	 * 
	 * 기능: 	문자열 반환 하기 
	 * 				
	 * 
	 * 
	 */
	public static String substring(String str_find, int i, int j)
	{
		String str = substring(str_find, i, j);
		return str;
	}

	public static int length(String str_find)
	{
		int xx = 0;
		xx = str_find.length();
		return xx;
	}
	
	
	
	/**
	 * 기능: 	    yy-MM-dd hh:mm:ss.0 형태의 String 형 날짜 형식에 대하여
	 * 				yy/MM/dd hh:mm String 형으로 변환하는 기능 
	 * return : 	String 
	 * Parameter: 	변경하고자 하는  String형 데이터형태의 values
	 * 작성자: 		이충섭
	 * 작성일: 		09/02/02
	 */
	public static String DataFormat_yyMMdd_hhmm(String inputvalue){
		
		inputvalue = inputvalue.substring(2);
		inputvalue=inputvalue.replaceAll("-","/");		
		
		int choice =  inputvalue.indexOf(":");
		inputvalue =  inputvalue.substring(0,choice+3);		
		
		return inputvalue;
		
	}
	
	/**
	 * 기능: 	    10자리의 랜덤 숫자 
	 * return : 	String 
	 * Parameter: 	
	 * 작성자: 		김명진 
	 * 작성일: 		09/02/02
	 */
	
	public static String RandomNumber()
	{
		Random oRandom = new Random();
		int[] ran	=	new int[9];
	   	
		int nan = 0;
		String nansu = "";
		// 1~10까지의 정수를 랜덤하게 출력
	    for(int i=0; i<10; i++)
	    {
	    int ii = oRandom.nextInt(10);
	    //out.println(ii);
	    
	    ran[i] = ii;
	    ran[i] += nan;
	    nansu += ran[i];
	    }
	   return nansu;
	}
	
	
}
