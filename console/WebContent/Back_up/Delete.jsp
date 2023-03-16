<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="console.list.*"%>

<jsp:useBean id="myDB" class="console.list.BoardMgr" />
<%
   int num;
   int nowPage;
   String inPass=""; 
   String DBPass="";
   
   nowPage = Integer.parseInt(request.getParameter("page"));
   num = Integer.parseInt(request.getParameter("num"));
  
   BoardBean tempBoard = myDB.getBoard(num);

  if((request.getParameter("pass")) !=null){
    inPass = request.getParameter("pass"); 
    DBPass = tempBoard.getPass(); 
  if(!(inPass.equals(DBPass))) {

%>

<script>
	alert("입력하신 비밀번호가 올바르지 않습니다. 다시 확인해주세요.");
	history.go(-1);
</script>
<%
	}else{
	  myDB.deleteBoard(num);
	  response.sendRedirect("List.jsp?page=" + nowPage);
	}
  }
%>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("패스워드를 입력하세요.");
		form.pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>
<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      사용자의 비밀번호를 입력해 주세요.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="Delete.jsp" >
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="pass" size=17 maxlength=15>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="삭제완료" onClick="check()"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
 <input type=hidden name=page value="<%=nowPage%>">
 <input type=hidden name=num value="<%=num%>">
</form> 
</table>
</center>
</body>
</html>
