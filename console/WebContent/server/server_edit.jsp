<!--
===============================================================
					서비스 수정   페이지 
===============================================================
-->
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray" %>
<%@page import="java.util.StringTokenizer"%>
<%@ include file="/common/common.jsp"%>

<% 

    int           PortCount         = 0; //포트 번호
	int           ServiceCount      = 0; //소속서비스 
	int           ManagerCount      = 0; //담당자 
	int           VendorCount       = 0; //제조사 
	int           EditListCount     = 0; //수정할 목록 불러 오기
	int           NtPort            = 0; //포트 번호 불러 오기 
	
	String  os_type 	    = "";							  	// 장비 유형
	String  fixport         = "";	   						 	// 고정 아이피 
	String service_id_check = "";					 			// 아이디 체크값 
//	String user_id 	        = "";								// 사용자 아이디 
	String vendor_id 		= "";								// 회사 
	String port 			= "";           					// 포트 번호
	String Unix_port 		= "";      							// Unix 포트 번호 
	String[] system_ip 		= new String[10];					// 시스템 아이피 
	String system_id 		= request.getParameter("system_id");// system_id 받아 오기 

    ResultSetTray server_PortList    = null;  // 포트번호 불러 오기
    ResultSetTray server_ServiceList = null;  // 소속서비스 불러 오기 
    ResultSetTray server_ManagerList = null;  // 담당자 불러 오기 
    ResultSetTray server_VendorList  = null;  // 제조사 불러 오기 
    ResultSetTray server_EditList    = null;  // 수정할 목록 불러 오기  
    ResultSetTray server_NtPort      = null;  // 포트 번호 불러 오기 
    
    
    //String	checkbox="";
    // checkbox	=	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
		server_PortList    = (ResultSetTray)request.getAttribute("rsTray");    //포트 번호 불러 오기 
		PortCount 		   = server_PortList.getRowCount();
		
		server_ServiceList = (ResultSetTray)request.getAttribute("rsTray2");   //소속 서비스 불러 오기 
		ServiceCount 	   = server_ServiceList.getRowCount();
		
		server_ManagerList = (ResultSetTray)request.getAttribute("rsTray3");   // 담당자 불러 오기 
		ManagerCount 	   = server_ManagerList.getRowCount();
		
		server_VendorList  = (ResultSetTray)request.getAttribute("rsTray4");   // 제조사 불러 오기 
		VendorCount 	   = server_VendorList.getRowCount();
		
		server_EditList    = (ResultSetTray)request.getAttribute("rsTray5");   // 수정할 목록  불러 오기 
		EditListCount      = server_EditList.getRowCount();	  
		
		if(request.getAttribute("rsTray6") != null) 						   //port 값이 null 이면 실행 하지 않음 
		{
		server_NtPort = (ResultSetTray)request.getAttribute("rsTray6");        // 포트 번호 불러 오기 
		NtPort 		  = server_NtPort.getRowCount();	
		port 		  = server_NtPort.get("seqno"); 						   //포트 번호 불러 오기 
			}
		
		
		os_type 		 = server_EditList.get("ostype");                 	   // 장비 타입 
		fixport 		 = server_EditList.get("fixedflag");              	   // unix 고정 포트
		if(fixport.equals("") || fixport==null){fixport="";}				
	
		service_id_check = server_EditList.get("service_id");    	 		   //서비스 아이디 
		user_id 		 = server_EditList.get("user_id"); 	 		 		   //부여 아이디 
		vendor_id 		 = server_EditList.get("vendor_id");   	     		   //제조사 
		Unix_port 		 = server_EditList.get("port");				 		   //유닉스 포트 
	}
//	[system_ip           ]	123.123.123.123	
	
	StringTokenizer token = new StringTokenizer(server_EditList.get("system_ip"),".");
	for( int i = 0; token.hasMoreElements(); i++ ){
		system_ip[i] = token.nextToken(); 						 	 		   //시스템 ip분리 하기 
	}
	
%>
<html>
<head>
<!-- 팝업사이즈  500 * 426-->
<title>팝업_장비관리_시스템 등록</title>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
<META NAME="CONTENT-LANGUAGE" CONTENT="KR">
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
.style1 {	font-size: 11px
}
-->
</style>
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
<script language="JavaScript">
window.document.onload = document.form.system_id.focus();

