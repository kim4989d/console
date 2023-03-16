<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ page import="console.common.util.Util"%>
<%@ include file="/common/common.jsp"%>
<html>
<head>
<title>사용자_Unix작업등록_작업내역현황(Uinx)</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
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
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>icon01.gif" align="absmiddle" /></td>
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>user_text_top_service2.gif" /></td>
                        <td class="MenuTopText">작업내역현황(Uinx) &gt;&gt; TMLL</td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                  <td height="8"></td>
                </tr>
                <tr>
                  <td height="32" background="<%=DIR_IMG %>search_line01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <colgroup>
                    <col width="*">
                    <col width="30">
                    <col width="220">
                    <col width="30">
                    </colgroup>
                    <tr>
                      <td><select style="margin-left:8px" name="key" class="InputLIneSelect">
                          <option value="SERVICE_NAME" selected>서비스이름</option>
                          <option value="SERVICE_ID">서비스ID</option>
                        </select>
                          <input style="margin-left:2px"name="find" type="text" class="InputLIneGray" size="12" />
                          <select style="margin-left:2px" name="key1" class="InputLIneSelect">
                            <option value="system_name">시스템이름</option>
                            <option value="host_id">시스템ID</option>
                          </select>
                          <input style="margin-left:2px" name="find1" type="text" class="InputLIneGray" size="12" /></td>
                      <td width="65" class="TableSearchBg ">기간</td>
                      <td><input name="cal1" class="InputLIneGray" size="10" />
                          <img src="<%=DIR_IMG %>search_zoom.gif"style="margin-right:4px;margin-left:4px" align="absmiddle"  class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');" /> ~
                        <input name="cal1" class="InputLIneGray" size="10" />
                          <img src="<%=DIR_IMG %>search_zoom.gif"style="margin-right:4px;margin-left:4px" align="absmiddle"  class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');" /></td>
                      <td><a href="#"><img  style="margin-right:8px"src="<%=DIR_IMG %>search_btn_ok.gif" /></a></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="6"></td>
                </tr>
                <tr>
                  <td align="right" class="T11PgaeNum"><img style="margin-right:10px"src="<%=DIR_IMG %>icon02.gif" align="absmiddle">총 <strong>2</strong> 페이지 <B><FONT COLOR="ed7338">1/1</FONT></b></td>
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
                        <col width="90">
                        <col width="100">
                        <col width="200">
                        <col width="70">
                        <col width="80">
                        <col width="80">
                        <col width="*">
                        </colgroup>
                        <tr class="TableBgBold">
                          <td height="34" class="TableBg">작업자</td>
                          <td class="TableBg">작업 목적</td>
                          <td class="TableBg">작업 기간</td>
                          <td class="TableBg">등록일</td>
                          <td class="TableBg">승인담당자</td>
                          <td class="TableBg">승인결과</td>
                          <td class="TableBg">상 태</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><div style="height:312; overflow-y:scroll;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                          <colgroup>
                          <col width="90">
                          <col width="100">
                          <col width="200">
                          <col width="70">
                          <col width="80">
                          <col width="80">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td class="TableBgText">tester</td>
                            <td class="TableBgText"><a href="#" onClick="newWin('3971748828')"><strong>test</strong></a></td>
                            <td class="TableBgTextDate">09/02/02 09:00 ~ 09/02/26 09:00</td>
                            <td class="TableBgTextDate">2009/02/02</td>
                            <td class="TableBgText">기태현</td>
                            <td class="TableBgText"><FONT COLOR='4848cf'><B>승인완료</B></FONT></td>
                            <td class="TableBgText"><strong><FONT COLOR ='e02a38'>작업중</FONT></strong></td>
                          </tr>
                          <tr>
                            <td class="TableBgText">서정덕</td>
                            <td class="TableBgText"><a href="#" onClick="newWin('5873151750')"><strong>모네타 점검</strong></a></td>
                            <td class="TableBgTextDate">09/01/20 22:00 ~ 09/01/31 22:00</td>
                            <td class="TableBgTextDate">2009/01/20</td>
                            <td class="TableBgText">천왕성</td>
                            <td class="TableBgText"><FONT COLOR='4848cf'><B>승인완료</B></FONT></td>
                            <td class="TableBgText"><FONT COLOR='535353'><B><strong>미작업</strong><B></FONT></td>
                          </tr>
                          <tr>
                            <td class="TableBgText">박종민</td>
                            <td class="TableBgText"><a href="#" onClick="newWin('6269300114')"><strong>시스템점검및 </strong></a></td>
                            <td class="TableBgTextDate">09/01/17 16:00 ~ 09/06/30 16:00</td>
                            <td class="TableBgTextDate">2009/01/17</td>
                            <td class="TableBgText">이인복</td>
                            <td class="TableBgText"><FONT COLOR='4848cf'><B>승인완료</B></FONT></td>
                            <td class="TableBgText"><strong><FONT COLOR='e02a38'>작업대기중</FONT></strong></td>
                          </tr>
                          <tr>
                            <td class="TableBgText">이승헌</td>
                            <td class="TableBgText"><a href="#" onClick="newWin('5881528138')"><strong>네이트코드 관</strong></a></td>
                            <td class="TableBgTextDate">08/10/22 09:00 ~ 08/10/22 23:59</td>
                            <td class="TableBgTextDate">2008/10/22</td>
                            <td class="TableBgText">김현정</td>
                            <td class="TableBgText"><FONT COLOR='4848cf'><B>승인완료</B></FONT></td>
                            <td class="TableBgText"><FONT COLOR ='4848cf'><B>작업완료</B></FONT></td>
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
            <b><font color="ff7635"><img src="<%=DIR_IMG %>btn_p1.gif" width="16" height="15" align="absmiddle">&nbsp;1&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;2&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;3&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;4&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;5&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;6&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;7&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;8&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;9&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;10&nbsp;</font></b> <img src="<%=DIR_IMG %>btn_n2.gif" width="16" height="15" align="absmiddle"></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="29"></td>
          <td align="right" valign="top"><a href="#"><img style="margin-right:6px"src="<%=DIR_IMG %>btn_renewal.gif"></a><a href="#"><img src="<%=DIR_IMG %>btn_work_regist.gif"></a></td>
          <td></td>
        </tr>
</table>
</body>
</html>
