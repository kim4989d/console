<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="admin.app.*"%>

<% request.setCharacterEncoding("euc-kr");%>

<!--
<jsp:useBean id="article" scope="page" class="user.unix.reg.UnixDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
-->

<!-- 
	��û��Ȳ ���ν� ������Ʈ ó��
 -->
<%	
	AppDBBean app = AppDBBean.getInstance();
	app.appApp();
	
	response.sendRedirect("/ngs/view/indexControl(admin).jsp?CONTROL=admin1/admin1&PAGENUM=01");	
%>
