<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ include file="/common/common.jsp"%>
<html>
<head>
<!-- 팝업사이즈  800 * 446-->
<title>사용자_Unix작업등록_팝업_작업내역등록</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS %>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS %>skt_Default.css' TYPE='TEXT/CSS'>
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
    <td height="46" background="<%=DIR_IMG %>pop_800bg_01.jpg" class="PopupTitleBgWhite"><img src="<%=DIR_IMG %>pop_img01.gif" width="8" height="17" align="absmiddle" style="margin-left:10px; margin-right:10px">작업내역등록</td>
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
            <td class="PopupBold">작업목적</td>
            <td class="PopupBold"><textarea name="content" cols="100" rows="3"  class="InputLIneGraySearch"  onKeyUp="chk_msg()" readonly>test</textarea></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">작업 시간</td>
            <td class="PopupLine"><input name="cal1" class="InputLIneGray" value="2006/05/19" size="10">
                <img src="<%=DIR_IMG %>zoom.gif"style="margin-right:4px;margin-left:4px" align="absmiddle"  class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');">
                <select name="hh1" class="InputLIneSelect">
                  <option value="00" >00</option>
                  <option value="01" >01</option>
                  <option value="02" >02</option>
                  <option value="03" >03</option>
                  <option value="04" >04</option>
                  <option value="05" >05</option>
                  <option value="06" >06</option>
                  <option value="07" >07</option>
                  <option value="08" >08</option>
                  <option value="09" >09</option>
                  <option value="10" >10</option>
                  <option value="11" >11</option>
                  <option value="12" >12</option>
                  <option value="13" >13</option>
                  <option value="14" >14</option>
                  <option value="15" >15</option>
                  <option value="16" >16</option>
                  <option value="17" SELECTED>17</option>
                  <option value="18" >18</option>
                  <option value="19" >19</option>
                  <option value="20" >20</option>
                  <option value="21" >21</option>
                  <option value="22" >22</option>
                  <option value="23" >23</option>
                </select>
              시
  <select name="mm1"  class="InputLIneSelect">
    <option value="00" selected>00</option>
    <option value="05" >05</option>
    <option value="10" >10</option>
    <option value="15" >15</option>
    <option value="20" >20</option>
    <option value="25" >25</option>
    <option value="30" >30</option>
    <option value="35" >35</option>
    <option value="40" >40</option>
    <option value="45" >45</option>
    <option value="50" >50</option>
    <option value="55" >55</option>
  </select>
              분 ~
  <input name="cal2" type="text" class="InputLIneGray" size="10" VALUE="2009/01/21">
  <img src="<%=DIR_IMG %>zoom.gif" align="absmiddle" class="Cursor_hand" onClick="popUpCalendar(this, cal2, 'yyyy/mm/dd');">
  <select name="hh2"  class="InputLIneSelect">
    <option value="00" >00</option>
    <option value="01" >01</option>
    <option value="02" >02</option>
    <option value="03" >03</option>
    <option value="04" >04</option>
    <option value="05" >05</option>
    <option value="06" >06</option>
    <option value="07" >07</option>
    <option value="08" >08</option>
    <option value="09" >09</option>
    <option value="10" >10</option>
    <option value="11" >11</option>
    <option value="12" >12</option>
    <option value="13" >13</option>
    <option value="14" >14</option>
    <option value="15" >15</option>
    <option value="16" >16</option>
    <option value="17" SELECTED>17</option>
    <option value="18" >18</option>
    <option value="19" >19</option>
    <option value="20" >20</option>
    <option value="21" >21</option>
    <option value="22" >22</option>
    <option value="23" >23</option>
  </select>
              시
  <select name="mm2"  class="InputLIneSelect">
    <option value="00" SELECTED>00</option>
    <option value="05" >05</option>
    <option value="10" >10</option>
    <option value="15" >15</option>
    <option value="20" >20</option>
    <option value="25" >25</option>
    <option value="30" >30</option>
    <option value="35" >35</option>
    <option value="40" >40</option>
    <option value="45" >45</option>
    <option value="50" >50</option>
    <option value="55" >55</option>
  </select>
              분</td>
          </tr>
		  <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">FTP 사용</td>
            <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><input type="radio" name="ftp" value="1" >
                    <B><FONT COLOR="ff3116">사용</FONT></B>
                    <input type="radio" name="ftp" value="0" checked>
                  미사용 </td>
              </tr>
            </table></td>
		  </tr>
         <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">작업시스템</td>
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
                        <td class="TableBgText">기태현</td>
                        <td class="TableBgText"><a href="#"><img src="<%=DIR_IMG %>btn_delete.gif" border="0" align="absmiddle" style="margin-left:13px"></a></td>
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
                <td height="34" align="right"><a href="#"><img src="<%=DIR_IMG %>btn_add.gif" border="0"></a></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupLine"><strong>첨부파일</strong></td>
            <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="300" height="18">&nbsp;</td>
                <td width="100" align="center"><strong>작업결과</strong></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupLine"><strong>파일첨부</strong></td>
            <td class="PopupBold"><input name="Filename" type="file" class="inputLIneGrayColor" size="66"><a href="#"><img src="<%=DIR_IMG %>btn_delete.gif" border="0" align="absmiddle" style="margin-left:5px"></a></td>
          </tr>
          
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td></td>
        <td height="40" align="right"><a href="#"><img style="margin-right:6px" src="<%=DIR_IMG %>btn_regist.gif"></a><a href="#"><img src="<%=DIR_IMG %>btn_close.gif" width="42" height="22"></a></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
