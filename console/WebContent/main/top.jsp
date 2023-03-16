<%@ page contentType="text/html; charset=euc-kr"%>
<%@include file="/common/common.jsp" %> 

<%
	String Level 	= "";
	String IP		= "IP 192.18.171.242";

	if( kind.equals("A") ){
		Level = "관리자";
	}else if( kind.equals("O")){
		Level = "운용자";
	}else{
		Level = "일반사용자";
	}


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
.style3 {
	font-family: "돋움";
	font-size: 12px;
	color: #000000;
}
-->
</style>
</head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	}
.style2 {color: #f0ff00}
-->
</style>


<body>
<table width="950" border="0" cellspacing="0" cellpadding="0">
   <tr>
	    <td width="16" bgcolor="#9a9da2"></td>
	    <td width="676" height="37" background="<%=DIR_IMG %>main_top_line.gif" style="padding-left:19px">
    <span class="style2"> 로그인 이름: <b><%=name %></b> / Level: <b><%=Level %></b></span>&nbsp;&nbsp;&nbsp;&nbsp;
	    <img src="<%=DIR_IMG %>btn_modify.gif" align="middle">
	    <img src="<%=DIR_IMG %>btn_logout.gif" align="middle" style="margin-right:16px; margin-left:6px">
	    <img src="<%=DIR_IMG %>on.gif" align="middle">&nbsp;&nbsp;<span class="style3"><%=IP %></span></td>
    <td width="258" height="37" valign="bottom" background="<%=DIR_IMG %>main_top_line.gif">
<!--    <img style="margin-right:4px"src="<%=DIR_IMG %>btn_netStatus.gif" width="97" height="26"> -->
<!--    <img style="margin-right:4px"src="<%=DIR_IMG %>btn_static.gif" width="97" height="26">		 -->
	</td>
  </tr>
</table>
</body>
</html>




