<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>사용자_Window작업등록_작업내역등록현황(NT)_작업내역 등록</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='../../css/skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='../../css/skt_Default.css' TYPE='TEXT/CSS'>
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
                        <td><img style="margin-right:15px"src="../../images/icon01.gif" align="absmiddle"></td>
                        <td><img style="margin-right:15px"src="../../images/user_text_top_service3.gif"></td>
                        <td class="MenuTopText">작업내역 등록</td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                  <td height="8"></td>
                </tr>
                <tr>
                  <td height="32"></td>
                </tr>
                <tr>
                  <td height="6"></td>
                </tr>
                <tr>
                  <td align="right" class="T11PgaeNum">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<colgroup>
	            <col width="70">
	            <col width="*">
	            </colgroup>
                    <tr>
                      <td height="30" class="PopupBold">제목</td>
                      <td class="PopupBold"><input name="title" type="text" class="inputLIneGrayColor" size="100"></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">작업목적</td>
                      <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input name="uname2" type="text" class="inputLIneGrayColor" size="50" maxlength="20" readonly></td>
                          <td width="80"><B><FONT COLOR="396297">작업등록자</FONT></B></td>
                          <td><input name="uname" type="text" class="inputLIneGrayColor" size="30" value="김정욱" maxlength="20" readonly></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">FTP 사용</td>
                      <td class="PopupBold"><input type="radio" name="ftp" value="1" >
                                <B><FONT COLOR="ff3116">사용</FONT></B>
                                <input type="radio" name="ftp" value="0" checked>
                      미사용</td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">작업 시간</td>
                      <td class="PopupLine"><input name="cal1" class="InputLIneGray" value="2006/05/19" size="10">
                          <img src="../../images/zoom.gif"style="margin-right:4px;margin-left:4px" align="absmiddle"  class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');">
                        <input name="hh1" type="text" class="InputLIneGray" size="4" value="00" onKeyPress="onlyNumber()">
                        시
                        <input name="mm1" type="text" class="InputLIneGray" size="4" value="00" onKeyPress="onlyNumber()">
                        분 ~
                        <input name="cal2" type="text" class="InputLIneGray" size="10" VALUE="2009/01/21">
                        <img src="../../images/zoom.gif" align="absmiddle" class="Cursor_hand" onClick="popUpCalendar(this, cal2, 'yyyy/mm/dd');">
                        <input name="hh1" type="text" class="InputLIneGray" size="4" value="00" onKeyPress="onlyNumber()">
                        시
                        <input name="mm1" type="text" class="InputLIneGray" size="4" value="00" onKeyPress="onlyNumber()">
                        분</td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">내용</td>
                      <td class="PopupBold"><textarea style="margin-top:5px; margin-bottom:5px" name="detail" cols="80" rows="3" class="inputLIneGrayColorTextarea" onKeyUp="length_check(4000,'detail');">테스트용</textarea></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">작업시스템</td>
                      <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="4"></td>
                          </tr>
                          <tr>
                            <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
					<colgroup>
                    <col width="110">
                    <col width="100">
                    <col width="130">
                    <col width="120">
                    <col width="120">
                    <col width="*">
                    </colgroup>
                                <tr class="TableBgBold">
                                  <td height="34" class="TableBg">서비스 이름</td>
                                  <td class="TableBg">서비스 ID </td>
                                  <td class="TableBg">시스템 이름</td>
                                  <td class="TableBg">시스템 ID</td>
                                  <td class="TableBg">장비담당자</td>
                                  <td class="TableBg">구분</td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td><div style="height:104; overflow-y:scroll;">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
					 <colgroup>
                    <col width="110">
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
                                    <td class="TableBgText">기태현</td>
                                    <td class="TableBgText"><a href="#"><img src="../../images/btn_delete.gif" border="0" align="absmiddle" style="margin-left:13px"></a></td>
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
                            <td height="23" align="right"><a href="#"><img src="../../images/btn_add.gif" border="0"></a></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupLine"><strong>파일첨부</strong></td>
                      <td class="PopupBold"><input name="Filename" type="file" class="inputLIneGrayColor" size="66">
                        <a href="#"><img src="../../images/btn_delete.gif" border="0" align="absmiddle" style="margin-left:5px"></a></td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
          <td width="20">&nbsp;</td>
        </tr>
        <tr>
          <td height="29"></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="top"><a href="#"><img src="../../images/btn_list.gif"></a></td>
              <td align="right" valign="top"><a href="#"><img src="../../images/btn_regist.gif"></a></td>
            </tr>
          </table></td>
          <td></td>
        </tr>
</table>
</body>
</html>
