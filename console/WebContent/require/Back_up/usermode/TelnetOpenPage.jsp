<%@ page language="java" contentType="text/html; charset=EUC-KR" %>    

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