
<!--
===============================================================
					서비스 등록 중복 체크 페이지 
===============================================================
-->

<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>중복 아이디 확인 </title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
}
-->
</style>

<script language="JavaScript">
 function Reback(){
 	var frm = document.listfrm;
 		frm.action="/server.do?cmd=server_req";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
 }
<%
	String val = request.getParameter("PARA");		// 등록한 목록을 다시 불러옴 
	String value = request.getParameter("i");		// 아이디 채크값 
%>
</script>
</head>
<form name="listfrm">
<body>
<table width="499" height="37" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td>시스템 등록</td>
  </tr>
</table>

<table width="499" border="0" cellspacing="0" cellpadding="0">
  <tr>
        <td height="50"><div align="center"><strong>
        <%if(value.equals("1")){%>
        	이미등록된 장비 ID 입니다.
        <%}else{%>
        	서비스 담당자만이<BR> 시스템을 추가 할수 있습니다. 
        <%}%></strong></div></td>
  </tr>
  <tr> 
    <td height="50"><div align="center"><input type="button" value="확인" onClick="javascript:Reback();"></div></td>
  </tr>
</table>
</form>
</body>
</html>
