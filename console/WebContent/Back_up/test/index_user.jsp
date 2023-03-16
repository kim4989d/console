<!-- Copyright (c) 2008 by ObjectLearn. All Rights Reserved. -->
<%@ page language="java" pageEncoding="EUC-KR" %>
<html>
	<head>
		<title>¢Æ¢Æ VACCS (Vpn Access Control Certification System Project ¢Æ¢Æ</title>
	</head>
	<body>
		<center>Welcome</center>
	</body>
</html>
<jsp:forward page="/view/indexControl(user).jsp">
  <jsp:param name="CONTROL" value="user1"/>
  <jsp:param name="PAGENUM" value="01"/>
</jsp:forward>