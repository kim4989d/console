<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@page import="console.common.tray.ResultSetTray" %>
 
<% 

    int           rowCount         = 0;  //��� ��� ��� ���� 
    int           rowCount2         = 0; //������ �ҷ� ����
    int           rowCount3         = 0; //����� �з�1
    int           rowCount4         = 0; //����� �з�2
    int           rowCount5         = 0; //����� �з�3
    
    ResultSetTray join_list_tray  = null;  // 
    ResultSetTray join_list_tray2  = null;  // 
    ResultSetTray join_list_tray3  = null;  //����� �з�1
    ResultSetTray join_list_tray4  = null;  //����� �з�2
    ResultSetTray join_list_tray5  = null;  //����� �з�3

    //String	checkbox="";
    //checkbox	=	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
		join_list_tray = (ResultSetTray)request.getAttribute("rsTray");  //��� ��� ��� �ҷ� ���� 
		rowCount = join_list_tray.getRowCount();
	
		join_list_tray2 = (ResultSetTray)request.getAttribute("rsTray2"); //������(�Ŵ���) �ҷ� ���� 
		rowCount2 = join_list_tray2.getRowCount();
		
		join_list_tray3 = (ResultSetTray)request.getAttribute("rsTray3"); //����� �з�1 
		rowCount3 = join_list_tray3.getRowCount();
		
		join_list_tray4 = (ResultSetTray)request.getAttribute("rsTray4"); //����� �з�2 
		rowCount4 = join_list_tray4.getRowCount();
		
		join_list_tray5 = (ResultSetTray)request.getAttribute("rsTray5"); //����� �з�3
		rowCount5 = join_list_tray5.getRowCount();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>���� ��û ��� </title>
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
<script language="JavaScript" src="./js/Calendar.js"></script>
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
		window.open("../id_repeat.php?id="+str,"checkid","scrollbars=no,resizeable=no,width=340,height=109, top=200, left=150");

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

	/* 2.�ֹι�ȣ 
	var chk =0
	var yy = form.ssn1.value.substring(0,2);
	var mm = form.ssn1.value.substring(2,4);
	var dd = form.ssn1.value.substring(4,6);
	var sex  = form.ssn2.value.substring(0,1);
	
	if ((form.ssn1.value.length!=6)||(mm <1||mm>12||dd<1))
	{
    		alert ("�ֹε�Ϲ�ȣ�� �ٷ� �Է��Ͽ� �ֽʽÿ�.");
    		form.ssn1.focus();
    		return ;
    	}
 	if ((sex != 1 && sex !=2 )||(form.ssn2.value.length != 7 ))
	{
    		alert ("�ֹε�Ϲ�ȣ�� �ٷ� �Է��Ͽ� �ֽʽÿ�.");
		form.ssn2.focus(); 
    		return ;
    	}   
	
	// �ֹε�Ϲ�ȣ üũ 
  	for (var i = 0; i <=5 ; i++)
	{ 
		chk = chk + ((i%8+2) * parseInt(form.ssn1.value.substring(i,i+1)));
 	}

  	for (var i = 6; i <=11 ; i++)
	{ 
      	  	chk = chk + ((i%8+2) * parseInt(form.ssn2.value.substring(i-6,i-5)));
 	}
  	
  	chk = 11 - (chk %11);
  	chk = chk % 10;

  	if (chk != form.ssn2.value.substring(6,7))
  	{   
    		alert ("��ȿ���� ���� �ֹε�Ϲ�ȣ�Դϴ�.");
    		form.ssn1.focus();
    		return ;
    	}	
		*/
 	var temp=document.form.uname.value
	if (temp=="")
	{
		alert("�̸��� �Է����ּ���")
		document.form.uname.focus();
		return false;
	}
 	var temp=document.form.oper.value;
	var temp1=document.form.uKind.value;
	if (temp=="" && temp1!="O")
	{
		alert("����ڸ� �������ּ���!")
		document.form.oper.focus();
		return false;
	}	

 	var temp=document.form.sys_id.value;
	var temp1=document.form.uKind.value;
	if (temp1!="O" )
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
	else
	{
	 	var temp=document.form.service_id.value
		if (temp=="")
		{
			alert(" ���񽺸� �������ּ���!")
			return false;
		}		

	}
	form.submit();
	return;
}
function change_menu(val)
{
	var val;
	if (val=="O")
	{
		document.form.oper.disabled=true; 				
		document.form.oper.style.background="#e8e8e8";
		HiddenFrame1.location.href="consolejoinsys_name.do?cmd=console_join_sys_name";
		return;
	}
	else
	{
		document.form.oper.disabled=false; 				
		document.form.oper.style.background="#FFFFFF";	
		HiddenFrame1.location.href="consolejoinsys.do?cmd=console_join_sys";
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
			HiddenFrame1.location.href="consolejoinsys.do?cmd=console_join_sys&cid="+oper_id+"&com="+val2;
			return;
			}
		}
	}
}
</script>
<!--<?include $_HOME["FNC_HOME"]."/select.php";  ?> ���� �ʿ��� select �޴��� �ҷ��� --> 

