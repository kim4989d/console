<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "admin.equip.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@page import="admin.app.AppDBBean"%>
<%@page import="admin.app.AppDataBean"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<% 
	request.setCharacterEncoding("euc-kr"); 

    int count  = 0;
    
    AppDBBean dbPro = AppDBBean.getInstance();
    count = dbPro.getArticleCount();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	AppDataBean data = dbPro.getDatas();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv=Cache-Control content=No-Cache>
<meta http-equiv=Pragma	content=No-Cache>
<title>▒ NGS ▒  NGS WEB SOLUTION ▒</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
}
-->
</style>
<link href="/ngs/comm/css/default.css" rel="stylesheet" type="text/css">
<link href="/ngs/comm/css/Form.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="/ngs/comm/js/common.js"></script>

<script language="javascript">
	function allRefresh()
	{
		window.parent.frames["topFrame"].location.reload();
		window.parent.frames["leftFrame"].location.reload() ;
		window.parent.frames["mainFrame"].location.reload();
	}

	var newPoup;    // 전역변수로 선언한 뒤...

	function newWin(result)
	{
		var result;

		if (result.indexOf(",") > 0)
		{
			alert ("반려는 한개만 선택 할 수 있습니다.");
			return false;
		}

		var url="return_ok.php?uniq_id="+result;
		
		var re = "toolbar=no, resizable=0,scrollbars=auto, status=0,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=503, height=150, top=200, left=370";

		if (newPoup != null)     newPoup.close();

		newPoup = window.open(url, 'return', re);
	}
	function newWin1(val,act)
	{
		var val;
		var act;
		var url="../equipment/system_edit.php?s="+val
		
	var re = "toolbar=no, resizable=0,scrollbars=auto, status=0,location=no, resize=0, menubar=no, directories=no, copyhistory=0, width=503, height=445,top=200, left=370";
	 if (newPoup != null)     newPoup.close();
	newPoup=window.open(url, 'sys', re);
	}
	function newWin2(val)
	{
		var val;
		var act;
		if (val.indexOf(",") > 0)
		{
			alert ("중복 승인은 할 수 없습니다.");
			return false;
		}

		var url="user_add_policy.php?c="+val+"&div="+""
		document.form.uniq_id.value = val;
		
	var re = "toolbar=no,resizable=0,scrollbars=auto, status=1,location=no, resize=0, menubar=no, directories=no, copyhistory=0, width=801, height=590,top=200, left=150";
	 if (newPoup != null)     newPoup.close();
	newPoup = window.open(url, 'sys', re);
	}	
</script>
</head>

<body>
<table width="762" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<form name="form" method="post" action="auth_ok.php" target="HiddenFrame">
	<input type="hidden" name="div" value="" >
	<input type="hidden" name="uniq_id" >
	<input type="hidden" name="flag" value="0" >
	<input type="hidden" name="content">
	<input type="hidden" name="act">
	<input type="hidden" name="term">
	<input type="hidden" name="idle">
	<input type="hidden" name="st">
	<input type="hidden" name="et">
	<input type="hidden" name="lc">
	<table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30">&nbsp;</td>
          <td width="702" height="500" valign="top">
		   <table width="702" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="44" valign="top"><img src="/ngs/images/content_title/title_service14.gif" width="136" height="25"></td>
              </tr>
                  <tr>
                    <td align="right" style="padding-top:2px;padding-bottom:3px"><table border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td background="/ngs/images/common/search_page_03.gif">
						<table border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td class="T11PgaeNum" align="center"></td>
                              <td width="10"></td>
                              <td class="T11PgaeNum" align="center">페이지 1/1</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                  </tr>
			  <tr>
                <td>
				<table width="702" border="0" cellpadding="0" cellspacing="0">
                    <tr class="TableBgBold">
                      <td width="40" height="37" class="TableBg">선택<input type="hidden" name="check_all" value="checkbox" onclick="SetChecked()"></td>
                      <td width="80" class="TableBg">사용자ID</td>
                      <td width="70" class="TableBg">사용자이름</td>
                      <td class="TableBg">작업 내역</td>
					  <td width="100" class="TableBg">서비스그룹</td>
					  <td width="80" class="TableBg">신청일</td>
                      <td width="82" class="TableBg">승인결과</td>
                    </tr>
                </table>
				</td>
              </tr>
              
              <!-- insert data -->
              <%
    			if (count == 0  ) {
    				
    			}else if(count > 0){
    				if( data.app_result.equals("미승인") ){   					
			  %>
              <tr>
                  <td> 
				   <table width="702" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="40" class="TableBgText">
                        <input type="checkbox" name="seqNo" value="8358897958|NULL" onClick="blur();"></td>
                        <td width="80" class="TableBgText"><%= data.worker_id%></td>
                        <td width="70" class="TableBgText"><%= data.worker_name%></td>
                        <td class="TableBgText"><a href="#" onclick="newWin2('8358897958|NULL')"><%= data.content%></a></td>
						<td width="100" class="TableBgText"><%= data.se_name%></td>
						<td width="80" class="TableBgTextDate"><%= sdf.format(data.reg_date)%></td>
                        <td width="82"class="TableBgText"><B><FONT COLOR="RED"><%= data.app_result%></FONT></b></td>
                      </tr>
                    </table></td>
                      <% } %>
                      <%} %>
              </tr>
              <tr>
              
              
                <td>
				<table width="702" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="35" background="/ngs/images/service/table_under_bg.gif">
						<table width="702" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="43"><img src="/ngs/images/common/btn_sell_all.gif" width="43" height="19" hspace="5" class="cursor_hand" onClick="SetChecked();"></td>
                              <td><div align="center">
							  <!--페이징 처리 클래스 끝-->
								 <img src='/ngs/images/common/board_arrow_pre.gif' hspace='10' border='0' align='absbottom'>  |<b><font color=red>1</font></b>|  <img src='/ngs/images/common/board_arrow_next.gif' hspace='10' border='0' align='absbottom'> 							  <!--페이징 처리 클래스 끝-->										 
								 </div></td>
                              <td width="43">&nbsp;</td>
                            </tr>
                        </table>
					</td>
                  </tr>
                </table>
				</td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
              <tr>
                  <td align="right"><img src="/ngs/images/common/btn_renewal.gif" width="39" height="27" hspace="4"  class="Cursor_Hand" onclick="javascript:allRefresh()">
                  <img src="/ngs/images/common/btn_agree.gif" width="39" height="27" class="Cursor_Hand" onclick="window.location='/ngs/view/admin/admin1/apppro.jsp'">
                  <img src="/ngs/images/board/btn_return.gif" width="39" height="27" hspace="4" class="Cursor_Hand" onclick="move_button('re')"></td>
              </tr>
              <tr>
                <td height="40">&nbsp;</td>
              </tr>
          </table></td>
          <td width="30">&nbsp;</td>
        </tr>
    </table>
	</form>
	</td>
  </tr>
  <tr>
    <td>
      <table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="762" border="0" cellspacing="0" cellpadding="0">
</table>
</td>
        </tr>
      </table></td>
  </tr>
</table>
<iframe name="HiddenFrame" width="0" height="0" id="HiddenFrame"  scrolling="no"   FRAMEBORDER="0"></iframe>
</body>
</html>
