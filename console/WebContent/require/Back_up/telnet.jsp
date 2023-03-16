<%@page  contentType="text/html; charset=EUC_KR"%>
<%@ page import="application.CmdExecutor"%> 
<%
	
//Telnet mRemote 실행 부분 구현.
//	Runtime rt = Runtime.getRuntime();

	String mRemotePath = "C:/Program Files/VanDyke Software/SecureCRT/SecureCRT.exe";
	//rt.exec(mRemotePath);
CmdExecutor cmd=new CmdExecutor();
%>

 
 
 <html>
<head>
<script>

function ok(process){
document.telnetfrm;
alert(process);
document.location.href="process.jsp?process="+process;
}


</script>

</head>
<body>
<form name="telnetfrm">
<%
	String str="";
for(int i=0;i<6;i++){
%>
<input type="button" onclick="ok('<%=mRemotePath%>')" name="but<%=i %>" value="<%=i %>">

<%}
%>
<input type="hidden" name="one" value="1">

</form>
ddddd
</body>
</html>