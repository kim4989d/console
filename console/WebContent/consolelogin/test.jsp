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
	String str = "�б�,��,ȸ��,���ӹ�"; 
	int ee = 0;
	StringTokenizer tokens = new StringTokenizer( str, "," ); 
	for( int x = 1; tokens.hasMoreElements(); x++ ){ 
	out.println( "����" + x + " = " + tokens.nextToken() ); 
	ee = +x;
	out.println(ee);
	}

%>
</body>
</html>