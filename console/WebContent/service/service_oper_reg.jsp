<%
/*
page   : 서비스 정보 수정 팝업
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
<!-- 팝업사이즈  500 * 260 -->
<title>팝업_서비스관리_담당자</title>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
<META NAME="CONTENT-LANGUAGE" CONTENT="KR">
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
</head>
<body>
<table width=500 border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="<%=DIR_IMG%>pop_500bg_01.jpg" class="PopupTitleBgWhite"><img src="<%=DIR_IMG%>pop_img01.gif" align="absmiddle" style="margin-left:10px; margin-right:10px">담당자</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5"></td>
        <td width="*" height="4" bgcolor="#9ab1cf"></td>
        <td width="5"></td>
      </tr>
      <tr>
        <td></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="OrangeText"><strong>서비스 담당자 등록현황</strong></td>
                    </tr>
                  </table></td>
                  </tr>
                <tr>
                  <td><table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="4" align="center"></td>
                    </tr>
                    <tr>
                      <td width="700" align="center"><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="340">
                          <col width="*">
                          <col width="340">
                          </colgroup>
                          <tr>
                            <td align="center"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="<%=DIR_IMG%>dot_1.gif" width="24" height="28"></td>
                                  <td><strong>등록시스템</strong></td>
                                </tr>
                            </table></td>
                            <td align="center">&nbsp;</td>
                            <td><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td  style="padding-left:70"><img src="<%=DIR_IMG%>dot_1.gif" width="24" height="28"></td>
                                  <td><strong>신청시스템</strong></td>
                                </tr>
                            </table></td>
                          </tr>
                        </table>
                          <table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="30" align="center" class="PopupLine"><select multiple size="7" name="reg_system" style="width:200" onDblClick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                              </select></td>
                              <td width="30" align="center"><table border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td align="center"><img src="<%=DIR_IMG%>btn_S1.gif" width="20" height="17"></td>
                                  </tr>
                                  <tr>
                                    <td align="center">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td align="center"><img src="<%=DIR_IMG%>btn_S2.gif" width="20" height="17"></td>
                                  </tr>
                              </table></td>
                              <td height="30" align="center" class="PopupLine"><select multiple size="7" name="reg_system2" style="width:200" ondblclick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                              </select></td>
                            </tr>
                        </table></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
        </table></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td height="40" align="right"><a href="#"><img style="margin-right:6px" src="<%=DIR_IMG%>btn_ok.gif"></a><a href="#"><img src="<%=DIR_IMG%>btn_close.gif" width="42" height="22"></a></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>