<!-- 작업내역 등록에서 들어갈 작업 시스템 페이지 구현.
	 Admin 작업 등록 없이 하나의 시스템만 등록 후 처리할 예정.
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
	//페이지 count처리
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }
    
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count  = 0;
    int number = 0;

    //DB 객체 얻기.
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
<title>▒▒▒▒▒▒▒▒ VACCS ▒▒▒▒▒▒▒▒</title>
<link href="/ngs/comm/css/default.css" rel="stylesheet" type="text/css">
<link href="/ngs/comm/css/Form.css" rel="stylesheet" type="text/css">
</head>



<body>
<!-- BBS 출력부분 start -->
<%
    if (count == 0) {
%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
<tr>
    <td align="center">
    	등록된 데이터가  없습니다.
    </td>
</table>
<%
	} else {    
%>

<table border="1" width="500" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"> 
      <td align="center"  width="50"><input type="checkbox"> </td> 
      <td align="center"  width="100" >서비스 이름</td> 
      <td align="center"  width="100" >서비스 ID</td> 
      <td align="center"  width="100" >시스템 이름</td> 
      <td align="center"  width="100" >시스템 ID</td>
      <td align="center"  width="100" >장비담당자</td> 
      <td align="center"  width="100" >구분</td> 
    </tr>
<%  
  for (int i = 0 ; i <1 ; i++) {
	  WorkSysDataBean article = (WorkSysDataBean)articleList.get(i);
%>

    
   <tr height="30">
    <!-- 체크박스 -->
    <td align="center"  width="50">
    <input type="checkbox"></td>    
    
    <!-- 서비스 이름 -->
    <td align="center"  width="100">
    <%=article.getSer_name()%></td>
    
    <!-- 서비스 ID -->
    <td align="center"  width="100" >
    <%=article.getSer_id()%></td>
    
    <!-- 시스템 이름 -->
    <td align="center"  width="100" >
    <%=article.getSys_name()%></td> 
    
    <!-- 시스템 ID -->
    <td align="center"  width="100">
    <%= article.getSys_id() %></td>
    
    <!-- 장비담당자 -->
    <td align="center" width="100" >
    <%= article.getEqui_per()%></td>
    
    <!-- 구분-->
    <td align="center" width="100" >
    <input type="button" value="삭제" onclick="window.location='work_sys_default.jsp'"></td>
    
 </tr>
     <%}%>
</table>
<%} %>

</body>