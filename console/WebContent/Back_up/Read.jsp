<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="console.list.*"%>

<jsp:useBean id="myDB" class="console.list.BoardMgr" />
<jsp:useBean id="utilMgr" class="console.list.UtilMgr"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int nowPage = Integer.parseInt(request.getParameter("page"));
	String keyField = request.getParameter("keyField"); 
    String keyWord = request.getParameter("keyWord");

	BoardBean tempBoard = myDB.getBoard(num);
	
	String name = tempBoard.getName();
	String email = tempBoard.getEmail();
	String homepage = tempBoard.getHomepage();
	String subject = tempBoard.getSubject();
	String regdate = tempBoard.getRegdate();
	String content = tempBoard.getContent();
	String ip = tempBoard.getIp();
	int count= tempBoard.getCount();
%>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function list(){
	document.list.action="List.jsp";
 	document.list.submit();
 } 
</script>
</head>
<body>
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> 이 름 </td>
	 <td bgcolor=#ffffe8><%=name%></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><%=regdate%></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 ><a href="mailto:<%=email%>"><%=email%></a></td> 
	 <td align=center bgcolor=#dddddd width=10%> 홈페이지 </td>
	 <td bgcolor=#ffffe8 ><a href="http://<%=homepage%>" target="_new">http://<%=homepage%></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><%=subject%> </td>
   </tr>
   <tr> 
    <td colspan=4><br><%=utilMgr.getContent(content)%><br></td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     <%=ip%>로 부터 글을 남기셨습니다./  조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:list()" >목 록</a> | 
	<a href="Update.jsp?page=<%=nowPage%>&num=<%=num%>" >수 정</a> |
	<a href="Reply.jsp?page=<%=nowPage%>&num=<%=num%>" >답 변</a> |
	<a href="Delete.jsp?page=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br>
  </td>
 </tr>
</table>
<%
if(keyWord==null || keyWord.equals("null")){ %>
<form name="list" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="page" value="<%=nowPage%>">
</form>
<%} else{ %>
<form name="list" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="page" value="<%=nowPage%>">
<input type="hidden" name="keyField" value="<%=keyField%>">
<input type="hidden" name="keyWord" value="<%=keyWord%>">
</form>
<%}%>
</body>
</html>
