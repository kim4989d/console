<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="console.common.tray.ResultSetTray,console.common.util.Util" %>
<%@ include file="/common/common.jsp"%>
<% 
    int           VendorCount          = 0;  		//	�Ҽӻ� �ҷ� ���� 
    int           rowCount2         = 0;  			//  ������ �ҷ� ����  
	int 		  rowCount3   		= 0; 			//  ������ �ҷ����� 2 
    
    ResultSetTray join_list_tray   = null;  	// 
    ResultSetTray join_list_tray2  = null;  	// 
    ResultSetTray join_list_tray3  = null;  	// 

    
	if(request.getAttribute("rsTray") !=null){
		join_list_tray = (ResultSetTray)request.getAttribute("rsTray");   //  �Ҽӻ� �ҷ� ���� 
		VendorCount = join_list_tray.getRowCount();
	}
	if(request.getAttribute("rsTray2") != null){
		join_list_tray2 = (ResultSetTray)request.getAttribute("rsTray2"); //  ������ �ҷ� ���� 
		rowCount2 = join_list_tray2.getRowCount();
	}
	if(request.getAttribute("rsTray3") != null){
		join_list_tray3 = (ResultSetTray)request.getAttribute("rsTray3"); //  ������ �ҷ� ���� 
		rowCount3 = join_list_tray3.getRowCount();
	}
	