<SCRIPT language='JavaScript'>
function uKindChange() {
 var x = document.form.uKind.options.selectedIndex;
 var groups=document.form.uKind.options.length;
 var group=new Array(groups);
 for (i=0; i<groups; i++)
 group[i]=new Array();
 group[0][0]=new Option("�����ϼ���","");
 group[1][0]=new Option("admin����","");
 group[1][1]=new Option("MC����","bmdzYWRtaW4=");
 group[1][2]=new Option("���ؼ�","YW1hdGV1cw==");
 group[1][3]=new Option("�����ũ","anV0X3Rlc3Q=");
 group[1][4]=new Option("������","ZmFyc2Vlcg==");
 group[1][5]=new Option("�����","cHl1bg==");
 group[1][6]=new Option("�÷���������1","cGxhdGZvcm0x");
 group[1][7]=new Option("�÷���������2","cGxhdGZvcm0y");
 group[1][8]=new Option("�����","amRoYTAxMQ==");
 group[2][0]=new Option("admin����","");
 group[2][1]=new Option("ngs���","bmdzb3Blcg==");
 group[2][2]=new Option("������","ZGhrYW5n");
 group[2][3]=new Option("�ǿ���","eWNrd29u");
 group[2][4]=new Option("������","d2ViMjE=");
 group[2][5]=new Option("�����","MTEwMjA4MQ==");
 group[2][6]=new Option("������","MTEwNzk2Nw==");
 group[2][7]=new Option("���¿�","dHdraW0=");
 group[2][8]=new Option("���¿�","dHdraW0xMjM=");
 group[2][9]=new Option("������","MTEwNDk3OQ==");
 group[2][10]=new Option("�ں���","MTEwNDE3NQ==");
 group[2][11]=new Option("�ڿ뼮","eW9uZ3Nlb2t5");
 group[2][12]=new Option("������","amJwYXJrMDE=");
 group[2][13]=new Option("���°�","MTEwODEyMg==");
 group[2][14]=new Option("�۰���","c3MxMjkw");
 group[2][15]=new Option("��ȣ��","MTEwNDA4Mw==");
 group[2][16]=new Option("���ؼ�","MTEwNTY4OA==");
 group[2][17]=new Option("������","eWhqa2p5");
 group[2][18]=new Option("�̱���","MTEwMzQxNg==");
 group[2][19]=new Option("���κ�","MTEwMzA4OQ==");
 group[2][20]=new Option("���ؼ�","b3BlcmF0b3I=");
 group[2][21]=new Option("������","MTEwMjExMw==");
 group[2][22]=new Option("õ����","dGVsYXJpbg==");
 group[2][23]=new Option("õ�ռ�","YnJfb3Blcg==");
 group[2][24]=new Option("������","MTEwMjYyNA==");
 group[2][25]=new Option("�ܼ�","Y29uc29sZQ==");
 group[2][26]=new Option("�����","MTEwNjAwNQ==");
 group[3][0]=new Option("admin����","");
 group[3][1]=new Option("ngs���","bmdzb3Blcg==");
 group[3][2]=new Option("������","ZGhrYW5n");
 group[3][3]=new Option("�ǿ���","eWNrd29u");
 group[3][4]=new Option("������","d2ViMjE=");
 group[3][5]=new Option("�����","MTEwMjA4MQ==");
 group[3][6]=new Option("������","MTEwNzk2Nw==");
 group[3][7]=new Option("���¿�","dHdraW0=");
 group[3][8]=new Option("���¿�","dHdraW0xMjM=");
 group[3][9]=new Option("������","MTEwNDk3OQ==");
 group[3][10]=new Option("�ں���","MTEwNDE3NQ==");
 group[3][11]=new Option("�ڿ뼮","eW9uZ3Nlb2t5");
 group[3][12]=new Option("������","amJwYXJrMDE=");
 group[3][13]=new Option("���°�","MTEwODEyMg==");
 group[3][14]=new Option("�۰���","c3MxMjkw");
 group[3][15]=new Option("��ȣ��","MTEwNDA4Mw==");
 group[3][16]=new Option("���ؼ�","MTEwNTY4OA==");
 group[3][17]=new Option("������","eWhqa2p5");
 group[3][18]=new Option("�̱���","MTEwMzQxNg==");
 group[3][19]=new Option("���κ�","MTEwMzA4OQ==");
 group[3][20]=new Option("���ؼ�","b3BlcmF0b3I=");
 group[3][21]=new Option("������","MTEwMjExMw==");
 group[3][22]=new Option("õ����","dGVsYXJpbg==");
 group[3][23]=new Option("õ�ռ�","YnJfb3Blcg==");
 group[3][24]=new Option("������","MTEwMjYyNA==");
 group[3][25]=new Option("�ܼ�","Y29uc29sZQ==");
 group[3][26]=new Option("�����","MTEwNjAwNQ==");
temp = document.form.oper;
 for (m = temp.options.length-1 ; m > 0 ; m--)
  temp.options[m]=null
 for (i=0;i<group[x].length;i++){
  temp.options[i]=new Option(group[x][i].text,group[x][i].value)
 }
 temp.options[0].selected=true
}
</SCRIPT>



