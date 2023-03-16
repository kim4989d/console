<%@ page language="java" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv=Cache-Control content=No-Cache>
<meta http-equiv=Pragma	content=No-Cache>
<title>ngs</title>
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
<link href="../comm/css/default.css" rel="stylesheet" type="text/css">
<link href="../comm/css/Form.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../comm/js/submenu.js"></script>
<Script Language="JavaScript" src="../comm/js/find.js"></Script>
<script language="JavaScript" src="http://ngs3.nate.com/ngs4/comm/js/url_check.js"></script>
<script language="javascript">
function dbclick(){ 
        if(event.button==1) alert("현재 처리중입니다."); 
    } 
function allRefresh()
	{
		window.parent.frames["topFrame"].location.reload() ;
		window.parent.frames["leftFrame"].location.reload() ;
		window.parent.frames["mainFrame"].location.reload();
	
	}
function go_connM(svc_id,sys_id,CONN_TYPE,flag,sid)
{
	if (confirm(sid+"에 접속 하시겠습니까?\n\n모든작업은 감시되고 있습니다."))
	{
		upLoad.style.visibility = "visible"
		HiddenFrame.location.href='system_conn.php?i='+svc_id+"&k="+sys_id+"&c="+CONN_TYPE+"&h="+flag
		document.onmousedown=dbclick; 
		return;
	}
	return;
}
function system_serch(val1,val2,val3,val4,val5)
{
	
	form.service_id.value = val2
	form.system_id.value = val3
	form.conn_type.value = val4
	form.flag.value = val5

	form.target="HiddenFrame";
	form.action="user_win_system_check.php";
	upLoad.style.visibility = "visible"
	form.submit();

	
}
	function system_change(val1,val2,val3,val4)
	{
		if (confirm("장비접속 방법을 접속별 접속으로 변경 하시겠습니까?"))
	{
			HiddenFrame.location.href="change_system.php?svc_id="+val1+"&sys_id="+val2
			}
			else  return;	
	}
function system_date_add(val1,val2)
{
	if (confirm("시스템 접속 연장 신청을 하시겠습니까?"))
		newWin1(val1,val2)
		else  return;
}
var newPoup;    // 전역변수로 선언한 뒤...
function newWin(val,act)
	{
		var val;
		var act;
		if (act=="equi"){	
		var url="svc_reg.php?i="+val
			var w=501;
			var h=390;
		}
		else if (act=="edit")	{
		var url="user_edit.php?i="+val
			var w=500;
			var h=390;		
		}
		
		var re = "toolbar=no, resizable=yes,scrollbars=auto, status=no,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width="+w+", height="+h+", top=200, left=370";
		
		if (newPoup != null)     newPoup.close();
		newPoup=window.open(url, 'new', re);
	}

	if (document.layers){
		document.captureEvents(Event.MOUSEMOVE);
	}
function newWin1(val1,val2,val3)
	{

		var w=501;
		var h=247;	
		var url ="extension_date.php?svc_id="+val1+"&sys_id="+val2+"&h_id="+val3;
		
		var re = "toolbar=no, resizable=no,scrollbars=no, status=0,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width="+w+", height="+h+", top=200, left=370";
		newPoup=window.open(url, 'new', re);
	}
		if (document.layers){
		document.captureEvents(Event.MOUSEMOVE);
	}
    function SetScrollPos(tagdiv)
    {
        var positionTop = 0;
        if (tagdiv != null)
        {
            positionTop = parseInt(tagdiv.scrollTop, 10);
            document.getElementById("SAMPLE_TABLE").style.top = positionTop;
        }
    }
	document.onmousemove=handlerMM;
	window.onload=initiate;
</script>

</head>
<body onclick="body_click();">
<div id="upLoad" style="position:absolute; left:350; top:200; width:125px; height:30px; z-index:0; visibility: hidden;"> 
  <img src="../images/common/Waiting.gif" width="125" height="30" border="0"></div>
<div id="empty_layer" style="width:0px; height:18px; position:absolute; left:0px; top:0px; z-index:1; visibility:hidden;">
   <p></p>
