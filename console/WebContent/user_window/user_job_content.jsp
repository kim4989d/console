<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<!-- �˾�������  800 * 533-->
<title>�˾�_�����_Window�۾����_�۾����������Ȳ(NT)_�۾�����</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='../../../css/skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='../../../css/skt_Default.css' TYPE='TEXT/CSS'>
</head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	}
-->
</style>
<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="../../../images/pop_800bg_01.jpg" class="PopupTitleBgWhite"><img src="../../../images/pop_img01.gif" width="8" height="17" align="absmiddle" style="margin-left:10px; margin-right:10px">�۾�����</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td><table width="800" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5"></td>
        <td width="790" height="4" bgcolor="#9ab1cf"></td>
        <td width="5"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <colgroup>
	            <col width="20">
	            <col width="110">
	            <col width="*">
	            </colgroup>
			<tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">����</td>
            <td class="PopupBold"><input name="title" type="text" class="inputLIneGrayColor" value="test" size="110"></td>
			</tr>
			<tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">�۾�����</td>
            <td class="PopupBold"><input name="title" type="text" class="inputLIneGrayColor" value="test" size="110"></td>
          </tr>
			<tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">�۾������</td>
            <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><input name="uname" type="text" class="inputLIneGrayColor" size="20" value="������" maxlength="20" readonly></td>
                <td width="80"><B><FONT COLOR="396297">FTP ���</FONT></B></td>
                <td width="250"><input type="radio" name="ftp" value="1" >
                    <B><FONT COLOR="ff3116">���</FONT></B>
                    <input type="radio" name="ftp" value="0" checked>
                  �̻��</td>
              </tr>
            </table></td>
			</tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">�۾� �ð�</td>
            <td class="PopupLine"><input name="cal1" class="InputLIneGray" value="2006-05-19" size="10"><img src="../../../images/zoom.gif"style="margin-right:4px;margin-left:4px" align="absmiddle"  class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');"><input name="hh1" type="text" class="InputLIneGray" size="4" value="00" onKeyPress="onlyNumber()">
              
              �� <input name="mm1" type="text" class="InputLIneGray" size="4" value="00" onKeyPress="onlyNumber()"> �� ~ 
                  <input name="cal2" type="text" class="InputLIneGray" size="10" VALUE="2009/01/21"> 
                  <img src="../../../images/zoom.gif" align="absmiddle" class="Cursor_hand" onClick="popUpCalendar(this, cal2, 'yyyy/mm/dd');"> 
                  <input name="hh1" type="text" class="InputLIneGray" size="4" value="00" onKeyPress="onlyNumber()">
              
              �� <input name="mm1" type="text" class="InputLIneGray" size="4" value="00" onKeyPress="onlyNumber()"> ��</td>
          </tr>
		  <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">����</td>
            <td class="PopupBold"><textarea style="margin-top:5px; margin-bottom:5px" name="detail" cols="112" rows="5" class="inputLIneGrayColorTextarea" onKeyUp="length_check(4000,'detail');">�׽�Ʈ��</textarea></td>
          </tr>
         <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">�۾��ý���</td>
            <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="4"></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <colgroup>
                    <col width="130">
                    <col width="100">
                    <col width="130">
                    <col width="120">
                    <col width="120">
                    <col width="*">
                    </colgroup>
                    <tr class="TableBgBold">
                      <td height="34" class="TableBg">���� �̸�</td>
                      <td class="TableBg">���� ID </td>
                      <td class="TableBg">�ý��� �̸�</td>
                      <td class="TableBg">�ý��� ID</td>
                      <td class="TableBg">�������</td>
                      <td class="TableBg">����</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><div style="height:130; overflow-y:scroll;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <colgroup>
                      <col width="130">
                      <col width="100">
                      <col width="130">
                      <col width="120">
                      <col width="120">
                      <col width="*">
                      </colgroup>
                      <tr>
                        <td class="TableBgText">test_svr</td>
                        <td class="TableBgText">test_svr</td>
                        <td class="TableBgText">TEST</td>
                        <td class="TableBgText">53w5</td>
                        <td class="TableBgText">������</td>
                        <td class="TableBgText"><a href="#"><img src="../../../images/btn_delete.gif" border="0" align="absmiddle" style="margin-left:13px"></a></td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                        <td class="TableBgText">&nbsp;</td>
                      </tr>
                    </table>
                </div></td>
              </tr>
              <tr>
                <td height="5"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupLine"><strong>÷������</strong></td>
            <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="300" height="18">&nbsp;</td>
                <td width="100" align="center"><strong>�۾����</strong></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupLine"><strong>����÷��</strong></td>
            <td class="PopupBold"><input name="Filename" type="file" class="inputLIneGrayColor" size="66"><a href="#"><img src="../../../images/btn_delete.gif" border="0" align="absmiddle" style="margin-left:5px"></a></td>
          </tr>
          
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td></td>
        <td height="40" align="right"><a href="#"><img src="../../../images/btn_close.gif" width="42" height="22"></a></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
