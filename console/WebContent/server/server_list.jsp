<!--
===============================================================
					서비스 장비 목록 페이지  
===============================================================
-->
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ page import="console.common.util.Util"%>
<%@ include file="/common/common.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%
  
	String kind2=request.getParameter("kind");


	System.out.println("kind2@@@@@@@"+kind2);


int           ServerListCount         = 0;
	String enc_service_id 		= "";   	 //($service_id, $key_code);
	String enc_system_id  		= "";	 	 //EnCode($system_id, $key_code);
	String enc_OSTYPE     		= "";        //EnCode($OSTYPE, $key_code);
	String enc_host_id    		= "";   	 //EnCode($host_id, $key_code);
	String pageNum		  		= "";        //페이지 넘버 
	String div  		  		= "";		 //left 메뉴 값 
	String str_order      		= "";		 // 검색 타입 조건 1일 경우 desc 
	String str_value      		= "";		 // 검색 타입 조건 1일 경우 desc
//	Tray          reqTray       = null;
    ResultSetTray server_List   = null;   	 //
    String	checkbox			= "";        // select box 값 
    
    
    checkbox	=	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
		server_List = (ResultSetTray)request.getAttribute("rsTray");
		ServerListCount = server_List.getRowCount();
	}
%>
<%
	pageNum	 =	request.getParameter("page");	
	if (pageNum == "" || pageNum == null) { pageNum ="1";} 

	div 	= 	request.getParameter("div");		// left 메뉴 값 
	if (div == "" || div == null) div ="ALL";			
	
	str_order =	request.getParameter("o");			// 검색 타입 조건 1일 경우 desc 
	str_value =	request.getParameter("s");			// 검색 타입 조건 1일 경우 desc

	if (str_value =="") str_value="0";						
	if (str_order =="") str_order="system_id";
	if (str_value =="1") str_order = str_order+" desc";	
%>

<html>
<head>
<title>장비관리>사용장비 현황</title>
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
</head>
<script type="text/javascript"> 

