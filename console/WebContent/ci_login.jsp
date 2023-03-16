<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray,console.common.util.Util,console.common.session.ConSessionManager" %>
<%@include file="/common/common.jsp" %>

<%
	
	ConSessionManager.InitSession(request);	//모든 세션 초기화

	String loginRes = (String)request.getAttribute("loginRes");
	String usr_id   = (String)request.getAttribute("user_id");
	String message  = "";
	
	if (usr_id == null) usr_id = "";
	
	if ( loginRes == null ) {
	} else if ( loginRes.equals("0") ) {
		message = "미등록 사용자 아이디(사원번호)입니다.";
	} else if ( loginRes.equals("5") ) {
		message = "비밀번호가 틀렸습니다.";
	} else {
	    usr_id = "";
		message = "로그아웃 되었습니다.";
	}
%>
<html>
<head>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<title>sk_login</title>
<style type="text/css">
<!--
.style1 {
	font-family: "돋움";
	font-size: 12px;
}
-->
</style>
<script type="text/javascript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
function goReg(url) 
{
	var opt = "toolbar=no, resizable=no,scrollbars=auto, location=no, status=yes,resize=no, menubar=no, directories=no, copyhistory=0, width=1000, height=530, top=100, left=50";
	window.open(url, 'reg', opt);	
}


function closeSelfAfterLogin() {
	if (confirm("윈도우를 종료하려고 합니다.")) {
		if (self.parent.opener == null || self.parent.opener == 'undefined') {
			self.parent.opener = self;
		} 
		self.parent.close();
	}
}



function login() {
	with (document.loginfrm) {
			method="post";
			action="/login.do";
			cmd.value = "login";
			method.target="_self";
			submit();
		
	}
}

function loginout(){

	with (document.loginfrm) {
			method="post";
			action="/login.do";
			cmd.value = "login";
			logout.value="logout";
			method.target="_self";
			submit();
	}
}

</script>
</head>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	}
.style5 {color: #ff3116}
-->
</style>
<body onLoad="MM_preloadImages('<%=DIR_IMG%>btn_login_1.gif','<%=DIR_IMG%>id_memori_1.gif')">
<form name="loginfrm">
<input type="hidden" name="cmd" value="login">
<table width="1280" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="145"></td>
  </tr>
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="400"></td>
        <td width="250"><img src="<%=DIR_IMG%>logo_sk.jpg" width="249" height="71"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="31" bgcolor="#615f5f"><img src="<%=DIR_IMG%>bg_1280.gif" width="1280" height="31"></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="600" align="right"><img src="<%=DIR_IMG%>img_mouse.gif" /></td>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="46"></td>
          </tr>
          <tr>
            <td style="padding-left:17px"><table width="267" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="<%=DIR_IMG%>round_line01.gif" width="4" height="85" /></td>
                <td width="259" height="85" align="center" background="<%=DIR_IMG%>round_line02.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><table width="189" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="15">&nbsp;</td>
                          <td><img src="<%=DIR_IMG%>id.gif" width="13" height="10" align="absmiddle" style="padding-left:13px; padding-right:25px"></td>
                          <td style="padding-left:10px"><input name="user_id" type="text" class="InputLIneGrayLogin"  value="" size="18" /></td>
                        </tr>
                        <tr>
                          <td height="5"></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><img src="<%=DIR_IMG%>pass.gif" width="24" height="12" align="absmiddle" style="padding-left:13px; padding-right:13px" /></td>
                          <td style="padding-left:10px"><input name="passwd" type="password" class="InputLIneGrayLogin" size="18"   value="" /></td>
                        </tr>
                    </table></td>
                    <td width="70"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('btn_login','','<%=DIR_IMG%>btn_login_1.gif',1)" onclick="login();"><img src="<%=DIR_IMG%>btn_login.gif" name="btn_login" width="59" height="56" border="0"></a></td>
                  </tr>
                </table></td>
                <td><img src="<%=DIR_IMG%>round_line03.gif" width="4" height="85" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td style="padding-left:17px"><table width="267" border="0" cellspacing="0" cellpadding="0">
                   <colgroup>
                  <col width="*">
                  <col width="100">
                  </colgroup>
              <tr>
                <td height="14" colspan="2"></td>
                </tr>
              <tr>
                <td align="right"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('id_memori','','<%=DIR_IMG%>id_memori_1.gif',1)"><img src="<%=DIR_IMG%>id_memori.gif" name="id_memori" border="0"></a></td>
                <td align="right"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('id_join','','<%=DIR_IMG%>id_join_1.gif',0)"><img src="<%=DIR_IMG%>id_join.gif" name="id_join" border="0" onClick="goReg('/consolejoin.do?cmd=console_join');"></a></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