</head>

<body>
<table width="800" border="0" cellpadding="0" cellspacing="1" bgcolor="">
  <tr>
    <td bgcolor=""><table width="800" border="0" cellpadding="0" cellspacing="0" bgcolor="">
        <tr>
          <td><table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="405" height="37" class="PopupTitleBgWhite"><img src="../images/common/spacer.gif" width="10" height="3">NGS 
                  ����  ��û ���</td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="4" bgcolor=""></td>
        </tr>
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="500">
				<form name="form" action="g_join_ins.php" method="post">
					<input type="hidden" name="id_check" >
					<input type="hidden" name="sys_id">
					<input type="hidden" name="sys_name">
					<input type="hidden" name="service_id">		
					<input type="hidden" name="service_name">		
					<input type="hidden" name="sys_intention" >				
				<table width="500" border="0" cellspacing="0" cellpadding="0">
                    <tr bgcolor=""> 
                      <td height="30" class="PopupBold"><span class="OrangeText"><strong>����� 
                        ����</strong></span></td>
                      <td></td>
                    </tr>
                    <tr> 
                      <td width="95" height="30" class="PopupBold">����� ID </td>
                      <td width="405" class="PopupLine" ><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="uid" type="text" class="inputLIneGrayColor" size="23" maxlength="13"></td>
                            <td width="250" class="T11PopupText"><input type="button" value="�ߺ�äũ" name="idcheck" width="65" height="21" border="0" align="absmiddle" class="Cursor_Hand" id="idcheck" onClick="id_chk();"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">��ȣ</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="pwd1" type="password" class="inputLIneGrayColor" size="23" maxlength="10"></td>
                            <td width="250" class="T11PopupText">���� ���� ���� 8�ڸ��� �Է� ���ּ���</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">��ȣȮ��</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="pwd2" type="password" class="inputLIneGrayColor" size="23" maxlength="10"></td>
                            <td width="250" class="T11PopupText">���� �Է��Ͻ� ��ȣ�� �����ϰ� �Է��ϼ���.</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">����� ����</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"> 
							<select name="uKind" class="inputLIneGrayColor" onChange="uKindChange();change_menu(this.form.uKind.value)">
								<OPTION value ="">����</OPTION>
								<OPTION value ="O">�����</OPTION>
								<OPTION value ="G" selected>�Ϲݻ����</OPTION>
								<OPTION value ="M">���������۾���</OPTION>
                              </select></td>
                              <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10" align="absmiddle"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">��û����</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50"> 
                              <img src="../images/common/popup_must2.gif" width="27" height="10" align="absmiddle"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">�Ҽӻ�</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"> 
	<select name="company" class="inputLIneGrayColor">
                <OPTION value ="">����</OPTION>
