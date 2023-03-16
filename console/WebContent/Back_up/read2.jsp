<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="console.list.*,java.util.*"%>
<%@page import="console.common.tray.ResultSetTray" %>
<%@page import="console.common.tray.Tray" %>
<%
    int           rowCount         = 0;
    Tray          reqTray       = null;
	ResultSetTray goods_list_Tray  = null;
	String        goods_code       = null;
	String        goods_name       = null;
	
	//reqTray = (ResultSetTray)request.getAttribute("rsTray");
	goods_list_Tray = (ResultSetTray)request.getAttribute("rsTray");
	rowCount = goods_list_Tray.getRowCount();
%>

<%
  request.setCharacterEncoding("euc-kr");
%>

<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function list(){
	document.list.action="/list.do?cmd=list";
 	document.list.submit();
 } 
</script>
</head>
<body>
<form  method="post" name="list">
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	   
	
	
	 <td align=center bgcolor=#dddddd width=10%> 이 름 </td>
	 <td bgcolor=#ffffe8><%=goods_list_Tray.getString("name") %></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><%=goods_list_Tray.getString("regdate") %></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 ><a href="mailto:<%=goods_list_Tray.getString("regdate") %>"><%=goods_list_Tray.getString("regdate") %></a></td> 
	 <td align=center bgcolor=#dddddd width=10%> 홈페이지 </td>
	 <td bgcolor=#ffffe8 ><a href="http://<%=goods_list_Tray.getString("regdate") %>" target="_new">http://<%=goods_list_Tray.getString("regdate") %></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><%=goods_list_Tray.getString("regdate") %> </td>
   </tr>
   <tr> 
    <td colspan=4><br><br></td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     로 부터 글을 남기셨습니다./  조회수
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:list()" >목 록</a> | 
  </td>
 </tr>
</table>
</form>
</body>
</html>