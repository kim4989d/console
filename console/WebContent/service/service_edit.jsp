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
<!-- 팝업사이즈  500 * 387-->
<title>팝업 서비스관리 서비스 정보 수정</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">
	<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
	<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<script>
function List(){
	var frm=document.frm;
	    frm.action="/serviceupdate.do?cmd=service_edit.jsp";
		frm.method="post";
		frm.target="_self";
		frm.submit();
}
</script>
</head>
<table width=500 border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="<%=DIR_IMG%>pop_500bg_01.jpg" class="PopupTitleBgWhite"><img src="<%=DIR_IMG%>pop_img01.gif" align="absmiddle" style="margin-left:10px; margin-right:10px">서비스 정보 수정</td>
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
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="95" height="30" class="PopupBold">Service ID</td>
                      <td class="PopupLine"><b class="OrangeText">O/M</b></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">서비스 이름</td>
                      <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input name="service_name" type="text" class="inputLIneGrayColor" size="23" maxlength="20" value="O&M"></td>
                          <td class="T11PopupText"><img src="<%=DIR_IMG%>dot_2.gif" align="absmiddle" /><font color="ff3116">필수</font></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">담당자</td>
                      <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input type="text" name="CNAME" value="김현정" class="inputLIneGrayColor"></td>
                          <td class="T11PopupText"><img src="<%=DIR_IMG%>dot_2.gif" align="absmiddle" /><font color="ff3116">필수</font> <span class="style1">(매니저를 선택하세요.)</span> </td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">담당업체</td>
                      <td class="PopupLine"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="4"></td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                              <colgroup>
                              <col width="50%">
                              <col width="*">
                              </colgroup>
                              <tr class="TableBgBold">
                                <td height="34" class="TableBg">업체명</td>
                                <td class="TableBg">구분</td>
                                </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td><div style="height:130; overflow-y:scroll;">
                              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                              <colgroup>
                              <col width="55%">
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
                         <td class="TableBgText"><%=goods_list_Tray.get("service_id",i) %></td>
                         <td class="TableBgText"><a href="#"><img src="<%=DIR_IMG%>btn_delete.gif" border="0" align="absmiddle" style="margin-left:3px"></a></td>
                        </tr>                  		
                  		
                  		<% 
	    						}//if end
    					   }//for end	
                  		%>
                              </table>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="5"></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">&nbsp;</td>
                      <td height="30" align="right" class="PopupLine"><a href="#"><img src="<%=DIR_IMG%>btn_company_reg.gif" border="0"></a></td>
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
        <td height="40" align="right"><a href="#"><img style="margin-right:6px" src="<%=DIR_IMG%>btn_modify1.gif"></a><a href="#"><img src="<%=DIR_IMG%>btn_close.gif" width="42" height="22"></a></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>