<!-- 유저용 UNIX 작업등록 구현페이지-->
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

    //DB처리
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
<title>▒▒▒▒▒▒▒▒ VACCS ▒▒▒▒▒▒▒▒<</title>
<link href="/ngs/common/style.css" rel="stylesheet" type="text/css">

<script language="javascript">

function openReg(){
           url = "writeForm.jsp" ;
           open(url, "confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=650, height=350");
       }

</script>



</head>
<body>
<!-- BBS 출력부분 start -->
<%
    if (count == 0) {
%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center" height="100">
<tr>
    <td align="center">
   	 등록된 데이터가  없습니다.
    </td>
</table>
<%
	} else {    
%>

<!-- BBS 컬럼 출력 구현부 -->
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
	<tr align="right" height="30" >총:&nbsp;<%=count%>건&nbsp;

	<!-- BBS  페이지 숫자 처리 부분 --> 
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
	        <a href="work_reg_list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>/ 페이지:&nbsp;
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>			
	        <a href="work_reg_list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
	 <%
	        }
	        if (endPage < pageCount){ %>	        
	        <a href="work_reg_list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
	<%
	        }
	    }
	%>
	
	</tr>
	
    <tr height="30"> 
      <td align="center"  width="100" >작  업  자</td> 
      <td align="center"  width="200" >작업목적</td> 
      <td align="center"  width="300" >작업기간</td> 
      <td align="center"  width="150" >등록일</td>
      <td align="center"  width="100" >승인담당자</td> 
      <td align="center"  width="100" >승인결과</td> 
      <td align="center"  width="100" >상           태</td> 
    </tr>
<%  
  for (int i = 0 ; i < articleList.size() ; i++) {
	  UnixDataBean article = (UnixDataBean)articleList.get(i);
%>
   <tr height="30">
    <!-- 작업자 -->
    <td align="center"  width="100">
    <%=article.getUnix_work()%></td>
    
    <!-- 작업목적 -->
    <td align="center"  width="150" >
    <%=article.getUnix_object()%></td>
    
    <!-- 작업기간 -->
    <td align="center"  width="200" >
    <%=sdf.format(article.getUnix_work_date_s() )%> ~
    <%=sdf.format(article.getUnix_work_date_e() )%></td>
    
    <!-- 등록일 -->
    <td align="center"  width="100">
    <%= sdf.format(article.getUnix_regdate()) %></td>
    
    <!-- 승인 담당자 -->
    <td align="center" width="100" >
    <%= article.getUnix_app_name() %></td>
    
    <!-- 승인결과 (처리중/승인완료)-->
    <td align="center" width="100" >
    <%= article.getUnix_app_result() %></td>
    
    <!-- 상태(승인전/작업중) -->
    <td align="center" width="100" >
    <%= article.getUnix_stat() %></td>
 </tr>
     <%}%>
</table>
<%} %>

<!-- 작업등록 부분 구현 Start 팝업창으로 변경예정 -->
<table border="0" width="700" height="50" cellpadding="0" cellspacing="0" align="center">
    <tr align="right">
    <td>
    <INPUT type="button" value="작업내역 등록  " onclick="javascript:openReg()">
    </td>
    </tr>
</table>


</body>
</html>