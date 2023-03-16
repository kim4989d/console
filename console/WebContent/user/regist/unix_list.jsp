<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray, console.common.util.Util" %>
<%@include file="/common/common.jsp" %>
<%
    ResultSetTray listTray  = null;
    int	rowCount = 0;					//게시물 전체 갯수

    
    if( request.getAttribute("rsTray") !=null){
		listTray = (ResultSetTray)request.getAttribute("rsTray");
		rowCount = listTray.getRowCount();
	}
    
    
    if( request.getAttribute("checkbox") !=null){
		listTray = (ResultSetTray)request.getAttribute("checkbox");
	}
    
    
%>
<%
  request.setCharacterEncoding("euc-kr");
%>

 <html> 
 <head> 
<script language="JavaScript" src="/calsample/Calendar.js"></script>
<script>

//새로고침 
function Refresh(){
	var frm=document.regfrm;
		frm.action="/usermain.do?cmd=unix_list";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
}


//유닉스용 작업 등록
function newWin(val)
{
	window.alert(val);
	
	
	var Pwidth=801;
	var Pheight=457;
	var url;
	
	locW = (screen.availWidth-Pwidth)/2;
	locH = (screen.availHeight-Pheight)/2;
	
	if (val > 0) 
		url = "www.naver.com";
	else 
		url="connection_req.php?c=C&f=U";
	
	if (winfo != null)     
		winfo.close();
		
	winfo = window.open(url,"jobWin","width="+Pwidth+",height="+Pheight+",top="+locH+",left="+locW+",toolbar=no,scrollbars=0, resizable=0, toolbar=0, menubar= 0,location=0, directories=0, status=0");
}

function newWinTest(){

	var Pwidth=801;
	var Pheight=457;
	var url;
	
	locW = (screen.availWidth-Pwidth)/2;
	locH = (screen.availHeight-Pheight)/2;

	window.open('','',"width="+Pwidth+",height="+Pheight+",top="+locH+",left="+locW+",toolbar=no,scrollbars=0, resizable=0, toolbar=0, menubar= 0,location=0, directories=0, status=0");
}


</script>
 </head>

 <body>
 <center><br><h2></h2><br>
 <form name="regfrm">
 <input type="hidden" name="kind" value="<%=kind%>">
 <input type="hidden" name="user_id" value="<%=user_id%>">
 <table border="1" align="center">
 
 <!-- 검색 기능 추가  -->
 <tr>
 	
 	<td>기간</td>
 	<td><input name="cal1" type="text" id="cal1" readonly="readonly"></td>
 	<td><input type="button" value="달력1" onClick="popUpCalendar(this,cal1,'yyyy/mm/dd');"></td>
 	<td><input name="cal2" type="text" id="cal2" readonly="readonly"></td>
 	<td><input type="button" value="달력2" onClick="popUpCalendar(this,cal2,'yyyy/mm/dd');"></td>
 	<td> </td>
 	
 </tr>
 
 
 <tr>
	 <td>작업자</td>
	 <td>작업 목적 </td>
	 <td>작업 기간</td>
	 <td>등록일 </td>
	 <td>승인담당자 </td>
	 <td>승인결과</td>
	 <td>상태</td>
 </tr>
 
 <%
 	if(rowCount == 0){	
 	%>
	    <tr><td colspan="7" align="center">등록된 작업이 없습니다</td></tr>
	<%
 	}
 	else{		
   		for(int i=0;i<rowCount;i++){	
   	%>
		<tr>
			<td><%=listTray.get("user_id")%></td>
			<td><%=listTray.get("intention")%></td>
			<td><%=Util.DataFormat_yyMMdd_hhmm( listTray.get("from_dt") ) %>
			  - <%=Util.DataFormat_yyMMdd_hhmm( listTray.get("to_dt") )%></td>
			<td><%=Util.DataFormat( listTray.get("reg_dt") )%></td>
			<td><%=listTray.get("name")%></td>
			<td><%=listTray.get("admin_result")%></td>
			<td><%=listTray.get("status")%></td>
	<%	}
    }%>
    <tr>
    <td>
	    <input type="button" value="갱신" 		onclick="Refresh()">
	    <input type="button" value="작업내역 등록" onclick="newWinTest()">
    </td>   
    </tr>
    
  </table>  
 </form>   
 </center> 
 </body>   
 
 </html>
    
    