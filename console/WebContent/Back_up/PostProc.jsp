<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="console.list.*"%>
<%
  request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="myBoard" class="console.list.BoardBean" />
<jsp:setProperty name="myBoard" property="*" />
<jsp:useBean id="myDB" class="console.list.BoardMgr" />
<% 
  myDB.insertBoard(myBoard);
  response.sendRedirect("List.jsp");
%>