<% for(int i=0; i<rowCount; i++){%>
                <option value="<%=join_list_tray.get("company_id",i)%>"><%=join_list_tray.get("company_name",i)%></option>
<% 
}
%>
                              </select> </td>
                            <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">�޴���</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><select name="hp1" size="1" class="inputLIneGrayColor">
                                <option value ="">�����ϼ���</option>
                                <option value ="011">011</option>
                                <option value ="016">016</option>
                                <option value ="017">017</option>
                                <option value ="018">018</option>
                                <option value ="019">019</option>
                                <option value ="010" selected>010</option>
                              </select>
                              - 
                              <input name="hp2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();">
                              - 
                              <input name="hp3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();">
							  <input name="isported" type="checkbox" value="1"> ��ȣ�̵��� ��� üũ
							  <img src="../images/common/popup_must2.gif" width="27" height="10" align="absmiddle">
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">ȸ �� �� ȭ</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><select name="tel1" class="inputLIneGrayColor">
                                <option value=''>�� �� �� �� ��</option>
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
                              <input name="tel2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();">
                              - 
                              <input name="tel3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">�� ��</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="fax1" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" >
                              - 
                              <input name="fax2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" >
                              - 
                              <input name="fax3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" ></td>
                              <td width="250" class="T11PopupText">&nbsp; </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>  
                      <td height="30" class="PopupBold">�� ��</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="uname" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style = "ime-mode:inable"></td>
                            <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">�����</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155">
							<select name="oper" class="inputLIneGrayColor" style="width:110" onchange="change_service(this.form.oper.value,this.form.company.value)">
                                <OPTION value=''>�������������</OPTION>
                            </select>
							 </td>
                            <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10"> 
                              (�Ŵ����� �����ϼ���.) </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
				  </form>
				  </td>
                <td valign="top"><iframe name="HiddenFrame1" width="400" height="270" id="HiddenFrame1"  scrolling="NO"   FRAMEBORDER="0" src="consolejoinsys.do?cmd=console_join_sys"></iframe></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td height="33" bgcolor=""><table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="95">&nbsp;</td>
                <td width="710" align="center"><input type="button" value="���" width="39" height="27" align="absmiddle" class="Cursor_Hand" onClick="Form_check()"> 
                  <input type="button" value="�ݱ�" width="39" height="27" align="absmiddle" class="Cursor_Hand" onClick="javascript:window.close();"></td>
                <td width="95" align="right"></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<script language="JavaScript">
	window.document.onload = document.form.uid.focus();
	window.document.onload = uKindChange();change_menu('G')
</script>
</body>
</html>



















