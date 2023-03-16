<%@ page contentType="text/html; charset=euc-kr"%>
<%@include file="/common/common.jsp" %> 

<html>
<head>
<title></title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
	<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->

function inputlist(){

window.alert("Unix 작업 현황");

}


</script>
</head>

<body onLoad="MM_preloadImages('<%=DIR_IMG %>menu_02_1.gif','<%=DIR_IMG %>menu_03_1.gif','<%=DIR_IMG %>menu_04_1.gif','<%=DIR_IMG %>menu_05_1.gif','<%=DIR_IMG %>menu_06_1.gif','<%=DIR_IMG %>menu_07_1.gif','<%=DIR_IMG %>menu_01_1.gif')">
<table width="186" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="<%=DIR_IMG %>logo_sk2.jpg" width="186" height="97"></td>
  </tr>
  <tr>
    <td height="436" valign="top" background="<%=DIR_IMG %>menu_bg01.jpg" style="padding-top:20px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="11"></td>
        <td><a href="/require.do?cmd=require_unix_list&kind=<%=kind%>"   target="showframe" 	onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=DIR_IMG %>menu_01_1.gif',1)"><img src="<%=DIR_IMG %>menu_01.gif" name="Image1" border="0"></a></td>
        <td width="11"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="/work.do?cmd=work_list&kind=<%=kind%>"  			  target="showframe" 	onMouseOut="MM_swapImgRestore()"	onMouseOver="MM_swapImage('Image2','','<%=DIR_IMG %>menu_02_1.gif',1)"><img src="<%=DIR_IMG %>menu_02.gif" name="Image2" border="0"></a></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="/service.do?cmd=service_admin_list&kind=<%=kind%>"  target="showframe" 	onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=DIR_IMG %>menu_03_1.gif',1)"><img src="<%=DIR_IMG %>menu_03.gif" name="Image3" border="0"></a></td>
        
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="/server.do?cmd=server_list&kind=<%=kind%>" target="showframe" 	 target="showframe"		onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','<%=DIR_IMG %>menu_04_1.gif',1)"><img src="<%=DIR_IMG %>menu_04.gif" name="Image4" border="0"></a></td>
        <td>&nbsp;</td>
      </tr>
      <!-- 정책관리 추후 추가 예정 
      <tr>
        <td>&nbsp;</td>
        <td><a  																		onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=DIR_IMG %>menu_05_1.gif',1)"><img src="<%=DIR_IMG %>menu_05.gif" name="Image5" border="0"></a></td>
        <td>&nbsp;</td>
      </tr>
       -->
      <tr>
        <td>&nbsp;</td>
        <td><a href="/admin.do?cmd=admin_user_list" 					target="showframe" 		onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','<%=DIR_IMG %>menu_06_1.gif',1)"><img src="<%=DIR_IMG %>menu_06.gif" name="Image6" border="0"></a></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="/company.do?cmd=company_list&kind=<%=kind%>"  	target="showframe" 		onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','<%=DIR_IMG %>menu_07_1.gif',1)"><img src="<%=DIR_IMG %>menu_07.gif" name="Image7" border="0"></a></td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>