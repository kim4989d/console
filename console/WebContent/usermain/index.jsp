<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Untitled Document</title>
</head>
<frameset rows="*,60" frameborder="no" border="0" framespacing="0">
  <frameset rows="37,*" cols="*" frameborder="no" border="0">
    <frame src="/usermain/top.jsp"  name="top" frameborder="No" scrolling="no" noresize="noresize" marginwidth="0" marginheight="0" id="top" title="top" />
    
    <frameset rows="*" cols="186,*" framespacing="0" frameborder="no" border="0">
      <frame src="/usermain/left.jsp"  name="left" frameborder="0" scrolling="no" noresize="noresize" marginwidth="0" marginheight="0" id="left" title="left" />
      <frame src="/usermain/main.jsp" name="showframe" frameborder="0"  scrolling="auto" marginwidth="0" marginheight="0" id="main" title="main" />
      </frameset>
    

  </frameset>
  <frame src="/usermain/bottom.jsp" name="bottom" frameborder="no" scrolling="no" noresize="noresize" marginwidth="0" marginheight="0" title="bottomFrame" />
</frameset>
</html>