<%
/*
file   : product_list.jsp
page   : 코드관리 제조사코드 현황
name   : 최승주
e-mail : halfodys@gmail.com
date   : 2009-02-07
memo   : 날짜형식의 데이터 조회시에 등록일 포맷 미정
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
	
    if( request.getAttribute("rsTray") !=null){
    	goods_list_Tray = (ResultSetTray)request.getAttribute("rsTray");
    	rowCount = goods_list_Tray.getRowCount();
	}
%>

<html>
<head>
<title>코드관리>제조사코드 현황</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
	<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
	<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<script>
function List(){
	var frm=document.frm;
	    frm.action="/product.do?cmd=product_list";
		frm.method="post";
		frm.target="_self";
		frm.submit();
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
                        <td><img style="margin-right:15px"src="<%=DIR_IMG%>text_top_service7.gif" /></td>
                        <td class="MenuTopText">제조사코드 현황 &gt;&gt; TMLL</td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                  <td height="8"></td>
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
                      <td class="TableBg">제조사ID</td>
					  <td class="TableBg">제조사명</td>
                      <td class="TableBg">등록일</td>
					  <td class="TableBg">관리</td>
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
//                        		function getDayFormat($dayStr,$flag) {
//                        	    if ($dayStr == "0" || $dayStr == "") 
//                        	        return "";
//                        	    else {
//                        	        if ( $flag=="0" && strlen($dayStr) == 8) {
//                        	            return substr($dayStr, 0, 4) . "-" . substr($dayStr, 4, 2) . "-" . substr($dayStr, 6, 2);
//                        	        }else if($flag=="1" && strlen($dayStr)==8){
//                        	        	  return substr($dayStr, 0, 4) . "." . substr($dayStr, 4, 2) . "." . substr($dayStr, 6, 2);
//                        	        }else if($flag=="2"){  //YY/MM/DD
//                        	        	  return substr($dayStr,2,2) . "/" . substr($dayStr, 5, 2) . "/" . substr($dayStr, 8, 2);
//                        	        }else if($flag=="3"){ //YYYY/MM/DD
//                        	        	  return substr($dayStr,0,4) . "/" . substr($dayStr, 5, 2) . "/" . substr($dayStr, 8, 2);
//                        	        }else if($flag=="4"){ //YYYYMMDD
//                        	        	  return substr($dayStr,0,4).substr($dayStr, 5, 2).substr($dayStr, 8, 2);
//                        	        }else {
//                        	            return substr($dayStr, 0, 4) . "-" . substr($dayStr, 4, 2);
//                        	        }
//                        	    }
//                        	}
                        	 //                        	REG_DT = getDayFormat(rowCount[i][2],"3");   
                        %>
					<tr>
						<td colspan="9">검색된 페이지가 없습니다 "</td>
                 	</tr>        
           				<%
	    					}else{
           				%>              
                          <tr>                       
	    		    		<td class="TableBgText"><%=goods_list_Tray.get("vendor_id",i) %></td>	    
	    		    		<td class="TableBgText"><%=goods_list_Tray.get("vendor_name",i) %></td>
					   <!-- <td class="TableBgText"><%=goods_list_Tray.get("REG_DT",i) %></td> -->
                            <td class="TableBgText"><img src="<%=DIR_IMG%>btn_delete.gif" align="absmiddle"> </td>
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