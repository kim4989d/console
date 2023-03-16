<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv=Cache-Control content=No-Cache>
<meta http-equiv=Pragma	content=No-Cache>
<title>▒ NGS ▒ NGS WEB SOLUTION ▒</title>
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
<Script Language="JavaScript" src="../comm/js/find.js"></Script>
<script language="JavaScript" src="../comm/js/common.js"></script>
<script language="javascript">
var newPoup;    // 전역변수로 선언한 뒤...
function allRefresh()
{
	window.parent.frames["topFrame"].location.reload();
	window.parent.frames["leftFrame"].location.reload();
	window.parent.frames["mainFrame"].location.reload();
	
}
function dbclick(){ 
        if(event.button==1) alert("현재 처리중입니다."); 
    } 
function go_connM(svc_id,sys_id,falg,host_id,dec_id)
{
	if (confirm(dec_id+"에 접속 하시겠습니까?\n\n모든작업은 감시되고 있습니다."))
	{
		upLoad.style.visibility = "visible";

		var form= document.enc;
		form.i.value=svc_id;
		form.k.value=sys_id;
		form.f.value=falg;
		form.h.value=host_id;

		form.method="post";
		form.target="HiddenFrame";
		form.action="system_conn.php";
		form.submit();
		//location.href='system_conn.php?i='+svc_id+"&k="+sys_id+"&f="+falg+"&h="+host_id;
		document.onmousedown=dbclick; 
		return;
	}
	return;
}
	function newWin(val,act,count)
	{
		var val;
		var act;
		var Equipment;
		var count = Number(count)
		if (act=="insert")	
		{ 
			var url="system_reg.php?div="+val
			//iEquipment = window.parent.parent.frames['topFrame1'].CHECK_COUNT()
			/*if (Equipment != 0)
			{
				alert("라이센스를 발급 받아야 사용 할 수 있습니다!");
				return;
			}
			else if(Number(Equipment) < Number(count+1))
			{
				alert("현재 사용하시는 라이센스는"+Equipment+"개의 장비를 등록 할 수 있습니다.\n\n추가 장비를 등록 하시려면 라이센스를 재 발급 받아 주세요!");
				return;			
			}*/

		}
		else if (act=="edit")	var url="system_edit.php?s="+val
		var re = "toolbar=no, resizable=0,scrollbars=auto, status=1,location=no, resize=0, menubar=no, directories=no, copyhistory=0, width=503, height=445,top=200, left=370";
		 if (newPoup != null)     newPoup.close();
			newPoup=window.open(url, 'sys', re);
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
		location.href=val2+'.php?o='+val+"&s="+sort_value+"&div="+val1+"&page="+1;
	}
</script>
</head >
<body>
    <OBJECT ID="NGSinstall" CLASSID="CLSID:1A4C2D5D-C371-41B9-AE59-8FD63E36DE6A" codebase="http://203.236.30.55/ngs4/ActiveX/NGSInstall.cab#Version=1,0,3,3" width="1" height="1">
         <param name="Name" value="NGS">   
         <param name="Region" value="BRV4">
         <param name="Ver" value="17">
         <param name="IP" value="203.236.30.55">
         <param name="Port" value="80">
         <param name="Dir" value="/install/">
         <param name="RunName" value="">     
         <param name="RunParam" value="">
         <param name="SvrVerName" value="SvrInfo.txt">
         <param name="LocVerName" value="LocInfo.txt">
	 <param name="DebugFile" value="0">
</OBJECT>
 <SCRIPT for="QMSInstall" event="Result(code)" language="JavaScript">
       //alert('QMSInstallConversion - ' + code);
       // 0:설치 실패, 1:설치 성공, 2:이미 설치되었음(변경사항이 없다는 의미)
       if(code=="1" ) 
	   {
			location.href='system_svc_list.php'
	   }
</script>
<body>
<form name="enc" method="post">
	<input type="hidden" name="i">
	<input type="hidden" name="k">
	<input type="hidden" name="f">
	<input type="hidden" name="h">
</form>
<div id="upLoad" style="position:absolute; left:350; top:200; width:125px; height:30px; z-index:0; visibility: hidden;">
<img src="../images/common/Waiting.gif" border="0"></div>
<form name="look" method="post" action="system_svc_list.php">
<input type="hidden" name="div" value="ALL" >
	<input type="hidden" name="sort_name" value="system_id" >
	<input type="hidden" name="sort_value" value="0" >
