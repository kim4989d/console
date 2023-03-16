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
   <td align="center">서비스명</td>
   <td align="center">시스템ID</td>
   <td align="center">HOST ID</td>
   <td align="center">시스템 이름</td>
   <td align="center">IP 주소</td>
   <td align="center">담당자</td>
   <td align="center">포트 </td>
   <td align="center">제조사 </td>
   <td align="center">기종</td>
   <td align="center">상면위치</td>
   <td align="center">분전반번호</td>
   <td align="center">등록일</td>
   <td align="center">수정일</td>
  </tr>

<%

for(int i=0; i<rowCount; i++){
	if(rowCount==0){
	     %>
	    <td colspan='4'>검색된 테이블이없습니다</td>
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

