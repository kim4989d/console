<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray" %>
<%@include file="/common/common.jsp" %>




<%
    ResultSetTray listTray  = null;
    int	rowCount = 0;					//게시물 전체 갯수
//    String certKey = "";				//인증키 (사용안함)
	
    if( request.getAttribute("rsTray") !=null){
		listTray = (ResultSetTray)request.getAttribute("rsTray");
		rowCount = listTray.getRowCount();
	}
    
//    certKey = (String)request.getAttribute("cert_id");		//사용안함
%>
<%
  request.setCharacterEncoding("euc-kr");
%>

 <html> 
 <head> 
 <script>

//새로고침 
function Refresh(){
	window.document.location.reload();
}


function newWin()
{
	window.alert("Success");
	var url="/require/require_return.jsp";		//페이지 직접 이동
//	var url="/require.do?cmd=";

	var re = "width=300,height=100,top=115,left=0";

	if (newPoup != null)     
		newPoup.close();

	window.open(url,'pop',re);
}


//승인 및 반려 처리
function move_button(input){
	var frm=document.requirefrm;
		var numtemp="";
		var temp ="";
		temp = frm.check;
		var len = temp.length;
		var count=0;
		var bool="false";
		
		if(len>1){
			for(var i=0;i<len;i++){
				if(temp[i].checked){
				count++;		
				bool="true";
				}
			}
			for(var i=0;i<len;i++){
				if(temp[i].checked){
					if(count==1){
					numtemp =temp[i].value;		
					}else{
					numtemp =numtemp+"/"+ temp[i].value;		
					}
				}
			}
			if(count==0 && bool=="false"){
					alert("값을 선택하십시오");
					return;					
					}
					
			if( confirm("승인하시겠습니까?") ){ 
			}else{
			return;
			}
		}else{
			if(temp.checked){
			numtemp=temp.value;
			bool="true";
			}
			if(count==0 && bool=="false"){
				alert("값을 선택하십시오");
				return;
				}
			if(confirm("예약취소하시겠습니까?")){ 
			}else{
			return;
			}
		}
			
			alert(numtemp);					//넘기는 값 확인
			//fr.changebox.value=numtemp;
			
		frm.action="/require.do?cmd=require_update&numtemp";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();

}

</script>
 </head>

 <body>
 <center><br><h2>신청현황 NT/UNIX</h2><br>
 <form name="requirefrm">
 <table border="1">
 <tr>
	 <td>전체선택<input type="checkbox" name="allcheckbox" onclick="checkBox_AllCheck();"></td>
	 <td>사용자  ID </td>
	 <td>사용자 이름 </td>
	 <td>작업내역 </td>
	 <td>서비스그룹 </td>
	 <td>신청일 </td>
	 <td>승인결과 </td>
	 <td>Cert_Key</td>
 </tr>
 
 <%
 	if(rowCount == 0)
 	{	
 	%>
	    <tr><td colspan="7" align="center">검색된 테이블이없습니다</td></tr>
	<%
 	}
 	else{		
   		for(int i=0;i<rowCount;i++){	%>
   			<tr>
			<td><input type="checkbox" name="check" value="<%=listTray.get("cert_id", i)%>"></td>	
		    <td><%=listTray.get("user_id", i)%></td>
		    <td><%=listTray.get("name", i) %></td>
		    <td><%=listTray.get("work_conttens", i) %></td>
		    <td><%=listTray.get("service_group", i)%></td>
		    <td><%=listTray.get("reg_dt", i)%></td>
		    <td>처리중</td>
			<td><%=listTray.get("cert_id", i)%></td>
		    </tr>
		<%	}
    	}
    %>
    <tr>
    <td>
	    <input type="button" value="갱신" onclick="Refresh();">
	    <input type="button" value="승인" onclick="move_button('com');">
	    <input type="button" value="반려" onclick="move_button('re');">
<!--    <input type="button" value="popup" onclick="newWin();">	 -->
    </td>   
    </tr>
    
  </table>  
 </form>   
 </center> 
 </body>   
 
 </html>
    