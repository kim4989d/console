<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ page import="console.common.util.Util"%>
<%@ include file="/common/common.jsp"%>


<%

	/*	EndUser�� Unix �۾� ��� */
	
	
    ResultSetTray listTray  = null;
    int	rowCount = 0;					//�Խù� ��ü ����

    
    if( request.getAttribute("rsTray") !=null){
		listTray = (ResultSetTray)request.getAttribute("rsTray");
		rowCount = listTray.getRowCount();
	}
    
    
    if( request.getAttribute("checkbox") !=null){
		listTray = (ResultSetTray)request.getAttribute("checkbox");
	}
    
    
%>
<%
  request.setCharacterEncoding("euc-kr");
%>


<html>
<head>
<title>�����_Unix�۾����_�۾�������Ȳ(Uinx)</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>

<script type="text/javascript">



function newWin()
{
	var Pwidth=800;
	var Pheight=460;
	var url
	locW = (screen.availWidth-Pwidth)/2;
	locH = (screen.availHeight-Pheight)/2;
	
//	url="require.do?cmd=unix_work_pop";	
	url="/user_unix/pop/pop_unix_connection_req.jsp";

		 winfo = window.open(url,"jobWin","width="+Pwidth+",height="+Pheight+",top="+locH+",left="+locW+",toolbar=no,scrollbars=0, resizable=0, toolbar=0, menubar= 0,location=0, directories=0, status=0");
}


//���ΰ�ħ 
function Refresh(){
	var frm=document.regfrm;
		frm.action="/usermain.do?cmd=unix_list";
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
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>icon01.gif" align="middle" /></td>
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>user_text_top_service2.gif" /></td>
                        <td class="MenuTopText">�۾����� ��Ȳ �� �۾� ��û</td>
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
                          <option value="SERVICE_NAME" selected>�����̸�</option>
                          <option value="SERVICE_ID">����ID</option>
                        </select>
                          <input style="margin-left:2px"name="find" type="text" class="InputLIneGray" size="12" />
                          <select style="margin-left:2px" name="key1" class="InputLIneSelect">
                            <option value="system_name">�ý����̸�</option>
                            <option value="host_id">�ý���ID</option>
                          </select>
                          <input style="margin-left:2px" name="find1" type="text" class="InputLIneGray" size="12" /></td>
                      <td width="65" class="TableSearchBg ">�Ⱓ</td>
                      <td><input name="cal1" class="InputLIneGray" size="10" />
                          <img src="<%=DIR_IMG %>search_zoom.gif"style="margin-right:4px;margin-left:4px" align="middle"  class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');" /> ~
                        <input name="cal1" class="InputLIneGray" size="10" />
                          <img src="<%=DIR_IMG %>search_zoom.gif"style="margin-right:4px;margin-left:4px" align="middle"  class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');" /></td>
                      <td><a href="#"><img  style="margin-right:8px"src="<%=DIR_IMG %>search_btn_ok.gif" /></a></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="6"></td>
                </tr>
                <tr>
                  <td align="right" class="T11PgaeNum"><img style="margin-right:10px"src="<%=DIR_IMG %>icon02.gif" align="middle">�� <strong>1</strong> ������ <B><FONT COLOR="ed7338"><%= rowCount %>/1</FONT></b></td>
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
                          <td height="34" class="TableBg">�۾���</td>
                          <td class="TableBg">�۾� ����</td>
                          <td class="TableBg">�۾� �Ⱓ</td>
                          <td class="TableBg">�����</td>
                          <td class="TableBg">���δ����</td>
                          <td class="TableBg">���ΰ��</td>
                          <td class="TableBg">�� ��</td>
                        </tr>
                      </table></td>
                    </tr>
                     <%
				 	if(rowCount == 0){	
				 	%>
					    <tr><td colspan="7" align="center">��ϵ� �۾��� �����ϴ�</td></tr>
					<%
				 	}
				 	else{		
				   		for(int i=0;i<rowCount;i++){	
				   	%>
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
                            <td class="TableBgText"><%=listTray.get("user_id")%><</td>
                            <td class="TableBgText"><strong><%=listTray.get("intention")%></strong></a></td>
                            <td class="TableBgTextDate"><%=Util.DataFormat_yyMMdd_hhmm( listTray.get("from_dt") ) %> ~ <%=Util.DataFormat_yyMMdd_hhmm( listTray.get("to_dt") )%></td>
                            <td class="TableBgTextDate"><%=Util.DataFormat( listTray.get("reg_dt") )%>2</td>
                            <td class="TableBgText"><%=listTray.get("name")%></td>
                            <td class="TableBgText"><FONT COLOR='4848cf'><B><%=listTray.get("admin_result")%></B></FONT></td>
                            <td class="TableBgText"><strong><FONT COLOR ='e02a38'><%=listTray.get("status")%></FONT></strong></td>
                          </tr>   
                        </table>
                        	<%	}
    						}%>
                      
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
            <!--����¡ ó�� Ŭ���� ��-->
            <b><font color="ff7635">
            <img src="<%=DIR_IMG %>btn_p1.gif" width="16" height="15" align="middle"onclick="Refresh()" >&nbsp;1&nbsp;</font>
            <font color="cccccc">|</font><font color="404040">&nbsp;2&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;3&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;4&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;5&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;6&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;7&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;8&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;9&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;10&nbsp;</font></b> 
            <img src="<%=DIR_IMG %>btn_n2.gif" width="16" height="15" align="middle" onclick="newWinTest()" ></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="29"></td>
          <td align="right" valign="top"><a href="#"><img style="margin-right:6px"src="<%=DIR_IMG %>btn_renewal.gif"></a><a href="#"><img src="<%=DIR_IMG %>btn_work_regist.gif" onclick="newWin()"></a></td>
          <td></td>
        </tr>
</table>
</body>
</html>
