<!--
===============================================================
					���� ����   ������ 
===============================================================
-->
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray" %>
<%@page import="java.util.StringTokenizer"%>
<%@ include file="/common/common.jsp"%>

<% 

    int           PortCount         = 0; //��Ʈ ��ȣ
	int           ServiceCount      = 0; //�ҼӼ��� 
	int           ManagerCount      = 0; //����� 
	int           VendorCount       = 0; //������ 
	int           EditListCount     = 0; //������ ��� �ҷ� ����
	int           NtPort            = 0; //��Ʈ ��ȣ �ҷ� ���� 
	
	String  os_type 	    = "";							  	// ��� ����
	String  fixport         = "";	   						 	// ���� ������ 
	String service_id_check = "";					 			// ���̵� üũ�� 
//	String user_id 	        = "";								// ����� ���̵� 
	String vendor_id 		= "";								// ȸ�� 
	String port 			= "";           					// ��Ʈ ��ȣ
	String Unix_port 		= "";      							// Unix ��Ʈ ��ȣ 
	String[] system_ip 		= new String[10];					// �ý��� ������ 
	String system_id 		= request.getParameter("system_id");// system_id �޾� ���� 

    ResultSetTray server_PortList    = null;  // ��Ʈ��ȣ �ҷ� ����
    ResultSetTray server_ServiceList = null;  // �ҼӼ��� �ҷ� ���� 
    ResultSetTray server_ManagerList = null;  // ����� �ҷ� ���� 
    ResultSetTray server_VendorList  = null;  // ������ �ҷ� ���� 
    ResultSetTray server_EditList    = null;  // ������ ��� �ҷ� ����  
    ResultSetTray server_NtPort      = null;  // ��Ʈ ��ȣ �ҷ� ���� 
    
    
    //String	checkbox="";
    // checkbox	=	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
		server_PortList    = (ResultSetTray)request.getAttribute("rsTray");    //��Ʈ ��ȣ �ҷ� ���� 
		PortCount 		   = server_PortList.getRowCount();
		
		server_ServiceList = (ResultSetTray)request.getAttribute("rsTray2");   //�Ҽ� ���� �ҷ� ���� 
		ServiceCount 	   = server_ServiceList.getRowCount();
		
		server_ManagerList = (ResultSetTray)request.getAttribute("rsTray3");   // ����� �ҷ� ���� 
		ManagerCount 	   = server_ManagerList.getRowCount();
		
		server_VendorList  = (ResultSetTray)request.getAttribute("rsTray4");   // ������ �ҷ� ���� 
		VendorCount 	   = server_VendorList.getRowCount();
		
		server_EditList    = (ResultSetTray)request.getAttribute("rsTray5");   // ������ ���  �ҷ� ���� 
		EditListCount      = server_EditList.getRowCount();	  
		
		if(request.getAttribute("rsTray6") != null) 						   //port ���� null �̸� ���� ���� ���� 
		{
		server_NtPort = (ResultSetTray)request.getAttribute("rsTray6");        // ��Ʈ ��ȣ �ҷ� ���� 
		NtPort 		  = server_NtPort.getRowCount();	
		port 		  = server_NtPort.get("seqno"); 						   //��Ʈ ��ȣ �ҷ� ���� 
			}
		
		
		os_type 		 = server_EditList.get("ostype");                 	   // ��� Ÿ�� 
		fixport 		 = server_EditList.get("fixedflag");              	   // unix ���� ��Ʈ
		if(fixport.equals("") || fixport==null){fixport="";}				
	
		service_id_check = server_EditList.get("service_id");    	 		   //���� ���̵� 
		user_id 		 = server_EditList.get("user_id"); 	 		 		   //�ο� ���̵� 
		vendor_id 		 = server_EditList.get("vendor_id");   	     		   //������ 
		Unix_port 		 = server_EditList.get("port");				 		   //���н� ��Ʈ 
	}
//	[system_ip           ]	123.123.123.123	
	
	StringTokenizer token = new StringTokenizer(server_EditList.get("system_ip"),".");
	for( int i = 0; token.hasMoreElements(); i++ ){
		system_ip[i] = token.nextToken(); 						 	 		   //�ý��� ip�и� �ϱ� 
	}
	
