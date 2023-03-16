<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="console.list.*"%>
<%
  request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="myBoard" class="console.list.BoardBean" />
  <jsp:setProperty name="myBoard" property="*" />
<jsp:useBean id="myDB" class="console.list.BoardMgr" />
<%
    int nowPage = Integer.parseInt(request.getParameter("page"));
	int num = Integer.parseInt(request.getParameter("num"));
	BoardBean tempBoard = myDB.getBoard(num);
    int pos = tempBoard.getPos();
	int depth = tempBoard.getDepth();
	myBoard.setPos(pos); 
	myBoard.setDepth(depth); 
	myDB.replyupMyBoard(myBoard);
	myDB.replyMyBoard(myBoard);

	response.sendRedirect("List.jsp?page=" + nowPage); 
%> 