<!--
===============================================================
					서비스 수정 등록 완료 페이지  
===============================================================
-->
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">		
	<script> 
	  alert("수정에  성공 하엿습니다.");
	  //alert("목록 페이지로 이동 하겟습니다.");
	  window.close();
	  response.sendRedirect("server.do?cmd=server_list");
	</script>