function Form_check()
{
	var id_pattern = new RegExp('[^a-zA-Z0-9_]'); //아이디 패턴검사 정규식
	var temp=document.form;
	if (!temp.system_id.value.length || id_pattern.test(temp.system_id.value))
	 {
    	 alert("서비스ID는 영문자와 숫자, '_' 로 입력해 주세요.");
		 temp.system_id.value = "";
		 temp.system_id.focus();
		 return;
	 }
	else if(getByte(temp.system_id.value)>20)
	{
		alert("장비ID 20byte\n넘을 수없습니다.");
		form.system_id.focus();
		return;
	}
	var temp=document.form.system_name.value
	if(temp=="")
	{
		alert("시스템이름을 입력하세요!");
		form.system_name.focus();
		return;
	}
	if(getByte(temp)>20)
	{
		alert("시스템이름은 20byte\n넘을 수 없습니다.");
		form.system_name.focus();
		return;
	}

	var port_no=document.form.port_no;
	var win_port=document.form.win_port;
	
	if (document.form.os_type[0].checked == true)
	{
		var temp=document.form;
		if (temp.ip_addr1.value =="" || temp.ip_addr2.value=="" || temp.ip_addr3.value=="" || temp.ip_addr4.value=="")
		{
			alert("IP 주소는 정확히 입력 해주세요!");
			form.ip_addr1.focus();
			return;
		}
		if (!port_no.value)
		{
			alert("포트번호를 입력 해주세요!");
			form.port_no.focus();
			return;
		}
	}
	else
	{
		var temp=document.form;
		if (temp.wip_addr1.value =="" || temp.wip_addr2.value=="" || temp.wip_addr3.value=="" || temp.wip_addr4.value=="")
		{
			alert("IP 주소는 정확히 입력 해주세요!");
			form.wip_addr1.focus();
			return;
		}
		if (!win_port.value)
		{
			alert("포트번호를 입력 해주세요!");
			form.win_port.focus();
			return;
		}

	}

	var temp=document.form.service_id.value;
	if (temp=="")
	{
		alert("서비스를 선택하세요!");
		form.service_id.focus();
		return;
	}

	var temp=document.form.oper_id.value;
	if (temp=="")
	{
		alert("담당자를 선택하세요!");
		form.oper_id.focus();
		return;
	}
	var temp=document.form.kom.value;
	if(getByte(temp)>20)
	{
		alert("기종은 20byte\n넘을 수 없습니다.");
		form.kom.focus();
		return;
	}
	var temp=document.form.sang_pos.value;
	if(getByte(temp)>20)
	{
		alert("기종은 20byte\n넘을 수 없습니다.");
		form.sang_pos.focus();
		return;
	}	
	form.submit();
	return;
}


function getByte(s)
{
    var sum = 0;
    var len = s.length;
    for (var i=0; i<len; i++) {
        var ch = s.substring(i, i + 1);
        var en = escape(ch);
        if ( en.length <= 4 ) {
            sum++;
        }
        else {
            sum += 2;
        }
    }
    return sum;
}


function onlyNumber()
{
	if ( event.keyCode<48 || event.keyCode>57 )
		{
			event.returnValue = false;
		}
}

function CheckEnt(next) {
	if (event.keyCode == 13)
	{
		next.focus();
		return			
	}
}


 function clickshow(num)   
        {   
             if (num==1)
              {   
                menu=eval("document.all.block"+num+".style");           
                menu1=eval("document.all.block"+2+".style");  
                                 				                                             
			   if (menu.display=="none")   
				{
					menu.display="block";   
					menu1.display="none";   
				}  
			  } 
			else if (num==2)
              {   
                menu=eval("document.all.block"+num+".style");           
                menu1=eval("document.all.block"+1+".style");
			   if (menu.display=="none")   
				{
					menu.display="block";
					menu1.display="none";
					  		  	    
				}
				
			  } 

		}
function CheckEnt(next) {
	if (event.keyCode == 13)
	{
		next.focus();
		return			
	}
}