function List(){
 	var frm=document.look;
 		frm.action="/server.do?cmd=server_list";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
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

 
var newPoup;

function newWin(val,act,count)
	{
		var val;
		var act;
		var Equipment;
		var count = Number(count)
		if (act=="insert")	
		{ 
			var url="system_reg.php?div="+val;
			Equipment = window.parent.parent.frames['topFrame1'].CHECK_COUNT();
			Equipment = 1000;
			if (Equipment== 0)
			{
				alert("라이센스를 발급 받아야 사용 할 수 있습니다!");
				return;
			}
			else if(Number(Equipment) < Number(count+1))
			{
				alert("현재 사용하시는 라이센스는"+Equipment+"개의 장비를 등록 할 수 있습니다.\n\n추가 장비를 등록 하시려면 라이센스를 재 발급 받아 주세요!");
				return;			
			}

		}
		else if (act=="edit")	var url="server.do?cmd=server_edit&system_id="+val
		var re = "toolbar=no, resizable=0,scrollbars=auto, status=0,location=no, resize=0, menubar=no, directories=no, copyhistory=0, width=503, height=445,top=200, left=370";
		 if (newPoup != null)     newPoup.close();
			newPoup=window.open(url, 'sys', re);
	}
	
function ExcelDown(){
 	var frm = document.listfrm;
 		frm.action="/server.do?cmd=exceldown";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
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
    
function ExcelDown(){
 	var frm = document.look;
 		frm.action="/server.do?cmd=exceldown&div='<%=div%>'&f=system_list";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
 		}
 
    
 
 
function Refresh()
{
//	test_code
//	window.alert();	
	window.document.location.reload();
}

function MM_openBrWindow(theURL,winName,features) { 					//작업등록 하기 
  window.open(theURL,winName,"toolbar=no, resizable=0,scrollbars=auto, status=1,location=no, resize=0, menubar=no, directories=no, copyhistory=0, width=503, height=480,top=200, left=370");
}
function user_sort(val,val1,val2,kind)
	{
		var sort_value;
		var sort_name;

		sort_name =  look.sort_name.value;
		sort_value =  look.sort_value.value;
		if (val == sort_name) 
		{	
			if (sort_value == '0') {
				sort_value = '1';
			}
			else  sort_value = '0';
		}
		else
		{
			sort_value = '0';
		}
		//alert("1231231");
		location.href=val2+'&o='+val+"&kind="+kind+"&s="+sort_value+"&div="+val1+"&page="+<%=pageNum%>;
	}
</script>
<body>
<div id="upLoad" style="position:absolute; left:350; top:200; width:125px; height:30px; z-index:0; visibility: hidden;">
<img src="../images/common/Waiting.gif" border="0"></div>
	<form name="enc" method="post">
		<input type="hidden" name="i">
		<input type="hidden" name="k">
		<input type="hidden" name="f">
		<input type="hidden" name="h">
	</form>
 <form name="look" method="post" action="server.do?cmd=server_list" >
 	<input type="hidden" name="div" value="<%=div%>" >
	<input type="hidden" name="uniq_id" >
	<input type="hidden" name="flag" value="0" >
	<input type="hidden" name="act" >	
	<input type="hidden" name="sort_name" value="<%=str_order%>">
	<input type="hidden" name="sort_value" value="<%=str_value%>">
	<input type="hidden" name="kind" value="<%=kind%>">
	
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
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>icon01.gif" align="absmiddle" /></td>
                        <td><img style="margin-right:15px"src="<%=DIR_IMG %>text_top_service4.gif" /></td>
                        <td class="MenuTopText">사용장비 현황 </td>
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
                        <td><%=checkbox%></td>
                        <td></td>
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
                        <col width="70">
						<col width="200">
                        <col width="200">
                        <col width="90">
						<col width="80">
						<col width="*">
                        </colgroup>
                        
                        <tr class="TableBgBold">
                        <td height="34" class="TableBg">관리</td>
                        <td class="TableBg"><a href="#" onClick="user_sort('system_id','<%=div%>','server.do?cmd=server_list','<%=kind%>');">시스템 ID</a><img  style="margin-left:3px"src="<%=DIR_IMG %>arrow_up.gif"></td>
                        <td class="TableBg"><a href="#" onClick="user_sort('service_id','<%=div%>','server.do?cmd=server_list','<%=kind%>');">서비스 ID</a><img  style="margin-left:3px"src="<%=DIR_IMG %>arrow_up.gif"></td>
                        <td class="TableBg">IP</td>
                        <td class="TableBg">등록일</td>
                        <td class="TableBg"><a href="#" onClick="user_sort('ostype','<%=div%>','server.do?cmd=server_list','<%=kind%>');">장비구분</a><img  style="margin-left:3px"src="<%=DIR_IMG %>arrow_up.gif"></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><div id="SAMPLE_DIV" style="height:312; overflow-y:scroll;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                         <colgroup>
                        <col width="70">
						<col width="200">
                        <col width="200">
                        <col width="90">
						<col width="80">
						<col width="*">
                        </colgroup>
                          <%
						if(ServerListCount==0){
					  %>
					 <tr><td colspan='4'>검색된 테이블이없습니다</td><tr>
					 <%}else{ 
					    for(int i=0;i<ServerListCount;i++){
					    	//$key_code = $cfg->GetValue("KEY_CODE"); 		  //암호화, 복호화 Key
					    	enc_service_id = server_List.get("service_id");   //($service_id, $key_code);
					    	enc_system_id  = server_List.get("system_id");	  //EnCode($system_id, $key_code);
					    	enc_OSTYPE     = server_List.get("ostype");       //EnCode($OSTYPE, $key_code);
					    	enc_host_id    = server_List.get("host_id");   	  //EnCode($host_id, $key_code);
					    	
					    	%>
					    	<tr>
                            <td class="TableBgText"><a href="#"><img src="<%=DIR_IMG %>btn_s_contact.gif" border="0" onClick="javascript:go_connM('<%=enc_service_id%>','<%=enc_system_id%>', '<%=enc_OSTYPE%>','<%=enc_host_id%>','<%=server_List.get("system_id",i) %>')"></a></td>
                            <td class="TableBgText"><a href="#" onClick="blur();newWin('<%=server_List.get("system_id",i)%>','edit','');"><strong><%=server_List.get("host_id",i)%></strong></a></td>
                            <td class="TableBgText"><%=server_List.get("service_id",i) %></td>
                            <td class="TableBgText"><%=server_List.get("system_ip",i) %></td>
                            <td class="TableBgTextDate">
                            <%=Util.DataFormat_yyMMdd( server_List.get("reg_dt",i) )%>
                            </td>
                            <td class="TableBgText">
                            	<%
				  			String ostype = server_List.get("ostype",i);
							if(ostype.equals("W")){%>
							<img src="<%=DIR_IMG %>nt_m.gif" style="margin-left:13px"align="absmiddle">
								<%}else{%>
							<img src="<%=DIR_IMG %>unix_m.gif" style="margin-left:13px"align="absmiddle"></td>
								<%
								}
					    	}%>
					    </tr>
						<% } %>
                        </table>
                      	</div>
                      </td>
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
            <b><font color="ff7635"><img src="<%=DIR_IMG %>btn_p1.gif" width="16" height="15" align="absmiddle" >&nbsp;1&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;2&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;3&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;4&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;5&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;6&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;7&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;8&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;9&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;10&nbsp;</font></b> <img src="<%=DIR_IMG %>btn_n2.gif" width="16" height="15" align="absmiddle"></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="29"></td>
          <td align="right" valign="top"><a href="#"><img style="margin-right:6px"src="<%=DIR_IMG %>btn_renewal.gif" onclick="javascript:Refresh();" ></a><a href="#"><img style="margin-right:6px"src="<%=DIR_IMG %>btn_excel.gif" onclick="javascript:ExcelDown();"></a><a href="#"><img src="<%=DIR_IMG %>btn_machine.gif" onClick="javascript:MM_openBrWindow('server.do?cmd=server_req','','')"></a></td>
          <td></td>
        </tr>
</table>
</form>
</body>
</html>