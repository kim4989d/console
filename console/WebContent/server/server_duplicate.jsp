
<!--
===============================================================
					���� ��� �ߺ� üũ ������ 
===============================================================
-->

<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�ߺ� ���̵� Ȯ�� </title>
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
	String val = request.getParameter("PARA");		// ����� ����� �ٽ� �ҷ��� 
	String value = request.getParameter("i");		// ���̵� äũ�� 
%>
</script>
</head>
<form name="listfrm">
<body>
<table width="499" height="37" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td>�ý��� ���</td>
  </tr>
</table>

<table width="499" border="0" cellspacing="0" cellpadding="0">
  <tr>
        <td height="50"><div align="center"><strong>
        <%if(value.equals("1")){%>
        	�̵̹�ϵ� ��� ID �Դϴ�.
        <%}else{%>
        	���� ����ڸ���<BR> �ý����� �߰� �Ҽ� �ֽ��ϴ�. 
        <%}%></strong></div></td>
  </tr>
  <tr> 
    <td height="50"><div align="center"><input type="button" value="Ȯ��" onClick="javascript:Reback();"></div></td>
  </tr>
</table>
</form>
</body>
</html>
