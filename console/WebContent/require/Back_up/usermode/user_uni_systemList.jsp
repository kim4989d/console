<%
/*
page   : 작업관리 작업완료 세션 현황
name   : 최승주
e-mail : halfodys@gmail.com
date   : 2009-02-07
*/
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" %>    
<%@include file="/common/common.jsp" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="console.list.*,java.util.*"%>
<%@page import="console.common.tray.ResultSetTray" %>
<%@page import="console.common.tray.Tray" %>
<%@page import="console.common.util.CommonUtil" %>

<%
    int           rowCount         = 0;
    Tray          reqTray          = null;
    ResultSetTray goods_list_Tray  = null;
    String        namecheckbox     = null;
    String        goods_code       = null;
	String        goods_name       = null;
	
    if( request.getAttribute("rsTray") !=null){
    	goods_list_Tray = (ResultSetTray)request.getAttribute("rsTray");
    	namecheckbox =(String)request.getAttribute("namecheckbox");
    	rowCount = goods_list_Tray.getRowCount();
	}
%>



<html>
<head>
<title>사용자_접속현황_UNIX 장비현황</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<script type="text/javascript">

function test(){

window.open('/usermode/telnet.jsp','name','windowStatusString');

}
</script>

</head>
<body>
<form name="frm">
	<table width="764" height="502" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20">&nbsp;</td>
          <td width="724" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="97" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="16"></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <colgroup>
                      <col width="12">
                      <col width="10%">
                      <col width="*">
                      </colgroup>
                      <tr>
                        <td><img style="margin-right:15px"src="<%=DIR_IMG%>icon01.gif" align="absmiddle" /></td>
                        <td><img style="margin-right:15px"src="<%=DIR_IMG%>user_text_top_service1.gif" /></td>
                        <td class="MenuTopText">UNIX 사용장비현황 &gt;&gt; TMLL</td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                  <td height="8"></td>
                </tr>
                <tr>
                  <td height="32" background="<%=DIR_IMG%>search_line01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <colgroup>
                      <col width="*">
                      <col width="30">
                      <col width="220">
                      <col width="30">
                      </colgroup>
                      <tr>
                        <td><select  style="margin-left:8px" name="key" class="InputLIneSelect">
                                        <option value="host_id" selected>호스트 ID</option>
                                        <option value="system_name" >호스트 NAME</option>
                                      </select><input style="margin-left:5px; margin-right:8px"name="find" type="text" class="InputLIneGray" size="20" maxlength="20"></td>
                        <td><a href="#"><img  style="margin-right:8px"src="<%=DIR_IMG%>search_btn_ok.gif" /></a></td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="6"></td>
                </tr>
                <tr>
                  <td align="right" class="T11PgaeNum"><img style="margin-right:10px"src="<%=DIR_IMG%>icon02.gif" align="absmiddle">총 <strong>2</strong> 페이지 <B><FONT COLOR="ed7338">1/1</FONT></b></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="70">
						<col width="200">
                        <col width="200">
                        <col width="90">
						<col width="80">
						<col width="*">
                        </colgroup>
                        <tr class="TableBgBold">
                        <td height="34" class="TableBg">관리</td>
                        <td class="TableBg">서비스명</td>
                        <td class="TableBg">호스트ID</td>
                        <td class="TableBg">호스트명</td>
                        <td class="TableBg">접속만료일</td>
                        <td class="TableBg">장비구분</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><div style="height:312; overflow-y:scroll;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                         <colgroup>
                        <col width="70">
						<col width="200">
                        <col width="200">
                        <col width="90">
						<col width="80">
						<col width="*">
                        </colgroup>
                        
                          <tr>
                            <td class="TableBgText"><a href="#">
							<input type="button" value="Telnet" onclick="test()"><p>
                            <td class="TableBgText">Jeniffer(NT)</td>
                            <td class="TableBgText">test_svr</td>
                            <td class="TableBgText">TEST</td>
                            <td class="TableBgTextDate">N/A </td>
                            <td class="TableBgText"><img src="<%=DIR_IMG%>unix_m.gif" style="margin-left:13px"align="absmiddle"></td>
                          </tr>
                        
                        </table>
                      </div></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
          <td width="20">&nbsp;</td>
        </tr>
        <tr>
          <td height="30"></td>
          <td align="center" valign="middle"><div align="center">
            <!--페이징 처리 클래스 끝-->
            <b><font color="ff7635"><img src="<%=DIR_IMG%>btn_p1.gif" width="16" height="15" align="absmiddle">&nbsp;1&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;2&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;3&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;4&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;5&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;6&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;7&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;8&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;9&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;10&nbsp;</font></b> <img src="<%=DIR_IMG%>btn_n2.gif" width="16" height="15" align="absmiddle"></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="29"></td>
          <td align="right" valign="top"><a href="#"><img style="margin-right:6px"src="<%=DIR_IMG%>btn_renewal.gif"></a><a href="#"><img src="<%=DIR_IMG%>btn_machine.gif"></a></td>
          <td></td>
        </tr>
</table>
</body>
</html>
