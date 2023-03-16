<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/common.jsp"%>
<html>
<head>
<title>사용자_게시판_공지사항</title>
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
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>user_text_top_service4.gif" /></td>
                        <td class="MenuTopText">공지사항</td>
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
                                      <option value="g_user_id">작성자</option>
                                      <option value="g_title" selected>제목</option>
                                      <option value="g_name" >내용</option>									  
                                    </select><input style="margin-left:5px; margin-right:8px"name="find" type="text" class="InputLIneGray" size="20" maxlength="20"></td>
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
                        <col width="50">
						<col width="450">
                        <col width="60">
                        <col width="90">
						<col width="*">
                        </colgroup>
                        <tr class="TableBgBold">
                        <td height="34" class="TableBg">번호</td>
                        <td class="TableBg">제목</td>
                        <td class="TableBg">작성자</td>
                        <td class="TableBg">등록일</td>
                        <td class="TableBg">조회수</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><div style="height:312; overflow-y:scroll;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="50">
						<col width="450">
                        <col width="60">
                        <col width="90">
						<col width="*">
                        </colgroup>
                          <tr>
                            <td class="TableBgText">1</td>
                            <td class="TableBgText">Jeniffer(NT)</td>
                            <td class="TableBgText">test_svr</td>
                            <td class="TableBgTextDate">2009/02/02</td>
                            <td class="TableBgText">999</td>
                            </tr>
                          <tr>
                            <td class="TableBgText">2</td>
                            <td class="TableBgText">Jeniffer(NT)</td>
                            <td class="TableBgText">test_svr</td>
                            <td class="TableBgTextDate">2009/02/02</td>
                            <td class="TableBgText">999</td>
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
          <td align="right" valign="top">&nbsp;</td>
          <td></td>
        </tr>
</table>
</body>
</html>
