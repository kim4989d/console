<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="console.common.tray.ResultSetTray"%>
<%@ page import="console.common.util.Util" %>
<%@ page import="java.util.StringTokenizer"%>
<%@ include file="/common/common.jsp"%>
<% 
    int           VendorCount           =	 0;  		//	�Ҽӻ� �ҷ� ���� 
    int           rowCount2         	= 	 0;  		//  ������ �ҷ� ����  
	int 		  rowCount3   			= 	 0; 		//  ������ �ҷ����� 2
	int 		  UserEditListCount		=	 0;			//  ���� ��� �ҷ� ���� 
	int			  UserServiceIdCount	=	 0;			//  �ý��� id�ҷ����� 
	int 		  UserSystemListCount	=	 0;			//  �ý��� ����Ʈ 
	int			  UserSmsWorkCount		=	 0;			//	SMS
	
	String uKind						=	"";
	String str_url						=	"";
	String hp							=	"";
	String company_tel					=	"";
	String company_fax					=	"";
	String service_id					=	"";
	
	String hp1							=	"";
	String hp2							=	"";
	String hp3							=	"";
	
	String tel1							=	"";
	String tel2							=	"";
	String tel3							=	"";
	
	String fax1							=	"";
	String fax2							=	"";
	String fax3							=	"";
	
	String sys_id						=	"";
	String sys_name						=	"";
	String sys_intention				=	"";
	String REG_DT						=	"";
	String work_flag					=	"";
	String uname						=	"";
	
    ResultSetTray join_list_tray   = null;  			// 		�Ҽӻ�
    ResultSetTray join_list_tray2  = null;  			// 		������1
    ResultSetTray join_list_tray3  = null;  			// 		������2
    ResultSetTray UserEditList     = null;  			// 		���� ��� �ҷ����� 
    ResultSetTray UserServiceId    = null;  			// 		�ý��� id �ҷ����� 
    ResultSetTray UserSystemList   = null;  			// 		�ý��� ����Ʈ 
	ResultSetTray UserSmsWorkList  = null;  			// 		SMS

    
	if(request.getAttribute("rsTray") !=null){
		join_list_tray = (ResultSetTray)request.getAttribute("rsTray");   	//  �Ҽӻ� �ҷ� ���� 
		VendorCount = join_list_tray.getRowCount();
	}
	if(request.getAttribute("rsTray2") != null){
		join_list_tray2 = (ResultSetTray)request.getAttribute("rsTray2"); 	//  ������ �ҷ� ���� 
		rowCount2 = join_list_tray2.getRowCount();
	}
	if(request.getAttribute("rsTray3") != null){
		join_list_tray3 = (ResultSetTray)request.getAttribute("rsTray3"); 	//  ������ �ҷ� ���� 2
		rowCount3 = join_list_tray3.getRowCount();
	}
	
	if(request.getAttribute("rsTray4") != null){
		UserEditList = (ResultSetTray)request.getAttribute("rsTray4"); 		//  ���� ��� �ҷ����� 
		UserEditListCount = UserEditList.getRowCount();
	}
	
	if(request.getAttribute("rsTray5") != null){
		UserServiceId = (ResultSetTray)request.getAttribute("rsTray5"); 	//  �ش� �ý���ID �ҷ����� 
		UserServiceIdCount = UserServiceId.getRowCount();
	}
	
	if(request.getAttribute("rsTray6") != null){
		UserSystemList = (ResultSetTray)request.getAttribute("rsTray6"); 	//  �ý��� ����Ʈ 
		UserSystemListCount = UserSystemList.getRowCount();
	}
	
	if(request.getAttribute("rsTray7") != null){
		UserSmsWorkList = (ResultSetTray)request.getAttribute("rsTray7");   //  SMS
		UserSmsWorkCount = UserSmsWorkList.getRowCount();
	}
	
	System.out.println(UserEditList);
	System.out.println(UserServiceId);
	System.out.println(UserSystemList);
	System.out.println(UserSmsWorkList);
	
	uKind			=	UserEditList.get("kind");							//	���������
	hp				=	UserEditList.get("cell_num");						//	�ڵ���
	company_tel		=	UserEditList.get("company_tel");					//	ȸ�� ��ȭ ��ȣ
	company_fax		=	UserEditList.get("company_fax");					//	fax 
	
%>

