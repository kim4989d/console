<!-- �۾����� ��Ͽ��� �� �۾� �ý��� ������ ����.
	 Admin �۾� ��� ���� �ϳ��� �ý��۸� ��� �� ó���� ����.
 -->
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "admin.equip.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 5;
%>

<% 
	request.setCharacterEncoding("euc-kr"); 
%> 
<%
	//������ countó��
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }
    
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count  = 0;
    int number = 0;

    //DB ��ü ���.
    List articleList = null;
    WorkSysDBBean dbPro = WorkSysDBBean.getInstance();
    count = dbPro.getArticleCount();
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize);
    }
	number = count-(currentPage-1) * pageSize;
%>

<html>
<head>
<title>�ƢƢƢƢƢƢƢ� VACCS �ƢƢƢƢƢƢƢ�</title>
<link href="/ngs/comm/css/default.css" rel="stylesheet" type="text/css">
<link href="/ngs/comm/css/Form.css" rel="stylesheet" type="text/css">
</head>



<body>
<!-- BBS ��ºκ� start -->
<%
    if (count == 0) {
%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
<tr>
    <td align="center">
    	��ϵ� �����Ͱ�  �����ϴ�.
    </td>
</table>
<%
	} else {    
%>

<table border="1" width="500" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"> 
      <td align="center"  width="50"><input type="checkbox"> </td> 
      <td align="center"  width="100" >���� �̸�</td> 
      <td align="center"  width="100" >���� ID</td> 
      <td align="center"  width="100" >�ý��� �̸�</td> 
      <td align="center"  width="100" >�ý��� ID</td>
      <td align="center"  width="100" >�������</td> 
      <td align="center"  width="100" >����</td> 
    </tr>
<%  
  for (int i = 0 ; i <1 ; i++) {
	  WorkSysDataBean article = (WorkSysDataBean)articleList.get(i);
%>

    
   <tr height="30">
    <!-- üũ�ڽ� -->
    <td align="center"  width="50">
    <input type="checkbox"></td>    
    
    <!-- ���� �̸� -->
    <td align="center"  width="100">
    <%=article.getSer_name()%></td>
    
    <!-- ���� ID -->
    <td align="center"  width="100" >
    <%=article.getSer_id()%></td>
    
    <!-- �ý��� �̸� -->
    <td align="center"  width="100" >
    <%=article.getSys_name()%></td> 
    
    <!-- �ý��� ID -->
    <td align="center"  width="100">
    <%= article.getSys_id() %></td>
    
    <!-- ������� -->
    <td align="center" width="100" >
    <%= article.getEqui_per()%></td>
    
    <!-- ����-->
    <td align="center" width="100" >
    <input type="button" value="����" onclick="window.location='work_sys_default.jsp'"></td>
    
 </tr>
     <%}%>
</table>
<%} %>

</body>