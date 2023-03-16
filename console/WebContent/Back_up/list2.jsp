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
	System.out.println("start");
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
function onLoad(){

document.search.action="/list.do";
document.search.target="_self";
document.search.submit();

}
</script>
</head>
<body>
<form action="/list.do" name="search" method="post">

<input type="hidden" name="cmd" value="list">


<center><br>
<h2>JSPBoard</h2><br>
<table align=center border=0 width=80%>
 <tr>
  <td align=center>page</td>
 </tr>
</table>
<table align=center width="80%" border=0 cellspacing=0 cellpadding=3>
 <tr>
  <td align=center colspan=2 >
  <table border=0 width=100% cellpadding=2 cellspacing=0>
    <tr align=center bgcolor=#D0D0D0 height=120%>
     <td>번 호</td>
	 <td>제 목</td>
	 <td>이 름</td>
	 <td>날 짜</td>
	 <td>조회수</td>
    </tr>
     <tr> 
     <%
    for(int i=0;i<rowCount;i++){
	    if(rowCount==0){
	     
	     
	     %>
	    <td colspan='4'>검색된 테이블이없습니다</td>
	    
	    <%}else{ %>
  
	   
	    <td><a href="/read.do?cmd=read&num=<%=goods_list_Tray.get("num",i) %>"><%=goods_list_Tray.get("num",i) %></a></td>
	    <td><%=goods_list_Tray.get("subject",i) %></td>
	    <td><%=goods_list_Tray.get("name",i) %></td>
	    <td><%=goods_list_Tray.get("regdate",i) %></td>
	    <td><%=goods_list_Tray.get("count",i) %></td> 
	    </tr>
	    
	    <%
	    }
    }
    %>
    
    </tr>
    </table> 
    </td>
 </tr>
 <tr>
  <td><br><br></td>
 </tr>
 <tr>
  <td align="left" > Go to Page 
  </td> 
  <td align=right> 
   <a href="/Post2.jsp">[글쓰기]</a><a href="javascript:list()">[처음으로]</a> 
  </td>
 </tr>
</table><br>

<table border=0 width=527 align=center cellpadding=4 cellspacing=0 >
 <tr>
  <td align=center valign=bottom>
   <select name="keyField" size=1 >
    <option value="name"> 이 름
    <option value="subject"> 제 목
    <option value="content"> 내 용
   </select>
   <input type="text" size=16 name="keyWord"  value="koljjjkhhjkh">
   <input type="button"  value="찾기" onClick="check()">
   <input type="hidden" name="page" value="0">
  </td>
 </tr>
</table>
</form>

</body>
</html>