%>
<html>
<head>
<!-- �˾�������  1000 * 516-->
<title>����� ���� ���� ��û </title>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
<META NAME="CONTENT-LANGUAGE" CONTENT="KR">
<LINK REL='STYLESHEET' HREF='../common/css/skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='../common/css/skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
.style1 {
	font-size: 11px
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
//�ڸ��̵�
function moveFocus(num,fromform,toform)
{
	var str = fromform.value.length;
	if(str == num)
       toform.focus();
}
function id_chk() {                                                                 

	var str

		str=document.form.uid.value;
		if (str=="")
		{
			document.form.uid.focus();
			
		}
		if(str.length<3)
		{
			alert("���̵�� 4���̻��Դϴ�.");
			document.form.uid.focus();
			return false;
		
		}
		else
		window.open("/admin.do?cmd=admin_user_reapeat&uid="+str,"checkid","scrollbars=no,resizeable=no,width=340,height=109, top=200, left=150");
}	



function pwd_check(cmp)
{
	var temp=cmp.value.length
	if (temp<8)
	{
		alert("��й�ȣ�� �ּ� 8���� �̻��Դϴ�.");
		document.form.pwd2.value="";
		document.form.pwd1.focus();
		return false;
	}
	else{
	
	if (cmp.value!=document.form.pwd2.value)
	{	
		alert("��й�ȣ�� ���� ��ġ ���� �ʽ��ϴ�.");
		document.form.pwd2.value="";
		document.form.pwd1.select();
		return; 
	}

	}
}
function onlyNumber()
{
	if ( event.keyCode<48 || event.keyCode>57 )
		event.returnValue = false;
}  
//���ڼ� üũ
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
function Form_check()
{

	var id_pattern = new RegExp('[^a-zA-Z0-9_]'); //���̵� ���ϰ˻� ���Խ�
	var passwd_pattern = new RegExp('[^a-zA-Z0-9]'); //��й�ȣ
	var temp=document.form.id_check.value
	if (temp=="")
	{
		alert("ID �ߺ�Ȯ���� ���ּ���")
		document.form.uid.focus();
		return false;	
	}
	var temp=document.form;
	if (temp.uid.value.length<2 || getByte(temp.uid.value)>10) 
	{
		alert("����� ���̵��  �ּ� 2�� �̻�\n10byte ���� �� �����ϴ�.");
		temp.uid.value = "";
		temp.id_check.value = "";		
		temp.uid.focus();
		return;
	}
 	if (!temp.uid.value.length || id_pattern.test(temp.uid.value))
	 {
    	 alert("���̵� �����ڿ� ����, '_' �� �Է��� �ּ���.");
		 temp.uid.value = "";
		 temp.id_check.value = "";		
		 temp.uid.focus();
		 return;
	 }
	 if (temp.pwd1.value.length < 8 || getByte(temp.pwd1.value) > 10)
	 {
	 	  alert("��й�ȣ�� 8���̻�\n10byte ���� �� �����ϴ�.");
		  temp.pwd1.select();
		  temp.pwd2.value = "";		  
		  temp.pwd1.focus();
		  return;	 	
	 }
	 if(temp.pwd1.value=="" || temp.pwd2.value=="" || passwd_pattern.exec(temp.pwd1.value)) 
	 {
	 	  alert("��й�ȣ�� ��Ȯ�ϰ� �Է��� �ּ���.");
		  temp.pwd1.value = "";
		  temp.pwd2.value = "";		  
		  temp.pwd1.focus();
		  return;
	 }
	if(form.uKind.value=="")
	{
		alert("����� ������ �����ϼ���");
		form.uKind.focus();
		return;
	}
	if(form.object.value=="")
	{
		alert("��û������ �Է����ּ���!");
		form.object.focus();
		return;
	}
	else if (getByte(document.form.object.value)>50 )
	{
	
		alert("��û���� ������ 50byte�� ���� �� �����ϴ�.");
		form.object.select();
		return;
	}	
	if(form.hp1.value==""|| form.hp2.value=="" || form.hp3.value=="")
	{
		alert("�ڵ�����ȣ�� �ٸ��� �Է��ϼ���");
		form.hp1.focus();
		return;
	}

 	var temp=document.form.uname.value
	if (temp=="")
	{
		alert("�̸��� �Է����ּ���")
		document.form.uname.focus();
		return false;
	}
 	var temp=document.form.oper.value;
	var temp1=document.form.uKind.value;
	if (temp=="" && temp1!="A" &&temp1!="O")
	{
		alert("����ڸ� �������ּ���!")
		document.form.oper.focus();
		return false;
	}	

 	var temp=document.form.sys_id.value;
	var temp1=document.form.uKind.value;
	if (temp1!="O" && temp1!="A")
	{
		if (temp=="")
		{
			alert("�ý����� �������ּ���!");
			return false;
		}
	 	document.form.sys_intention.value = HiddenFrame1.form.sys_intention.value;
		var temp = document.form.sys_intention.value;
		if (temp=="" || getByte(temp) > 50 )
		{
			alert("�ý��� �������� �������ּ���!");
			HiddenFrame1.form.sys_intention.focus();
			return false;
		}
		
	}
		
	document.form.submit();
	return;
}


function change_menu(val)
{
	var val;
	
	if (val=="O")
	{
		document.form.oper.disabled=true; 				
		document.form.oper.style.background="#e8e8e8";
		HiddenFrame1.location.href="/admin.do?cmd=admin_user_joinname";
		return;
	}
	else if(val=="A")
	{
		document.form.str1.disabled=true; 
		document.form.str2.disabled=true; 		
		document.form.oper.disabled=true; 				
		document.form.oper.style.background="#e8e8e8";
		HiddenFrame1.location.href="/admin/dummy.jsp";
		return;
	}
	else if(val=="M")
	{
		document.form.str1.disabled=false; 
		document.form.str2.disabled=false; 		
		document.form.oper.disabled=false; 				
		document.form.oper.style.background="#FFFFFF";
		HiddenFrame1.location.href="/admin.do?cmd=admin_user_joinsys";
		return;
	}	
	else
	{
		document.form.str1.disabled=false; 
		document.form.str2.disabled=false;
		document.form.oper.disabled=false; 				
		document.form.oper.style.background="#FFFFFF";	
		HiddenFrame1.location.href="/admin.do?cmd=admin_user_joinsys";
		return;
	}	
}



function change_service(val,val2)
{
	
	var Temp = document.form.uKind.value;
	var Temp2 = document.form.company.value
	if ( Temp2 =="")
	{
		alert("�Ҽӻ縦 ���� ���ּ���")
		document.form.oper.options[0].selected = true
		document.form.company.focus();
		return;
	}
	else{

		if (Temp == "G" || Temp == "M")
		{
			if (val != ""){
			var oper_id = val;
			HiddenFrame1.location.href="/admin.do?cmd=admin_user_joinsys&cid="+oper_id+"&com="+val2;
			return;
			}
		}
	}
}


</script>
</head>
<body>
<%// �ڹ� ��ũ��Ʈ �� ������ ó�� �ϱ� ���� �� 
  //���� �ʿ��� select �޴��� �ҷ��� 
  
 	out.println("	<SCRIPT language='JavaScript'>");
	out.println("	function uKindChange() {");
	out.println("	var x = document.form.uKind.options.selectedIndex;");
	out.println(" 	var groups=document.form.uKind.options.length;");
	out.println(" 	var group=new Array(groups);");
	out.println(" 	for (i=0; i<groups; i++)");
	out.println("		group[i]=new Array();");

	out.println("group[0][0]=new Option(\"�����ϼ���\",\"\");");

//$SQL="select user_id,name from TBL_USER where KIND ='A'  and admit_flag='1' order by name";
//$row = $db->queryFetch($SQL);
	out.println("group[1][0] = new Option(\"admin����\",\"\");");

	int k=1;
	String oper_id = "";
	String oper_name = "";
	for(int i=0; i<rowCount2; i++){
		oper_id =  join_list_tray2.get("user_id",i);
		name 	=  join_list_tray2.get("name",i);
	out.println("group[1]["+k+"]=new Option(\""+name+"\",\""+oper_id+"\");");
		k=k+1;
	}

	k=1;
//	$SQL="select user_id,name from TBL_USER where kind='O' and admit_flag='1'  order by name";
//	$row = $db->queryFetch($SQL);
	out.println(" group[2][0]=new Option(\"admin����\",\"\");");
	for(int i=0; i<rowCount3; i++){
		oper_id 	= join_list_tray3.get("user_id",i);
		oper_name 	= join_list_tray3.get("name",i);
		out.println(" group[2]["+k+"]=new Option(\""+oper_name+"\",\""+oper_id+"\");");
		k=k+1;
	}

	k=1;
//	$SQL="select user_id,name from TBL_USER where kind='O' and admit_flag='1'  order by name";
//	$row = $db->queryFetch($SQL);
	out.println(" group[3][0]=new Option(\"admin����\",\"\");");
	for(int i=0; i<rowCount3; i++){
		oper_id   = join_list_tray3.get("user_id",i);
		oper_name = join_list_tray3.get("name",i);
	out.println(" group[3]["+k+"]=new Option(\""+oper_name+"\",\""+oper_id+"\");");
		k=k+1;
	}
	
	k=1;
//	$SQL="select user_id,name from TBL_USER where kind='O' and admit_flag='1'  order by name";
//	$row = $db->queryFetch($SQL);
	out.println(" group[4][0]=new Option(\"admin����\",\"\");");
	for(int i=0; i<rowCount3; i++){
		oper_id   = join_list_tray3.get("user_id",i);
		oper_name = join_list_tray3.get("name",i);
	out.println(" group[4]["+k+"]=new Option(\""+oper_name+"\",\""+oper_id+"\");");
		k=k+1;
	}
	out.println("temp = document.form.oper;");
	out.println("for (m = temp.options.length-1 ; m > 0 ; m--)");
	out.println("  temp.options[m]=null");
	out.println(" for (i=0;i<group[x].length;i++){");
	out.println("  temp.options[i]=new Option(group[x][i].text,group[x][i].value)");
	out.println(" }");
	out.println(" temp.options[0].selected=true");
	out.println("}");
	out.println("</SCRIPT>");
%>
<form name="form" action="/admin.do?cmd=admin_user_joinins" method="post">  
		<input type="hidden" name="id_check" >
		<input type="hidden" name="sys_id">
		<input type="hidden" name="sys_name">
		<input type="hidden" name="service_id">		
		<input type="hidden" name="service_name">		
		<input type="hidden" name="sys_intention" >
		<input type="hidden" name="user_id" value="<%=user_id%>">
		<input type="hidden" name="kind" 	value="<%=kind%>">

<table width=1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="../common/images/pop_1000bg_01.jpg" class="PopupTitleBgWhite"><img src="../common/images/pop_img01.gif" width="8" height="17" align="middle" style="margin-left:10px; margin-right:10px">���� ��û ���</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>


    <td><table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="5"></td>
          <td width="790" height="4" bgcolor="#9ab1cf"></td>
          <td width="5"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <colgroup>
              <col width="50%">
              <col width="*">
              </colgroup>
              <tr>
                <td height="30" colspan="2" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="OrangeText"><strong>����� ����</strong></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td height="30" class="PopupBold">����� ID </td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="uid" type="text" class="inputLIneGrayColor" size="23" maxlength="13" /></td>
                                  <td>&nbsp;<a href="#"><img src="../common/images/btn_id_check.gif" align="middle" name="idcheck" id="idcheck" onClick="id_chk();"></a></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold" >��ȣ</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd1" type="password" class="inputLIneGrayColor" size="23" maxlength="10"></td>
                                  <td>&nbsp;<span class="style1">���� ���� ���� 8�ڸ��� �Է� ���ּ���</span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">��ȣȮ��</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd2" type="password" class="inputLIneGrayColor" size="23" maxlength="10" /></td>
                                  <td>&nbsp;<span class="style1">���� �Է��Ͻ� ��ȣ�� �����ϰ� �Է��ϼ���. </span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">����� ����</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="uKind" class="InputLIneSelect" onChange="uKindChange();change_menu(this.form.uKind.value)">
                                      <option value ="" selected="selected">����</option>
                                      <%if( kind.equals("A") ){ %>
                                      <option value ="A">������</option>
                                      <%} %>
                                      <option value ="O">�����</option>
                                      <option value ="G">�Ϲݻ����</option>
                                      <option value ="M">���������۾���</option>
                                    </select></td>
                                  <td><img src="../common/images/dot_2.gif" align="middle"><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
	
                          <tr>
                            <td height="30" class="PopupBold">��û����</td>
                            <td  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50">
                                    <img src="../common/images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="BlueText"><strong>�Ҽӻ�</strong></td>
                            <td><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="company" class="InputLIneSelect">
                                       <OPTION value ="">����</OPTION>
									<% for(int i=0; i<VendorCount; i++){%>
									                <option value="<%=join_list_tray.get("company_id",i)%>"><%=join_list_tray.get("company_name",i)%></option>
									<% 
									}
									%>
                                    </select></td>
                                  <td><img src="../common/images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                      <td valign="top"><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td height="30" class="PopupBold">�޴���</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="hp1" size="1" class="InputLIneSelect">
                                      <option value ="">�����ϼ���</option>
                                      <option value ="011">011</option>
                                      <option value ="016">016</option>
                                      <option value ="017">017</option>
                                      <option value ="018">018</option>
                                      <option value ="019">019</option>
                                      <option value ="010" selected="selected">010</option>
                                    </select>
                                    -
                                    <input name="hp2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                    -
                                    <input name="hp3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                    <input name="isported" type="checkbox" value="1" />
                                    <span class="style1">��ȣ�̵��� ��� üũ</span><img src="../common/images/dot_2.gif" align="middle"><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">ȸ����ȭ</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="tel1" class="InputLIneSelect">
                                      <option value=''>�����ϼ���</option>
                                      <option value='02' >02</option>
                                      <option value='031'>031</option>
                                      <option value='032'>032</option>
                                      <option value='033'>033</option>
                                      <option value='041'>041</option>
                                      <option value='042'>042</option>
                                      <option value='043'>043</option>
                                      <option value='051'>051</option>
                                      <option value='052'>052</option>
                                      <option value='053'>053</option>
                                      <option value='054'>054</option>
                                      <option value='055'>055</option>
                                      <option value='061'>061</option>
                                      <option value='062'>062</option>
                                      <option value='063'>063</option>
                                      <option value='064'>064</option>
                                    </select>
                                    -
                                    <input name="tel2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                    -
                                    <input name="tel3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" /></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">�ѽ�</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="fax1" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                    -
                                    <input name="fax2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                    -
                                    <input name="fax3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" /></td>
                                  <td class="T11PopupText">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">�̸�</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="uname" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style = "ime-mode:inable" /></td>
                                  <td class="T11PopupText"><img src="../common/images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
<!--                            <td height="30" class="PopupBold">�����</td>-->
<!--                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">-->
<!--                                <tr>-->
<!--                                  <td><select name="oper" class="InputLIneSelect" style="width:110" onChange="change_service(this.form.oper.value,this.form.company.value)">-->
<!--                                      <option value=''>�������������</option>-->
<!--                                    </select>-->
<!--                                  </td>-->
<!--                                  <td class="T11PopupText"><img src="../common/images/dot_2.gif" align="middle" /><FONT COLOR="ff3116">�ʼ�</FONT> <span class="style1">(�Ŵ����� �����ϼ���.)</span> </td>-->
<!--                                </tr>-->
<!--                              </table></td>-->
<!--                        		<tr>-->
<!--                          <td height="30" class="BlueText"><strong>���Ӻ� ����</strong></td>-->
<!--                          <td class="BlueText"><table width="405" border="0" cellspacing="0" cellpadding="0">-->
<!--                              <tr>-->
<!--                                <td width="100"><input type="radio" name="sType" value="C" checked id="str1">-->
<!--                                  		���Ӻ�����</td>-->
<!--                                <td width="250"><input type="radio" name="sType" value="P" id="str2">-->
<!--                                  		�Ⱓ������</td>-->
<!--                              </tr>-->
<!--                              </tr>-->
						<td height="30" class="PopupBold">�����</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><select name="oper" class="InputLIneSelect" style="width:110" onChange="change_service(this.form.oper.value,this.form.company.value)">
                                    <option value=''>�������������</option>
                                  </select>                                </td>
                                <td class="T11PopupText"><img src="<%=DIR_IMG%>dot_2.gif" align="absmiddle" /><font color="ff3116">�ʼ�</font> <span class="style1">(�Ŵ����� �����ϼ���.)</span> </td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="BlueText"><strong>���Ӻ� ����</strong></td>
                          <td class="BlueText"><table width="405" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="100"><input type="radio" name="sType" value="C" checked id="str1">
                                		  ���Ӻ�����</td>
                                <td width="250"><input type="radio" name="sType" value="P" id="str2">
                                  		�Ⱓ������</td>
                              </tr>
                          </table></td>
                        </tr>
                      </table>
                      </table></td>
                  </tr>
              </tr>
              <tr>
              <td>
		<!-- iframe    -->
		<iframe name="HiddenFrame1" width="1000" height="230" id="HiddenFrame1"  scrolling="NO"   FRAMEBORDER="0" src="/admin.do?cmd=admin_user_joinsys">
		</iframe>
			</td> 
			</tr>  
        <!-- iframe    -->
          <tr>
          <td height="40" align="right">
          <a href="#"><img style="margin-right:6px" src="../common/images/btn_regist.gif" width="42" height="22" onClick="Form_check()"></a>
          <a href="#"><img src="../common/images/btn_close.gif" width="42" height="22" onClick="javascript:window.close();"></a></td>
          <td>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<tr>
</tr>
</form>
</body>
</html>