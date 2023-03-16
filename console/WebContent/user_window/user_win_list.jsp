<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ page import="console.common.util.Util"%>
<%@ include file="/common/common.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%
    int           UserWinListCount         = 0;

    ResultSetTray UserWin_List   = null;   	 //
    String		checkbox	 	 = "";       // select box 값 
    String 		ADMIT_RESULT	 = "";
    String 		STATUS			 = "";		
    
    
    checkbox	=	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
		UserWin_List 		 = (ResultSetTray)request.getAttribute("rsTray");
		UserWinListCount	 = UserWin_List.getRowCount();
	}
%>

<html>
<head>
<title>사용자_Window작업등록_작업내역등록현황(NT)</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
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
<script language="JavaScript">
var winfo
function newWin(val1)
{
	var Pwidth=802;
	var Pheight=601;
	var url
	locW = (screen.availWidth-Pwidth)/2;
	locH = (screen.availHeight-Pheight)/2;
	url = "job_content.php?s="+val1+"&f=g"
	 if (winfo != null)     winfo.close();
		 winfo = window.open(url,"jobWin","width="+Pwidth+",height="+Pheight+",top="+locH+",left="+locW+",toolbar=no,scrollbars=0, resizable=0, toolbar=0, menubar= 0,location=0, directories=0, status=1");
	 //gFlowWait(false, false);
}
	function allRefresh()
	{
		window.parent.frames["topFrame"].location.reload();		
		window.parent.frames["leftFrame"].location.reload() ;
		window.parent.frames["mainFrame"].location.reload();
	
	}
</script>
</head>
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
                  <td>
           <form name="look" method="post" action="job_list.php">
				<input type="hidden" name="div" value="<?=$div?>" >
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <colgroup>
                      <col width="12">
                      <col width="10%">
                      <col width="*">
                      </colgroup>
                      <tr>
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>icon01.gif" align="absmiddle"></td>
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>user_text_top_service3.gif"></td>
                        <td class="MenuTopText">작업내역등록현황(NT) &gt;&gt; TMLL</td>
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
                        <col width="100">
                        <col width="110">
                        <col width="210">
                        <col width="90">
                        <col width="110">
                        <col width="*">
                        </colgroup>
                        <tr class="TableBgBold">
                          <td height="34" class="TableBg">작업자</td>
                          <td class="TableBg">제목</td>
                          <td class="TableBg">작업 기간</td>
                          <td class="TableBg">등록일</td>
                          <td class="TableBg">승인결과</td>
                          <td class="TableBg">상 태</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><div style="height:312; overflow-y:scroll;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="100">
                        <col width="110">
                        <col width="210">
                        <col width="90">
                        <col width="110">
                        <col width="*">
                        </colgroup>
                        <%
						if(UserWinListCount==0){
					  %>
					 <tr><td colspan='4'>검색된 테이블이없습니다</td><tr>
					 <%}else{ 
					    for(int i=0;i<UserWinListCount;i++){
								ADMIT_RESULT= "<FONT COLOR='RED'><B>승인대기</B></FONT>";
								STATUS="<B>작업대기</B>";
					    	%>
					    	<tr>
                            <td class="TableBgText"><%=UserWin_List.get("user_id",i)%></td>	 
                             <td class="TableBgText">usertest</td>	 
                            <td class="TableBgText"><a href="#" onClick="blur();newWin('3971748828')"><strong><%=UserWin_List.get("title",i)%></strong></a></td>
                            <td class="TableBgTextDate"><%=UserWin_List.get("from_dt",i)%></td>
                            <td class="TableBgTextDate"><%=UserWin_List.get("reg_dt",i)%></td>
                            <td class="TableBgTextDate"><%=ADMIT_RESULT%></td>
                            <td class="TableBgText"><%=STATUS%></td>
                           <% } %>
					    </tr>
						<% } %>
						
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
</form>
</body>
</html>
