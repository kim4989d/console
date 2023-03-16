<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script language="JavaScript" src="/ngs/comm/js/Calendar2.js"></script>
<script language="JavaScript" src="/ngs/comm/js/common.js"></script>
<script language="JavaScript" src="/ngs/comm/js/find1.js"></script>
<script language="javascript">
	function dbclick(){ 
        if(event.button==1) alert("현재 처리중입니다."); 
    } 
	function allRefresh()
	{
		window.parent.frames["topFrame"].location.reload();		
		window.parent.frames["leftFrame"].location.reload() ;
		window.parent.frames["mainFrame"].location.reload();
	
	}
function go_connM(svc_id,sys_id,falg)
{
		upLoad.style.visibility = "visible";
		HiddenFrame.location.href='../equipment/system_conn.php?i='+svc_id+"&k="+sys_id+"&f="+falg;
		document.onmousedown=dbclick; 
		return;
}
	function logview(va1,val2)
	{
			upLoad.style.visibility = "visible";
			HiddenFrame.location.href='logview.php?flag=1&p='+va1+"&f="+val2;
			document.onmousedown=dbclick; 
	}

var newPoup;    // 전역변수로 선언한 뒤...
	function newWin(val)
	{
	var url="../user/user_edit.php?uid="+val+"&g=job"
	var re = "toolbar=no, resizable=no,scrollbars=auto, status=0,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=903, height=486, top=100, left=50";
    if (newPoup != null)     newPoup.close();
	newPoup=window.open(url, 'new', re);
	}
	function SessionKill(val)
	{
		upLoad.style.visibility = "visible";
		document.onmousedown=dbclick; 
		setTimeout("window.parent.parent.frames['topFrame1'].TEST("+val+")",10); 
		return;
		//window.parent.parent.frames["topFrame1"].TEST(val);

	}

    function SetScrollPos(tagDIV)
    {
        var positionTop = 0;
        if (tagDIV != null)
        {
            positionTop = parseInt(tagDIV.scrollTop, 10);
            document.getElementById("SAMPLE_TABLE").style.top = positionTop;
        }
    }
	function user_sort(val,val1,val2)
	{
		var sort_value;
		var sort_name;

		sort_name =  look.sort_name.value;
		sort_value =  look.sort_value.value;
		if (val == sort_name) 
		{	
			if (sort_value == 0) {
				sort_value = 1;
			}
			else  sort_value = 0;
		}
		else
		{
			sort_value = 0;
		}
		location.href=val2+'.php?o='+val+"&s="+sort_value+"&div="+val1+"&page="+1+""
	}

</script>
</head>
<body>
<table id="upLoad" cellspacing="1" cellpadding="1" width="128" border="0" style ="Z-INDEX: 100; WIDTH: 129px; POSITION: absolute; HEIGHT:34px; left: 294px; top: 211px; visibility: hidden;" >
  <tr> 
    <td class ="" id="tblWait" style="Z-INDEX: 300"><img src="../images/common/Waiting.gif" alt="처리중입니다." name="imgWaiting"  width="125" height="30" border="0" id="imgWaiting" style="LEFT: 1px; CURSOR: wait;">	
    </td>
  </tr>
  </table>
