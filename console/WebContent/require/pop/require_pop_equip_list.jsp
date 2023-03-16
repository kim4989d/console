<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray, console.common.util.CommonUtil" %>
<%@include file="/common/common.jsp" %>


<%
	ResultSetTray listTray  = null;
	int	rowCount = 0;					

	if( request.getAttribute("rsTray") !=null){
		listTray = (ResultSetTray)request.getAttribute("rsTray");
		rowCount = listTray.getRowCount();
	}
%>

<html>
<head>
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href='<%=DIR_CSS%>skt_Form.css' rel="stylesheet" type="text/css">
<link href='<%=DIR_CSS%>skt_Default.css' rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<script language="JavaScript">
function InnerHtmPrsList(SVC_ID,SVC_NAME,SYS_ID,SYS_NAME,OPER,HOST_ID)
{
	if (!InnerHtmPrsList_Dpli(SYS_ID))
	{
		return false; 
	}


	var idx = mytable1.rows.length;
    var formatdate = "yyyy-mm-dd";	
	var locidx ="0";
	var LastIdx     = mytable1.rows.length;
	var selfIdx     = mytable1.clickedRowIndex;
	if(LastIdx < 1 ) locidx ="N";
	else locidx = (LastIdx );
     var form = document.frmLst;  


  
	lm_oRow = mytable1.insertRow(idx);
	lm_oRow.onmouseover = function(){mytable1.clickedRowIndex=this.rowIndex};
	lm_oRow.height="26";
   
   
	lm_oCell1 = lm_oRow.insertCell();
	lm_oCell2 = lm_oRow.insertCell();
	lm_oCell3 = lm_oRow.insertCell();
	lm_oCell4 = lm_oRow.insertCell();
	lm_oCell5 = lm_oRow.insertCell();
	lm_oCell6 = lm_oRow.insertCell();

   	lm_oCell1.width="130";
	lm_oCell2.width="100";
    lm_oCell3.width="130";
    lm_oCell4.width="100";
    lm_oCell5.width="90";
    lm_oCell6.width="";

	lm_oCell1.align="center";
	lm_oCell2.align="center";
	lm_oCell3.align="center";
	lm_oCell4.align="center";
	lm_oCell5.align="center";
	lm_oCell6.align="center";


	lm_oCell1.style.cssText='BORDER-BOTTOM:1PX SOLID #CCCCCC; FONT-SIZE: 8.5pt; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-BOTTOM: 2px;';
	lm_oCell2.style.cssText='BORDER-BOTTOM:1PX SOLID #CCCCCC; FONT-SIZE: 8.5pt; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-BOTTOM: 2px;';
	lm_oCell3.style.cssText='BORDER-BOTTOM:1PX SOLID #CCCCCC; FONT-SIZE: 8.5pt; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-BOTTOM: 2px;';
	lm_oCell4.style.cssText='BORDER-BOTTOM:1PX SOLID #CCCCCC; FONT-SIZE: 8.5pt; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-BOTTOM: 2px;';
	lm_oCell5.style.cssText='BORDER-BOTTOM:1PX SOLID #CCCCCC; FONT-SIZE: 8.5pt; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-BOTTOM: 2px;';
	lm_oCell6.style.cssText='BORDER-BOTTOM:1PX SOLID #CCCCCC; FONT-SIZE: 8.5pt; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-BOTTOM: 2px;';


	lm_oCell1co ="<tr><td><input type='hidden' name='SVC_ID' value='"+SVC_ID+"'><input type='hidden' name='SVC_NAME' value='"+SVC_NAME+"'>"+SVC_NAME+"</td>";
	lm_oCell2co ="<td><input type='hidden' name='SYS_ID' value='"+SYS_ID+"'><input type='hidden' name='SYS_NAME' value='"+SYS_NAME+"'>"+SVC_ID+"</td>";
	lm_oCell3co ="<td>"+SYS_NAME+"</td>";
	lm_oCell4co ="<td> "+HOST_ID+"</td>";
	lm_oCell5co ="<td>"+OPER+"</td>";
    lm_oCell6co ="<td><img src='<%=DIR_IMG%>btn_del.gif' width='26' height='17' class='cursor_Hand' onclick='javascript:jsdelPrsRow();'></td></tr>";


	
    lm_oCell1.innerHTML=lm_oCell1co;
    lm_oCell2.innerHTML=lm_oCell2co;
	lm_oCell3.innerHTML=lm_oCell3co;
	lm_oCell4.innerHTML=lm_oCell4co;
	lm_oCell5.innerHTML=lm_oCell5co;
	lm_oCell6.innerHTML=lm_oCell6co;
    //jsSearch(locidx);   
	return true;
}



function jsdelPrsRow() {
 	var idx     = mytable1.rows.length;     //테이블 행갯수
	var form    = document.frmLst;  

 	mytable1.deleteRow(mytable1.clickedRowIndex);
}
function InnerHtmPrsList_Dpli(sys_id)
{
	var idx = mytable1.rows.length;

	if ( idx == 1)
	{
			var temp = frmLst.SYS_ID.value; 
			if ( sys_id == temp) return false
	}
	else if(idx >1)
	{
		for(var i = 0; i < idx; i++)
		{
			var temp = frmLst.SYS_ID[i].value; 
			if ( sys_id == temp) return false
		}
	
	}
			return true;
}
</script>
</head>

<body background="<%=DIR_IMG %>table_bg.jpg">
<form name="frmLst"  id="frmLst" >
  <table width="610" border="0" cellpadding="0" cellspacing="0"  id="mytable1" style="TABLE-LAYOUT:fixed;" >
<% 
		if( !listTray.get("sys_id").equals("") || listTray.get("cert_key").equals("")  ||  !listTray.get("job_no").equals("")){
			for(int i = 0; i < rowCount; i++){
%>
			<tr align="center" onMouseOver='mytable1.clickedRowIndex=this.rowIndex'> 
			<td width="130" height="27" class="TableBgText">
			
			<input type="hidden" name="SVC_ID" value="<%= listTray.get("service_id",i) %>">
			<input type="hidden" name="SVC_NAME" value="<%= listTray.get("servic_name",i) %>"> 
			<input type="hidden" name="SYS_ID" value="<%= listTray.get("system_id",i) %>">
			<input type="hidden" name="SYS_NAME" value="<%= listTray.get("service_name",i) %>"> 
			<input type="hidden" name="OEPR" ><%= listTray.get("service_name",i) %>		</td>

			<td width="100" class="TableBgText"><%= listTray.get("service_id",i) %>		</td>
			<td width="130" class="TableBgText"><%= listTray.get("service_name",i) %>	</td>
			<td width="100" class="TableBgText"><%= listTray.get("system_id",i) %>		</td>
			<td width="90"  class="TableBgText"><%= listTray.get("name",i) %>			</td>

			<td class="TableBgText"><div align="center"><img src="<%=DIR_IMG %>btn_delete.gif" width="26" height="17"  class="Cursor_Hand" onclick='javascript:jsdelPrsRow();'></div></td>
			</tr>
	<% 
		}
 	}%>
  </table>
</form>
</body>
</html>
