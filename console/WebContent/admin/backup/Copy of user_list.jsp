<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ page import="console.common.util.Util"%>
<%@ include file="/common/common.jsp"%>

<% request.setCharacterEncoding("euc-kr"); %>
<%
		int AdminUserCount  	=   0;		

		String div				= 	"";
		String str_order 		=	"";
		String str_value		=   "";
		String str_kind			=	"";
		String KIND				=   "";
		String SID				=	"";					// ����� ID ��
		boolean KIND_CEHCK		=	false;
		
		
		SID 					=	"ngsadmin";			//�ӽ� ���̵� �� �ο� 
	    ResultSetTray Admin_UserList   = null;   	 	//
	    String	checkbox			= "";       		// select box �� 
	    
		div 	= 	request.getParameter("div");		// left �޴� �� 
		if (div == "" || div == null) div ="ALL";
		
		str_order =	request.getParameter("o");			// �˻� Ÿ�� ���� 1�� ��� desc 
		str_value =	request.getParameter("s");			// �˻� Ÿ�� ���� 1�� ��� desc
	     
	    checkbox	=	(String)request.getAttribute("checkbox");
		
		if(request.getAttribute("rsTray") !=null){
			Admin_UserList = (ResultSetTray)request.getAttribute("rsTray");
			AdminUserCount = Admin_UserList.getRowCount();
		}
		

		
%>
<html>
<head>
<title>����ڰ���>����ڰ���</title>
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
	background-image: url();
}
-->
</style>
<script type="text/javascript"> 

function List(){
	alert("�˻� �մϴ� ");
 	var frm=document.look;
 		frm.action="/admin_user.do?cmd=admin_user_list";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
 }
 
function ExcelDown(){
 	var frm = document.listfrm;
 		frm.action="/server.do?cmd=exceldown";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
 }
function allRefresh()
	{
		//window.parent.frames["leftFrame"].location.reload() ;
		//window.parent.frames["mainFrame"].location.reload();
		location.reload();
	}
function godelete(user_id,name,uKind)
	{
			var name;
			var cert_id;
			if(confirm(name+"���� ���� �Ͻðڽ��ϱ�?")) {
			  location.href="user_del.php?uid="+user_id+"&k="+uKind
			} else {
			  return;
			}
	}
function emergency(val)
	{	
	
	  if (val)
	  {
		  if(confirm("������  ��Ȳ������ ���� ������ ����˴ϴ�.\n\n�����Ͻðڽ��ϱ�?\n\n����ֺ����Ϸ�� ���������� �Ͻñ�ٶ��ϴ�!")) {
				HiddenFrame.location.href="user_emergency.php?f=1"
			}
			else return;
	  }
	 else
	  {
		  if(confirm("�Ϲ� ������� �������� ���� �մϴ�.")) {
				HiddenFrame.location.href="user_emergency.php?f=2"
			}
			else return;		
		}
		
	}
var newPoup;    // ���������� ������ ��...	
	function newWin(val,act)
	{
		var result;
		if (act=="insert") var url="user_reg.php?uid="+val
		if (act=="edit") var url="user_edit.php?uid="+val		
		
		
	var re = "toolbar=no, resizable=0,scrollbars=no, status=0,location=no, resize=0, menubar=no, directories=no, copyhistory=0, width=902, height=486, top=100, left=50";
	 if (newPoup != null)     newPoup.close();
	newPoup=window.open(url, 'user', re);
	}

	function newWin(val1,val2,val3,val4)
	{
	var url="user_system_list.php?uid="+val2+"&unm="+val1+"&kind="+val3+"&comp="+val4
	var re = "toolbar=no, resizable=0,scrollbars=no, status=0,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=502, height=546, top=200, left=370";
	 if (newPoup != null)     newPoup.close();
	newPoup=window.open(url, 'syslist', re);
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
		location.href=val2+'.php?o='+val+"&s="+sort_value+"&div="+val1+"&page="+<?=$page?>;
	}