<%
		if(uKind.equals("A")){
			str_url="../admin/dummy.jsp";
		}else if(uKind.equals("O")){
			str_url="/admin.do?cmd=admin_user_joinname";
		}else{
			str_url="/admin.do?cmd=admin_user_joinsys";
		}

		//hp="12345678901010";
		//hp="123456";
		
		//if (hp.length() > 10){
			//hp1=hp.substring(0,2);
			//hp2=hp.substring(3,5);
			//hp3=hp.substring(6,8);
		//}else{
			//hp1=hp.substring(0,2);
			//hp2=hp.substring(3,5);
			//hp3=hp.substring(6,8);
		//}
		if(!company_tel.equals("")){
			StringTokenizer sdf = new StringTokenizer(company_tel,"-");
			//String[] tel = company_tel.split("-");  
			tel1 = sdf.nextToken();
			tel2 = sdf.nextToken();
			tel3 = sdf.nextToken();
		}
		if(!company_fax.equals("")){
			StringTokenizer sdf2 = new StringTokenizer(company_fax,"-");
			//String[] fax = company_tel.split("-");
			fax1 = sdf2.nextToken();
			fax2 = sdf2.nextToken();
			fax3 = sdf2.nextToken();
		}

		if(UserServiceIdCount	!=	0){
			for(int i=0; i<UserServiceIdCount; i++){
				service_id=UserServiceId.get("service_id",i)+","+service_id;
			}
				//str_find = " and "+substring(str_find,0,length(str_find)-5);				// �ӽ� �ּ�  ó�� 
				//service_id = Util.substring(service_id,0,Util.length(service_id)-1);		// �ӽ� �ּ� ó�� 
		}else if(!uKind.equals("O")){
			if(UserSystemListCount != 0){
				for(int i=0; i<UserSystemListCount; i++){
					
				//	a.system_id,b.host_id,a.service_id,a.intention,a.REG_DT
				sys_id			=	UserSystemList.get("system_id",i)+","+sys_id;
				sys_name		=	UserSystemList.get("host_id",i)+","+sys_name;
				sys_intention	=	UserSystemList.get("intention",i);
				REG_DT			=	UserSystemList.get("reg_dt",i);
	
				}
				//sys_id=Util.substring(sys_id,0,Util.length(sys_id)-1);						// �ӽ� �ּ� ó��
				//sys_name=Util.substring(sys_name,0,Util.length(sys_name)-1);				// �ӽ� �ּ� ó��
			}
		}
		if ((uKind.equals("G") || uKind.equals("M")) && UserEditList.get("cert_date").equals("")){
				work_flag = UserSmsWorkList.get("work_flag");
		}
		//<!-- �˾�������  1000 * 516-->
		
%>
<html>
<head>
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

	var id_pattern = new RegExp('[^a-zA-Z0-9_]'); 		 //���̵� ���ϰ˻� ���Խ�
	var passwd_pattern = new RegExp('[^a-zA-Z0-9]'); 	 //��й�ȣ
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
		document.form.str1.disabled=true; 
		document.form.str2.disabled=true; 		
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

var CHARGER_ID ="<%=UserEditList.get("charger_id")%>"

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

function ResmsSend(val,val1,val2)
{
	//SMS ���� �غ� ��
	window.alert("�غ����Դϴ�.");
	//HiddenFrame.location.href="user_sms_send.php?h="+val+"&c="+val1+"&p="+val2;

}
function OnsetSubmit(){
	var form = document.user_system
	form.target = "HiddenFrame1";
	form.action ="<%=str_url%>";
	form.method = "post";
    form.submit();
}

</script>
</head>
<body onload="change_menu('<%=uKind%>');OnsetSubmit()">
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
		uname 	=  join_list_tray2.get("name",i);
	out.println("group[1]["+k+"]=new Option(\""+uname+"\",\""+oper_id+"\");");
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
<form name="user_system">
	<input type="hidden" name="uid" value="<%=UserEditList.get("user_id")%>">
	<input type="hidden" name="sys_id" value="<%=sys_id%>">
	<input type="hidden" name="sys_name" value="<%=sys_name%>">
	<input type="hidden" name="svc_id"  value="<%=service_id%>">
	<input type="hidden" name="sys_intention" value="<%=sys_intention%>">
	<input type="hidden" name="cid" value="<%=UserEditList.get("charger_id")%>">
	<input type="hidden" name ="user_id" value ="<%=user_id%>">	
	<input type="hidden" name ="kind" value="<%=kind%>">
</form>

