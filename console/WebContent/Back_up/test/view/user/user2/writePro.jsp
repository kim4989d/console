<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="user.unix.reg.UnixRegDBBean"%>

<% request.setCharacterEncoding("euc-kr");%>



<%@page import="user.unix.reg.UnixDataBean"%>
<jsp:useBean id="article" scope="page" class="user.unix.reg.UnixDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
	String id= (String)session.getAttribute("memId");
	if(id==null)
		id = "user";
	
	article.setUnix_work(id);
	article.setUnix_app_name("admin");
	article.setUnix_work_date_s(new Timestamp (System.currentTimeMillis() ) );	//Start Of WorkTime
	article.setUnix_work_date_e(new Timestamp (System.currentTimeMillis() ) );	//Finish Of WorkTime
	article.setUnix_regdate(new Timestamp (System.currentTimeMillis() ) );
	article.setUnix_app_result("¹Ì½ÂÀÎ");	
	article.setUnix_stat("½ÂÀÎÁß");
	
	UnixRegDBBean dbPro = UnixRegDBBean.getInstance();//°´Ã¼¾ò´Â´Ù.

	dbPro.insertArticle(article);
	
	response.sendRedirect("work_reg_list.jsp");		
%>
