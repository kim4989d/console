<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="console.common.tray.ResultSetTray" %>

<%
    int           rowCount         = 0;
//	Tray          reqTray       = null;

    ResultSetTray require_list_tray  = null;
	
    String 		  checkbox="";
	
	checkbox = (String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
	require_list_tray = (ResultSetTray)request.getAttribute("rsTray");
	
	rowCount = require_list_tray.getRowCount();
	}
%>

<%
  request.setCharacterEncoding("utf-8");
%>

 <html> 
 <head> 
 <script>
 function List(){
 	var frm=document.listfrm;
 		frm.action="/require.do?cmd=require_list";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
 }
 
 </script>
 
 </head>
 
 <body>
 <center><br><h2>신청현황 게시판</h2><br>
 <form name="listfrm">
 
 <table border="1">

 <tr>
 <td>
 사용자  아이디
 </td>
  <td>
 사용자 이름
 </td>
 
 <td>
 <%
    for(int i=0;i<rowCount;i++){
	    out.print("<tr>");
    	if(rowCount==0){
	     %>
	    <td colspan='4'>검색된 테이블이없습니다</td>
	    <%}else{ %>
	    <!-- require_List -->   
	    <td><%=require_list_tray.get("user_id",i)%></td>
	    <td><%=require_list_tray.get("name",i) %></td>
	    </tr>
	    <%
	    }
    }
    %>
 </td>
    </tr>
    <tr>
   <%=checkbox%>
    </tr>
  </table>  
   
    
 </form>   
 </center>
 </body>   
 </html>
    