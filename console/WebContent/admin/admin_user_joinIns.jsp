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
		alert("정상적으로 계졍신청을 할수 없습니다. 다시 신청해주세요!");
		history.back();
		</script>
		
<%}else if (value ==2){
		%>	
		<script language = "javascript">
		alert("정상적으로 계정신청을 할수 없습니다.다시 신청해주세요!");
		history.back();
		</script>
<% }else if(value==3 ){ 
		%>
		<script language = "javascript">
		alert("이미 등록된 ID 입니다. 중복체크를 해주세요");
		history.back();
		</script>

<% }else if(value==4 ){
		%>
		<script language = "javascript">
		alert("이미 등록된 핸드폰 번호 입니다.");
		history.back();
		</script>
<%}else{%>
			<script language = "javascript">
			alert("계정 및 사용시스템 신청이 완료되었습니다.");
			window.close();
			</script>
<%}%>