<html>
<head>
<!-- �˾�������  1000 * 506-->
<title>�˾�_NGS ���� ��û ���</title>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
<META NAME="CONTENT-LANGUAGE" CONTENT="KR">
<LINK REL='STYLESHEET' HREF='../css/skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='../css/skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
.style1 {
	font-size: 11px
}
-->
</style>
</head>
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
<body>
<table width=1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="../images/pop_1000bg_01.jpg" class="PopupTitleBgWhite"><img src="../images/pop_img01.gif" width="8" height="17" align="absmiddle" style="margin-left:10px; margin-right:10px">NGS ���� ��û ���</td>
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
                                  <td>&nbsp;<a href="#"><img src="../images/btn_id_check.gif" align="absmiddle"></a></td>
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
                                  <td><select name="uKind" class="InputLIneSelect" onchange="uKindChange();change_menu(this.form.uKind.value)">
                                      <option value ="">����</option>
                                      <option value ="O">�����</option>
                                      <option value ="G" selected="selected">�Ϲݻ����</option>
                                      <option value ="M">���������۾���</option>
                                    </select></td>
                                  <td><img src="../images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">��û����</td>
                            <td  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50">
                                    <img src="../images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="BlueText"><strong>�Ҽӻ�</strong></td>
                            <td><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="company" class="InputLIneSelect">
                                      <option value ="">����</option>
                                      <option value="ABLECOM">���̺���</option>
                                      <option value="ADS">�ռ�����Ÿ�ý���</option>
                                      <option value="AHNLAB">��ö��������</option>
                                      <option value="AIRCROSS">����ũ�ν�</option>
                                      <option value="ATSolution">ATSolution</option>
                                      <option value="BLUEDIGM">������</option>
                                      <option value="BNSWORKS">BNSWORKS</option>
                                      <option value="BTBSoluti">BTB�ַ��</option>
                                      <option value="CASSIS">CASSIS</option>
                                      <option value="CITYGAME">��Ƽ����</option>
                                      <option value="CP">Ŀ�ӽ��÷���</option>
                                      <option value="DONGDEUK">�����������</option>
                                      <option value="EASYMON">������</option>
                                      <option value="EFOTEK">������</option>
                                      <option value="EMC">EMC</option>
                                      <option value="ENCOREPLUS">���ھ��÷���</option>
                                      <option value="FORCS">���ÿ���</option>
                                      <option value="GTPLUS">GT�÷���</option>
                                      <option value="HAEORUM">�ؿ���</option>
                                      <option value="HP">HP</option>
                                      <option value="IBM">IBM</option>
                                      <option value="ICENT">���̼�Ʈ</option>
                                      <option value="ICONLAB">�����ܷ�</option>
                                      <option value="IGLOOSEC">�̱۷��ť��Ƽ</option>
                                      <option value="IMC">IMC</option>
                                      <option value="INFOSEC">������</option>
                                      <option value="INNOTECH">�̳���ũ</option>
                                      <option value="INSOFT">���̿�����Ʈ</option>
                                      <option value="INZEN">����</option>
                                      <option value="ITPlus">ITPlus</option>
                                      <option value="IWT">���̴�����Ƽ</option>
                                      <option value="JAEUNGTECH">�����ũ</option>
                                      <option value="KEY2NET">KEY2NET</option>
                                      <option value="KOREANET">�ڸ��Ƴ�Ʈ</option>
                                      <option value="KORNIC">�ڴб۷θ�</option>
                                      <option value="LINUXONE">��������</option>
                                      <option value="MANTECH">����</option>
                                      <option value="MCURIX">��ť����</option>
                                      <option value="Microsoft">Microsoft�μ�����</option>
                                      <option value="NCODING">���ڵ��н�</option>
                                      <option value="NEXTCODE">�ؽ�Ʈ�ڵ�</option>
                                      <option value="NEXTGATE">�ؽ�����Ʈ</option>
                                      <option value="NKIA">��Ű��</option>
                                      <option value="NOKIA">��Ű��</option>
                                      <option value="PIXBYTE">�Ƚ�����Ʈ</option>
                                      <option value="PSYNET">���̳�</option>
                                      <option value="QCOM">ť��</option>
                                      <option value="RATHONTECH">������ũ</option>
                                      <option value="ROCKPLACE">���÷��̽�</option>
                                      <option value="RSUPPORT">�˽���Ʈ</option>
                                      <option value="SIGMAINFO">�ñ׸��������</option>
                                      <option value="SKCC">SK C&amp;C</option>
                                      <option value="SKTelecom">SKTelecom</option>
                                      <option value="SVL">SVL</option>
                                      <option value="TGCORP">Ƽ������</option>
                                      <option value="UCLICK">��Ŭ��</option>
                                      <option value="XEST">����Ʈ�������</option>
                                      <option value="ZESPRO">��������</option>
                                      <option value="cipher_cas">������ĳ����</option>
                                      <option value="solvix">�ֺ�</option>
                                      <option value="varobision">�ٷκ���</option>
                                    </select></td>
                                  <td><img src="../images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">�ʼ�</FONT></td>
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
                                  <td><select name="hp4" size="1" class="InputLIneSelect">
                                      <option value ="">�����ϼ���</option>
                                      <option value ="011">011</option>
                                      <option value ="016">016</option>
                                      <option value ="017">017</option>
                                      <option value ="018">018</option>
                                      <option value ="019">019</option>
                                      <option value ="010" selected="selected">010</option>
                                    </select>
                                    -
                                    <input name="hp4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    -
                                    <input name="hp4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    <input name="isported2" type="checkbox" value="1" />
                                    <span class="style1">��ȣ�̵��� ��� üũ</span><img src="../images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">ȸ����ȭ</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="tel4" class="InputLIneSelect">
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
                                    <input name="tel4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    -
                                    <input name="tel4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" /></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">�ѽ�</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    -
                                    <input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    -
                                    <input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" /></td>
                                  <td class="T11PopupText">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">�̸�</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="uname2" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style = "ime-mode:inable" /></td>
                                  <td class="T11PopupText"><img src="../images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">�����</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="oper2" class="InputLIneSelect" style="width:110" onchange="change_service(this.form.oper.value,this.form.company.value)">
                                      <option value=''>�������������</option>
                                    </select>
                                  </td>
                                  <td class="T11PopupText"><img src="../images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">�ʼ�</FONT> <span class="style1">(�Ŵ����� �����ϼ���.)</span> </td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="30" colspan="2" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="4" bgcolor="#9ab1cf">
                    </tr>
                    <tr>
                      <td height="30" class="OrangeText"><strong>����� ��Ȳ</strong></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <colgroup>
                    <col width="40%">
                    <col width="*">
                    </colgroup>
                    <tr>
                      <td><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td class="BlueText"><strong>���� ����</strong></td>
                            <td><select name="oper" class="InputLIneSelect">
                                <option value ="">����ڸ� �����ϼ���</option>
                              </select></td>
                          </tr>
                        </table></td>
                      <td width="700" align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="4"></td>
                          </tr>
                          <tr>
                            <td height="2" bgcolor="#c9c9c9"></td>
                          </tr>
                          <tr>
                            <td height="4" align="center"></td>
                          </tr>
                          <tr>
                            <td width="700" align="center"><table border="0" cellspacing="0" cellpadding="0">
                                <colgroup>
                                <col width="340">
                                <col width="*">
                                <col width="340">
                                </colgroup>
                                <tr>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="../images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>��Ͻý���</strong></td>
                                      </tr>
                                    </table></td>
                                  <td align="center">&nbsp;</td>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="../images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>��û�ý���</strong></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table>
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="30" align="center" class="PopupLine"><select multiple size="7" name="reg_system" style="width:340" onDblClick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                                    </select></td>
                                  <td align="center"><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="center"><img src="../images/btn_S1.gif" width="20" height="17" /></td>
                                      </tr>
                                      <tr>
                                        <td align="center">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td align="center"><img src="../images/btn_S2.gif" width="20" height="17" /></td>
                                      </tr>
                                    </table></td>
                                  <td height="30" align="center" class="PopupLine"><select multiple size="7" name="reg_system2" style="width:340" ondblclick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                                    </select></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="4" align="center"></td>
                          </tr>
                          <tr>
                            <td height="2" bgcolor="#c9c9c9"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td colspan="2"  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td height="30" class="PopupBold">������</td>
                            <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td height="30" align="right"><a href="#"><img style="margin-right:6px" src="../images/btn_regist.gif" width="42" height="22" onClick="Form_check()"></a><a href="#"><img src="../images/btn_close.gif" width="42" height="22" onClick="javascript:window.close();"></a></td>
          <td></td>
        </tr>
      </table></td>
  </tr>
</table>
<script language="JavaScript">
	window.document.onload = document.form.uid.focus();
	window.document.onload = uKindChange();change_menu('G')
</script>
</body>
</html>
