<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>▒▒▒▒ Neo Gate ▒▒▒▒</title>
</head>
<%

	System.out.println("frame start");
%>

<frameset rows="40, 535" cols="*" border="0">
  <frame src="/main/top.jsp"  name="top">
  <frameset rows="1*, 70" cols="*">
    <frameset rows="*" cols="200, 1*">
      <frame src="/main/left.jsp"  name="left" scrolling="auto">
      <frame src="/main/main.jsp"  scrolling="auto" name="showframe" >
    </frameset>
    <frame src="/main/bottom.jsp"  name="bottom" noresize="noresize">
  </frameset>
 
<noframes>
<body>
</body>
</noframes>
</frameset>
</html>
