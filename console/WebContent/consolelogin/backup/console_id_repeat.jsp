<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="console.common.tray.ResultSetTray" %>
<% 

    int           rowCount          = 0;  //	���̵� �ߺ� Ȯ�� 
    
    ResultSetTray IdRepeat_list_tray   = null;  // 


    //String	checkbox="";
    //checkbox	=	(String)request.getAttribute("checkbox");
	String uid = (String)request.getAttribute("uid");
	
	if(request.getAttribute("rsTray") !=null){
		IdRepeat_list_tray = (ResultSetTray)request.getAttribute("rsTray");  //���̵� �ߺ� Ȯ��  
		rowCount = IdRepeat_list_tray.getRowCount();	
	}
%>
<html>
<% 
	//$uid=$_REQUEST["id"];

%>
<html>
<head>
<title>[���̵� �ߺ�Ȯ��]</title>
<LINK REL='STYLESHEET' HREF='../common/css/skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='../common/css/skt_Default.css' TYPE='TEXT/CSS'>
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
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script language="JavaScript">
function searchid()
{
	var temp=document.form.uid.value
	if (temp=="")
	{
		alert("���̵� �Է��ϼ���");
		document.form.uid.focus();
		return;
	}
	if (temp.length<4)
	{
		alert("���̵�� �ѱ� ���� \n���� 4�ڸ� �̻��Դϴ�.");
		document.form.uid.focus();
		return;

	}
	form.submit();
	return;
}

</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="340" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="37" class="PopupTitleBgWhite"><img src="../images/common/spacer.gif" width="10" height="3">ID 
      �ߺ� üũ</td>
  </tr>
</table>
<% 
	if(rowCount != 0) {

%>	
<table width="340" border="0" cellpadding="0" cellspacing="1" bgcolor="#8f8f8f">
  <tr bgcolor="#FFFFFF"> 
    <td align="center" valign="top" class="pad_pop_15">
	 <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td> 
		  <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
                <td height="20"><img src="img/icon/ic_arrow01.gif" width="6" height="7"> 
                  <strong><%=uid%></strong>�� ��� �� �� �����ϴ�.</td>
              </tr>
              <tr> 
                <td width="10">&nbsp;</td>
                <td> (8�� �̻��� ���� �ҹ��ڳ� ���ڷ� �����մϴ�. )</td>
              </tr>
            </table>
			</td>
        </tr>
      </table>
<form name="form" action="consolejoin.do?cmd=console_id_repeat" method="post" class="FORM">
      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#e8e8e8">
        <tr class="pad_left_05"> 
          <td width="97" height="30" class="PopupBold">���̵�</td>
          <td class="PopupLine"> <table border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td>
                	<input name="uid" type="text" class="inputLIneGrayColor" value="" size="18" maxlength="16"></td>
                
                
                </td>
                <td width="20">&nbsp;</td>
                <td><img src="images/board/btn_ok.gif" alt="�˻�" width="39" height="27" class="Cursor_Hand" onClick="searchid();"></td>
                <td width="5">&nbsp;</td>
                <td><img src="images/common/btn_close.gif" alt="�ݱ�" width="39" height="27" class="Cursor_Hand" onClick="javascript:window.close();"></td>
              </tr>
            </table></td>
        </tr>
      </table>
</form>	  
<script language="JavaScript">
	window.document.onload = document.form.id.focus();
</script>
<%}else{%>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr bgcolor="#e8e8e8"> 
          <td height="10"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="26" bgcolor="#e8e8e8">
        <tr bgcolor="#e8e8e8"> 
          <td height="50"><div align="center"><strong>- ��밡���� ���̵�</strong> 
              �Դϴ�. - </div></td>
          <td width="47"><img src="images/board/btn_ok.gif" width="39" height="27" class="Cursor_Hand" onClick="javascript:top.opener.form.id_check.value=1;top.opener.form.uid.value='<%=uid%>';top.opener.form.pwd1.select();window.close();"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr bgcolor="#e8e8e8"> 
          <td height="10"></td>
        </tr>
      </table>
<%}%>	  
	  </td>
  </tr>
</table>
</body>
</html>