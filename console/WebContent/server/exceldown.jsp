<%@ page contentType="application/vnd.ms-excel;charset=euc-kr" language="java"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ include file="/common/common.jsp"%>

<%
    int           rowCount         = 0;
//	Tray          reqTray       = null;

    ResultSetTray Server_ExcelList = 	null;
    String	checkbox			   =	"";
	checkbox					   =	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray2") != null){
		Server_ExcelList = (ResultSetTray)request.getAttribute("rsTray2");
		rowCount 	     = Server_ExcelList.getRowCount();
	}
%>

<html>
<head>
 <meta http-equiv="Content-Type" content="application/vnd.ms-excel;charset=euc-kr">
 <title> EXCEL DATA</title>
</head>

<body>
   <table border="1" cellspacing="1" cellpadding="0">
  <tr>
   <td align="center">���񽺸�</td>
   <td align="center">�ý���ID</td>
   <td align="center">HOST ID</td>
   <td align="center">�ý��� �̸�</td>
   <td align="center">IP �ּ�</td>
   <td align="center">�����</td>
   <td align="center">��Ʈ </td>
   <td align="center">������ </td>
   <td align="center">����</td>
   <td align="center">�����ġ</td>
   <td align="center">�����ݹ�ȣ</td>
   <td align="center">�����</td>
   <td align="center">������</td>
  </tr>

<%

for(int i=0; i<rowCount; i++){
	if(rowCount==0){
	     %>
	    <td colspan='4'>�˻��� ���̺��̾����ϴ�</td>
	    <%}else{ %>
<tr>

<td><%=Server_ExcelList.get("service_name",i)%></td>
<td><%=Server_ExcelList.get("system_id",i)%></td>
<td><%=Server_ExcelList.get("host_id",i)%></td>
<td><%=Server_ExcelList.get("system_name",i)%></td>
<td><%=Server_ExcelList.get("system_ip",i)%></td>
<td><%=Server_ExcelList.get("charger_id",i)%></td>
<td><%=Server_ExcelList.get("port",i)%></td>
<td><%=Server_ExcelList.get("vendor_id",i)%></td>
<td><%=Server_ExcelList.get("kom",i)%></td>
<td><%=Server_ExcelList.get("sang_pos",i)%></td>
<td><%=Server_ExcelList.get("bun_no",i)%></td>
<td><%=Server_ExcelList.get("reg_dt",i)%></td>
<td><%=Server_ExcelList.get("updt_dt",i)%></td>

</tr>
<%

}
}
%>

</table>

</body>

</html>