<table width="762" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30">&nbsp;</td>
          <td width="702" height="500" valign="top">
		   <table width="702" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="44" valign="top"><img src="../images/content_title/title_service13.gif" width="136" height="25"></td>
              </tr>
              <tr>
                <td height="1" bgcolor="#aaaaaa"></td>
              </tr>
			  <tr>
				<td height="1" ></td>
			  </tr>
              <tr>
                  <td valign="top"><table width="702" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="90" align="center"><img src="" width="44" height="12"></td>
                        <td> <table width="612" border="0" cellspacing="0" cellpadding="0">


                            <tr> 
                              <td background="../images/common/search_line02.gif"></td>
                              <td bgcolor="c5c5c5"><table width="344" border="0" align="right" cellpadding="0" cellspacing="0">
                                  <tr> 
                                    <td align="right"> <select name="key" class="InputLIneGraySearch">
                                        <option value="host_id" selected>시스템ID</option>
                                        <option value="system_name">시스템이름</option>
                                      </select> &nbsp; <input name="find" type="text" class="InputLIneGraySearch" size="20" maxlength="20"></td>
                                    <td width="56" align="right"><img src="../images/common/search_btn_ok.gif" width="40" height="20" hspace="3" class="Cursor_Hand" onClick="JavaScript:gaja();"></td>
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
                        <td background="../images/common/search_page_03.gif">
						<table border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td class="T11PgaeNum" align="center">총 19</td>
                              <td width="10"></td>
                              <td class="T11PgaeNum" align="center">페이지 1/1</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                  </tr>
              <tr> 
                <td>
				  <div id="SAMPLE_div" style="width:100%px; height:421px; overflow-y: auto;"  onScroll="SetScrollPos(this);">
				    <table width="702" border="0" cellpadding="0" cellspacing="0" id="SAMPLE_TABLE"  style="position: absolute; left: 0px; top: 0px; z-index: 10;">
                    <tr class="TableBgBold"> 
					   <td width="50"  class="TableBg">관리</td>
                      <td width="180" class="TableBg"><a href="#" onClick="user_sort('system_id','ALL','system_svc_list');">시스템 ID</a>  <img src='../images/common/arrow_up.jpg' align='absmiddle'></td>
					  <td width="" class="TableBg"><a href="#" onClick="user_sort('service_id','ALL','system_svc_list');">서비스 ID</a> </td>
                      <td width="90" class="TableBg">IP</td>
					  <td width="90" class="TableBg">등록일</td>
                      <td width="80" class="TableBg"><a href="#" onClick="user_sort('ostype','ALL','system_svc_list');">장비구분</a> </td></td>
                    </tr>
				   </table>				     
					 <table width="702" border="0" cellpadding="0" cellspacing="0">
                      <tr class="TableBgBold"> 
                        <td width="50" class="TableBg">관리</td>
                        <td width="180" class="TableBg">시스템 ID</td>
                        <td width="" class="TableBg">서비스 ID</td>
                        <td width="90" class="TableBg">IP</td>
                        <td width="90" class="TableBg">등록일</td>
                        <td width="80" class="TableBg">장비구분</td>
                      </tr>
                    <!--/table></td>
              </tr>
              <tr> 
                <td> <table width="702" border="0" cellpadding="0" cellspacing="0"-->
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NjIINDgIMzkINDkIMjgINTkINjgINjYI','MTI3CDEwMggzNQgxMTII', 'MzEI','NjIINDgIMzkINDkI','53w5')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('53w5','edit','');">test</a></td>
                        <td class="TableBgText">test_svr</td>
                        <td class="TableBgTextDate"><div align="left">124.123.124.123</div></td>
                        <td class="TableBgTextDate">08/12/10</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','MAg0OAg1OAg0NAgzNwg0Ngg4Nwg2NggyNAgxMTgIMzAIMTI0CA==', 'MjkI','MAg0OAg1OAg0NAgzNwg0Ngg4Nwg2NggyNAgxMTgIMzAIMTI0CA==','Jeniffer(NT)')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('Jeniffer(NT)','edit','');">Jeniffer(NT)</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.206.244</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/nt.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','MAg0OAg1OAg0NAgzNwg0Ngg4Nwg2NggxCA==', 'MzEI','MAg0OAg1OAg0NAgzNwg0Ngg4Nwg2NggxCA==','Jeniffer1')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('Jeniffer1','edit','');">Jeniffer1</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.200.249</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','MAg0OAg1OAg0NAgzNwg0Ngg4Nwg2NggyCA==', 'MzEI','MAg0OAg1OAg0NAgzNwg0Ngg4Nwg2NggyCA==','Jeniffer2')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('Jeniffer2','edit','');">Jeniffer2</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.200.250</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NDgINDcI','Nwg3CDAIMgg=', 'MzEI','Nwg3CDAIMgg=','MRTG')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('MRTG','edit','');">MRTG</a></td>
                        <td class="TableBgText">zz</td>
                        <td class="TableBgTextDate"><div align="left">192.168.206.19</div></td>
                        <td class="TableBgTextDate">08/10/13</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NjIINDgIMzkINDkIMjgINTkINjgINjYI','NAgxOAg3CDExOAgyMAgxMwgxMTII', 'MjkI','NAgxOAg3CDExOAgyMAgxMwgxMTII','NGS3WEB')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('NGS3WEB','edit','');">NGS3WEB</a></td>
                        <td class="TableBgText">test_svr</td>
                        <td class="TableBgTextDate"><div align="left">203.236.30.56</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/nt.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','NAgyOAgyNQgyMgg=', 'MzEI','NAgyOAgyNQgyMgg=','NIMS')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('NIMS','edit','');">NIMS</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.206.249</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NDgINDcI','NDAIMzMINDkINTQINTUIMTIxCA==', 'MzEI','NDAIMzMINDkINTQINTUIMTIxCA==','btest1')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('btest1','edit','');">btest1</a></td>
                        <td class="TableBgText">zz</td>
                        <td class="TableBgTextDate"><div align="left">192.168.201.25</div></td>
                        <td class="TableBgTextDate">08/06/20</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NDgINDcI','NDAIMzMINDkINTQINTUIMTIyCA==', 'MzEI','NDAIMzMINDkINTQINTUIMTIyCA==','btest2')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('btest2','edit','');">btest2</a></td>
                        <td class="TableBgText">zz</td>
                        <td class="TableBgTextDate"><div align="left">192.168.200.229</div></td>
                        <td class="TableBgTextDate">08/06/20</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','NDcINTIIMzkINjAINDYIMzkIOTIIMQg=', 'MzEI','NDcINTIIMzkINjAINDYIMzkIOTIIMQg=','easymon1')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('easymon1','edit','');">easymon1</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.200.57</div></td>
                        <td class="TableBgTextDate">08/06/12</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','NDcINTYINTUIMzIIMzkIMzcI', 'MzEI','NDcINTYINTUIMzIIMzkIMzcI','emcedm')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('emcedm','edit','');">emcedm</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.202.96</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','MzUINTkINTAINDIINDMINjEIODAI', 'MzEI','MzUINTkINTAINDIINDMINjEIODAI','infohub')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('infohub','edit','');">infohub</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.201.155</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','MzkINTQINTkINDMINDYIMTIxCA==', 'MzEI','MzkINTQINTkINDMINDYIMTIxCA==','mconm1')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('mconm1','edit','');">mconm1</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.200.57</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','MzkINTQINTkINDMINDYIMTIyCA==', 'MzEI','MzkINTQINTkINDMINDYIMTIyCA==','mconm2')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('mconm2','edit','');">mconm2</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.200.58</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','MzkINTQIMzIIMzIINDgINjAI', 'MzEI','MzkINTQIMzIIMzIINDgINjAI','mctest')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('mctest','edit','');">mctest</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">192.168.201.130</div></td>
                        <td class="TableBgTextDate">07/10/19</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NjIINDgIMzkINDkIMjgINTkINjgINjYI','NjIINDgIMzkINDkIMjgINTkINjkI', 'MzEI','NjIINDgIMzkINDkIMjgINTkINjkI','test_sw')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('test_sw','edit','');">test_sw</a></td>
                        <td class="TableBgText">test_svr</td>
                        <td class="TableBgTextDate"><div align="left">220.103.231.2</div></td>
                        <td class="TableBgTextDate">08/12/11</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NDgINDcI','NjIINDgIMzkINDkIMjgINjMIODcIODIIMQg=', 'MzEI','NjIINDgIMzkINDkIMjgINjMIODcIODIIMQg=','test_web1')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('test_web1','edit','');">test_web1</a></td>
                        <td class="TableBgText">zz</td>
                        <td class="TableBgTextDate"><div align="left">172.18.181.249</div></td>
                        <td class="TableBgTextDate">08/05/29</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','NjIINTYINjIIMzIIMTE0CA==', 'MzEI','NjIINTYINjIIMzIIMTE0CA==','tmje1')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('tmje1','edit','');">tmje1</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">172.18.184.251</div></td>
                        <td class="TableBgTextDate">08/06/12</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                      <tr> 
                        <td class="TableBgText"><img src="../images/common/btn_s_contact.gif" width="42" height="17" align="absmiddle" class="cursor_hand" onClick="javascript:go_connM('NQgxMjIIMjUI','NjIINTYINjIIMzIIMTEzCA==', 'MzEI','NjIINTYINjIIMzIIMTEzCA==','tmje2')"> 
                        </td>
                        <td class="TableBgText"><a href="#" onClick="blur();newWin('tmje2','edit','');">tmje2</a></td>
                        <td class="TableBgText">O/M</td>
                        <td class="TableBgTextDate"><div align="left">172.18.184.252</div></td>
                        <td class="TableBgTextDate">08/06/12</td>
                        <td  class="TableBgText">                          
						                            <img src="../images/board/unix.gif"> 
                          </td>
                      </tr>
                    </table></td>
              </tr>
              <tr> 
                <td><table width="702" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="35" background="../images/service/table_under_bg.gif"> 
                        <table width="702" border="0" cellspacing="0" cellpadding="0">
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
                <td align="right"><img src="../images/common/btn_renewal.gif" width="39" height="27" hspace="4"  class="Cursor_Hand" onclick="javascript:allRefresh()"><img src="../images/common/btn_excel.gif" width="39" height="27" class="Cursor_Hand" onclick="javascript:location.href='system_list_excel.php?div=ALL&f=system_list'"><img src="../images/common/btn_machine.gif" width="61" height="27" hspace="4" class="Cursor_Hand" onclick="javascript:newWin('ALL','insert','345')"></td>
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
          <td<table width="762" border="0" cellspacing="0" cellpadding="0">
</table>
</td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<iframe name="HiddenFrame" width="1" height="0" id="HiddenFrame"  scrolling="no"   FRAMEBORDER="0"></iframe>
</body>
</html>
