<!-- 장비 리스트 출력전 빈 페이지 작업
 -->
<%@ page contentType = "text/html; charset=euc-kr" %>
<% 
	request.setCharacterEncoding("euc-kr"); 
%> 

<html>
<head>
<title>▒▒▒▒▒▒▒▒ VACCS ▒▒▒▒▒▒▒▒</title>
<link href="/ngs/comm/css/default.css" rel="stylesheet" type="text/css">
<link href="/ngs/comm/css/Form.css" rel="stylesheet" type="text/css">
</head>
<body>

<table  border="1" width="500" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"> 
      <td align="center"  width="100" >서비스 이름</td> 
      <td align="center"  width="100" >서비스 ID</td> 
      <td align="center"  width="100" >시스템 이름</td> 
      <td align="center"  width="100" >시스템 ID</td>
      <td align="center"  width="100" >장비담당자</td> 
      <td align="center"  width="100" >구분</td> 
    </tr>
	<tr height="30" >
	   <td align="center"  width="100"></td>
	   <td align="center"  width="100" ></td>
	   <td align="center"  width="100" ></td> 
	   <td align="center"  width="100"></td>
	   <td align="center" width="100" ></td>
	   <td align="center" width="100" ></td>
	</tr>
</table>
</body>