<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.util.*" %>
<%@ page import= "java.util.Random"%>
<%@ page import= "console.common.util.Util"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<%
	//<%=Util.RandomNumber()
	String fax1 	=	"";
	String fax2		=	"";
	String fax3		=	"";
	
	String company_tel = "123-333-4443";
	StringTokenizer sdf = new StringTokenizer(company_tel,"-");
//String[] fax = company_tel.split("-");
	fax1 = sdf.nextToken();
	fax2 = sdf.nextToken();
	fax3 = sdf.nextToken();
	
	out.println(fax1+"##");
	out.println(fax2+"##");
	out.println(fax3+"##");

//	out.println(Util.RandomNumber());

//    Random oRandom = new Random();
//	int[] ran	=	new int[10];
   	
//	int nan = 0;
//	String nansu = "";
	// 1~10까지의 정수를 랜덤하게 출력
 //   for(int i=0; i<10; i++)
  //  {
 //   int ii = oRandom.nextInt(10);
 //   out.println(ii);
    
  //  ran[i] = ii;
  //  ran[i] += nan;
  //  nansu += ran[i];
  //  }
	
	//out.println("========");
	//out.println(ran[0]);
	//out.println(ran[1]);
	//out.println(ran[2]);
	//out.println(nan);
	//out.println("========");
	//out.println(nansu);
	
	

    
    

    // 0.0f 에서 1.0f 까지의 실수를 랜덤하게 출력
    // 3.7670135E-5 라는 값이 나올 수도 있는데 이것은
    // 0.000037670135 입니다.
 //   float f = oRandom.nextFloat();
 //   System.out.println(f);

    // true(참), false(거짓) 중의 하나를 랜덤하게 출력
 //   Boolean b = oRandom.nextBoolean();
  //  System.out.println(b);
 // }
//}


//	String str = "123.123.123.123"; 
//	int ee = 0;
//	String[] addr = new String[10];
//	StringTokenizer tokens = new StringTokenizer( str, "." ); 
//	for( int x = 1; tokens.hasMoreElements(); x++ ){ 
//	addr[x] = 	tokens.nextToken();
//	out.println( "문자" + x + " = " +addr[x] ); 
//	ee = +x;
	//out.println(ee);
//	}
//	String ip_addr = server_list_tray.get("ostype");
//				String[] temp_svc_id = service_id.split(",");
//				
//				for(int i=0; i<temp_svc_id.length; i++){
//				System.out.println( "문자" + (i) + " = " +temp_svc_id[i] ); 
				
//	String ip_addr = "123,123,123,123";
//	String[] ip = ip_addr.split(",");
//	for(int i=0; i<ip.length; i++)
//	{
//		out.println(i+"번 == "+ip[i]+"\n");
//	}


//	String sa = "2009-10-2 10:04:00";
//	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
//	sa = sdf.format(new java.util.Date()); 
//	out.println("today = "+sa); 

//	String str="123456789";
	
//	out.println(str.substring(1,3));
//	out.println(str.substring(3,6));
//	out.println(str.substring(6,9));
//	out.println(str.sub));
	
	
	
//	out.println("========");
//	out.println(str.length()); 

	

%>
</body>
</html>