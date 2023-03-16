<%
/*
page   : 작업관리 작업완료 세션 현황
name   : 최승주
e-mail : halfodys@gmail.com
date   : 2009-02-07
*/
%>
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
    String        namecheckbox2    = null;
    String        goods_code       = null;
	String        goods_name       = null;
    String        cal1       	   = null;
	String        cal2       	   = null;	
	
    if( request.getAttribute("rsTray") !=null){
    	goods_list_Tray = (ResultSetTray)request.getAttribute("rsTray");
    	namecheckbox =(String)request.getAttribute("namecheckbox");
    	namecheckbox2 =(String)request.getAttribute("namecheckbox2");
    	cal1 =(String)request.getAttribute("cal1");
    	cal2 =(String)request.getAttribute("cal2");
    	rowCount = goods_list_Tray.getRowCount();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>작업관리>작업완료세션</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
	<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
	<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
table.Nnavi {height:13px;border-collapse:collapse;margin:0 auto;}
table.Nnavi {height:13px;border-collapse:collapse;margin:0 auto;}
-->
</style>
<script>
function WorkedList(){
	var frm=document.workfrm;
	    frm.action="/worked.do?cmd=worked_list";
		frm.method="post";
		frm.target="_self";
		frm.submit();
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
-->
</style>
<body>
	<form name="workfrm">
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
                        <td><img style="margin-right:15px"src="<%=DIR_IMG%>text_top_service2.gif" /></td>
                        <td class="MenuTopText">작업완료세션 &gt;&gt; TMLL</td>
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
                        <td>
                        	<%=namecheckbox %>
                            <%=namecheckbox2 %>
                            
                        	&nbsp;접속일자&nbsp;
							<input name="cal1" class="InputLIneGray" type="text" readonly="readonly" size="10" />
							<img src="<%=DIR_IMG%>search_zoom.gif" onClick="popUpCalendar(this,cal1,'yyyy/mm/dd');">
							~							
							<input name="cal2" class="InputLIneGray" type="text" readonly="readonly" size="10" />
							<img src="<%=DIR_IMG%>search_zoom.gif" onClick="popUpCalendar(this,cal2,'yyyy/mm/dd');">
							
						</td>
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
                        <col width="60">
                        <col width="90">
                        <col width="70">
                        <col width="70">
                        <col width="80">
                        <col width="150">
                        <col width="60">
                        <col width="60">
                        <col width="*">
                        </colgroup>
                        <tr class="TableBgBold">
                       <td height="34" class="TableBg"></td>
                      <td class="TableBg">사용자이름
						<img  style="margin-left:3px"src="<%=DIR_IMG%>arrow_up.gif" width="9" height="9">
					  </td>
					  <td class="TableBg">사용자ID</td>
                      <td class="TableBg">서비스ID</td>
					  <td class="TableBg">접속시스템</td>
                      <td class="TableBg">로그인 시간</td>
                      <td class="TableBg">담당자</td>
                      <td class="TableBg">장비구분</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><div style="height:312; overflow-y:scroll;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="60">
                        <col width="90">
                        <col width="70">
                        <col width="70">
                        <col width="80">
                        <col width="150">
                        <col width="60">
                        <col width="60">
                        <col width="*">
                        </colgroup>
                        <%for(int i=0;i<rowCount;i++){
                        	if(rowCount==0){
                        %>
					<tr>
						<td colspan="9">검색된 페이지가 없습니다 "</td>
                 	</tr>        
           				<%
	    					}else{
           				%>              
                          <tr>
                            <td class="TableBgText"><img src="<%=DIR_IMG%>btn_s_log.gif" class="cursor_hand" onClick="logview('2583','20090204144820.2583.log');"></td>
	    		    		<td class="TableBgText"><%=goods_list_Tray.get("name",i) %></td>
	    		    		<td class="TableBgText"><%=goods_list_Tray.get("user_id",i) %></td>
	    		    		<td class="TableBgText"><%=goods_list_Tray.get("service_id",i) %></td>
	    		    		<td class="TableBgText"><%=goods_list_Tray.get("system_id",i) %></td>	    
	    		    		<td class="TableBgText"><%=goods_list_Tray.get("logintime",i) %></td>
	    		    		<td class="TableBgText"><%=goods_list_Tray.get("admin",i) %></td>
                            <td class="TableBgText"><img src="<%=DIR_IMG%>unix_m.gif" align="absmiddle"> </td>
                          </tr>
                  		
                  		<% 
	    						}//if end
    					   }//for end	
                  		%>
                  		
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
          <td align="right" valign="top">&nbsp;</td>
          <td></td>
        </tr>
</table>
</body>
</html>