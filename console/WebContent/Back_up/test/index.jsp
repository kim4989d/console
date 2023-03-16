<!-- Copyright (c) 2002 by ObjectLearn. All Rights Reserved. -->
<%@ page language="java" pageEncoding="EUC-KR" %>
<html>
	<head>
		<title>¢Æ¢Æ VACCS (Vpn Access Control Certification System Project ¢Æ¢Æ </title>
	</head>
	<body>
		<center>Welcome</center>
	</body>
</html>
<%
String check = null;
%>
<%if(check == "1"){%> <!-- admin -->
<jsp:forward page="/test/view/indexControl.jsp">
  <jsp:param name="CONTROL" value="admin1"/>
  <jsp:param name="PAGENUM" value="01"/>
  <jsp:param name="CHECK" value="1"/>
</jsp:forward>
<%}else{%><!-- user -->
<jsp:forward page="/test/view/indexControl.jsp">
  <jsp:param name="CONTROL" value="user1"/>
  <jsp:param name="PAGENUM" value="01"/>
  <jsp:param name="CHECK" value="2"/>
</jsp:forward>
<%}%>