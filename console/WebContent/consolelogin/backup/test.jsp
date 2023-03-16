<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
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

String str="123456789";
	
	out.println(str.substring(1,3));
	out.println(str.substring(3,6));
	out.println(str.substring(6,9));
	out.println(str.substring(1,3));
	
	out.println("========");
	out.println(str.length()); 

	

%>
</body>
</html>