function fix(){
	var port=document.form.port_no.value;
		if(port==23){
			alert("PORT가 23일경우는 고정포트 사용이 불가능 합니다.")
			form.fixport.checked = false;
		}
	}
//관리 


</script>
</head>
<body <%if(os_type.equals("W")){%>onLoad="clickshow(2)"<%}%>>
      	<form name="form" action="server.do?cmd=server_editIns" method="post">
		<input type="hidden" name="tmep_port" value="<%=server_EditList.get("port")%>">
		<input type="hidden" name="temp_type" value="<%=server_EditList.get("os_type")%>">
		<input type="hidden" name="system_id" value="<%=system_id%>">
		<input type="hidden" name="pre_svc" value="<%=server_EditList.get("service_id")%>">
<table width=500 border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="<%=DIR_IMG %>pop_500bg_01.jpg" class="PopupTitleBgWhite"><img src="<%=DIR_IMG %>pop_img01.gif" align="absmiddle" style="margin-left:10px; margin-right:10px">시스템 등록</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                      <td width="95" height="30" class="PopupBold">SYSTEM ID </td>
                      <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input name="host_id" type="text" class="inputLIneGrayColor" id="system_id" size="23" maxlength="15" value="<%=server_EditList.get("host_id")%>"></td>
                          <td class="T11PopupText"><img src="<%=DIR_IMG %>dot_2.gif" align="absmiddle" /><font color="ff3116">필수</font> <span class="style1">(중복하지 마세요.)</span> </td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">장비 설명</td>
                      <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input name="system_name" type="text" class="inputLIneGrayColor" id="system_name" size="23" maxlength="15" value="<%=server_EditList.get("system_name")%>"></td>
                          <td class="T11PopupText"><img src="<%=DIR_IMG %>dot_2.gif" align="absmiddle" /><font color="ff3116">필수</font> <span class="style1">(중복하지 마세요.)</span> </td>
                        </tr>
                      </table></td>
                    </tr>
					<tr>
                      <td height="30" class="PopupBold">Operating System</td>
                      <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td><input type="radio" name="os_type" value="U"  <%if (os_type.equals("U")){%>checked<%}%>  onclick="clickshow(1)">
                          UNIX 계열 
                          <input type="radio" name="os_type" value="W"  <%if (os_type.equals("W")){%>checked<%}%> onclick="clickshow(2)" >
                          Windows 계열</td>
                            </tr>
                          </table></td>
                          <td class="T11PopupText"><img src="<%=DIR_IMG %>dot_2.gif" align="absmiddle" /><font color="ff3116">필수</font></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">장비 IP</td>
                      <td class="PopupLine">
                      <SPAN id="block1" style="DISPLAY: block;">
                      <table width="100%" border="0" cellpadding="0" cellspacing="0"> 
                      <tr> 
                        <td><input name="ip_addr1" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="<%=system_ip[0]%>" onkeyup="moveFocus(3,this,this.form.ip_addr2)">
                          . 
                          <input name="ip_addr2" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="<%=system_ip[1]%>" onkeyup="moveFocus(3,this,this.form.ip_addr3)">
                          . 
                          <input name="ip_addr3" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="<%=system_ip[2]%>" onkeyup="moveFocus(3,this,this.form.ip_addr4)">
                          . 
                          <input name="ip_addr4" type="text" class="inputLIneGrayColor" size="4" onKeyPress="onlyNumber();" maxlength="3" value="<%=system_ip[3]%>" onkeyup="moveFocus(3,this,this.form.port_no)">
                          &nbsp; PORT 
                          <input name="port_no" type="text" class="inputLIneGrayColor" size="7" onKeyPress="onlyNumber();" maxlength="7" <%if(os_type.equals("U")){%>value="<%=Unix_port%>"<%}%>>
							<input name="fixport" type="checkbox" value="1" <%if (fixport.equals("1")){%>checked<%}%> onclick="fix()"> <font color="red">*(고정포트사용)</font></td>
                      </tr>
                 	</table>
					</SPAN>
					<SPAN id="block2" style="DISPLAY: none;">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
                      <tr> 
                        <td><input name="wip_addr1" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="<%=system_ip[0]%>" onkeyup="moveFocus(3,this,this.form.wip_addr2)">
                          . 
                          <input name="wip_addr2" type="text"  size="4"  class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="<%=system_ip[1]%>" onkeyup="moveFocus(3,this,this.form.wip_addr3)">
                          . 
                          <input name="wip_addr3" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="<%=system_ip[2]%>" onkeyup="moveFocus(3,this,this.form.wip_addr4)">
                          . 
                          <input name="wip_addr4" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="<%=system_ip[0]%>">
                          <input type="hidden" name="fixport" value="0"> 
                          &nbsp; PORT 
						  
                          <select name="win_port">
				<%	for(int i=0; i<PortCount; i++){
								String port2 = server_PortList.get("seqno",i);
							%>
														<option value="<%=server_PortList.get("seqno",i)%>" <%if(port.equals(port2)){%>selected<%}%>><%=server_PortList.get("seqno",i)%>번 포트</option>	
							<% 
							}
							%>						  
						  </select></td>
                      </tr>
                    </table>	 
					</SPAN>  
					</td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">소속 서비스</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="155"><select name="service_id" class="inputLIneGrayColor">
                              <option selected VALUE="">필수 선택 사항 </option>
							<% for(int i=0; i<ServiceCount; i++){	
								String service_id2 = server_ServiceList.get("service_id",i);%>
                           		 <option value="<%=server_ServiceList.get("service_id",i)%>" <%if(service_id2.equals(service_id_check)){%>selected<%}%>><%=server_ServiceList.get("service_id",i)%></option>
							<%
							}
							%>
                          </select></td>
                          <td width="250" class="T11PopupText">&nbsp;</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">담당자</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="155"><select name="oper_id" class="inputLIneGrayColor">
                              <option value="">필수 선택 사항</option>
						<% for(int i=0; i<ManagerCount; i++){	
								String charger_id2 = server_ManagerList.get("charger_id",i);
							%>
                            <option value="<%=server_ManagerList.get("user_id",i)%>" <%if (charger_id2 == user_id){%>selected<%}%>><%=server_ManagerList.get("name",i)%></option>
							<% 
							}
							%>
                            </select>                          
                            </td>
                          <td width="250" class="T11PopupText">담당자를 반드시 선택하여주십시요</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">제조사</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="155"><select name="vendor_id" class="inputLIneGrayColor">
                            <option value="">선택해주세요</option>
							<% for(int i=0; i<VendorCount; i++){	
								String vendor_id2 = server_VendorList.get("vendor_id",i);
							%>
							                            <option value="<%=server_VendorList.get("vendor_id",i)%>" <%if (vendor_id2.equals(vendor_id)){%>selected<%}%>><%=server_VendorList.get("vendor_id",i)%></option>
							<% 
							}
							%>
                            </select>                          
                            </td>
                          <td width="250" class="T11PopupText">&nbsp;</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">기종</td>
                      <td class="PopupLine"><input name="kom" type="text" class="inputLIneGrayColor" size="30" maxlength="25" value="<%=server_EditList.get("kom")%>"></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">상면위치</td>
                      <td class="PopupLine"><input name="sang_pos" type="text" class="inputLIneGrayColor" size="30" maxlength="25" value="<%=server_EditList.get("sang_pos")%>"></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">분전반 번호</td>
                      <td class="PopupLine"><input name="bun_no" type="text" class="inputLIneGrayColor" size="30" maxlength="25" onKeyPress="onlyNumber();" value="<%=server_EditList.get("bun_no")%>">
                    &nbsp;숫자만 입력하세요.</td>
                    </tr>
                    <tr>
                      <td height="30" colspan="2" class="PopupLine"><font color="ff3116">* 필수 입력 사항은 반드시 입력해야 합니다.</font></td>
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
        <td height="40" align="right"><a href="#"><img style="margin-right:6px" src="<%=DIR_IMG %>btn_regist.gif" onClick="Form_check()" alt="수정"></a> 
        							  <a href="#"><img src="<%=DIR_IMG %>btn_close.gif" width="42" height="22" onClick="javascript:window.close()" alt="닫기"></a></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>