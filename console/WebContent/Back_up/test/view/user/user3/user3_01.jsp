<%@ page language="java" pageEncoding="EUC-KR" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
	background-color: ;
}
-->
</style>
<link href="/ngs/comm/css/default.css" rel="stylesheet" type="text/css">
<link href="/ngs/comm/css/Form.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="/ngs/comm/js/Calendar3.js"></script>
<script language="JavaScript" src="/ngs/comm/js/find1.js"></script>
<script language="JavaScript" src="/ngs/comm/js/common.js"></script>
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
<table width="762" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30" height="300">&nbsp;</td>
          <td width="702" height="500" valign="top">
			<form name="look" method="post" action="job_list.php">
			<input type="hidden" name="div" value="" >
              <table width="702" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="44" valign="top"><img src="/ngs/images/content_title/title_service17.gif" width="136" height="25"></td>
                </tr>
              <tr>
                <td height="1" bgcolor="#aaaaaa"></td>
              </tr>
                  <tr>
                    <td height="1" ></td>
                  </tr>
              <tr>				
                <tr> 
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="60" align="center"><img src="/ngs/images/common/search_01.gif" width="44" height="12"></td>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td background="" ></td>
                              <td align="center" bgcolor="c5c5c5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td><select name="key" class="InputLIneGraySearch">
                                        <option value="SERVICE_NAME" selected>서비스이름</option>
                                        <option value="SERVICE_ID">서비스ID</option>
                                      </select></td>
                                    <td align="center"><input type="text" name="find" class="InputLIneGraySearch" size="12"></td>
                                    <td><select name="key1" class="InputLIneGraySearch">
                                        <option value="system_name" selected>시스템이름</option>
                                        <option value="system_id">시스템ID</option>
                                      </select></td>
                                    <td width="0" align="center"><input type="text" name="find1" class="InputLIneGraySearch" size="12"></td>
                                    <td width="0" align="right"><img src="/ngs/images/common/search_time.gif" width="19" height="11" hspace="7"></td>
                                    <td width="0"><input type="text" name="cal1" class="InputLIneGraySearch" size="10" readonly=></td>
                                    <td width="0"><img src="/ngs/images/common/zoom.gif" width="19" height="19" align="absmiddle" class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');"></td>
                                    <td width="0" align="center">~</td>
                                    <td width="0"><input type="text" name="cal2" class="InputLIneGraySearch" size="10" readonly></td>
                                    <td width="0"><img src="/ngs/images/common/zoom.gif" width="19" height="19" align="absmiddle" class="Cursor_hand" onClick="popUpCalendar(this, cal2, 'yyyy/mm/dd');"></td>
                                    <td width="0"><img src="/ngs/images/common/search_btn_ok.gif" width="40" height="20" hspace="7" class="Cursor_Hand" onClick="gaja();"></td>
                                  </tr>
                                </table></td>
                              <td background=""></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                 <tr>
                   <td height="1" ></td>
                 </tr>
              <tr>
                <td height="1" bgcolor="#aaaaaa"></td>
              </tr>				
                  <tr>
                    <td align="right" style="padding-top:2px;padding-bottom:3px"><table border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td background="/ngs/images/common/search_page_03.gif">
						<table border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td class="T11PgaeNum" align="center">총 0</td>
                              <td width="10"></td>
                              <td class="T11PgaeNum" align="center">페이지 1/0</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                  </tr>
                <tr> 
                  <td><table width="702" border="0" cellpadding="0" cellspacing="0">
                      <tr class="TableBgBold"> 
                        <td width="90" height="37" class="TableBg">작업자</td>
                        <td class="TableBg">제 목</td>
                        <td width="170" class="TableBg">작업 기간</td>
                        <td width="70" class="TableBg">등록일</td>
                        <td width="70" class="TableBg">승인결과</td>
						<td width="70" class="TableBg">상 태</td>
                      </tr>
                      <tr> 
                        <td class="TableBgText" colspan="5"><img src="/ngs/images/board/msg_05.gif" width="191" height="42"></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td><table width="702" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="35" background="/ngs/images/service/table_under_bg.gif"><table width="702" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="180">&nbsp;</td>
                              <td><div align="center"> 
							  <!--페이징 처리 클래스 끝-->
																		<img src="/ngs/images/common/board_arrow_pre.gif" hspace="10" border="0" align="absbottom">
										|1|
										<img src="/ngs/images/common/board_arrow_next.gif" hspace="10" border="0" align="absbottom">
															  <!--페이징 처리 클래스 끝-->
                                </div></td>
                              <td width="200">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="9"></td>
                </tr>
                <tr> 
                  <td align="right"><img src="/ngs/images/common/btn_renewal.gif" width="39" height="27" class="Cursor_Hand" onClick="allRefresh();"> 
                    <img src="/ngs/images/common/btn_work_regist.gif" width="83" height="27" class="Cursor_Hand" onClick="javascript:location.href='job_reg.php'"></td>
                </tr>
                <tr> 
                  <td height="40">&nbsp;</td>
                </tr>
              </table>
            </form>
			</td>
          <td width="30">&nbsp;</td>
        </tr>
    </table></td>
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
</body>
</html>
