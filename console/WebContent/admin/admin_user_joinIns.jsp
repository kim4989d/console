<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/common.jsp" %>
<%
int value = 0;
if(value != 0)
{
	value = Integer.parseInt(request.getParameter("value"));
}
else
{
	value = 0;
}

%>
<% 
if (value==1){
		%>
		<script language = "javascript">
		alert("���������� ������û�� �Ҽ� �����ϴ�. �ٽ� ��û���ּ���!");
		history.back();
		</script>
		
<%}else if (value ==2){
		%>	
		<script language = "javascript">
		alert("���������� ������û�� �Ҽ� �����ϴ�.�ٽ� ��û���ּ���!");
		history.back();
		</script>
<% }else if(value==3 ){ 
		%>
		<script language = "javascript">
		alert("�̹� ��ϵ� ID �Դϴ�. �ߺ�üũ�� ���ּ���");
		history.back();
		</script>

<% }else if(value==4 ){
		%>
		<script language = "javascript">
		alert("�̹� ��ϵ� �ڵ��� ��ȣ �Դϴ�.");
		history.back();
		</script>
<%}else{%>
			<script language = "javascript">
			alert("���� �� ���ý��� ��û�� �Ϸ�Ǿ����ϴ�.");
			window.close();
			</script>
<%}%>