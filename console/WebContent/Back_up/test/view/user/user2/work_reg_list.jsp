<!-- ������ UNIX �۾���� ����������-->
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "user.unix.reg.UnixDataBean" %>
<%@ page import = "user.unix.reg.UnixRegDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 5;
    SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
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

    //DBó��
    List articleList = null;
    UnixRegDBBean dbPro = UnixRegDBBean.getInstance();
    count = dbPro.getArticleCount();
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize);
    }
	number = count-(currentPage-1) * pageSize;
%>


<html>
<head>
<title>�ƢƢƢƢƢƢƢ� VACCS �ƢƢƢƢƢƢƢ�<</title>
<link href="/ngs/common/style.css" rel="stylesheet" type="text/css">

<script language="javascript">

function openReg(){
           url = "writeForm.jsp" ;
           open(url, "confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=650, height=350");
       }

</script>



</head>
<body>
<!-- BBS ��ºκ� start -->
<%
    if (count == 0) {
%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center" height="100">
<tr>
    <td align="center">
   	 ��ϵ� �����Ͱ�  �����ϴ�.
    </td>
</table>
<%
	} else {    
%>

<!-- BBS �÷� ��� ������ -->
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
	<tr align="right" height="30" >��:&nbsp;<%=count%>��&nbsp;

	<!-- BBS  ������ ���� ó�� �κ� --> 
	<%
	    if (count > 0) {
	        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
			 
	        int startPage = (int)(currentPage/10)*10+1;
			int pageBlock=10;
	        int endPage = startPage + pageBlock-1;
	        if (endPage > pageCount)
	        { 
	        	endPage = pageCount;
	        }
	        
	        if (startPage > 10) {    %>
	        <a href="work_reg_list.jsp?pageNum=<%= startPage - 10 %>">[����]</a>/ ������:&nbsp;
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>			
	        <a href="work_reg_list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
	 <%
	        }
	        if (endPage < pageCount){ %>	        
	        <a href="work_reg_list.jsp?pageNum=<%= startPage + 10 %>">[����]</a>
	<%
	        }
	    }
	%>
	
	</tr>
	
    <tr height="30"> 
      <td align="center"  width="100" >��  ��  ��</td> 
      <td align="center"  width="200" >�۾�����</td> 
      <td align="center"  width="300" >�۾��Ⱓ</td> 
      <td align="center"  width="150" >�����</td>
      <td align="center"  width="100" >���δ����</td> 
      <td align="center"  width="100" >���ΰ��</td> 
      <td align="center"  width="100" >��           ��</td> 
    </tr>
<%  
  for (int i = 0 ; i < articleList.size() ; i++) {
	  UnixDataBean article = (UnixDataBean)articleList.get(i);
%>
   <tr height="30">
    <!-- �۾��� -->
    <td align="center"  width="100">
    <%=article.getUnix_work()%></td>
    
    <!-- �۾����� -->
    <td align="center"  width="150" >
    <%=article.getUnix_object()%></td>
    
    <!-- �۾��Ⱓ -->
    <td align="center"  width="200" >
    <%=sdf.format(article.getUnix_work_date_s() )%> ~
    <%=sdf.format(article.getUnix_work_date_e() )%></td>
    
    <!-- ����� -->
    <td align="center"  width="100">
    <%= sdf.format(article.getUnix_regdate()) %></td>
    
    <!-- ���� ����� -->
    <td align="center" width="100" >
    <%= article.getUnix_app_name() %></td>
    
    <!-- ���ΰ�� (ó����/���οϷ�)-->
    <td align="center" width="100" >
    <%= article.getUnix_app_result() %></td>
    
    <!-- ����(������/�۾���) -->
    <td align="center" width="100" >
    <%= article.getUnix_stat() %></td>
 </tr>
     <%}%>
</table>
<%} %>

<!-- �۾���� �κ� ���� Start �˾�â���� ���濹�� -->
<table border="0" width="700" height="50" cellpadding="0" cellspacing="0" align="center">
    <tr align="right">
    <td>
    <INPUT type="button" value="�۾����� ���  " onclick="javascript:openReg()">
    </td>
    </tr>
</table>


</body>
</html>