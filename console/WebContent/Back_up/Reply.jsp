<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="console.list.*"%>
<jsp:useBean id="myDB" class="console.list.BoardMgr"/>
<%
	int nowPage = Integer.parseInt(request.getParameter("page"));
	int num = Integer.parseInt(request.getParameter("num"));
    BoardBean tempBoard = myDB.getBoard(num);
	String subject = tempBoard.getSubject();
	String content = tempBoard.getContent(); 
%>
<html>
<head> <title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<br><br>
 <table width=460 cellspacing=0 cellpadding=3>
  <tr>
   <td bgcolor=#CCCC00 height=21 align=center>�亯�ϱ�</td>
  </tr>
</table>
<form name=post method=post action="ReplyProc.jsp" >
<table width=527 cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>
    <tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <input type=text name=name size=30 maxlength=20></td>
    </tr>
    <tr>
     <td width=20%>E-Mail</td>
     <td width=80%>
	  <input type=text name=email size=30 maxlength=30></td>
    </tr>
    <tr>
     <td width=20%>Ȩ������</td>
     <td width=80%>
	  <input type=text name=homepage size=40 maxlength=30></td>
    </tr>
    <tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <input type=text name=subject size=50 value="�亯 : <%=subject%>" maxlength=50></td> 
    </tr>
	<tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <textarea name=content rows=12 cols=50>
      <%=content %>

========�亯 ���� ������.=======
      </textarea></td>
    </tr>
    <tr>
     <td width=20%>��� ��ȣ</td> 
     <td width=80%>
	  <input type=password name=pass size=15 maxlength=15></td> 
    </tr>
    <tr>
     <td colspan=2 height=5><hr size=1></td>
    </tr>
	<tr> 
     <td colspan=2>
	  <input type=submit value="�亯���" >
      <input type=reset value="�ٽþ���">
      <input type=button value="�ڷ�" onClick="history.go(-1)"></td>
    </tr> 
   </table>
  </td>
 </tr>
 <input type=hidden name=ip value="<%=request.getRemoteAddr()%>" >
 <input type=hidden name=page value="<%=nowPage%>">
 <input type=hidden name=num value="<%=num%>">
</table>
</form> 
</center>
</body>
</html>
