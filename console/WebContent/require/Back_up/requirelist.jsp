<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray" %>
<%@page import="console.common.tray.Tray" %>

<%
    int           rowCount         = 0;
    Tray          reqTray       = null;
	ResultSetTray goods_list_Tray  = null;
	String        goods_code       = null;
	String        goods_name       = null;
	String 		  checkbox="";
	
	
	//reqTray = (ResultSetTray)request.getAttribute("rsTray");
	System.out.println("start");
	checkbox = (String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
	goods_list_Tray = (ResultSetTray)request.getAttribute("rsTray");
	
	rowCount = goods_list_Tray.getRowCount();
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
 <form name="listfrm">
 
 <table border="1">
 <%
    for(int i=0;i<rowCount;i++){
	    out.print("<tr>");
    	if(rowCount==0){
	     
	     
	     %>
	    <td colspan='4'>검색된 테이블이없습니다</td>
	    
	    <%}else{ %>
  
	   
	    <td><%=goods_list_Tray.get("user_id",i) %></td>
	    <td><%=goods_list_Tray.get("name",i) %></td>
	   
	    </tr>
	    
	    <%
	    }
    }
    %>
    <tr>
    
    </tr>
    <tr>
   <%=checkbox%>
   
    
    
    </tr>
  </table>  
    
    
 </form>   
 </body>   
 </html>
    