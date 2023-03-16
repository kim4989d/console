<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="console.common.tray.ResultSetTray" %>

<%
    int rowCount = 0;
    ResultSetTray require_list_tray  = null;
    String	checkbox="";
    
    checkbox = (String)request.getAttribute("checkbox");	

	if(request.getAttribute("rsTray") !=null){
		require_list_tray = (ResultSetTray)request.getAttribute("rsTray");
		rowCount = require_list_tray.getRowCount();		
	}
%>
<%
  request.setCharacterEncoding("UTF-8");
%>

 <html> 
 <head> 
 <script>
 
//승인 처리
 function Update(){
 	window.alert("경고");
	var frm = document.listfrm;
		docoum
		frm.action="/login.do?cmd=console_login";
		frm.method="post";
		frm.target="_self";
		frm.submit();
}
 
 
//갱신 처리
function Refresh()
{
	window.alert("새로고침");	
 	var frm = document.listfrm;
	frm.action="/login.do?cmd=require_list";
	frm.method="post";
	frm.target="_self";
	frm.submit();
//	window.document.location.reload();
}

//테스용 처리
fuction Test(){
	
	window.alert();
}

//임시 추가
function move_button(act)
{
	var Radio = document.form.listfrm;
	var result = "";
	var txt="";
	
//	window.alert("move_button Call");
	
	if ( !Radio ) return;
	if (Radio.name == 'seqNo' ){
			if ( Radio.checked ) {
					result = Radio.value;
			}
	} else {
			for ( i = 0; i < Radio.length; i++) {
					if ( document.form.seqNo[i].checked ) {
							result += document.form.seqNo[i].value + ",";
					}
			}
			result = result.substr(0,result.length -1);
	}
	
	
	if (result == '' )
	{
			if (act=='com'){
			alert( "승인 항목을 선택하세요!" );
			return false;
			}

			if (act=='re'){
			alert( "반려 항목을 선택하세요!" );
			return false;
			}
			if (act=='de'){
			alert( "인증키를 선택하세요!" );
			return false;
			}
			if (act=='command'){
			alert( "명령어를 선택하세요!" );
			return false;
			}
	}
	document.form.uniq_id.value = result;
	document.form.act.value = act;
	
	if (act=="re")
	{
		newWin(result);
		return;
	}
	else if(act=="de")
	{
		if(confirm("인증키를 삭제 하시겠습니까?")) {
		document.form.submit();
		} else {	 return;	}
	}
	else if(act=="com")
	{
		//newWin2(result);
		//gFlowWait(true, false);
//		alert(result);
		if(confirm("승인 하시겠습니까?")) {
		document.form.submit();
		} else {	 
			//gFlowWait(false, false);
			return;	}
	}
	else if(act=="command")
	{
		if(confirm("삭제 하시겠습니까?")) {
	//	document.form.target ="_blank"
		document.form.action = "command_del.php"
		document.form.submit();
		} else {	 return;	}
	}
	else
	{
		if(confirm("승인 하시겠습니까?")) {
		document.form.submit();
		} else {	 return;	}
	}
}



 </script>
 
 </head>
 
 <body>
 <center><br><h2>신청현황 게시판</h2><br>
 <form name="listfrm">
 <table border="1">
 <tr>
 	 <td>선택	 	</td>
	 <td>사용자  ID 	</td>
	 <td>사용자 이름 	</td>
	 <td>작업내역 	</td>
	 <td>서비스그룹	</td>
	 <td>신청일 		</td>
	 <td>승인결과 	</td>
<td>
 
 <%
    for(int i=0;i<rowCount;i++){
	    out.print("<tr>");
    	if(rowCount==0){
	     %>
	    <td colspan='4'>검색된 테이블이없습니다</td>
	    <%}else{ %>
	    <!-- require_List 
	    	사용자ID		(user_id)
	    	사용자이름	(user_name)
			작업내역		(work_conttens)
			서비스그룹	(service_group)
			신청일		(reg_data)
			승인결과		(처리중)
	    -->   
	    
	    <td><input type="checkbox" name="seqNo" ></td>
	    <td><%=require_list_tray.get("user_id",i)%></td>
	    <td><%=require_list_tray.get("name",i) %></td>
	    <td><%=require_list_tray.get("work_conttens",i) %></td>
	    <td><%=require_list_tray.get("service_group",i)%></td>
	    <td><%=require_list_tray.get("reg_dt",i)%></td>
	    <td>승인중</td>
	    </tr> 
	    <%
	    }
    }
    %>
 	</td>
    </tr>
    <!-- 
    	내용: button 임시 구현 추후 수정 예정
    	작성자: 이충섭
    	일자: 2009-01-15
    -->
    <tr>
    <td>
    <input type="button" value="갱신" onclick="javascript:Refresh();">
    <input type="button" value="승인" onclick="jvasscript:move_button('com');">
    <input type="button" value="반려" onclick="javascript:test();">
    </td>   
    </tr>
    <tr>
    <%//=checkbox%>
    </tr>
  </table>  
 </form>   
 </center>
 </body>   
 
 </html>
    