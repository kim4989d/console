<!-- 
	Amin�� ��û ������ ��Ȳ-> unix �۾���û ��Ȳ ���� ������.	
 -->
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "admin.equip.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@page import="admin.app.AppDBBean"%>
<%@page import="admin.app.AppDataBean"%>
<%@ page import = "java.text.SimpleDateFormat" %>


<% 
	request.setCharacterEncoding("euc-kr"); 

    int count  = 0;
    
    AppDBBean dbPro = AppDBBean.getInstance();
    count = dbPro.getArticleCount();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	AppDataBean data = dbPro.getDatas();
%>

<head>
<title>Admin ��û��Ȳ UNIX �۾���</title>
<link href="/ngs/common/style.css" rel="stylesheet" type="text/css">
</head>



<body>
<!-- BBS ��ºκ� start -->

<%
    if (count == 0  || !data.app_result.equals("�̽���") ) {
%>

<table border="1" width="700" height="100" cellpadding="0" cellspacing="0" align="center">
<tr>
    <td align="center">
    	��ϵ� �����Ͱ�  �����ϴ�.
    </td>
</table>
<%
	} else {    
%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
      <tr height="30"> ��:&nbsp;<%=count%>&nbsp;��
    
      <td align="center"  width="50">����</td> 
      <td align="center"  width="100" >����� ID</td> 
      <td align="center"  width="100" >������̸�</td> 
      <td align="center"  width="200" >�۾� ����</td> 
      <td align="center"  width="100" >���񽺱׷�</td>
      <td align="center"  width="100" >��û��</td> 
      <td align="center"  width="100" >���ΰ��</td> 
      
	  </tr>
	   <tr height="30">
	    <!-- üũ�ڽ� -->
	    <td align="center"  width="50">
	    <input type="checkbox"></td>    
	    <!-- �����ID -->
	    <td align="center"  width="100">
		<%= data.worker_id%></td>
	    <!-- ������̸� -->
	    <td align="center"  width="100" >
	    <%= data.worker_name%></td>
	    
	    <!-- �۾� ���� -->
	    <td align="center"  width="200" >
	    <%= data.content%></td> 
	    
	    <!-- ���񽺱׷� -->
	    <td align="center"  width="100">
	    <%= data.se_name%></td>
	    
	    <!-- ��û�� -->
	    <td align="center" width="100" >
	    <%= sdf.format(data.reg_date)%></td>
	    
	    <!--���ΰ��-->
	    <td align="center" width="100" >
	    <%= data.app_result%></td>
	     </tr>
	     
	     
</table>
<%} %>

<%
	if (count == 0  || !data.app_result.equals("�̽���") ){
	}
	else{%>
	<table border="0" width="700" height="50" cellpadding="0" cellspacing="0" align="center">
	<tr align="center">
		<td align="right">
		<input type="reset" value="����" name="fresh" src="app_list.jsp">
		<input type="submit" value="����" name="access" onclick="window.location='/ngs/admin/admin_app/apppro.jsp'">
		<input type="button" value="�ݷ�" name="van">
		</td>
	</tr>
	
</table>
<%
	}
%>

</body>




