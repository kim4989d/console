<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="console.list.*,java.util.*"%>

<jsp:useBean id="myDB" class="console.list.BoardMgr" />

<%
  request.setCharacterEncoding("euc-kr");
%>

<%
   int nowPage = 0; 
   int nowBlock = 0; 
   int totalRecord = 0; 
   int numPerPage = 10;      
   int totalPage = 0;       
   int totalBlock = 0;      
   int pagePerBlock =0;    
   int beginPerPage =0;    

   String keyField ="" ;
   String keyWord ="" ; 

   Vector boardList;
%>
<% 
  
	

if(request.getParameter("keyWord") !=null){
			keyWord =request.getParameter("keyWord");
			keyField =request.getParameter("keyField");
		}
		
	if(request.getParameter("reload") !=null){
		if(request.getParameter("reload").equals("true")){
			keyWord ="";
			keyField ="";
			}
	}
System.out.println("key  :"+keyWord);
System.out.println("keyField  :"+keyField);
	boardList= myDB.getBoardList(keyField,keyWord); 
	totalRecord = boardList.size(); 
	numPerPage = 10; 
	if (request.getParameter("page") != null) { nowPage= Integer.parseInt(request.getParameter("page")); } 
	beginPerPage = nowPage * numPerPage;
	totalPage =(int)Math.ceil((double)totalRecord / numPerPage);
	pagePerBlock = 15; 
	if (request.getParameter("nowBlock") != null) {nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}
	totalBlock =(int)Math.ceil((double)totalPage / pagePerBlock);
%>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function check() {
     if (document.search.keyWord.value == "") 
		{
		 alert("�˻�� �Է��ϼ���.");
		 document.search.keyWord.focus();
		 return;
	    }
	 document.search.submit();
 }

function list(){
	document.list.action="List.jsp";
 	document.list.submit();
 }

 function read(value){
	document.read.action="Read.jsp";
	document.read.num.value=value;
	document.read.submit();   
 }

</script>
</head>
<body>
<center><br>
<h2>���α�û�������� ����� </h2><br>
<table align=center border=0 width=80%>
 <tr>
  <td align=left >Total : <%=totalRecord%> Articles(<font color=red><%=nowPage+1%>/<%=totalPage%>Pages</font>)</td>
 </tr>
</table>
<table align=center width="80%" border=0 cellspacing=0 cellpadding=3>
 <tr>
  <td align=center colspan=2 >
<% 
   if (boardList.isEmpty()) { 
%> 
��ϵ� ���� �����ϴ�.
<%  }
   else {
%>
   <table border=0 width=100% cellpadding=2 cellspacing=0>
    <tr align=center bgcolor=#D0D0D0 height=120%>
     <td>�� ȣ</td>
	 <td>�� ��</td>
	 <td>�� ��</td>
	 <td>�� ¥</td>
	 <td>��ȸ��</td>
    </tr>
<% 
	for (int i = beginPerPage;i < (beginPerPage+numPerPage); i++) { 
	if (i==totalRecord) break;

	BoardBean tempBoard = (BoardBean)boardList.elementAt(i);
	String name =tempBoard.getName();
	String subject = tempBoard.getSubject();
	String email = tempBoard.getEmail();
	String regdate = tempBoard.getRegdate();
	int depth = tempBoard.getDepth();
	int num = tempBoard.getNum(); 
	int count =tempBoard.getCount();
%>
    <tr> 
     <td align=center><%= totalRecord - i %></td>
     <td>
<%
	if (depth > 0) { 
	for (int re = 0; re < depth; re++) {
%> 
&nbsp;
&nbsp;
<% 
	 }
   }
%>
      <a href="javascript:read('<%=num%>')"><%= subject %></a>
     </td>
     <td align=center><a href="mailto:<%=email %>"><%= name %></a></td>
     <td align=center><%=regdate%></td>
     <td align=center><%=count%> </td>
    </tr>
<% 
   } 
%>

   </table> 
<% 
} 
%> 
  </td>
 </tr>
 <tr>
  <td><br><br></td>
 </tr>
 <tr>
  <td align="left" > Go to Page 
<% if(totalRecord !=0){ %> 
<% if (nowBlock > 0) {%> 
<a href="List.jsp?nowBlock=<%=nowBlock - 1 %>&page=<%=((nowBlock - 1) * pagePerBlock) %>">
���� <%=pagePerBlock %> ��</a>
<%}%> 
:::
<%
for (int i = 0; i < pagePerBlock; i++) { %>
<a href="List.jsp?nowBlock=<%=nowBlock %>&page=<%=(nowBlock*pagePerBlock) + i %>">
<%=(nowBlock * pagePerBlock) + i + 1 %></a>

<% if ((nowBlock * pagePerBlock) + i + 1 == totalPage)  break; %>
<%} %>

::: 

<% if (totalBlock > nowBlock + 1) {%> 
<a href="List.jsp?nowBlock=<%=nowBlock + 1 %>&page=<%=((nowBlock + 1) * pagePerBlock) %>"> 
���� <%=pagePerBlock %>��</a>
<%}%>

<%} %>
  </td> 
  <td align=right> 
   <a href="Post.jsp" >[�۾���]</a><a href="javascript:list()">[ó������]</a> 
  </td>
 </tr>
</table><br>
<form action="List.jsp" name="search" method="post">
<table border=0 width=527 align=center cellpadding=4 cellspacing=0 >
 <tr>
  <td align=center valign=bottom>
   <select name="keyField" size=1 >
    <option value="name"> �� ��
    <option value="subject"> �� ��
    <option value="content"> �� ��
   </select>
   <input type="text" size=16 name="keyWord"  value="">
   <input type="button"  value="ã��" onClick="check()">
   <input type="hidden" name="page" value="0">
  </td>
 </tr>
</table>
</form>
<form name="read" method="post">
    <input type="hidden" name="num" value="">
    <input type="hidden" name="page" value="<%=nowPage%>">
    <input type="hidden" name="keyField" value="<%=keyField%>">
    <input type="hidden" name="keyWord" value="<%=keyWord%>">
 </form>
<form name="list" method="post">
 <input type="hidden" name="reload" value="true">
 <input type="hidden" name="page" value="0">
 <input type="hidden" name="nowBlock" value="0"> 
</form>
</center>
</body>
</html>
