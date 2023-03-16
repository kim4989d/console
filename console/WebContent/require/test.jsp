<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray,console.common.util.CommonUtil,console.common.util.Util" %>
<%@include file="/common/common.jsp" %>

<%

	String message=CommonUtil.Isnull((String)request.getAttribute("test"));
%>


<html>
<head>

</head>

<body>
<form name="form" action="require.do?cmd=require_test">
	<table>
		<tr>
			<td>
				<input type="text" name="test">
				<input type="submit" > 				
			</td>
			<% if(message.equals("") ){
			  }else{%>
			  <td>
			  Message: <%=message %>		
			  </td>
			<%} %>
			
			
		</tr>
	</table>
</form>  
</body>
</html>
