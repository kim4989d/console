<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="console.list.*,java.util.*"%>



<html>
<head>
<script>
function ok(){
document.go.target="_self";
document.go.submit();

}
</script>
</head>
<body>
<form action="/list.do" method="post" name="go">
<input type="hidden" name="cmd" value="list">
<input type="button" onClick="ok();">
</form>
</body>
</html>
