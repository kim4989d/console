<%@page  contentType="text/html; charset=EUC_KR"%>
<%@ page import="application.CmdExecutor"%> 
<%
	
	String mRemotePath = "C:/puttytel.exe";
%>

 
 
 <html>
<head>
<script>

function ok(process){
document.location.href="process.jsp?process="+process;

}


</script>

</head>
<body>
<form name="telnetfrm">

<input type="button" value="TelnetConnecter" onclick="ok('<%=mRemotePath%>')" >

</form>
</body>
</html>