<!-- 
	Amin용 신청 페이지 현황-> unix 작업신청 현황 구현 페이지.	
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
<title>Admin 신청현황 UNIX 작업용</title>
<link href="/ngs/common/style.css" rel="stylesheet" type="text/css">
</head>



<body>
<!-- BBS 출력부분 start -->

<%
    if (count == 0  || !data.app_result.equals("미승인") ) {
%>

<table border="1" width="700" height="100" cellpadding="0" cellspacing="0" align="center">
<tr>
    <td align="center">
    	등록된 데이터가  없습니다.
    </td>
</table>
<%
	} else {    
%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
      <tr height="30"> 총:&nbsp;<%=count%>&nbsp;건
    
      <td align="center"  width="50">선택</td> 
      <td align="center"  width="100" >사용자 ID</td> 
      <td align="center"  width="100" >사용자이름</td> 
      <td align="center"  width="200" >작업 내역</td> 
      <td align="center"  width="100" >서비스그룹</td>
      <td align="center"  width="100" >신청일</td> 
      <td align="center"  width="100" >승인결과</td> 
      
	  </tr>
	   <tr height="30">
	    <!-- 체크박스 -->
	    <td align="center"  width="50">
	    <input type="checkbox"></td>    
	    <!-- 사용자ID -->
	    <td align="center"  width="100">
		<%= data.worker_id%></td>
	    <!-- 사용자이름 -->
	    <td align="center"  width="100" >
	    <%= data.worker_name%></td>
	    
	    <!-- 작업 내역 -->
	    <td align="center"  width="200" >
	    <%= data.content%></td> 
	    
	    <!-- 서비스그룹 -->
	    <td align="center"  width="100">
	    <%= data.se_name%></td>
	    
	    <!-- 신청일 -->
	    <td align="center" width="100" >
	    <%= sdf.format(data.reg_date)%></td>
	    
	    <!--승인결과-->
	    <td align="center" width="100" >
	    <%= data.app_result%></td>
	     </tr>
	     
	     
</table>
<%} %>

<%
	if (count == 0  || !data.app_result.equals("미승인") ){
	}
	else{%>
	<table border="0" width="700" height="50" cellpadding="0" cellspacing="0" align="center">
	<tr align="center">
		<td align="right">
		<input type="reset" value="갱신" name="fresh" src="app_list.jsp">
		<input type="submit" value="승인" name="access" onclick="window.location='/ngs/admin/admin_app/apppro.jsp'">
		<input type="button" value="반려" name="van">
		</td>
	</tr>
	
</table>
<%
	}
%>

</body>




