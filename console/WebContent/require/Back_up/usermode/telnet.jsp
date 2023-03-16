<%@page  contentType="text/html; charset=EUC_KR"%>
<%@ page import="application.CmdExecutor"%> 
<%
	
//Telnet mRemote 실행 부분 구현.
//	Runtime rt = Runtime.getRuntime();

	String mRemotePath = "C:/puttytel.exe";
	//rt.exec(mRemotePath);
	CmdExecutor cmd=new CmdExecutor();
%>

 
 
 <html>
<head>
<script>

function ok(process){

//document.frm;
//alert(process);
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