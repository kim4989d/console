<%@ page language="java" contentType="text/html; charset=EUC-KR" %>    

<%
/*
	//Telnet mRemote 실행 부분 구현.
	Runtime rt = Runtime.getRuntime();	
	String mRemotePath = "C:/Program Files/mRemote/mRemote.exe";
	
	rt.exec(mRemotePath);
*/	
%>

<html>
<head>
<script type="text/javascript">

function test(){

window.open('telnet.jsp','name','windowStatusString');

}
</script>
</head>
<body>

<form name="frm">
<table>
	<tr>
		<td>
			<input type="button" value="Telnet" onclick="test()"><p>
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
</table>	
</form>

</body>
</html>