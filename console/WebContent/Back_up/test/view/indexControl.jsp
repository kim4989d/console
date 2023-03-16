<%@ page language="java" pageEncoding="EUC-KR" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<%
  String CONTROL=null;
  String PAGENUM=null;
  String CHECK=null;
  try{
  CONTROL = request.getParameter("CONTROL");
  PAGENUM = request.getParameter("PAGENUM");
  CHECK = request.getParameter("CHECK");
  
  if(CONTROL.equals(null)){
	  CONTROL="intro";
  }
  if(PAGENUM.equals(null)){
	  PAGENUM="01";
  }
  if(CHECK.equals(null))
  {
	  CHECK="2";
  }
  }catch(Exception e){
	  e.printStackTrace();}
%>

<%if(CHECK=="0"){ %>
<jsp:forward page="/test/view/template/pm_template.jsp">
  <jsp:param name="CONTROL" value="<%=CONTROL%>"/>
  <jsp:param name="PAGENUM" value="<%=PAGENUM%>"/>
</jsp:forward>
<%}else if(CHECK=="1"){%>
<jsp:forward page="/test/view/template/admin_template.jsp">
  <jsp:param name="CONTROL" value="<%=CONTROL%>"/>
  <jsp:param name="PAGENUM" value="<%=PAGENUM%>"/>
</jsp:forward>
<%}else{%>
<jsp:forward page="/test/view/template/user_template.jsp">
  <jsp:param name="CONTROL" value="<%=CONTROL%>"/>
  <jsp:param name="PAGENUM" value="<%=PAGENUM%>"/>
</jsp:forward>
<%}%>