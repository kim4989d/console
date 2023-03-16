<%@ page contentType="text/html; charset=euc-kr"%>
<%@include file="/common/common.jsp" %>

<html>
<head>
<title>작업신청 반려</title>
</head>
<body>

<form name="form">
	<table>
		<tr>
			<td>작업금지 이유를 입력 하세요</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="intention">
			</td>
		<tr>
			<td>	
				<input type="button" value="확인">
				<input type="button" value="닫기" onclick="window.close();">
			</td>
		</tr>
	</table>
</form>

</body>
</html>