<form name="form" action="/admin.do?cmd=admin_user_joinins" method="post">
						<input type="hidden" name ="uid" value="<%=UserEditList.get("user_id")%>">
						<input type="hidden" name ="sys_id"value="<%=sys_id%>" >
						<input type="hidden" name ="sys_name" value="<%=sys_name%>">
						<input type="hidden" name ="service_id"  value="<%=service_id%>">
						<input type="hidden" name ="service_name">	
						<input type="hidden" name ="ported" value="<%=UserEditList.get("isported")%>">		
						<input type="hidden" name ="sys_intention" value="<%=sys_intention%>">
						<input type="hidden" name ="REG_DT" value="<%=REG_DT%>">
						<input type="hidden" name ="pre_sType" value="<%=UserEditList.get("type")%>">
						<input type="hidden" name ="pre_kind" value="<%=uKind%>">		
						<input type="hidden" name ="pre_hp" value ="<%=hp%>">
						<input type="hidden" name ="user_id" value ="<%=user_id%>">
				<%if (uKind.equals("O")){%>
						<input type="hidden" name="pre_item" value="<%=service_id%>">
				<%}else{%>
						<input type="hidden" name="pre_item" value="<%=sys_id%>">								
				<%}%>	  
<table width=1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="../common/images/pop_1000bg_01.jpg" class="PopupTitleBgWhite">
    <img src="../common/images/pop_img01.gif" width="8" height="17" align="middle" style="margin-left:10px; margin-right:10px">���� ��û ���</td>
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
                                  <td><b><%=UserEditList.get("user_id")%></b></td>
								<td><%if ((uKind.equals("G") || uKind.equals("M")) && UserEditList.get("cert_date").equals("") && !work_flag.equals("1") &&  !work_flag.equals("0")){%><img src="../common/images/btn_sms.gif" class="cursor_hand" onClick="ResmsSend('<%=hp%>','<%=UserEditList.get("cert_date")%>','<%=UserEditList.get("isported")%>')" align="absmiddle"><%}%></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold" >��ȣ</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd1" type="password" class="inputLIneGrayColor" size="23" maxlength="10" value="<%=UserEditList.get("password")%>"></td>
                                  <td>&nbsp;<span class="style1">���� ���� ���� 8�ڸ��� �Է� ���ּ���</span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">��ȣȮ��</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd2" type="password" class="inputLIneGrayColor" size="23" maxlength="10" value="<%=UserEditList.get("password")%>"/></td>
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
                                      <%if(kind.equals("A") ){ %>
                 
						                <OPTION value ="A" <%if(uKind.equals("A")){%>selected<%}%>>������</OPTION>
						                 <OPTION value ="O" <%if(uKind.equals("O")){%>selected<%}%>>�����</OPTION>
						              <%} %>   
						                  <OPTION value ="G" <%if(uKind.equals("G")){%>selected<%}%>>�Ϲݻ����</OPTION>
						                   <OPTION value ="M" <%if(uKind.equals("M")){%>selected<%}%>>���������۾���</OPTION>                
                                    </select></td>
                                  <td><img src="../common/images/dot_2.gif" align="middle"><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
	
                          <tr>
                            <td height="30" class="PopupBold">��û����</td>
                            <td  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50" value=<%=UserEditList.get("object")%>>
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
									                <option value="<%=join_list_tray.get("company_id",i)%>" <%if (join_list_tray.get("company_id",i).equals(UserEditList.get("company_id"))) {%>selected<%}%>><%=join_list_tray.get("company_name",i)%></option>
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
                                <OPTION value ="011" <%if (hp1.equals("011")){%>selected<%}%>>011</OPTION>
                                <OPTION value ="011" <%if (hp1.equals("017")){%>selected<%}%>>017</OPTION>
                                <OPTION value ="011" <%if (hp1.equals("018")){%>selected<%}%>>018</OPTION>
                                <OPTION value ="011" <%if (hp1.equals("019")){%>selected<%}%>>019</OPTION>
                                <OPTION value ="011" <%if (hp1.equals("010")){%>selected<%}%>>010</OPTION>
                                    </select>
                                    -
                                    <input name="hp2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" value="<%=hp2%>" />
                                    -
                                    <input name="hp3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" value="<%=hp3%>"/>
                                    
                                    <input name="isported" type="checkbox" value="1" <%if(UserEditList.get("isported").equals("1")) {%>CHECKED<%}%>> <span class="style1">��ȣ�̵��� ��� üũ</span>
                                    <img src="../common/images/dot_2.gif" align="middle"><FONT COLOR="ff3116"><FONT COLOR="ff3116">�ʼ�</FONT>
                               </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">ȸ����ȭ</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="tel1" class="InputLIneSelect">
	                                     <option value='02' <%if (tel1.equals("02")){%>selected<%}%>>02</option>
	                                     <option value='032' <%if (tel1.equals("032")){%>selected<%}%>>032</option>
	                                     <option value='033' <%if (tel1.equals("033")){%>selected<%}%>>033</option>
	                                     <option value='041' <%if (tel1.equals("041")){%>selected<%}%>>041</option>
	                                     <option value='042' <%if (tel1.equals("042")){%>selected<%}%>>042</option>
	                                     <option value='043' <%if (tel1.equals("043")){%>selected<%}%>>043</option>
	                                     <option value='051' <%if (tel1.equals("051")){%>selected<%}%>>051</option>
	                                     <option value='052' <%if (tel1.equals("052")){%>selected<%}%>>052</option>
	                                     <option value='053' <%if (tel1.equals("053")){%>selected<%}%>>053</option>
	                                     <option value='054' <%if (tel1.equals("054")){%>selected<%}%>>054</option>
	                                     <option value='055' <%if (tel1.equals("055")){%>selected<%}%>>055</option>
	                                     <option value='061' <%if (tel1.equals("061")){%>selected<%}%>>061</option>
	                                     <option value='062' <%if (tel1.equals("062")){%>selected<%}%>>062</option>
	                                     <option value='063' <%if (tel1.equals("063")){%>selected<%}%>>063</option>
	                                     <option value='064' <%if (tel1.equals("064")){%>selected<%}%>>064</option>
                                    </select>
                                    -
                                    <input name="tel2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" value="<%=tel2%>" />
                                    -
                                    <input name="tel3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" value="<%=tel3%>"/></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">�ѽ�</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td> 
 							<select name="fax1" class="inputLIneGrayColor">
	                                <option value=''>����</option>
	                                     <option value='02'  <%if (fax1.equals("02")){%>selected<%}%>>	02</option>
	                                     <option value='032' <%if (fax1.equals("032")){%>selected<%}%>>032</option>
	                                     <option value='033' <%if (fax1.equals("033")){%>selected<%}%>>033</option>
	                                     <option value='041' <%if (fax1.equals("041")){%>selected<%}%>>041</option>
	                                     <option value='042' <%if (fax1.equals("042")){%>selected<%}%>>042</option>
	                                     <option value='043' <%if (fax1.equals("043")){%>selected<%}%>>043</option>
	                                     <option value='051' <%if (fax1.equals("051")){%>selected<%}%>>051</option>
	                                     <option value='052' <%if (fax1.equals("052")){%>selected<%}%>>052</option>
	                                     <option value='053' <%if (fax1.equals("053")){%>selected<%}%>>053</option>
	                                     <option value='054' <%if (fax1.equals("054")){%>selected<%}%>>054</option>
	                                     <option value='055' <%if (fax1.equals("055")){%>selected<%}%>>055</option>
	                                     <option value='061' <%if (fax1.equals("061")){%>selected<%}%>>061</option>
	                                     <option value='062' <%if (fax1.equals("062")){%>selected<%}%>>062</option>
	                                     <option value='063' <%if (fax1.equals("063")){%>selected<%}%>>063</option>
	                                     <option value='064' <%if (fax1.equals("064")){%>selected<%}%>>064</option>
                              </select>	
                                    -
                                    <input name="fax2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber(); value="<%=fax2%>" />
                                    -
                                    <input name="fax3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" value="<%=fax3%>"/></td>
                                  <td class="T11PopupText">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">�̸�</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="uname" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style="ime-mode:inable" value="<%=UserEditList.get("name")%>" readonly/></td>
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
                                    <option value=''>����� ����</option>
                                    <% for(int i=0; i<rowCount3; i++){ %>
                			<option value="<%=join_list_tray3.get("user_id",i)%>" <%if(UserEditList.get("charger_id").equals(join_list_tray3.get("user_id",i))) {%>selected<%}%>><%=join_list_tray3.get("name",i)%></option>
									<% 
                                    }
									%>

                                  </select>                                </td>
                                <td class="T11PopupText"><img src="<%=DIR_IMG%>dot_2.gif" align="absmiddle" /><font color="ff3116">�ʼ�</font> <span class="style1">(�Ŵ����� �����ϼ���.)</span> </td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="BlueText"><strong>���Ӻ� ����</strong></td>
                          <td class="BlueText"><table width="405" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="100"><input type="radio" name="sType" value="C" id="str1" <%if (UserEditList.get("type").equals("C")){%>checked<%}%>>
                                		  ���Ӻ�����</td>
                                <td width="250"><input type="radio" name="sType" value="P" id="str2" <%if (UserEditList.get("type").equals("P")){%>checked<%}%>>
                                  		  �Ⱓ������</td>
                              </tr>
                          </table></td>
                        </tr>
                      </table>
                      </form>
                      </table></td>
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
</body>
</html>