</div>
<table id='menu_id_layer' style="position:absolute; width:120; cursor:hand; left:0px; top: 0px; visibility: hidden;">
	<tr>
		<td bgcolor="#DBDBDB">
			<table width=100% cellspacing="1" cellpadding="2" border=0 bgcolor="#ffffff">
				<tr onMouseover="this.className='menu_m_over'" onMouseout="this.className='menu_m_out'">
					<td onclick="javascript:go_link(form.service_id.value,form.system_id.value,form.conn_type.value,form.flag.value)">작업내역등록</td>
				</tr>
				<tr>
					<td height="1" bgcolor="#CCCCCC"></td>
				</tr>
				<tr onMouseover="this.className='menu_m_over'" onMouseout="this.className='menu_m_out'">
					<td onclick="javascript:go_conn(form.service_id.value,form.system_id.value,form.conn_type.value,form.flag.value)">장비 접속</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="762" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<form name="form" method="post" class="form">
		<input type="hidden" name="service_id">
		<input type="hidden" name="system_id">
		<input type="hidden" name="conn_type">
		<input type="hidden" name="flag">
		<input type="hidden" name="host_id">
	</form>	
	<table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30">&nbsp;</td>
          <td width="702" height="500" valign="top"><table width="702" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="44" valign="top"><img src="../images/content_title/title_service13.gif" width="136" height="25" align="absmiddle"></td>
              </tr>
              <tr>
                <td height="1" bgcolor="#aaaaaa"></td>
              </tr>
                  <tr>
                    <td height="1" ></td>
                  </tr>
			  <tr>
				<td>
					<form name="look" method="post" class="form">
				   <table width="702" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="90" align="center"><img src="../images/common/search_01.gif" width="44" height="12"></td>
                        <td>
						  <table width="612" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                            </tr>
                            <tr> 
                              <td background=""></td>
                              <td bgcolor="c5c5c5"><table width="344" border="0" align="right" cellpadding="0" cellspacing="0">
                                  <tr> 
                                    <td align="right"> <select name="key" class="InputLIneGraySearch">
                                        <option value="host_id" selected>호스트 ID</option>
                                        <option value="system_name" >호스트 NAME</option>
                                      </select> &nbsp; <input name="find" type="text" class="InputLIneGraySearch" size="20" maxlength="20"></td>
                                    <td width="56" align="right"><img src="../images/common/search_btn_ok.gif" width="40" height="20" hspace="3" class="Cursor_Hand" onClick="JavaScript:gaja();"></td>
                                  </tr>
                                </table>
								</td>
                              <td background=""></td>
                            </tr>
                          </table>
						  </td>
                      </tr>
                    </table>
					</form>
				</td>
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
                        <td background="../images/common/search_page_03.gif">
						<table border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td class="T11PgaeNum" align="center">총 1</td>
                              <td width="10"></td>
                              <td class="T11PgaeNum" align="center">페이지 1/1</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
               </tr>
              <tr>
                <td>
	 			<div id="SAMPLE_div" style="width:100%px; height:495px; overflow-y: auto;"  onScroll="SetScrollPos(this);">
				<table width="702" border="0" cellpadding="0" cellspacing="0" id="SAMPLE_TABLE"  style="position: absolute; left: 0px; top: 0px; z-index: 10;">
                    <tr class="TableBgBold"> 
                      <td width="50" class="TableBg">관리</td>
					  <td width="180" class="TableBg"><strong>서비스명</strong></td>
                      <td width="120" class="TableBg"><strong>호스트ID</strong></td>
                      <td width="" class="TableBg"><strong>호스트명</strong></td>
                      <td width="120" class="TableBg">접속만료일</td>
                      <td width="70" class="TableBg">장비구분</td>
                    </tr>
                  </table>
				<table width="702" border="0" cellpadding="0" cellspacing="0">
                    <tr class="TableBgBold"> 
                      <td width="50" class="TableBg">관리</td>                      
					  <td width="180" class="TableBg"><strong>서비스명</strong></td>
                      <td width="120" class="TableBg"><strong>호스트ID</strong></td>
                      <td width="" class="TableBg"><strong>호스트명</strong></td>
                      <td width="120" class="TableBg">접속만료일</td>
                      <td width="70" class="TableBg">장비구분</td>
                    </tr>
                    <tr> 
                      <td width="50" class="TableBgText">                        <a href="javascript:system_serch('menu_id_layer','NjIINDgIMzkINDkIMjgINTkINjgINjYI','NAgxOAg3CDExOAgyMAgxMwgxMTII','C','W')"><img src="../images/common/btn_s_contact.gif" width="42" height="17" border="0" class="cursor_hand" ></a>
              </div>
                      </td>
					  <td width="180" class="TableBgText">test_svr</td>
                      <td width="120" class="TableBgText">NGS3WEB</td>
                      <td width="" class="TableBgText">NGS3 Web Server</td>
                      <td width="120" class="TableBgText">                        N/A                        </td>
                      <td width="70" class="TableBgText"><img src="../images/board/nt.gif"></td>
                    </tr>
                  </table>
				  </div>
				  </td>
              </tr>
              <tr>
                <td><table width="702" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="35" background="../images/service/table_under_bg.gif"><table width="702" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="43">&nbsp;</td>
                              <td><div align="center">
							  <!--페이징 처리 클래스 끝-->
								 <img src='/ngs/images/common/board_arrow_pre.gif' hspace='10' border='0' align='absbottom'>  |<b><font color=red>1</font></b>|  <img src='/ngs/images/common/board_arrow_next.gif' hspace='10' border='0' align='absbottom'> 							  <!--페이징 처리 클래스 끝-->										  
								  </div></td>
                              <td width="43">&nbsp;</td>
                            </tr>
                          </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
              <tr>
                  <td align="right"><img src="../images/common/btn_renewal.gif" width="39" height="27" hspace="4"  class="Cursor_Hand" onclick="javascript:allRefresh()"><img src="../images/common/btn_machine.gif" width="61" height="27" class="Cursor_Hand" onClick="blur();newWin('usertest','equi');"></td>
              </tr>
              <tr>
                <td height="40">&nbsp;</td>
              </tr>
          </table></td>
          <td width="30">&nbsp;</td>
        </tr>
    </table>
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
<iframe name="HiddenFrame" width="1" height="0" id="HiddenFrame"  scrolling="no"   FRAMEBORDER="0"></iframe>
</body>
</html>