%>
<html>
<head>
<!-- �˾�������  500 * 426-->
<title>�˾�_������_�ý��� ���</title>
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
	var id_pattern = new RegExp('[^a-zA-Z0-9_]'); //���̵� ���ϰ˻� ���Խ�
	var temp=document.form;
	if (!temp.system_id.value.length || id_pattern.test(temp.system_id.value))
	 {
    	 alert("����ID�� �����ڿ� ����, '_' �� �Է��� �ּ���.");
		 temp.system_id.value = "";
		 temp.system_id.focus();
		 return;
	 }
	else if(getByte(temp.system_id.value)>20)
	{
		alert("���ID 20byte\n���� �������ϴ�.");
		form.system_id.focus();
		return;
	}
	var temp=document.form.system_name.value
	if(temp=="")
	{
		alert("�ý����̸��� �Է��ϼ���!");
		form.system_name.focus();
		return;
	}
	if(getByte(temp)>20)
	{
		alert("�ý����̸��� 20byte\n���� �� �����ϴ�.");
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
			alert("IP �ּҴ� ��Ȯ�� �Է� ���ּ���!");
			form.ip_addr1.focus();
			return;
		}
		if (!port_no.value)
		{
			alert("��Ʈ��ȣ�� �Է� ���ּ���!");
			form.port_no.focus();
			return;
		}
	}
	else
	{
		var temp=document.form;
		if (temp.wip_addr1.value =="" || temp.wip_addr2.value=="" || temp.wip_addr3.value=="" || temp.wip_addr4.value=="")
		{
			alert("IP �ּҴ� ��Ȯ�� �Է� ���ּ���!");
			form.wip_addr1.focus();
			return;
		}
		if (!win_port.value)
		{
			alert("��Ʈ��ȣ�� �Է� ���ּ���!");
			form.win_port.focus();
			return;
		}

	}

	var temp=document.form.service_id.value;
	if (temp=="")
	{
		alert("���񽺸� �����ϼ���!");
		form.service_id.focus();
		return;
	}

	var temp=document.form.oper_id.value;
	if (temp=="")
	{
		alert("����ڸ� �����ϼ���!");
		form.oper_id.focus();
		return;
	}
	var temp=document.form.kom.value;
	if(getByte(temp)>20)
	{
		alert("������ 20byte\n���� �� �����ϴ�.");
		form.kom.focus();
		return;
	}
	var temp=document.form.sang_pos.value;
	if(getByte(temp)>20)
	{
		alert("������ 20byte\n���� �� �����ϴ�.");
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
			alert("PORT�� 23�ϰ��� ������Ʈ ����� �Ұ��� �մϴ�.")
			form.fixport.checked = false;
		}
	}
//���� 


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
    <td height="46" background="<%=DIR_IMG %>pop_500bg_01.jpg" class="PopupTitleBgWhite"><img src="<%=DIR_IMG %>pop_img01.gif" align="absmiddle" style="margin-left:10px; margin-right:10px">�ý��� ���</td>
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
                          <td class="T11PopupText"><img src="<%=DIR_IMG %>dot_2.gif" align="absmiddle" /><font color="ff3116">�ʼ�</font> <span class="style1">(�ߺ����� ������.)</span> </td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">��� ����</td>
                      <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input name="system_name" type="text" class="inputLIneGrayColor" id="system_name" size="23" maxlength="15" value="<%=server_EditList.get("system_name")%>"></td>
                          <td class="T11PopupText"><img src="<%=DIR_IMG %>dot_2.gif" align="absmiddle" /><font color="ff3116">�ʼ�</font> <span class="style1">(�ߺ����� ������.)</span> </td>
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
                          UNIX �迭 
                          <input type="radio" name="os_type" value="W"  <%if (os_type.equals("W")){%>checked<%}%> onclick="clickshow(2)" >
                          Windows �迭</td>
                            </tr>
                          </table></td>
                          <td class="T11PopupText"><img src="<%=DIR_IMG %>dot_2.gif" align="absmiddle" /><font color="ff3116">�ʼ�</font></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">��� IP</td>
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
							<input name="fixport" type="checkbox" value="1" <%if (fixport.equals("1")){%>checked<%}%> onclick="fix()"> <font color="red">*(������Ʈ���)</font></td>
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
														<option value="<%=server_PortList.get("seqno",i)%>" <%if(port.equals(port2)){%>selected<%}%>><%=server_PortList.get("seqno",i)%>�� ��Ʈ</option>	
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
                      <td height="30" class="PopupBold">�Ҽ� ����</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="155"><select name="service_id" class="inputLIneGrayColor">
                              <option selected VALUE="">�ʼ� ���� ���� </option>
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
                      <td height="30" class="PopupBold">�����</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="155"><select name="oper_id" class="inputLIneGrayColor">
                              <option value="">�ʼ� ���� ����</option>
						<% for(int i=0; i<ManagerCount; i++){	
								String charger_id2 = server_ManagerList.get("charger_id",i);
							%>
                            <option value="<%=server_ManagerList.get("user_id",i)%>" <%if (charger_id2 == user_id){%>selected<%}%>><%=server_ManagerList.get("name",i)%></option>
							<% 
							}
							%>
                            </select>                          
                            </td>
                          <td width="250" class="T11PopupText">����ڸ� �ݵ�� �����Ͽ��ֽʽÿ�</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">������</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="155"><select name="vendor_id" class="inputLIneGrayColor">
                            <option value="">�������ּ���</option>
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
                      <td height="30" class="PopupBold">����</td>
                      <td class="PopupLine"><input name="kom" type="text" class="inputLIneGrayColor" size="30" maxlength="25" value="<%=server_EditList.get("kom")%>"></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">�����ġ</td>
                      <td class="PopupLine"><input name="sang_pos" type="text" class="inputLIneGrayColor" size="30" maxlength="25" value="<%=server_EditList.get("sang_pos")%>"></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">������ ��ȣ</td>
                      <td class="PopupLine"><input name="bun_no" type="text" class="inputLIneGrayColor" size="30" maxlength="25" onKeyPress="onlyNumber();" value="<%=server_EditList.get("bun_no")%>">
                    &nbsp;���ڸ� �Է��ϼ���.</td>
                    </tr>
                    <tr>
                      <td height="30" colspan="2" class="PopupLine"><font color="ff3116">* �ʼ� �Է� ������ �ݵ�� �Է��ؾ� �մϴ�.</font></td>
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
        <td height="40" align="right"><a href="#"><img style="margin-right:6px" src="<%=DIR_IMG %>btn_regist.gif" onClick="Form_check()" alt="����"></a> 
        							  <a href="#"><img src="<%=DIR_IMG %>btn_close.gif" width="42" height="22" onClick="javascript:window.close()" alt="�ݱ�"></a></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>