</script>
</head>
<body>
	<form name="look" method="post" action="admin_user.do?cmd=admin_user_list">
	<input type="hidden" name="div" value="<%=div%>" >
	<input type="hidden" name="sort_name" value="<%=str_order%>" >
	<input type="hidden" name="sort_value" value="<%=str_value%>" >
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
                        <td><img style="margin-right:15px"src="/common/images/icon01.gif" align="absmiddle" /></td>
                        <td><img style="margin-right:15px"src="/common/images/text_top_service6.gif" /></td>
                        <td class="MenuTopText">����� ��Ȳ &gt;&gt; TMLL</td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                  <td height="8"></td>
                </tr>
                <tr>
                  <td height="32" background="/common/images/search_line01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <colgroup>
                      <col width="*">
                      <col width="30">
                      <col width="220">
                      <col width="30">
                      </colgroup>
                      <tr>
                        <td><%=checkbox%><td>
                        <a href="#"><img  style="margin-right:8px"src="/common/images/search_btn_ok.gif" /></a></td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="6"></td>
                </tr>
                <tr>
                  <td align="right" class="T11PgaeNum"><img style="margin-right:10px"src="/common/images/icon02.gif" align="absmiddle">�� <strong>2</strong> ������ <B><FONT COLOR="ed7338">1/1</FONT></b></td>
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
                        <col width="80">
						<col width="100">
                        <col width="80">
                        <col width="80">
                        <col width="170">
                        <col width="80">
                        <col width="75">
                        <col width="*">
                        </colgroup>
                        <tr class="TableBgBold">
                        <td height="34" class="TableBg"><a href="#" onClick="user_sort('name','<%=div%>','user_list');">������̸�</a><img  style="margin-left:3px"src="/common/images/arrow_dowun.gif"></td>
                        <td class="TableBg"><a href="#" onClick="user_sort('user_id','<%=div%>','user_list');">�����ID</a><img  style="margin-left:3px"src="/common/images/arrow_dowun.gif"></td>
                        <td class="TableBg">�Ҽ�</td>
                        <td class="TableBg"><a href="#" onClick="user_sort('kind','<%=div%>','user_list');">����</a><img  style="margin-left:3px"src="/common/images/arrow_dowun.gif"></td>
                        <td class="TableBg"><a href="#" onClick="user_sort('last_login_dt','<%=div%>','user_list');">�����α��� �ð�</a><img  style="margin-left:3px"src="/common/images/arrow_dowun.gif"></td>
                        <td class="TableBg">������̸�</td>
                        <td class="TableBg">�����Ȳ</td>
                        <td class="TableBg">����</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><div style="height:312; overflow-y:scroll;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="80">
						<col width="100">
                        <col width="80">
                        <col width="80">
                        <col width="170">
                        <col width="80">
                        <col width="75">
                        <col width="*">
                        </colgroup>
<!--      a.user_id,a.name,c.COMPANY_NAME,a.cell_num,a.KIND,a.last_login_dt-->
                            <%
						if(AdminUserCount==0){
					  %>
					 <tr><td colspan='4'>�˻��� ���̺��̾����ϴ�</td><tr>
					 <%}else{ 
					    for(int i=0;i<AdminUserCount;i++){
							KIND	=	 Admin_UserList.get("kind",i);	// ����� ���� �м� 
							if (KIND.equals("A")){
								str_kind="������";
							}else if (KIND.equals("O")){
								str_kind="�����";
							}else if (KIND.equals("G")){
								str_kind="�Ϲݻ����";
							}else if (KIND.equals("E")){
								str_kind="���޻����";
								KIND_CEHCK = true;
							}else if (KIND.equals("M")){
								str_kind="��������";
							}
					    	%>
					    	<tr>
                            <td class="TableBgText"><%=Admin_UserList.get("name",i)%></td>
                            <td class="TableBgText"><a href="#" onClick="blur();newWin('<%=Admin_UserList.get("user_id",i)%>','edit');"><strong><%=Admin_UserList.get("user_id",i)%></strong></a></td>
                            <td class="TableBgText"><%=Admin_UserList.get("company_name",i) %></td>
                            <td class="TableBgText"><%=str_kind%></td>
                        	<td class="TableBgTextDate"><%=Admin_UserList.get("date_format(a.last_login_dt,'%y/%m/%d %h:%i')",i)%></td>
                            <td class="TableBgText"><%
                            if(Admin_UserList.get("kind",i).equals("A") || Admin_UserList.get("kind",i).equals("O")){%>
                            N/A
                            <%}else{%>
                            <%=Admin_UserList.get("cname",i)%>
                            <%}%>
                            </td>
                            
                            <%if(Admin_UserList.get("kind",i).equals("G") || Admin_UserList.get("kind",i).equals("M") || Admin_UserList.get("kind",i).equals("E")) {%>
                          <td class="TableBgText"><img src="/common/images/auth_list/com.gif"  onClick="newWin1('<%=Admin_UserList.get("name",i)%>','<%=Admin_UserList.get("user_id",i)%>','<%=Admin_UserList.get("kind",i)%>','<%=Admin_UserList.get("COMPANY_NAME",i)%>')"></td> 
                          <%}else{%>
                          <td class="TableBgText">��Ȱ��</td>
                          
							<%}%>
                          <td class="TableBgText"><a href="#"><img src="/common/images/btn_delete.gif" border="0" align="absmiddle"  style="margin-left:10px" onClick="godelete('<%=Admin_UserList.get("user_id",i)%>','<%=Admin_UserList.get("name",i)%>','<%=Admin_UserList.get("kind",i)%>')" alt="����" ></a></td>
                          </tr>
                          <%} 
						 }
                          %>
                        </table>
                      </div></td>
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
            <!--����¡ ó�� Ŭ���� ��-->
            <b><font color="ff7635"><img src="/common/images/btn_p1.gif" width="16" height="15" align="absmiddle">&nbsp;1&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;2&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;3&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;4&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;5&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;6&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;7&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;8&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;9&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;10&nbsp;</font></b> <img src="/common/images/btn_n2.gif" width="16" height="15" align="absmiddle"></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="29"></td>
          <td align="right" valign="top"><a href="#"><img style="margin-right:6px"src="/common/images/auth_list/btn_em1.gif"></a><a href="#"><img style="margin-right:6px"src="/common/images/btn_renewal.gif" onclick="allRefresh();"></a><a href="#"><img style="margin-right:6px"src="/common/images/btn_excel.gif" onclick="ExcelDown();"></a><a href="#"><img src="/common/images/auth_list/btn_user.gif" onclick="javascript:newWin('<%=SID%>','insert')" ></a></td>
          <td></td>
        </tr>
</table>
</form>
</body>
</html>
