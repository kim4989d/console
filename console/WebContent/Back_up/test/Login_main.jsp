<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>▒▒ VACCS (Vpn Access Control Certification System Project ▒▒</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #ebebeb;
}
-->
</style>
<link href="comm/css/default.css" rel="stylesheet" type="text/css">
<link href="comm/css/Form.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/javascript" src="comm/js/global.js"></script>
<script language="JavaScript">

	var ButtonImage = new Array();

			ButtonImage[0] = new Image() ;
			ButtonImage[0].src ="images/login/point_nosel.gif";
			ButtonImage[1] = new Image();
			ButtonImage[1].src ="images/login/point_sel.gif" ;
					
	function idRemember()
	{
		var Temp = document.Login.idsave.value;

			if (Temp == "0") 
			{
				
				document.images.id.src =  ButtonImage[1].src 
				document.Login.idsave.value = "1";
			}
			else
			{
				document.images.id.src =  ButtonImage[0].src 
				document.Login.idsave.value = "0";
			
			}
	}
	var newPoup;
	function newWin()
	{
		var val;
		var act;
		var url="comm/vista_info.html";
		
	var re = "toolbar=no, resizable=0,scrollbars=yes, status=0,location=no, resize=0, menubar=no, directories=no, copyhistory=0, width=590, height=800,top=2, left=20";
	 if (newPoup != null)     newPoup.close();
	newPoup=window.open(url, 'vist', re);
	}
</script>
</head>
<body>
<form name="Login" method="post" action="logon/login_ok.jsp">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" background="images/common/bg.jpg"><table width="747" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="414" align="right" valign="bottom" background="images/login/login_visual.jpg"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td height="20" align="right"><img src="images/login/point_nosel.gif" width="9" height="9" name="id" id="id" class="Cursor_Hand" onClick="idRemember()"><input type="hidden" name="idsave" value="0"></td>
              <td width="70" align="right"><img src="images/login/id_memori.gif" width="68" height="11" class="Cursor_Hand" onClick="idRemember()"></td>
              <td width="71" align="right"><a href="#"><img src="images/login/id_join.gif" width="58" height="11" onClick="goReg('comm/g_join.jsp');" class="cursor_hand" ></a></td>
                <td width="30" align="right"><input type="checkbox"  name="SSL_Login" value="1" ></td>
                <td width="60"><img src="images/login/secu.gif"></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="747" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="10"><img src="images/login/table_round01.gif" width="10" height="10"></td>
              <td width="727" background="images/login/table_round_line01.gif"></td>
              <td width="10"><img src="images/login/table_round02.gif" width="10" height="10"></td>
            </tr>
            <tr>
              <td background="images/login/table_round_line02.gif"></td>
              <td bgcolor="#FFFFFF"><table width="727" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="188"><img src="images/login/login.gif" width="188" height="55"></td>
                    <td><table width="534" border="0" cellpadding="0" cellspacing="0" bgcolor="dadada">
                        <tr>
                          <td width="5"><img src="images/login/table_gray_round01.gif" width="5" height="5"></td>
                          <td></td>
                          <td width="5"><img src="images/login/table_gray_round02.gif" width="5" height="5"></td>
                        </tr>
                        <tr>
                          <td height="45"></td>
                          <td>
						  <table width="524" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="26">&nbsp;</td>
                                <td width="22"><img src="images/login/id.gif" width="11" height="9"></td>
                                <td width="150"><input name="sid" type="text" class="InputLIneGrayLogin" size="20" onKeyDown="JavaScript:goEnter(document.Login.pwd)"  value=>
                                </td>
                                <td width="18">&nbsp;</td>
                                <td width="34"><img src="images/login/pass.gif" width="26" height="9"></td>
                                <td width="162"><input name="pwd" type="password" class="InputLIneGrayLogin" size="20" onKeyDown="JavaScript:goSubmit(document.Login)"></td>
                                <td><a href="#"><img src="images/login/btn_login.gif" width="80" height="26" border="0" class="cursor_hand" onclick="JavaScript:check(document.Login)" name="login" ></a></td>
                              </tr>
                          </table></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td><img src="images/login/table_gray_round03.gif" width="5" height="5"></td>
                          <td></td>
                          <td><img src="images/login/table_gray_round04.gif" width="5" height="5"></td>
                        </tr>
                    </table></td>
                    <td width="5">&nbsp;</td>
                  </tr>
              </table></td>
              <td background="images/login/table_round_line03.gif"></td>
            </tr>
            <tr>
              <td><img src="images/login/table_round03.gif" width="10" height="10"></td>
              <td background="images/login/table_round_line04.gif"></td>
              <td><img src="images/login/table_round04.gif" width="10" height="10"></td>
            </tr>
        </table></td>
      </tr>
  <tr>
	<td><table width="100" height="25" border="0" align="right" cellpadding="0" cellspacing="0">
		<tr>
		  <td><img src="images/vista/vista_user.gif" width="79" height="11" class="cursor_hand" onClick="newWin()";></td>
		</tr>
	  </table></td>
  </tr>
    </table>
      </td>
  </tr>
</table>
</form>
</body>
</html>
<script language="JavaScript">
	window.document.onload = document.Login.sid.focus();
</script>
	
	