<form name="look" method="post" action="working_list.php">
<input type="hidden" name="div" value="" >
<input type="hidden" name="sort_name" value="logintime" >
<input type="hidden" name="sort_value" value="0" >
<table width="762" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30">&nbsp;</td>
          <td width="702" height="500" valign="top"><table width="702" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="44" valign="top"><img src="/ngs/images/content_title/title_service5.gif" width="136" height="25"></td>
              </tr>
              <tr>
                <td height="1" bgcolor="#aaaaaa"></td>
              </tr>
                  <tr>
                    <td height="1" ></td>
                  </tr>
              <tr>
                <td valign="top">
				<table width="702" border="0" cellspacing="0" cellpadding="0">
				  <tr>
                    <td width="60" align="center"><img src="../images/common/search_01.gif" width="44" height="12"></td>
                    <td width="642"><table width="642" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td background=""></td>
                        <td align="center" bgcolor="c5c5c5"><table width="632" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="center"><select name="key" class="InputLIneGraySearch">
                                  <option value="name" seleted>사용자이름</option>
                                  <option value="user_id">사용자ID</option>
                                </select>
                              </td>
                              <td><input name="find" type="text" class="InputLIneGraySearch" size="12"></td>
                              <td align="center"><select name="key1" class="InputLIneGraySearch">
                                  <option value="system_name">시스템이름</option>
                                  <option value="host_id">시스템ID</option>
                              </select></td>
                              <td><input name="find1" type="text" class="InputLIneGraySearch" size="12"></td>
                              <td width="46" align="right"><img src="../images/common/header_date.gif" width="37" height="10" hspace="5"></td>
                              <td><input name="cal1" type="text" class="InputLIneGraySearch" id="cal1" size="10" readonly></td>
                              <td><img src="../images/common/zoom.gif" width="19" height="19" hspace="3" class="Cursor_Hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');"></td>
                              <td width="14" align="center" class="bold">~</td>
                              <td><input name="cal2" type="text" class="InputLIneGraySearch" id="cal2" size="10" readonly></td>
                              <td><img src="../images/common/zoom.gif" width="19" height="19" hspace="3" class="Cursor_Hand" onClick="popUpCalendar(this, cal2, 'yyyy/mm/dd');"></td>
                              <td width="40"><img src="../images/common/search_btn_ok.gif" width="40" height="20" class="Cursor_Hand" onClick="gaja();"></td>
                            </tr>
                        </table></td>
                        <td background=""></td>
                      </tr>

                    </table></td>
                  </tr>
                </table>
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
				  <div id="SAMPLE_DIV" style="width:100%px; height:421px; overflow-y: auto;"  onScroll="SetScrollPos(this);">
				    <table width="702" border="0" cellpadding="0" cellspacing="0" id="SAMPLE_TABLE"  style="position: absolute; left: 0px; top: 0px; z-index: 10;">
                    <tr class="TableBgBold"> 
                      <td width="54" class="TableBg"></td>
                      <td width="100" class="TableBg"><a href="#" onClick="user_sort('name','','working_list');">사용자이름</a> </td>
					  <td width="80" class="TableBg"><a href="#" onClick="user_sort('user_id','','working_list');">사용자ID</a> </td>
                      <td width="80" class="TableBg"><a href="#" onClick="user_sort('service_id','','working_list');">서비스ID </td>
					  <td class="TableBg"><a href="#" onClick="user_sort('host_id','','working_list');">접속시스템</a> </td>
                      <td width="110" class="TableBg"><a href="#" onClick="user_sort('logintime','','working_list');">로그인 시간</a> <img src='../images/common/arrow_up.jpg' align='absmiddle'></td>
                      <td width="100" class="TableBg"><a href="#" onClick="user_sort('charger_id','','working_list');">담당자</a></td>
                      <td class="TableBg"><a href="#" onClick="user_sort('ostype','','working_list');">장비구분</a> </td>
					  <td width ="41" class="TableBg">구분</td>
                    </tr>
				   </table>
				 <table width="702" border="0" cellpadding="0" cellspacing="0">
                    <tr class="TableBgBold"> 
                      <td width="54" class="TableBg"></td>
                      <td width="100" class="TableBg">사용자이름</td>
					  <td width="80" class="TableBg">사용자ID</td>
                      <td width="80" class="TableBg">서비스ID</td>
					  <td class="TableBg">접속시스템</td>
                      <td width="110" class="TableBg">로그인 시간</td>
                      <td width="100" class="TableBg">담당자</td>
                      <td class="TableBg">장비구분</td>
  					  <td width ="41"class="TableBg">구분</td>
                    </tr>
                  <!--/table></td>
              </tr>
              <tr> 
                <td> <table width="702" border="0" cellpadding="0" cellspacing="0"-->
                    <tr> 
                      <td  class="TableBgText"><img src="../images/common/btn_s_monitering.gif" class="cursor_hand" onClick="go_connM('test_svr','NGS3WEB','W');"></td>
                      <td class="TableBgText">MC센터</td>
                      <td class="TableBgText"><a href="#" onClick="blur();newWin('');">ngsadmin</a></td>
                      <td class="TableBgText">test_svr</td>
                      <td class="TableBgText">NGS3WEB</td>
                      <td class="TableBgTextDate">2008-11-30 14:43:10</td>
                      <td class="TableBgText">MC센터</td>
                      <td class="TableBgText">
						                            <img src="../images/board/nt.gif"> 
                          					  
					  </td>
						<td  class="TableBgText"><a href="#" onClick="SessionKill('3505')"><img src="../images/common/btn_session_off.gif" class="cursor_hand" border="0"></a></td>
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
                <td align="right"><img src="../images/common/btn_renewal.gif" width="39" height="27" hspace="4"  class="Cursor_Hand" onclick="javascript:allRefresh()"><img src="../images/common/btn_excel.gif" width="39" height="27" class="Cursor_Hand" onclick="javascript:location.href='working_list_excel.php?div=&f=working_list'"></td>
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
</FORM>
<iframe name="HiddenFrame" width="1" height="0" id="HiddenFrame"  scrolling="no"   FRAMEBORDER="0"></iframe>
</body>
</html>
