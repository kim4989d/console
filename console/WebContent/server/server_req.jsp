<!--
===============================================================
					���� ���  ������ 
===============================================================
-->
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ include file="/common/common.jsp"%>

<%
    int           Port_Count         = 0;    //��Ʈ ��ȣ
	int           Service_Count      = 0;    //�ҼӼ��� 
	int           Manager_Count      = 0; 	 //����� 
	int           Vendor_Count       = 0;    //������ 
//	Tray          reqTray       = null;

    ResultSetTray server_PortList       = null;   // ��Ʈ��ȣ �ҷ� ����
    ResultSetTray server_ServiceList    = null;  // �ҼӼ��� �ҷ� ���� 
    ResultSetTray server_ManagerList    = null;  // ����� �ҷ� ���� 
    ResultSetTray server_VendorList     = null;  // ������ �ҷ� ���� 
    
    String	checkbox="";
    checkbox	=	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
		server_PortList = (ResultSetTray)request.getAttribute("rsTray"); //��Ʈ ��ȣ �ҷ� ���� 
		Port_Count = server_PortList.getRowCount();
		
		server_ServiceList = (ResultSetTray)request.getAttribute("rsTray2"); //�Ҽ� ���� �ҷ� ���� 
		Service_Count = server_ServiceList.getRowCount();
		
		server_ManagerList = (ResultSetTray)request.getAttribute("rsTray3"); // ����� �ҷ� ���� 
		Manager_Count = server_ManagerList.getRowCount();
		
		server_VendorList = (ResultSetTray)request.getAttribute("rsTray4"); // ������ �ҷ� ���� 
		Vendor_Count = server_VendorList.getRowCount();
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
</script>


</head>

<body>
<table width=500 border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="<%=DIR_IMG %>pop_500bg_01.jpg" class="PopupTitleBgWhite"><img src="<%=DIR_IMG %>pop_img01.gif" align="absmiddle" style="margin-left:10px; margin-right:10px">�ý��� ���</td>
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
        <form name="form" action="server.do?cmd=server_req_ok" method="post">
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="95" height="30" class="PopupBold">SYSTEM ID </td>
                      <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input name="system_id" type="text" class="inputLIneGrayColor" id="system_id" size="23" maxlength="15"></td>
                          <td class="T11PopupText"><img src="<%=DIR_IMG %>dot_2.gif" align="absmiddle" /><font color="ff3116">�ʼ�</font> <span class="style1">(�ߺ����� ������.)</span> </td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">��� ����</td>
                      <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input name="system_name" type="text" class="inputLIneGrayColor" id="system_name" size="23" maxlength="15"></td>
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
                              <td><input type="radio" name="os_type" value="U"   onclick="clickshow(1)" checked >
                          UNIX �迭 
                          <input type="radio" name="os_type" value="W" onclick="clickshow(2)" >
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
                        <td><input name="ip_addr1" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="" onkeyup="moveFocus(3,this,this.form.ip_addr2)">
                          . 
                          <input name="ip_addr2" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="" onkeyup="moveFocus(3,this,this.form.ip_addr3)">
                          . 
                          <input name="ip_addr3" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="" onkeyup="moveFocus(3,this,this.form.ip_addr4)">
                          . 
                          <input name="ip_addr4" type="text" class="inputLIneGrayColor" size="4" onKeyPress="onlyNumber();" maxlength="3" value="" onkeyup="moveFocus(3,this,this.form.port_no)">
                          &nbsp; PORT 
                          <input name="port_no" type="text" class="inputLIneGrayColor" size="7" onKeyPress="onlyNumber();" maxlength="7" value="23">
							<input name="fixport" type="checkbox" value="1"> <font color="red">*(������Ʈ���)</font></td>
                      </tr>
                 	</table>
					</SPAN>
					<SPAN id="block2" style="DISPLAY: none;">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
                      <tr> 
                        <td><input name="wip_addr1" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="" onkeyup="moveFocus(3,this,this.form.wip_addr2)">
                          . 
                          <input name="wip_addr2" type="text"  size="4"  class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="" onkeyup="moveFocus(3,this,this.form.wip_addr3)">
                          . 
                          <input name="wip_addr3" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="" onkeyup="moveFocus(3,this,this.form.wip_addr4)">
                          . 
                          <input name="wip_addr4" type="text"  size="4" class="inputLIneGrayColor" onKeyPress="onlyNumber();" maxlength="3" value="">
                          <input type="hidden" name="fixport" value="0"> 
                          &nbsp; PORT 
						  
                          <select name="win_port">
				<%		for(int i=0; i<Port_Count; i++){%>
							<option value="<%=server_PortList.get("seqno",i)%>"><%=server_PortList.get("seqno",i)%>�� ��Ʈ</option>	
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
							<% for(int i=0; i<Service_Count; i++){	%>
				                            <option value="<%=server_ServiceList.get("service_id",i)%>"><%=server_ServiceList.get("service_id",i)%></option>
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
						<% for(int i=0; i<Manager_Count; i++){	%>
				                            <option value="<%=server_ManagerList.get("user_id",i)%>"><%=server_ManagerList.get("name",i)%></option>
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
							<% for(int i=0; i<Vendor_Count; i++){	%>
				                            <option value="<%=server_VendorList.get("vendor_id",i)%>"><%=server_VendorList.get("vendor_id",i)%></option>
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
                      <td class="PopupLine"><input name="kom" type="text" class="inputLIneGrayColor" size="30" maxlength="25" value=""></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">�����ġ</td>
                      <td class="PopupLine"><input name="sang_pos" type="text" class="inputLIneGrayColor" size="30" maxlength="25" value=""></td>
                    </tr>
                    <tr>
                      <td height="30" class="PopupBold">������ ��ȣ</td>
                      <td class="PopupLine"><input name="bun_no" type="text" class="inputLIneGrayColor" size="30" maxlength="25" onKeyPress="onlyNumber();" value="">
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
        <td height="40" align="right"><a href="#"><img style="margin-right:6px" src="<%=DIR_IMG %>btn_regist.gif" onClick="Form_check()" ></a><a href="#"><img src="<%=DIR_IMG %>btn_close.gif" width="42" height="22" onClick="javascript:window.close()" value="�ݱ�"></a></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>



